#!/usr/bin/env python3
"""
Generate LuaCATS definitions for MTA:SA functions.
This creates type annotations for the Lua Language Server (Sumneko).
"""

import re
import sys
from pathlib import Path
from sync_natives import (
    download_repo_zip, extract_yaml_from_zip, CATEGORIES,
    Colors, info, success, warning, error, header
)


def clean_description(text: str) -> str:
    """Clean markdown from description to make it safe for Lua comments."""
    if not text:
        return ""
    
    # Remove markdown links [text](url) -> text
    text = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', text)
    
    # Remove wiki links [[Page]] -> Page
    text = re.sub(r'\[\[([^\]|]+)(?:\|[^\]]+)?\]\]', r'\1', text)
    
    # Escape ]] which could be interpreted as end of Lua long string
    text = text.replace(']]', ']] ')
    
    # Remove HTML tags
    text = re.sub(r'<[^>]+>', '', text)
    
    # Remove markdown bold/italic markers
    text = re.sub(r'\*\*([^*]+)\*\*', r'\1', text)
    text = re.sub(r'\*([^*]+)\*', r'\1', text)
    text = re.sub(r'_([^_]+)_', r'\1', text)
    
    # Remove markdown headers
    text = re.sub(r'^#+ ', '', text, flags=re.MULTILINE)
    
    # Clean up extra whitespace
    text = re.sub(r'\n+', ' ', text)
    text = text.strip()
    
    return text

OUTPUT_DIR = Path(__file__).parent.parent / "definitions"

# Map MTA:SA types to LuaCATS types
TYPE_MAP = {
    "bool": "boolean",
    "boolean": "boolean",
    "int": "integer",
    "integer": "integer",
    "float": "number",
    "number": "number",
    "string": "string",
    "table": "table",
    "function": "function",
    "userdata": "userdata",
    "element": "element",
    "player": "player",
    "vehicle": "vehicle",
    "ped": "ped",
    "object": "object",
    "marker": "marker",
    "blip": "blip",
    "pickup": "pickup",
    "colshape": "colshape",
    "radararea": "radararea",
    "team": "team",
    "account": "account",
    "acl": "acl",
    "aclgroup": "aclgroup",
    "resource": "resource",
    "timer": "timer",
    "xmlnode": "xmlnode",
    "gui-element": "gui-element",
    "texture": "texture",
    "shader": "shader",
    "dxfont": "dxfont",
    "dxtexture": "dxtexture",
    "dxmaterial": "dxmaterial",
    "dxshader": "dxshader",
    "dxscreen": "dxscreen",
    "camera": "camera",
    "browser": "browser",
    "sound": "sound",
    "effect": "effect",
    "weapon": "weapon",
    "projectile": "projectile",
    "searchlight": "searchlight",
    "water": "water",
}


def map_type(mta_type: str) -> str:
    """Convert MTA:SA type to LuaCATS type."""
    if not mta_type:
        return "any"
    
    # Handle union types (e.g., "element|nil")
    if "|" in mta_type:
        parts = mta_type.split("|")
        return "|".join(map_type(p.strip()) for p in parts)
    
    # Handle array types (e.g., "table[]")
    if mta_type.endswith("[]"):
        base = mta_type[:-2]
        return f"{map_type(base)}[]"
    
    return TYPE_MAP.get(mta_type.lower(), mta_type)


def generate_function_def(func_data: dict) -> str:
    """Generate LuaCATS definition for a function."""
    if not func_data:
        return ""
    
    # Get first available implementation
    target = None
    for side in ["shared", "server", "client"]:
        if side in func_data:
            target = func_data[side]
            break
    
    if not target:
        return ""
    
    name = target.get("name", "")
    if not name or target.get("disabled"):
        return ""
    
    lines = []
    
    # Description
    description = clean_description(target.get("description", ""))
    if description:
        lines.append(f"---{description}")
    
    # Parameters
    params = target.get("parameters", [])
    for param in params:
        param_name = param.get("name", "")
        param_type = param.get("type", "any")
        param_desc = clean_description(param.get("description", ""))
        
        lua_type = map_type(param_type)
        
        # Optional parameter (has default)
        if param.get("default") is not None:
            lua_type = f"{lua_type}?"
        
        if param_desc:
            lines.append(f"---@param {param_name} {lua_type} {param_desc}")
        else:
            lines.append(f"---@param {param_name} {lua_type}")
    
    # Returns
    returns = target.get("returns", {})
    if returns:
        return_values = returns.get("values", [])
        return_desc = clean_description(returns.get("description", ""))
        
        if return_values:
            return_types = " | ".join(map_type(v.get("type", "any")) for v in return_values)
            if return_desc:
                lines.append(f"---@return {return_types} {return_desc}")
            else:
                lines.append(f"---@return {return_types}")
    
    # Side marker
    side_markers = []
    if "shared" in func_data:
        side_markers.append("Shared")
    if "server" in func_data:
        side_markers.append("Server")
    if "client" in func_data:
        side_markers.append("Client")
    
    if side_markers:
        lines.append(f"---@markup {{ MTA:SA {'/'.join(side_markers)} }}")
    
    # Function signature
    param_names = [p.get("name", "") for p in params]
    lines.append(f"function {name}({', '.join(param_names)}) end")
    lines.append("")
    
    return "\n".join(lines)


def main():
    header("MTA:SA Definitions Generator")
    
    info("Downloading repository...")
    zip_content = download_repo_zip()
    if not zip_content:
        error("Failed to download repository")
        return 1
    
    success("Downloaded repository")
    
    info("Extracting YAML files...")
    functions_data = extract_yaml_from_zip(zip_content)
    success(f"Extracted {len(functions_data)} categories")
    
    # Create output directory
    OUTPUT_DIR.mkdir(exist_ok=True)
    
    # Generate definitions
    all_defs = []
    all_defs.append("---@meta")
    all_defs.append("---@diagnostic disable: lowercase-global")
    all_defs.append("")
    all_defs.append("-- MTA:SA Type Definitions")
    all_defs.append("-- Auto-generated from official wiki")
    all_defs.append("")
    all_defs.append("---@class element")
    all_defs.append("---@class player: element")
    all_defs.append("---@class vehicle: element")
    all_defs.append("---@class ped: element")
    all_defs.append("---@class object: element")
    all_defs.append("---@class marker: element")
    all_defs.append("---@class blip: element")
    all_defs.append("---@class pickup: element")
    all_defs.append("---@class colshape: element")
    all_defs.append("---@class radararea: element")
    all_defs.append("---@class team: element")
    all_defs.append("---@class account: element")
    all_defs.append("---@class acl: element")
    all_defs.append("---@class aclgroup: element")
    all_defs.append("---@class resource: element")
    all_defs.append("---@class timer: element")
    all_defs.append("---@class xmlnode: element")
    all_defs.append("---@class gui-element: element")
    all_defs.append("")
    
    total_funcs = 0
    
    for category in sorted(functions_data.keys()):
        files = functions_data[category]
        info(f"Processing {category} ({len(files)} functions)...")
        
        all_defs.append(f"-- {category}")
        all_defs.append("")
        
        for filename, yaml_data in files.items():
            try:
                func_def = generate_function_def(yaml_data)
                if func_def:
                    all_defs.append(func_def)
                    total_funcs += 1
            except Exception as e:
                warning(f"Failed to process {filename}: {e}")
        
        success(f"  Generated {total_funcs} definitions so far")
    
    # Write output
    output_file = OUTPUT_DIR / "mta-sa.lua"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(all_defs))
    
    header("Results")
    success(f"Generated {total_funcs} function definitions")
    success(f"Saved to {output_file}")
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

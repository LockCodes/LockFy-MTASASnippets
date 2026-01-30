#!/usr/bin/env python3
"""
Sync MTA:SA natives from official wiki YAML files.
Fetches function definitions and generates VS Code snippets.
"""

import json
import sys
import yaml
import zipfile
import io
import re
import requests
from pathlib import Path
from typing import Dict, List, Optional, Any

GITHUB_API = "https://api.github.com/repos/multitheftauto/wiki.multitheftauto.com/contents"
RAW_BASE = "https://raw.githubusercontent.com/multitheftauto/wiki.multitheftauto.com/main"
REPO_ZIP_URL = "https://github.com/multitheftauto/wiki.multitheftauto.com/archive/refs/heads/main.zip"
FUNCTIONS_DIR = "functions"
OUTPUT_FILE = Path(__file__).parent.parent / "snippets" / "lua.json"

LUA_SNIPPETS = {
    "fori": {
        "prefix": "fori",
        "body": "for ${1:i},${2:v} in ipairs(${3:table_name}) do\n\t${0:print(i,v)}\nend",
        "description": "for i,v in ipairs()",
        "scope": "source.lua"
    },
    "for": {
        "prefix": "for",
        "body": "for ${1:i}=${2:1},${3:10} do\n\t${0:print(i)}\nend",
        "description": "for i=1,10",
        "scope": "source.lua"
    },
    "forp": {
        "prefix": "forp",
        "body": "for ${1:k},${2:v} in pairs(${3:table_name}) do\n\t${0:print(k,v)}\nend",
        "description": "for k,v in pairs()",
        "scope": "source.lua"
    },
    "fun": {
        "prefix": "fun",
        "body": "function ${1:function_name}( ${2:...} )\n\t${0:-- body}\nend",
        "description": "function",
        "scope": "source.lua"
    },
    "function": {
        "prefix": "function",
        "body": "function ${1:function_name}( ${2:...} )\n\t${0:-- body}\nend",
        "description": "function",
        "scope": "source.lua"
    },
    "local": {
        "prefix": "local",
        "body": "local ${1:x} = ${0:1}",
        "description": "local x = 1",
        "scope": "source.lua"
    },
    "string.find": {
        "prefix": "string.find",
        "body": "string.find( ${1:str}, ${2:index} )",
        "description": "Lua standard library",
        "scope": "source.lua"
    },
    "table.concat": {
        "prefix": "table.concat",
        "body": "table.concat( ${1:tablename},${2: \", \"},${3: start_index},${4: end_index} )",
        "description": "Lua standard library",
        "scope": "source.lua"
    },
    "table.sort": {
        "prefix": "table.sort",
        "body": "table.sort( ${1:tablename}${2:, sortfunction} )",
        "description": "Lua standard library",
        "scope": "source.lua"
    }
}

CATEGORIES = [
    "ACL", "Account", "Admin", "Announcement", "Audio", "Blip", "Browser",
    "Building", "Camera", "Clothes_and_body", "Colshape", "Cursor", "Database",
    "Discord", "Drawing", "Effects", "Element", "Engine", "Event", "Explosion",
    "File", "Fire", "GUI", "HTTP", "Input", "Light", "Map", "Marker", "Module",
    "Object", "Output", "Path", "Ped", "Pickup", "Player", "Projectile",
    "Radar_area", "Resource", "SVG", "Searchlight", "Server", "Settings_registry",
    "Team", "Text", "UTF8_Library", "Utility", "Vehicle", "Water", "Weapon",
    "Weapon_creation", "World", "XML"
]


class Colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'


def info(msg: str):
    sys.stdout.write(f"{Colors.OKBLUE}[*]{Colors.ENDC} {msg}\n")


def success(msg: str):
    sys.stdout.write(f"{Colors.OKGREEN}[+]{Colors.ENDC} {msg}\n")


def warning(msg: str):
    sys.stdout.write(f"{Colors.WARNING}[!]{Colors.ENDC} {msg}\n")


def error(msg: str):
    sys.stderr.write(f"{Colors.FAIL}[-]{Colors.ENDC} {msg}\n")


def header(msg: str):
    sys.stdout.write(f"\n{Colors.HEADER}{Colors.BOLD}{msg}{Colors.ENDC}\n")


def check_rate_limit() -> int:
    try:
        resp = requests.get("https://api.github.com/rate_limit", timeout=10)
        if resp.status_code == 200:
            return resp.json()["resources"]["core"]["remaining"]
    except Exception:
        pass
    return 0


def get_yaml_files_from_api(category: str) -> List[str]:
    url = f"{GITHUB_API}/{FUNCTIONS_DIR}/{category}"
    try:
        resp = requests.get(url, timeout=30)
        if resp.status_code == 200:
            files = resp.json()
            return [f["name"] for f in files if f["type"] == "file" and f["name"].endswith(".yaml")]
        elif resp.status_code == 403 and "rate limit" in resp.text.lower():
            return ["RATE_LIMIT"]
    except Exception as e:
        warning(f"Failed to fetch {category}: {e}")
    return []


def download_repo_zip() -> Optional[bytes]:
    info("Downloading repository as ZIP (fallback method)...")
    try:
        resp = requests.get(REPO_ZIP_URL, timeout=120)
        if resp.status_code == 200:
            return resp.content
        error(f"Failed to download ZIP: HTTP {resp.status_code}")
    except Exception as e:
        error(f"Download failed: {e}")
    return None


def extract_yaml_from_zip(zip_content: bytes) -> Dict[str, Dict[str, Any]]:
    result = {}
    with zipfile.ZipFile(io.BytesIO(zip_content)) as zf:
        for name in zf.namelist():
            match = re.match(r"[^/]+/functions/([^/]+)/([^/]+\.yaml)$", name)
            if match:
                category, filename = match.groups()
                if category not in result:
                    result[category] = {}
                try:
                    content = zf.read(name).decode('utf-8')
                    result[category][filename] = yaml.safe_load(content)
                except Exception as e:
                    warning(f"Parse error in {name}: {e}")
    return result


def determine_side(data: dict) -> str:
    if "shared" in data:
        return "Shared"
    elif "server" in data:
        return "Server-side"
    elif "client" in data:
        return "Client-side"
    return "Unknown"


def build_body(func_data: dict) -> str:
    name = func_data.get("name", "")
    params = func_data.get("parameters", [])
    
    if not params:
        return f"{name}()"
    
    parts = []
    for i, param in enumerate(params):
        param_name = param.get("name", "")
        parts.append(f"${{{i + 1}:{param_name}}}")
    
    return f"{name}( {', '.join(parts)} )"


def process_function(func_data: dict) -> Optional[dict]:
    if not func_data:
        return None
    
    target = None
    side = None
    for s in ["shared", "server", "client"]:
        if s in func_data:
            target = func_data[s]
            side = "Shared" if s == "shared" else ("Server-side" if s == "Server" else "Client-side")
            break
    
    if not target:
        return None
    
    name = target.get("name", "")
    if not name or target.get("disabled"):
        return None
    
    return {
        name: {
            "prefix": name,
            "body": build_body(target),
            "description": side,
            "scope": "source.lua"
        }
    }


def process_via_zip() -> tuple[dict, int, list]:
    snippets = dict(LUA_SNIPPETS)
    processed = 0
    errors = []
    
    zip_content = download_repo_zip()
    if not zip_content:
        error("Could not download repository")
        return snippets, processed, errors
    
    functions_data = extract_yaml_from_zip(zip_content)
    success(f"Extracted {len(functions_data)} categories from ZIP")
    
    for category, files in functions_data.items():
        info(f"Processing {category} ({len(files)} functions)...")
        
        for filename, yaml_data in files.items():
            try:
                snippet = process_function(yaml_data)
                if snippet:
                    snippets.update(snippet)
                    processed += 1
            except Exception as e:
                errors.append(f"{category}/{filename}: {e}")
        
        mta_count = len([s for s in snippets if s not in LUA_SNIPPETS])
        success(f"  {mta_count} MTA snippets so far")
    
    return snippets, processed, errors


def process_via_api() -> tuple[dict, int, list]:
    snippets = dict(LUA_SNIPPETS)
    processed = 0
    errors = []
    rate_limited = False
    
    for category in CATEGORIES:
        if rate_limited:
            warning(f"Skipping {category} (rate limited)")
            continue
        
        info(f"Processing {category}...")
        yaml_files = get_yaml_files_from_api(category)
        
        if yaml_files == ["RATE_LIMIT"]:
            error("GitHub API rate limit reached")
            rate_limited = True
            continue
        
        if not yaml_files:
            continue
        
        for filename in yaml_files:
            try:
                url = f"{RAW_BASE}/{FUNCTIONS_DIR}/{category}/{filename}"
                resp = requests.get(url, timeout=30)
                if resp.status_code == 200:
                    yaml_data = yaml.safe_load(resp.text)
                    snippet = process_function(yaml_data)
                    if snippet:
                        snippets.update(snippet)
                        processed += 1
            except Exception as e:
                errors.append(f"{category}/{filename}: {e}")
        
        mta_count = len([s for s in snippets if s not in LUA_SNIPPETS])
        success(f"  {mta_count} MTA snippets so far")
    
    return snippets, processed, errors


def save_snippets(snippets: dict, path: Path):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(snippets, f, indent="\t", ensure_ascii=False)


def main():
    header("MTA:SA Snippets Sync")
    
    remaining = check_rate_limit()
    info(f"GitHub API requests remaining: {remaining}")
    
    use_zip = remaining < 10
    
    if use_zip:
        warning("Low API quota, using ZIP download method")
        snippets, processed, errors = process_via_zip()
    else:
        snippets, processed, errors = process_via_api()
    
    mta_count = len([s for s in snippets if s not in LUA_SNIPPETS])
    
    header("Results")
    success(f"Total snippets: {len(snippets)}")
    info(f"  Lua standard: {len(LUA_SNIPPETS)}")
    info(f"  MTA:SA functions: {mta_count}")
    
    if errors:
        warning(f"Errors encountered: {len(errors)}")
        for err in errors[:5]:
            error(f"  {err}")
        if len(errors) > 5:
            warning(f"  ... and {len(errors) - 5} more")
    
    save_snippets(snippets, OUTPUT_FILE)
    success(f"Saved to {OUTPUT_FILE}")


if __name__ == "__main__":
    main()

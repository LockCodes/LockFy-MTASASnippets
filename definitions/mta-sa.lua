---@meta
---@diagnostic disable: lowercase-global

-- MTA:SA Type Definitions
-- Auto-generated from official wiki

---@class element
---@class player: element
---@class vehicle: element
---@class ped: element
---@class object: element
---@class marker: element
---@class blip: element
---@class pickup: element
---@class colshape: element
---@class radararea: element
---@class team: element
---@class account: element
---@class acl: element
---@class aclgroup: element
---@class resource: element
---@class timer: element
---@class xmlnode: element
---@class gui-element: element

-- ACL

---This function creates an ACL entry in the Access Control List system with the specified name.
---@param aclName string The name of the ACL entry to add.
---@return acl|false Returns the created ACL object if successful. Returns false if an ACL of the given name could not be created.
---@markup { MTA:SA Server }
function aclCreate(aclName) end

---This function creates a group in the ACL. An ACL group can contain objects like players and resources. They specify who has access to the ACL's in this group.
---@param groupName string The name of the group to create.
---@return aclgroup|false Returns the created aclgroup if successful. Returns false if failed.
---@markup { MTA:SA Server }
function aclCreateGroup(groupName) end

---This function destroys the ACL passed. The destroyed ACL will no longer be valid.
---@param theACL acl The ACL to destroy.
---@return boolean Returns true if successfully destroyed and false if it could not be deleted (ie. it's not valid).
---@markup { MTA:SA Server }
function aclDestroy(theACL) end

---This function destroys the given ACL group. The destroyed ACL group will no longer be valid.
---@param aclGroup aclgroup The aclgroup element to destroy.
---@return boolean Returns true if the ACL group was successfully deleted, false if it could not be deleted for some reason (ie. invalid argument).
---@markup { MTA:SA Server }
function aclDestroyGroup(aclGroup) end

---Get the ACL with the given name. If need to get most of the ACL's, you should consider using aclList to get a table of them all.
---@param aclName string The name to get the ACL belonging to.
---@return acl|false Returns the ACL with that name if it could be retrieved, false/nil if the ACL does not exist or it fails for some other reason.
---@markup { MTA:SA Server }
function aclGet(aclName) end

---This function is used to get the ACL group with the given name. If you need most of the groups you should consider using aclGroupList instead to get a table containing them all.
---@param groupName string The name to get the ACL group from.
---@return aclgroup|false Returns the aclgroup if it could be found. Returns false/nil if it did not exist or failed for some reason.
---@markup { MTA:SA Server }
function aclGetGroup(groupName) end

---Get the name of given ACL.
---@param theAcl acl The ACL to get the name of.
---@return string|false Returns the name of the given ACL as a string if successful. Returns false/nil if unsuccessful, ie the ACL is invalid.
---@markup { MTA:SA Server }
function aclGetName(theAcl) end

---This function returns whether the access for the given right is set to true or false in the ACL.
---@param theAcl acl The ACL to get the right from.
---@param rightName string The right name to return the access value of.
---@return boolean Returns true or false if the ACL gives access or not to the given function. Returns nil if it failed for some reason, e.g. an invalid ACL was specified or the right specified does not exist in the ACL.
---@markup { MTA:SA Server }
function aclGetRight(theAcl, rightName) end

---This function adds the given ACL to the given ACL group. This makes the resources and players in the given ACL group have access to what's specified in the given ACL. The rights for something in the different ACL's in a group are OR-ed together, which means if one ACL gives access to something, this ACL group will have access to that.
---@param theGroup aclgroup The group to add the ACL to.
---@param theAcl acl The ACL to add to the group.
---@return boolean Returns true if the ACL could be successfully added to the ACL group, false/nil if either of the elements are invalid, the ACL is already in that group or if something else goes wrong.
---@markup { MTA:SA Server }
function aclGroupAddACL(theGroup, theAcl) end

---This function adds an object to the given ACL group. An object can be a player's account, specified as user.. Or a resource, specified as resource.. Objects are specified as strings. The ACL groups work for the user accounts and the resources that are specified in them.
---@param theGroup aclgroup The group to add the object name string too.
---@param theObject string The object string to add to the given ACL.
---@return boolean Returns true if the object was successfully added to the ACL, false if it already existed in the list.
---@markup { MTA:SA Server }
function aclGroupAddObject(theGroup, theObject) end

---This function is used to get the name of the given ACL group.
---@param theGroup aclgroup The ACL group to get the name of.
---@return string|false Returns the name of the given ACL group as a string if successful, otherwise false or nil if the aclGroup is invalid or it fails for some other reason.
---@markup { MTA:SA Server }
function aclGroupGetName(theGroup) end

---This function returns a table of all the ACL groups.
---@return table Returns a table of all the ACL groups if successful, returns an empty table if no ACL groups exist. false/nil can be returned if this function fails for some other reason.
---@markup { MTA:SA Server }
function aclGroupList() end

---This function returns a table over all the ACL's that exist in a given ACL group.
---@param theGroup aclgroup The ACL group to get the ACL elements from.
---@return table|false Returns a table of the ACL elements in the given ACL group. This table might be empty. Returns false or nil if theGroup is invalid or it fails for some other reason.
---@markup { MTA:SA Server }
function aclGroupListACL(theGroup) end

---This function returns a table over all the objects that exist in a given ACL group. These are objects like players and resources.
---@param theGroup aclgroup The ACL group to get the objects from.
---@return table|false Returns a table of strings in the given ACL group. This table might be empty. Returns false or nil if theGroup is invalid or it fails for some other reason.
---@markup { MTA:SA Server }
function aclGroupListObjects(theGroup) end

---This function removes the given ACL from the given ACL group.
---@param theGroup aclgroup The group to remove the given ACL from.
---@param theAcl acl The ACL to remove from the given group.
---@return boolean Returns true if the ACL was successfully removed from the ACL group, false/nil if it could not be removed for some reason, ie. either of the elements were invalid.
---@markup { MTA:SA Server }
function aclGroupRemoveACL(theGroup, theAcl) end

---This function removes the given object from the given ACL group. The object can be a resource or a player. See aclGroupAddObject for more details.
---@param theGroup aclgroup The ACL group to remove the object string from.
---@param theObject string The object to remove from the ACL group.
---@return boolean Returns true if the object existed in the ACL and could be removed, false if it could not be removed for some reason, ie. it did not exist in the given ACL group.
---@markup { MTA:SA Server }
function aclGroupRemoveObject(theGroup, theObject) end

---This function returns a list of all the ACLs.
---@return table Returns a table of all the ACLs. This table can be empty if no ACLs exist. It can also return false/nil if it failed for some reason.
---@markup { MTA:SA Server }
function aclList() end

---This function returns a table of all the rights that a given ACL has.
---@param theAcl acl The ACL to get the rights from.
---@param allowedType string? The allowed right type. Possible values are general, function, resource and command. If not specified, all types will be retrieved.
---@return table|false Returns a table over the rights as strings in the given ACL. This table might be empty. Returns false or nil if theACL is invalid or it fails for some other reason.
---@markup { MTA:SA Server }
function aclListRights(theAcl, allowedType) end

---This function returns a table of all groups the object is in.
---@param theObject string The name of the ACL entry to get groups of.
---@return table Returns a table of all groups the object is in on success. This table might be empty. Returns error if something went wrong.
---@markup { MTA:SA Server }
function aclObjectGetGroups(theObject) end

---This function reloads the ACL's and the ACL groups from the ACL XML file. All ACL and ACL group elements are invalid after a call to this and should not be used anymore.
---@return boolean Returns true if the XML was successfully reloaded from the file, false if the XML was invalid, didn't exist or could not be loaded for some other reason.
---@markup { MTA:SA Server }
function aclReload() end

---This function removes the given right (string) from the given ACL.
---@param theAcl acl The ACL to remove the right from.
---@param rightName string The ACL right name to remove.
---@return boolean Returns true if the given right was successfully removed from the given ACL, false or nil if it could not be removed for some reason, ie. it didn't exist in the ACL.
---@markup { MTA:SA Server }
function aclRemoveRight(theAcl, rightName) end

---The ACL XML file is automatically saved whenever the ACL is modified, but the automatic save can be delayed by up to 10 seconds for performance reasons. Calling this function will force an immediate save.
---@return boolean Returns true if the ACL was successfully changed, false if it could not be saved for some reason, ie. file in use.
---@markup { MTA:SA Server }
function aclSave() end

---This functions changes or adds the given right in the given ACL. The access can be true or false and specifies whether the ACL gives access to the right or not.
---@param theAcl acl The ACL to change the right of.
---@param rightName string The right to add/change the access property of. It must be prefixed with function. or command. or general. or resource..
---@param hasAccess boolean Whether the access should be set to true or false.
---@return boolean Returns true if the access was successfully changed, false or nil if it failed for some reason, ie. invalid ACL or the rightName is invalid.
---@markup { MTA:SA Server }
function aclSetRight(theAcl, rightName, hasAccess) end

---This function returns whether or not the given object has access to perform the given action. Scripts frequently wish to limit access to features to particular users. The naïve way to do this would be to check if the player who is attempting to perform an action is in a particular group (usually the Admin group). The main issue with doing this is that the Admin group is not guaranteed to exist. It also doesn't give the server admin any flexibility. He might want to allow his 'moderators' access to the function you're limiting access to, or he may want it disabled entirely.
---@param theObject string|element The object to test if has permission to. This can be a client element (ie. a player), a resource or a string in the form user.name or resource.name.
---@param theRight string The action to test if the given object has access to. Ie. function.kickPlayer.
---@param defaultPermission boolean? The default permission if none is specified in either of the groups the given object is a member of. If this is left to true, the given object will have permissions to perform the action unless the opposite is explicitly specified in the ACL. If false, the action will be denied by default unless explicitly approved by the Access Control List.
---@return boolean Returns true if the given object has permission to perform the given action, false otherwise. Returns nil if the function failed because of bad arguments.
---@markup { MTA:SA Server }
function hasObjectPermissionTo(theObject, theRight, defaultPermission) end

---This function is used to determine if an object is in a group.
---@param theObject string The name of the object to check. Examples: "resource.ctf", "user.Jim".
---@param theGroup aclgroup The ACL group pointer of the group from which the object should be found.
---@return boolean Returns true if the object is in the specified group, false otherwise.
---@markup { MTA:SA Server }
function isObjectInACLGroup(theObject, theGroup) end

-- Account

---This function adds an account to the list of registered accounts of the current server.
---@param name string The name of the account you wish to make, this normally is the player's name.
---@param pass string The password to set for this account for future logins.
---@param allowCaseVariations boolean? Whether the username is case sensitive (if this is set to true, usernames "Bob" and "bob" will refer to different accounts).
---@return account|false Returns an account or false if the account already exists or an error occured.
---@markup { MTA:SA Server }
function addAccount(name, pass, allowCaseVariations) end

---This function copies all of the data from one account to another.
---@param theAccount account The account you wish to copy the data to.
---@param fromAccount account The account you wish to copy the data from.
---@return boolean Returns a true if the accounts were valid, false otherwise.
---@markup { MTA:SA Server }
function copyAccountData(theAccount, fromAccount) end

---This function returns an account for a specific user.
---@param username string The username of the account you want to retrieve.
---@param password string? The password for the account. If this argument is not specified, you can get the account whatever password it is, otherwise the password must match the account's.
---@param caseSensitive boolean? Specifies whether to ignore the case when searching for an account.
---@return account|false Returns an account or false if an account matching the username specified (and password, if specified) could not be found.
---@markup { MTA:SA Server }
function getAccount(username, password, caseSensitive) end

---This function returns the account with the specific ID.
---@param id integer The ID to get account from.
---@return account|false Returns account associated with specified ID. Returns false if invalid arguments were specified or there is no account with this ID..
---@markup { MTA:SA Server }
function getAccountByID(id) end

---This function retrieves a string that has been stored using setAccountData. Data stored as account data is persistent across user's sessions and maps, unless they are logged into a guest account.
---@param theAccount account The account you wish to retrieve the data from.
---@param key string The key under which the data is stored.
---@return string|false Returns a string containing the stored data or false if no data was stored under that key.
---@markup { MTA:SA Server }
function getAccountData(theAccount, key) end

---This function retrieves the ID of an account.
---@param theAccount account The account you wish to get the ID of.
---@return integer|false Returns a int containing the account's ID, false if the account does not exist or an invalid argument was passed to the function.
---@markup { MTA:SA Server }
function getAccountID(theAccount) end

---This function retrieves the IP address of an account.
---@param theAccount account The account you wish to get the IP of.
---@return string|false Returns a string containing the account's IP, false if the account does not exist or an invalid argument was passed to the function.
---@markup { MTA:SA Server }
function getAccountIP(theAccount) end

---This function retrieves the name of an account.
---@param theAccount account The account you wish to get the name of.
---@return string|false Returns a string containing the account's name, false if the account does not exist or an invalid argument was passed to the function.
---@markup { MTA:SA Server }
function getAccountName(theAccount) end

---This function returns the player element that is currently using a specified account, i.e. is logged into it. Only one player can use an account at a time.
---@param theAccount account The account you wish to get the player of.
---@return player|false Returns a player element if the account is currently in use, false otherwise.
---@markup { MTA:SA Server }
function getAccountPlayer(theAccount) end

---This function returns the last serial that logged onto the specified account.
---@param theAccount account The account to get serial from.
---@return string|false Returns string containing the serial, the string is empty if the account was never used. Returns false if invalid arguments were specified.
---@markup { MTA:SA Server }
function getAccountSerial(theAccount) end

---This function returns an account type.
---@param theAccount account An account you want to get info from.
---@return string Returns string containing the type (player, guest or console) of the account if the account is valid, unknown or error otherwise.
---@markup { MTA:SA Server }
function getAccountType(theAccount) end

---This function returns a table over all the accounts that exist in the server internal.db file.
---@return table A table over the accounts that exist in the server internal.db file. This table might be empty.
---@markup { MTA:SA Server }
function getAccounts() end

---This function returns a table containing all accounts with specified dataName and value (set with setAccountData).
---@param dataName string The name of the data.
---@param value string The value the dataName should have.
---@return table|false Returns table containing the accounts associated with specified value at dataName. Returns false if invalid arguments were specified.
---@markup { MTA:SA Server }
function getAccountsByData(dataName, value) end

---This function returns a table containing all accounts that were logged onto from specified IP-address.
---@param IP string The IP to get accounts from.
---@return table|false Returns table containing the accounts associated with specified IP-address. Returns false if invalid arguments were specified.
---@markup { MTA:SA Server }
function getAccountsByIP(IP) end

---This function returns a table containing all accounts that were logged onto from specified serial.
---@param serial string The serial to get accounts from.
---@return table|false Returns table containing the accounts associated with specified serial. Returns false if invalid arguments were specified.
---@markup { MTA:SA Server }
function getAccountsBySerial(serial) end

---This function returns a table containing all the user data for the account provided.
---@param theAccount account The account you wish to retrieve all data from.
---@return table|false A table containing all the user data, this table might be empty. false if invalid argument.
---@markup { MTA:SA Server }
function getAllAccountData(theAccount) end

---This function returns the specified player's account object.
---@param thePlayer player The player element you want to get the account of.
---@return account|false Returns the player's account object, or false if the player passed to the function is invalid.
---@markup { MTA:SA Server }
function getPlayerAccount(thePlayer) end

---This function checks to see if an account is a guest account. A guest account is an account automatically created for a user when they join the server and deleted when they quit or login to another account. Data stored in a guest account is not stored after the player has left the server. As a consequence, this function will check if a player is logged in or not.
---@param theAccount account The account you want to check to see if it is a guest account.
---@return boolean Returns true if the account is a guest account, false otherwise.
---@markup { MTA:SA Server }
function isGuestAccount(theAccount) end

---This functions logs the given player in to the given account. You need to provide the password needed to log into that account.
---@param thePlayer player The player to log into an account.
---@param theAccount account The account to log the player into.
---@param thePassword string The password needed to sign into this account.
---@return boolean Returns true if the player was successfully logged into the given account. Returns false if the log in failed for some reason, ie. the player was already logged in to some account (use logOut first), if the account was already in use or if it failed for some other reason.
---@markup { MTA:SA Server }
function logIn(thePlayer, theAccount, thePassword) end

---This function logs the given player out of his current account.
---@param thePlayer player The player to log out of his current account.
---@return boolean Returns true if the player was successfully logged out, false if it failed for some reason, ie. the player was never logged in.
---@markup { MTA:SA Server }
function logOut(thePlayer) end

---This function is used to delete existing player accounts.
---@param theAccount account The account you wish to remove.
---@return boolean Returns true if account was successfully removed, false if the account does not exist.
---@markup { MTA:SA Server }
function removeAccount(theAccount) end

---This function sets a string to be stored in an account.  This can then be retrieved using getAccountData.  Data stored as account data is persistent across user's sessions and maps, unless they are logged into a guest account. Even if logged into a guest account, account data can be useful as a way to store a reference to your own account system, though it's persistence is equivalent to that of using setElementData on the player's element.
---@param theAccount account The account you wish to retrieve the data from.
---@param key string The key under which you wish to store the data.
---@param value var The value you wish to store. Set to false to remove the data.
---@return boolean Returns a true if the account data was set, false if an invalid argument was specified.
---@markup { MTA:SA Server }
function setAccountData(theAccount, key, value) end

---This function sets the name of an account.
---@param theAccount account The account you wish to change the name.
---@param name string The new name.
---@param allowCaseVariations boolean? Whether the username is case sensitive (if this is set to true, usernames "Bob" and "bob" will refer to different accounts).
---@return boolean Returns a true if the account name was set, false if an invalid argument was specified.
---@markup { MTA:SA Server }
function setAccountName(theAccount, name, allowCaseVariations) end

---This function sets the password of the specified account.
---@param theAccount account The account whose password you want to set.
---@param password string The password.
---@return boolean Returns true if the password was set correctly, false otherwise.
---@markup { MTA:SA Server }
function setAccountPassword(theAccount, password) end

---This function sets the serial number for a specified player account. It allows administrators to update or assign a new serial to registered accounts.
---@param theAccount account The account element to set the serial for.
---@param serial string A valid 32-character hexadecimal string representing the new serial number.
---@return boolean Returns true if the serial was successfully set, false otherwise.
---@markup { MTA:SA Server }
function setAccountSerial(theAccount, serial) end

-- Admin

---This function will add a ban for the specified IP/username/serial to the server.
---@param IP string The IP to be banned. If you don't want to ban by IP, set this to nil.
---@param username string The username (nick) to be banned. If you don't want to ban by username, set this to nil.
---@param serial string The serial to be banned. If you don't want to ban by serial, set this to nil.
---@param responsibleElement player/string? The element that is responsible for banning the IP/username/serial. This can be a player or the root. This also can be a string - max 30 characters.
---@param reason string? The reason the IP/username/serial will be banned from the server. Max 125 characters.
---@param seconds integer? The amount of seconds the player will be banned from the server for. This can be 0 for an infinite amount of time.
---@return ban|false Returns the new ban if the IP/username/serial was banned successfully, false if invalid arguments are specified.
---@markup { MTA:SA Server }
function addBan(IP, username, serial, responsibleElement, reason, seconds) end

---This function will ban the specified player by either IP, serial or username.
---@param bannedPlayer player The player that will be banned from the server.
---@param IP boolean? Will player be banned by IP?
---@param username boolean? Will player be banned by username? (Preferred false).
---@param serial boolean? Will player be banned by serial?
---@param responsibleElement player/string? The element that is responsible for banning the player. This can be a player or the root. This also can be a string - max 30 characters.
---@param reason string? The reason the player will be banned from the server.
---@param seconds integer? The amount of seconds the player will be banned from the server for. This can be 0 for an infinite amount of time.
---@return ban|false Returns a ban object if banned successfully, or false if unsuccessful.
---@markup { MTA:SA Server }
function banPlayer(bannedPlayer, IP, username, serial, responsibleElement, reason, seconds) end

---This function will return the responsible admin (nickname of the admin) of the specified ban.
---@param theBan ban The ban you want to return the admin of.
---@return string|false Returns a string of the admin if everything was successful, false if invalid arguments are specified if there was no admin specified for the ban.
---@markup { MTA:SA Server }
function getBanAdmin(theBan) end

---This function will return the IP of the specified ban.
---@param theBan ban The ban in which you want to return the IP of.
---@return string|false Returns a string of the IP if everything was successful, false if invalid arguments are specified if there was no IP specified for the ban.
---@markup { MTA:SA Server }
function getBanIP(theBan) end

---This function will return the nickname (nickname that the player had when he was banned) of the specified ban.
---@param theBan ban The ban element which nickname you want to return.
---@return string|false Returns a string of the nickname if everything was successfull, false if invalid arguments are specified if there was no nickname specified for the ban element.
---@markup { MTA:SA Server }
function getBanNick(theBan) end

---This function will return the ban reason of the specified ban.
---@param theBan ban The ban in which you want to return the reason of.
---@return string|false Returns a string of the reason if everything was successful, false if invalid arguments are specified if there was no reason specified for the ban.
---@markup { MTA:SA Server }
function getBanReason(theBan) end

---This function will return the serial of the specified ban.
---@param theBan ban The ban you want to retrieve the serial of.
---@return string|false Returns a string of the serial if everything was successful, false if invalid arguments are specified or if there was no serial specified for the ban.
---@markup { MTA:SA Server }
function getBanSerial(theBan) end

---This function will return the time the specified ban was created, in seconds.
---@param theBan ban The ban of which you wish to retrieve the time of.
---@return integer|false Returns an integer of the banning time in the format of seconds from the year 1970. Use in conjunction with getRealTime in order to retrieve detailed information. Returns false if invalid arguments were specified or if there was no banning time specified for the ban.
---@markup { MTA:SA Server }
function getBanTime(theBan) end

---This function will return a table containing all the bans present in the server's banlist.xml.
---@return table Returns a table containing all the bans.
---@markup { MTA:SA Server }
function getBans() end

---This function will return the unbanning time of the specified ban in seconds.
---@param theBan ban The ban in which you wish to retrieve the unban time of.
---@return integer|false Returns an integer of the unbanning time in the format of seconds from the year 1970. Use in conjunction with getRealTime in order to retrieve detailed information. Returns false if invalid arguments are specified or if there was no unbanning time specified for the ban.
---@markup { MTA:SA Server }
function getUnbanTime(theBan) end

---This function checks whether the passed value is valid ban or not.
---@param theBan ban The value to check.
---@return boolean Returns true if the value is a ban, false otherwise.
---@markup { MTA:SA Server }
function isBan(theBan) end

---This function will kick the specified player from the server.
---@param kickedPlayer player The player that will be kicked from the server.
---@param responsiblePlayer player/string? The player or string that is responsible for the event. Maximum 30 characters if using a string.
---@param reason string? The reason for the kick. Max 125 characters.
---@return boolean Returns true if the player was kicked succesfully, false if invalid arguments are specified.
---@markup { MTA:SA Server }
function kickPlayer(kickedPlayer, responsiblePlayer, reason) end

---This function will reload the server ban list file.
---@return boolean Returns true if the ban list was reloaded successfully, false otherwise.
---@markup { MTA:SA Server }
function reloadBans() end

---This function will remove a specific ban.
---@param theBan ban The ban to be removed.
---@param responsibleElement player? The element that is responsible for removing the ban element. This can be a player or the root.
---@return boolean Returns true if the ban was removed succesfully, false if invalid arguments are specified.
---@markup { MTA:SA Server }
function removeBan(theBan, responsibleElement) end

---This function sets a new admin for a ban.
---@param theBan ban The ban you want to change the admin of.
---@param theAdmin string The new admin.
---@return boolean Returns true if changed, false otherwise.
---@markup { MTA:SA Server }
function setBanAdmin(theBan, theAdmin) end

---This function sets a new nick for a ban.
---@param theBan ban The ban you want to change the nick of.
---@param theNick string A string representing the nick you want to set the ban to.
---@return boolean Returns true if changed, false otherwise.
---@markup { MTA:SA Server }
function setBanNick(theBan, theNick) end

---This function sets the reason for the specified ban.
---@param theBan ban The ban that you wish to set the reason of.
---@param theReason string The new reason (max 125 characters).
---@return boolean Returns true if the new reason was set successfully, false otherwise.
---@markup { MTA:SA Server }
function setBanReason(theBan, theReason) end

---This function sets a new unban time of a given ban using unix timestamp (seconds since Jan 01 1970).
---@param theBan ban The ban of which to change the unban time of.
---@param theTime integer The new unban time.
---@return boolean Returns true if changed successfully, false otherwise.
---@markup { MTA:SA Server }
function setUnbanTime(theBan, theTime) end

-- Announcement

---This function retrieves the current gametype as set by setGameType. The game type is displayed in the server browser next to the server's name.
---@return string|nil Returns the gametype as a string. If no gametype is set it returns nil.
---@markup { MTA:SA Server }
function getGameType() end

---This function retrieves the current mapname as set by setMapName.
---@return string|nil Returns the mapname as a string. If no mapname is set it returns nil.
---@markup { MTA:SA Server }
function getMapName() end

---This function gets a rule value. A rule value is a string that can be viewed by server browsers and used for filtering the server list.
---@return string|nil Returns a string containing the value set for the specified key, false if invalid arguments were specified.
---@markup { MTA:SA Server }
function getRuleValue() end

---This function removes a set rule value that can be viewed by server browsers.
---@param key string The name of the rule you wish to remove.
---@return boolean Returns true if the rule value was removed, false if it failed.
---@markup { MTA:SA Server }
function removeRuleValue(key) end

---This function sets a string containing a name for the game type. This should be the game-mode that is active, for example Capture The Flag or Deathmatch. This is then displayed in the server browser and external server browsers.
---@param gameType string A string containing a name for the game mode, or false to clear it. (Max 200 characters).
---@return boolean Returns true if the game type was set, false if an invalid argument was passed to the function.
---@markup { MTA:SA Server }
function setGameType(gameType) end

---This function is used to set a map name that will be visible in the server browser. In practice you should generally rely on the mapmanager to do this for you.
---@param mapName string The name you wish the server browser to show. (Max 200 characters).
---@return boolean Returns true if map name was set successfully, false otherwise.
---@markup { MTA:SA Server }
function setMapName(mapName) end

---This function sets a rule value that can be viewed by server browsers.
---@param key string The name of the rule (Max 200 characters).
---@param value string The value you wish to set for the rule (Max 200 characters).
---@return boolean Returns true if the rule value was set, false if invalid arguments were specified.
---@markup { MTA:SA Server }
function setRuleValue(key, value) end

-- Audio

---The function is used to retrieve the ID of the current radio channel.
---@return integer Returns the ID of the radio channel.
---@markup { MTA:SA Client }
function getRadioChannel() end

---This function gets the given radio channel name.
---@param id integer The ID of the radio station you want to get the name of. It is a number from 0 to 12.
---@return string|false Returns a string containing the station name if successful, false otherwise.
---@markup { MTA:SA Client }
function getRadioChannelName(id) end

---This function checks if a big sound container is available to use or not.
---@param audioContainer string The container name.
---@return boolean Returns true if the sound container is available, false otherwise.
---@markup { MTA:SA Client }
function getSFXStatus(audioContainer) end

---This function gets the beats per minute of a specific sound element.
---@param theSound sound A sound element that is created using playSound or playSound3D.
---@return integer|false Returns the beats per minute of the given sound. false if bad element passed.
---@markup { MTA:SA Client }
function getSoundBPM(theSound) end

---This function gets the buffer playback length of the specified sound. Works only with streams.
---@param theSound sound The sound element which buffer length you want to get.
---@return number|false A float value indicating the buffer playback length of the sound in seconds. false if the sound is not a stream and nil if the sound is invalid.
---@markup { MTA:SA Client }
function getSoundBufferLength(theSound) end

---This function gets the parameters of a sound effect. See effects parameters.
---@param theSound sound/player The sound element to get the sound effect parameters of.
---@param effectName string The name of the effect whose parameters you want to retrieve
---@return table|false Returns a table with the parameter names as the keys, and their values. If the specified effect name is not valid, false is returned.
---@markup { MTA:SA Client }
function getSoundEffectParameters(theSound, effectName) end

---Returns the states of all effects of a sound.
---@param theSound sound/player A sound element.
---@return table|false Returns a table with the effect names as the keys, and their states as the values if successful. Otherwise, it returns false.
---@markup { MTA:SA Client }
function getSoundEffects(theSound) end

---This function gets the fast fourier transform data for an audio stream which is a table of floats representing the current audio frame. This allows things like visualisations. A fast fourier transform generates a table of all the frequencies of the current audio frame which starts at the bass end of the spectrum to mids to highs in that order. Should you have any problems there is an example resource located on the resources repository: Visualiser. Just type startmusic mystreamurl in your console and it will play on the cinema billboard near A51. If the element is a player, this function will use the players voice.
---@param theSound sound/player A sound element that is created using playSound or playSound3D. Streams are also supported.
---@param samples integer Allowed samples are 256, 512, 1024, 2048, 4096, 8192 and 16384.
---@param bands integer? Post processing option allows you to split the samples into the desired amount of bands or bars so if you only need 5 bars this saves a lot of cpu power compared to trying to do it in Lua.
---@return table|false Returns a table of samples/2 (or bands if bands is used) floats representing the current audio frame. Returns false if the sound is not playing yet or hasn't buffered in the case of streams.
---@markup { MTA:SA Client }
function getSoundFFTData(theSound, samples, bands) end

---This function is used to return the playback length of the specified sound element. If the element is a player, this function will use the players voice.
---@param theSound sound/player The sound element which length you want to return.
---@return number|false Returns an float value indicating the playback length of the sound element in seconds. false if bad sound element is passed.
---@markup { MTA:SA Client }
function getSoundLength(theSound) end

---This function gets the left/right level from a sound element. If the element is a player, this function will use the players voice.
---@param theSound sound/player The sound element which level data you want to return.
---@return integer|false | integer Returns a two integers in range from 0 to 32768. false if wrong sound element passed.
---@markup { MTA:SA Client }
function getSoundLevelData(theSound) end

---Gets a custom sound max distance at which the sound stops.
---@param theSound sound A sound element.
---@return integer|false Returns an integer of the max distance, false if invalid arguments where passed.
---@markup { MTA:SA Client }
function getSoundMaxDistance(theSound) end

---Used to get the meta tags attached to a sound. These provide information about the sound, for instance the title or the artist.
---@param theSound sound A sound element.
---@param format string? A filter string to get a specific meta tag.
---@return table|string|false Returns a table, but only a string if format is given, with all data available (keys are listed above) for the sound if successful, false otherwise. If any data is unavailable then the associated key is not written to the table.
---@markup { MTA:SA Client }
function getSoundMetaTags(theSound, format) end

---Gets a custom sound minimum distance at which the sound stops getting louder.
---@param theSound sound A sound element.
---@return integer|false Returns an integer of the minimum distance, false if invalid arguements where passed.
---@markup { MTA:SA Client }
function getSoundMinDistance(theSound) end

---This function is used to get the pan level of the specified sound element.
---@param theSound sound/player The sound element which pan you want to get.
---@return number|false Returns float value with range from -1.0 (left) to 1.0 (right), false otherwise.
---@markup { MTA:SA Client }
function getSoundPan(theSound) end

---This function is used to return the current seek position of the specified sound element. If the element is a player, this function will use the player's voice.
---@param theSound sound/player The sound element which seek position you want to return.
---@return number|false Returns a float value indicating the seek position of the sound element in seconds.
---@markup { MTA:SA Client }
function getSoundPosition(theSound) end

---This function gets the properties of a specific sound.
---@param theSound sound A sound element.
---@return number|false | number | number | boolean The first float is the sound's sample rate, the second one the sound's tempo, and the third one the pitch of the sound. The boolean representing whether the sound is reversed or not.
---@markup { MTA:SA Client }
function getSoundProperties(theSound) end

---This function is used to return the playback speed of the specified sound element.
---@param theSound sound/player The sound element which playback speed you want to return.
---@return number|false Returns an float value indicating the playback speed of the sound element. Default sound playback speed is 1.0.
---@markup { MTA:SA Client }
function getSoundSpeed(theSound) end

---This function is used to return the volume level of the specified sound element. If the element is a player, this function will use the players voice.
---@param theSound sound/player The sound element which volume you want to return.
---@return number|false Returns a float representing the volume level of the sound element, false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getSoundVolume(theSound) end

---This function gets the wave form data for an audio stream which is a table of floats representing the current audio frame as a wave. This allows things like visualisations. If the element is a player, this function will use the player's voice.
---@param theSound sound/player A sound element that is created using playSound or playSound3D. Streams are also supported
---@param samples integer Allowed samples are 256, 512, 1024, 2048, 4096, 8192 and 16384.
---@return table|false Returns a table of samples floats representing the current audio frame waveform. Returns false if the sound is not playing yet or hasn't buffered in the case of streams.
---@markup { MTA:SA Client }
function getSoundWaveData(theSound, samples) end

---This function is used to return the current loop state of the sound element.
---@param theSound sound The sound element which you want to get the loop state.
---@return boolean Returns true if the sound element is looped, false otherwise.
---@markup { MTA:SA Client }
function isSoundLooped(theSound) end

---This function checks whether panning is enabled in a sound element or not.
---@param theSound sound A valid sound element.
---@return boolean Returns true if the sound is valid and it has panning enabled, false if it does not or is not valid.
---@markup { MTA:SA Client }
function isSoundPanningEnabled(theSound) end

---This function is used to return the current pause state of the specified sound element. If the element is a player, this function will use the players voice.
---@param theSound sound/player The sound element which pause state you want to return.
---@return boolean Returns true if the sound element is paused, false if unpaused or invalid arguments were passed.
---@markup { MTA:SA Client }
function isSoundPaused(theSound) end

---This function plays a sound from GTA's big sound containers.
---@param containerName string The name of the audio container. Possible values are "feet", "genrl", "paina", "script", "spcea", "spcfa", "spcga", spcna", "spcpa", "radio".
---@param bankId integer The audio bank id.
---@param soundId integer The sound id within the audio bank.
---@param looped boolean? A boolean representing whether the sound will be looped.
---@return sound Returns a sound element if the sound was successfully created, false otherwise.
---@markup { MTA:SA Client }
function playSFX(containerName, bankId, soundId, looped) end

---This function plays a sound in the GTA world from GTA's big sound containers.
---@param containerName string The name of the audio container. Possible values are "feet", "genrl", "paina", "script", "spcea", "spcfa", "spcga", spcna", "spcpa", "radio".
---@param bankId integer The audio bank id.
---@param soundId integer The sound id within the audio bank.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param looped boolean? A boolean representing whether the sound will be looped.
---@return sound Returns a sound element if the sound was successfully created, false otherwise.
---@markup { MTA:SA Client }
function playSFX3D(containerName, bankId, soundId, x, y, z, looped) end

---Creates a sound element and plays it immediately after creation for the local player.
---@param soundPathOrData string filepath, raw data or URL (http://, https:// or ftp://) of the sound file you want to play.
---@param looped boolean? A boolean representing whether the sound will be looped. To loop the sound, use true. Loop is not available for streaming sounds, only for sound files.
---@param throttled boolean? A boolean representing whether the sound will be throttled (i.e. given reduced download bandwidth). To throttle the sound, use true. Sounds will be throttled per default and only for URLs.
---@return sound|false Returns a sound element if the sound was successfully created, false otherwise.
---@markup { MTA:SA Client }
function playSound(soundPathOrData, looped, throttled) end

---Creates a sound element in the GTA world and plays it immediately after creation for the local player. setElementPosition can be used to move the sound element around after it has been created. Remember to use setElementDimension after creating the sound to play it outside of dimension 0.
---@param soundPathOrData string filepath, raw data or URL (http://, https:// or ftp://) of the sound file you want to play.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param looped boolean? A boolean representing whether the sound will be looped. To loop the sound, use true. Loop is not available for streaming sounds, only for sound files.
---@param throttled boolean? A boolean representing whether the sound will be throttled (i.e. given reduced download bandwidth). To throttle the sound, use true. Sounds will be throttled per default and only for URLs.
---@return sound|false Returns a sound element if the sound was successfully created, false otherwise.
---@markup { MTA:SA Client }
function playSound3D(soundPathOrData, x, y, z, looped, throttled) end

---This function plays a frontend sound for the specified player.
---@param thePlayer player The player you want the sound to play for.
---@param sound integer A whole int specifying the sound id to play.
---@return boolean Returns true if the sound was successfully played, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function playSoundFrontEnd(thePlayer, sound) end

---This function sets the heard radio channel, even while not in a vehicle.
---@param ID integer The ID of the radio station you want to play.
---@return boolean Returns true if channel was set successfully, false otherwise.
---@markup { MTA:SA Client }
function setRadioChannel(ID) end

---Used to enable or disable specific sound effects. Use a player element to control a players voice with this function.
---@param theSound sound/player A sound element or a player element which will affect the voice broadcast.
---@param effectName string The effect you want to enable or disable.
---@param enable boolean true if you want to enable the effect, false if you want to disable it.
---@return boolean Returns true if the effect was set successfully, false otherwise.
---@markup { MTA:SA Client }
function setSoundEffectEnabled(theSound, effectName, enable) end

---This function sets the parameter of a sound effect. See effects parameters.
---@param theSound sound/player The sound element.
---@param effectName string The name of the effect whose parameter you want to change
---@param effectParam string The parameter name.
---@param paramValue var The parameter value.
---@return boolean Returns true if effect have been set successfully, false otherwise.
---@markup { MTA:SA Client }
function setSoundEffectParameter(theSound, effectName, effectParam, paramValue) end

---This function is used to change the loop state of the sound element.
---@param theSound sound The sound element to set the loop.
---@param loop boolean A boolean representing whether the sound will be looped.
---@return boolean Returns true if the sound element loop state was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function setSoundLooped(theSound, loop) end

---Sets a custom sound max distance at which the sound stops.
---@param theSound sound A sound element.
---@param distance integer The default value for this is 20.
---@return boolean Returns a true if the max distance was set, false otherwise.
---@markup { MTA:SA Client }
function setSoundMaxDistance(theSound, distance) end

---Sets a custom sound minimum distance at which the sound stops getting louder.
---@param theSound sound A sound element.
---@param distance integer An integer representing the distance the sound stops getting louder. The default value for this is 5.
---@return boolean Returns a true if the minimum distance was set, false otherwise.
---@markup { MTA:SA Client }
function setSoundMinDistance(theSound, distance) end

---This function is used to change the pan level of the specified sound element.
---@param theSound sound/player The sound element which pan you want to modify.
---@param pan number A floating point number representing the desired pan level. Range is from -1.0 (left) to 1.0 (right).
---@return boolean Returns true if the sound element pan was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function setSoundPan(theSound, pan) end

---This function toggles the panning of a sound (hearing it closer to the left or right side of the speakers due to the camera position). By default a sound has its panning enabled.
---@param theSound sound A sound element to change the panning of.
---@param enabled boolean true to enable the panning, false otherwise.
---@return boolean Returns true if the sound is valid and good arguments were passed, false if not. If the sound is not 3D, this function will return true as well, but isSoundPanningEnabled will always return true after this (so it has no effect).
---@markup { MTA:SA Client }
function setSoundPanningEnabled(theSound, enabled) end

---This function is used to either pause or unpause the playback of the specified sound element. Use a player element to control a players voice with this function.
---@param theSound sound/player The sound element which you want to pause/unpause.
---@param paused boolean A boolean value representing whether the sound should be paused or not. To pause the sound, use true.
---@return boolean Returns true if the sound element was successfully paused, false otherwise.
---@markup { MTA:SA Client }
function setSoundPaused(theSound, paused) end

---This function is used to change the seek position of the specified sound element. Use a player element to control a players voice with this function.
---@param theSound sound/player The sound element which seek position you want to modify.
---@param pos number A float value representing the new seek position of the sound element in seconds.
---@return boolean Returns true if the sound element's seek position was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function setSoundPosition(theSound, pos) end

---This function edits the properties of a specific sound.
---@param theSound sound A sound element that is created using playSound or playSound3D.
---@param sampleRate number A float that defines the new sound's sample rate.
---@param tempo number A float that defines the new sound tempo.
---@param pitch number A float that defines the new sound pitch.
---@param reverse boolean? A boolean representing whether the sound will be reversed or not.
---@return boolean Returns true if the properties sucessfully set, false otherwise.
---@markup { MTA:SA Client }
function setSoundProperties(theSound, sampleRate, tempo, pitch, reverse) end

---This function can be used to change the playback speed of the specified sound element.
---@param theSound sound/player The sound element which speed you want to modify.
---@param speed number A floating point number representing the desired sound playback speed.
---@return boolean Returns true if the sound element playback speed was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function setSoundSpeed(theSound, speed) end

---This function is used to change the volume level of the specified sound element. Use a player element to control a players voice with this function.
---@param theSound sound/player The sound element which volume you want to modify or a player element which voice volume you want to modify.
---@param volume number A floating point number representing the desired volume level. Range is from 0.0 to 1.0. This can go above 1.0 for amplification.
---@return boolean Returns true if the sound element volume was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function setSoundVolume(theSound, volume) end

---Stops the sound playback for specified sound element. The sound element is also destroyed.
---@param theSound sound The sound element you want to stop playing.
---@return boolean Returns true if the sound was successfully stopped, false otherwise.
---@markup { MTA:SA Client }
function stopSound(theSound) end

-- Blip

---This function creates a blip element, which is displayed as an icon on the client's radar.
---@param x number The x position of the blip, in world coordinates.
---@param y number The y position of the blip, in world coordinates.
---@param z number The z position of the blip, in world coordinates.
---@param icon integer? The icon that the radar blips should be. Default is 0. Valid values can be seen at Radar Blips.
---@param size integer? The size of the radar blip. Only applicable to the Marker icon. Default is 2. Maximum is 25.
---@param r integer? The amount of red in the blip's color (0-255). Only applicable to the Marker icon. Default is 255.
---@param g integer? The amount of green in the blip's color (0-255). Only applicable to the Marker icon. Default is 0.
---@param b integer? The amount of blue in the blip's color (0-255). Only applicable to the Marker icon. Default is 0.
---@param a integer? The amount of alpha in the blip's color (0-255). Only applicable to the Marker icon. Default is 255.
---@param ordering integer? This defines the blip's Z-level ordering (-32768-32767). Default is 0.
---@param visibleDistance number? The maximum distance from the camera at which the blip is still visible (0-65535).
---@param visibleTo element? This defines which elements can see the blip. Defaults to visible to everyone. See Visibility.
---@return blip|false Returns an element of the blip if it was created successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function createBlip(x, y, z, icon, size, r, g, b, a, ordering, visibleDistance, visibleTo) end

---This function creates a blip that is attached to an element. This blip is displayed as an icon on the client's radar and will 'follow' the element that it is attached to around.
---@param elementToAttachTo element The element to attach the blip to.
---@param icon integer? The icon that the radar blips should be. Default is 0. Valid values can be seen at Radar Blips.
---@param size integer? The size of the radar blip. Only applicable to the Marker icon. Default is 2. Maximum is 25.
---@param r integer? The amount of red in the blip's color (0-255). Only applicable to the Marker icon. Default is 255.
---@param g integer? The amount of green in the blip's color (0-255). Only applicable to the Marker icon. Default is 0.
---@param b integer? The amount of blue in the blip's color (0-255). Only applicable to the Marker icon. Default is 0.
---@param a integer? The amount of alpha in the blip's color (0-255). Only applicable to the Marker icon. Default is 255.
---@param ordering integer? This defines the blip's Z-level ordering (-32768-32767). Default is 0.
---@param visibleDistance number? The maximum distance from the camera at which the blip is still visible (0-65535).
---@param visibleTo element? This defines which elements can see the blip. Defaults to visible to everyone. See Visibility.
---@return blip|false Returns an element of the blip if it was created successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function createBlipAttachedTo(elementToAttachTo, icon, size, r, g, b, a, ordering, visibleDistance, visibleTo) end

---This function will tell you what color a blip is. This color is only applicable to the marker blip icon (ID 0). All other icons will ignore this.
---@param theBlip blip The blip whose color you wish to get.
---@return integer|false | integer | integer | integer Returns four integers in RGBA format, with a maximum value of 255 for each. The values are, in order, red, green, blue, and alpha. Alpha decides the transparancy where 255 is opaque and 0 is fully transparent. false is returned if the blip is invalid.
---@markup { MTA:SA Shared }
function getBlipColor(theBlip) end

---This function returns the icon a blip currently has. See Radar Blips.
---@param theBlip blip The blip we're getting the icon number of.
---@return integer|false Returns an int indicating which icon the blip has. false if blip element is invalid.
---@markup { MTA:SA Shared }
function getBlipIcon(theBlip) end

---This function gets the Z ordering value of a blip. The Z ordering determines if a blip appears on top of or below other blips. Blips with a higher Z ordering value appear on top of blips with a lower value. The default value for all blips is 0.
---@param theBlip blip The blip to retrieve the Z ordering value of.
---@return integer|false Returns the Z ordering value of the blip if successful, false otherwise.
---@markup { MTA:SA Shared }
function getBlipOrdering(theBlip) end

---This function gets the size of a blip.
---@param theBlip blip The blip you wish to get the size of.
---@return integer|false Returns an int indicating the size of the blip. The default value is 2. The maximum value is 25. false if blip element is invalid.
---@markup { MTA:SA Shared }
function getBlipSize(theBlip) end

---This function will tell you what visible distance a blip has.
---@param theBlip blip The blip whose visible distance you wish to get.
---@return number|false Returns one float with the blips visible distance, false if the blip is invalid.
---@markup { MTA:SA Shared }
function getBlipVisibleDistance(theBlip) end

---This function will let you change the color of a blip. This color is only applicable to the marker blip icon (ID 0). All other icons will ignore this.
---@param theBlip blip The blip who's color you wish to set.
---@param red integer The amount of red in the blip's color (0 - 255).
---@param green integer The amount of green in the blip's color (0 - 255).
---@param blue integer The amount of blue in the blip's color (0 - 255).
---@param alpha integer The amount of alpha in the blip's color (0 - 255). Alpha decides transparancy where 255 is opaque and 0 is transparent.
---@return boolean Returns true if the blip's color was set successfully. Returns false if the blip passed to the function is invalid, or any of the colors are out of the valid range.
---@markup { MTA:SA Shared }
function setBlipColor(theBlip, red, green, blue, alpha) end

---This function sets the icon for an existing blip element.
---@param theBlip blip The blip you wish to set the icon of.
---@param icon integer A number indicating the icon you wish to change it do. Valid values are listed on the Radar Blips page.
---@return boolean Returns true if the icon was successfully set, false if the element passed was not a valid blip or the icon value was not a valid icon number.
---@markup { MTA:SA Shared }
function setBlipIcon(theBlip, icon) end

---This function sets the Z ordering of a blip. It allows you to make a blip appear on top of or below other blips.
---@param theBlip blip The blip whose Z ordering to change.
---@param ordering integer The new Z ordering value. Blips with higher values will appear on top of blips with lower values. Possible range is -32767 to 32767. Default is 0.
---@return boolean Returns true if the blip ordering was changed successfully, false otherwise.
---@markup { MTA:SA Shared/Server }
function setBlipOrdering(theBlip, ordering) end

---This function sets the size of a blip's icon.
---@param theBlip blip The blip you wish to set the size of.
---@param size integer The size you wish the icon to be. 2 is the default value. 25 is the maximum value. Value gets clamped between 0 and 25.
---@return boolean Returns an true if the blip's size was set successfully. Returns false if the element passed was not a blip or if the icon size passed was invalid.
---@markup { MTA:SA Shared }
function setBlipSize(theBlip, size) end

---This function will set the visible distance of a blip.
---@param theBlip blip The blip whose visible distance you wish to set.
---@param theDistance number The distance you want the blip to be visible for. Value gets clamped between 0 and 65535.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setBlipVisibleDistance(theBlip, theDistance) end

-- Browser

---This function checks if the browser can return to the previous page.
---@param webBrowser browser The browser you want to check for a previous page.
---@return boolean Returns true if the browser can navigate back, false otherwise.
---@markup { MTA:SA Client }
function canBrowserNavigateBack(webBrowser) end

---This function checks if the browser can go to the next page.
---@param webBrowser browser The browser you want check for a next page.
---@return boolean Returns true if the browser can go to the next page, false otherwise.
---@markup { MTA:SA Client }
function canBrowserNavigateForward(webBrowser) end

---This function creates a new web browser element.
---@param width integer The browser's native width. This should be greater than or equal to 1.
---@param height integer The browser's native height. This should be greater than or equal to 1.
---@param isLocal boolean Sets whether the browser can only show local content or content from the internet (see examples for more information).
---@param transparent boolean? true if you want the browser transparent, false for opaque.
---@return element|false Returns a texture of the browser if it was created successfully, false otherwise. Returns also false, if the user disabled remote pages and isLocal was set to false.
---@markup { MTA:SA Client }
function createBrowser(width, height, isLocal, transparent) end

---This function executes a Javascript string to the specified browser. Works only with local browsers.
---@param webBrowser browser The web browser which will execute the Javascript code.
---@param jsCode string The Javascript code string.
---@return boolean Returns true if executing Javascript is allowed in the current context, false otherwise.
---@markup { MTA:SA Client }
function executeBrowserJavascript(webBrowser, jsCode) end

---This function will attempt to focus the browser or unfocus all browsers. The browser that is focused will retrieve keyboard input.
---@param webBrowser browser? The web browser to be focused - if this is nil, it will unfocus all browsers.
---@return boolean Returns true if the browser was focused or if nil was passed, false if it failed to focus or the browser does not exist.
---@markup { MTA:SA Client }
function focusBrowser(webBrowser) end

---This function gets a given property of a specified browser.
---@param webBrowser browser A browser element to get the property value of.
---@param property string The browser property key.
---@return string|nil Returns the value if the property was successfully found, nil otherwise.
---@markup { MTA:SA Client }
function getBrowserProperty(webBrowser, property) end

---This function returns a table containing the browser settings.
---@return table A table of settings.
---@markup { MTA:SA Client }
function getBrowserSettings() end

---This function can be used to retrieve the source code of a website (asynchronously). The size of the source code is limited to 2 MiB (remaining bytes are cut).
---@param webBrowser browser The browser element you want to get the source of.
---@param callback ( code ) function A callback function with syntax function (string code).
---@return boolean Returns true if valid arguments have been passed, false otherwise.
---@markup { MTA:SA Client }
function getBrowserSource(webBrowser, callback ( code )) end

---This function returns the title of the passed browser.
---@param webBrowser browser The browser.
---@return string|false Returns the title as a string. Returns false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getBrowserTitle(webBrowser) end

---This function returns the URL of the specified browser.
---@param webBrowser browser The browser.
---@return string|false Returns the web browser URL. Returns false if the browser element is invalid.
---@markup { MTA:SA Client }
function getBrowserURL(webBrowser) end

---This function injects a mouse click (state: down).
---@param webBrowser browser The browser.
---@param mouseButton string The mouse button (Possible values: left, middle, right).
---@param doubleClick boolean? Specifies whether it is a double click or not.
---@return boolean Returns true if the click was successfully injected, false otherwise.
---@markup { MTA:SA Client }
function injectBrowserMouseDown(webBrowser, mouseButton, doubleClick) end

---This function injects a mouse movement.
---@param webBrowser browser The browser which will retrieve the mouse movement.
---@param posX integer Absolute X screen coordinate.
---@param posY integer Absolute Y screen coordinate.
---@return boolean Returns true if the movement was injected successfully, false otherwise.
---@markup { MTA:SA Client }
function injectBrowserMouseMove(webBrowser, posX, posY) end

---This function injects a mouse click (state: up).
---@param webBrowser browser The browser.
---@param mouseButton string The mouse button (Possible values: left, middle, right).
---@return boolean Returns true if the click was successfully injected, false otherwise.
---@markup { MTA:SA Client }
function injectBrowserMouseUp(webBrowser, mouseButton) end

---This function injects mouse wheel events.
---@param webBrowser browser The web browser.
---@param verticalScroll integer Amount of units you want the browser to scroll along the Y-axe.
---@param horizontalScroll integer Amount of units you want the browser to scroll along the X-axe.
---@return boolean Returns true if the mouse action was successfully injected, false otherwise.
---@markup { MTA:SA Client }
function injectBrowserMouseWheel(webBrowser, verticalScroll, horizontalScroll) end

---This function checks if the specified URL is blocked from being loaded.
---@param address string A website URL.
---@param isURL boolean? true if address should be parsed as URL, false otherwise.
---@return boolean Returns false if the URL is able to be loaded, true if it is blocked and nil if an invalid domain/URL was passed.
---@markup { MTA:SA Client }
function isBrowserDomainBlocked(address, isURL) end

---This function checks if a browser is focused.
---@param webBrowser browser The browser.
---@return boolean Returns true if the browser is focused, false otherwise and nil if invalid arguments were passed.
---@markup { MTA:SA Client }
function isBrowserFocused(webBrowser) end

---This function checks if the client has the Enable GPU rendering setting enabled, which allows the usage of things like WebGL in browsers.
---@return boolean Returns true if the client has browser GPU rendering enabled, false otherwise.
---@markup { MTA:SA Client }
function isBrowserGPUEnabled() end

---This function checks if a browser is currently loading a website.
---@param webBrowser browser The browser.
---@return boolean Returns true if the browser is loading a website, false otherwise and nil if invalid arguments were passed.
---@markup { MTA:SA Client }
function isBrowserLoading(webBrowser) end

---This function gets the rendering state of a browser element.
---@param webBrowser browser The browser element to get the rendering state of.
---@return boolean Returns true if the browser rendering is paused, false otherwise.
---@markup { MTA:SA Client }
function isBrowserRenderingPaused(webBrowser) end

---This function loads the specified URL.
---@param webBrowser browser The browser element which will load the URL.
---@param url string The url you want to load. It can either contain a remote website ("http://" prefix) or a website stored within a local resource ("http://mta/local/gui.html" for example, see Local Scheme Handler for details).
---@param postData string? The post data passed to the website. Its content type can be any type (e.g. JSON) if urlEncoded is set to false.
---@param urlEncoded boolean? If set to true, it will be available f.e. in PHP's $_POST variable (the content type is application/x-www-form-urlencoded).
---@return boolean Returns true if the URL was successfully loaded.
---@markup { MTA:SA Client }
function loadBrowserURL(webBrowser, url, postData, urlEncoded) end

---Returns the browser to the previous page.
---@param webBrowser browser The browser that you want return to the previous page.
---@return boolean Returns true if the browser has returned to the previous page, false otherwise.
---@markup { MTA:SA Client }
function navigateBrowserBack(webBrowser) end

---This function takes the browser to the next page.
---@param webBrowser browser The browser that you want to take to the next page.
---@return boolean Returns true if the browser has gone to the next page, false otherwise.
---@markup { MTA:SA Client }
function navigateBrowserForward(webBrowser) end

---This function reloads the current browser's page.
---@param webBrowser browser The browser that you want to reload.
---@param ignoreCache boolean? Ignoring cached content, Equivalent to Shift + F5 in most browsers.
---@return boolean Returns true if the browser has reloaded, false otherwise.
---@markup { MTA:SA Client }
function reloadBrowserPage(webBrowser, ignoreCache) end

---This function opens a request window in order to accept the requested remote URLs.
---@param pages table A table containing all domains.
---@param parseAsURL boolean? true if the passed addresses should be converted from URLs, false otherwise.
---@param callback (wasAccepted, new_domains) function? A callback function that is called as soon as the result is available.Syntax function(bool wasAccepted, table new_domains)
---@return boolean Returns true, if the string was successfully read, false otherwise.
---@markup { MTA:SA Client }
function requestBrowserDomains(pages, parseAsURL, callback (wasAccepted, new_domains)) end

---Allows resizing of CEF browsers at runtime.
---@param webBrowser browser The browser you want to resize.
---@param width number The new width of the browser.
---@param height number The new height of the browser.
---@return boolean Returns true if the browser is resized successfully, false if there's something wrong.
---@markup { MTA:SA Client }
function resizeBrowser(webBrowser, width, height) end

---This function provides a requestable ajax resource for Lua/Javascript communication for a browser.
---@param webBrowser browser The web browser which will execute the Javascript code.
---@param url string The URL endpoint to handle.
---@param handler ( get_table, post_table ) function? The function to call if the webBrowser attempts to open the ajax endpoint. If this parameter is nil or omitted, the ajax handler for the url will be deleted.
---@return boolean Returns true if the ajax handler could be created/removed.
---@markup { MTA:SA Client }
function setBrowserAjaxHandler(webBrowser, url, handler ( get_table, post_table )) end

---This function sets a given property of a specified browser.
---@param webBrowser browser The browser element you want to set a property of.
---@param key string The browser property key.
---@param value string A value indicating whether to enable ("1") the property or not ("0").
---@return boolean Returns true if the property was successfully set, false otherwise.
---@markup { MTA:SA Client }
function setBrowserProperty(webBrowser, key, value) end

---This function sets the rendering state of a browser.
---@param webBrowser browser The browser.
---@param paused boolean true to pause rendering, false to continue.
---@return boolean Returns true if the state was successfully changed.
---@markup { MTA:SA Client }
function setBrowserRenderingPaused(webBrowser, paused) end

---This function sets either a specific browser's volume, or the overall volume for browsers.
---@param webBrowser browser? A browser element.
---@param volume number A floating point number representing the desired volume level. Range is from 0.0 to 1.0.
---@return boolean Returns true if successfully, false if there's something wrong.
---@markup { MTA:SA Client }
function setBrowserVolume(webBrowser, volume) end

---This function toggles the visibility of the developer tools panel.
---@param webBrowser browser The browser.
---@param visible boolean true to show the tools, false to hide.
---@return boolean Returns true if the visibility was successfully toggled, false if an error occurred.
---@markup { MTA:SA Client }
function toggleBrowserDevTools(webBrowser, visible) end

-- Building

---Creates a building element at a given position & interior with a certain rotation.
---@param modelId integer A whole integer specifying the GTA:SA object model ID. See Object IDs for a list of model IDs.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rx number? A floating point number representing the rotation about the X axis in degrees.
---@param ry number? A floating point number representing the rotation about the Y axis in degrees.
---@param rz number? A floating point number representing the rotation about the Z axis in degrees.
---@param interior integer? The interior you want to set the building to. Valid values are 0 to 255.
---@return building Returns the building element if the creation was successful, throws an error otherwise.
---@markup { MTA:SA Shared/Client }
function createBuilding(modelId, x, y, z, rx, ry, rz, interior) end

-- Camera

---This function will fade a player's camera to a color or back to normal over a specified time period.
---@param thePlayer player The player whose camera you wish to fade.
---@param fadeIn boolean Should the camera be faded in or out? Pass true to fade the camera in, false to fade it out to a color.
---@param timeToFade number? The number of seconds it should take to fade.
---@param red integer? The amount of red in the color that the camera fades out to (0 - 255). Not required for fading in.
---@param green integer? The amount of green in the color that the camera fades out to (0 - 255). Not required for fading in.
---@param blue integer? The amount of blue in the color that the camera fades out to (0 - 255). Not required for fading in.
---@return boolean Returns true if the camera was faded successfully, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server/Client }
function fadeCamera(thePlayer, fadeIn, timeToFade, red, green, blue) end

---This function returns an element that corresponds to the game camera.
---@return element Returns an camera element that corresponds to the game camera.
---@markup { MTA:SA Client }
function getCamera() end

---This function checks if the camera will "collide" with any objects or vehicles in its way. Read more about this setCameraClip.
---@return boolean | boolean This function checks the clip status.
---@markup { MTA:SA Client }
function getCameraClip() end

---This function gets the camera drunk level set by setCameraDrunkLevel. Drunk effect is a wavy motion of the camera depicting the player being drunk.
---@return integer Returns an int representing the camera drunk level, from 0 (no drunk effect) to 255 (maximum drunk effect).
---@markup { MTA:SA Client }
function getCameraDrunkLevel() end

---This function returns the field of view of the dynamic camera as set by setCameraFieldOfView.
---@param cameraMode string The camera mode to get the field of view.
---@return number Returns one float - the field of view angle.
---@markup { MTA:SA Client }
function getCameraFieldOfView(cameraMode) end

---This function returns what goggle effect is currently affecting the camera.
---@return string Returns string indicating the current camera goggle effect. Their meanings can be seen above.
---@markup { MTA:SA Client }
function getCameraGoggleEffect() end

---Returns the interior of the local camera (independent of the interior of the local player).
---@param thePlayer player The player whose camera interior you want to get.
---@return integer|false Returns an int indicating the camera's interior, false if the argument is invalid.
---@markup { MTA:SA Shared/Server/Client }
function getCameraInterior(thePlayer) end

---This function gets the position of the camera and the position of the point it is facing.
---@param thePlayer player The player whose camera matrix is to be returned.
---@return number|false | number | number | number | number | number | number | number This function returns 8 floats if the argument is valid (when applicable); the first three indicate the position of the camera, the next three indicate the position of the point it's facing, and the last two are the roll and field of view. Returns false if the argument is invalid.
---@markup { MTA:SA Shared/Client }
function getCameraMatrix(thePlayer) end

---This function returns an element that corresponds to the current target of the specified player's camera (i.e. what it is following).
---@param thePlayer player The player whose camera you wish to receive the target of.
---@return element|false Returns an element of the target if the function was successful, or false if bad arguments were specified. Returns false if the camera is in Fixed mode and has no target.
---@markup { MTA:SA Shared/Server/Client }
function getCameraTarget(thePlayer) end

---This function allows you to get the active camera view modes. This indicates at what distance the camera will follow the player or vehicle.
---@return integer | integer Returns two values indicating the current vehicle and ped camera view mode respectively.
---@markup { MTA:SA Client }
function getCameraViewMode() end

---This function cancels the shaking effect caused by shakeCamera.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function resetShakeCamera() end

---This function sets if the camera will "collide" with any objects or vehicles in its way. This means that if object clip is enabled an object is in the way of where the camera actually wants to be, the camera will try to be in front of it. This function can disable that.
---@param objects boolean? Sets if you want the camera to clip on objects.
---@param vehicles boolean? Sets if you want the camera to clip on vehicles.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function setCameraClip(objects, vehicles) end

---Drunk effect is a wavy motion of the camera depicting the player being drunk.
---@param shakeLevel integer An integer between 0 and 255, which represents the camera drunk intensity level.
---@return boolean Returns true if the camera drunk level was changed, false if the required argument is incorrect or missing.
---@markup { MTA:SA Client }
function setCameraDrunkLevel(shakeLevel) end

---This function sets the field of view of the dynamic camera - this is the field of view of the non-fixed camera - yes, the camera that the user can control whilst on foot or in a vehicle. The higher the field of view angle, the more you will be able to see to your sides.
---@param cameraMode string The camera mode to set the field of view of.
---@param fieldOfView number The field of view angle, 0 to 179.
---@param instant boolean? If set to true, the value is applied immediately, without delay (does not work with "vehicle_max").
---@return boolean Returns true if the arguments are valid, false otherwise.
---@markup { MTA:SA Client }
function setCameraFieldOfView(cameraMode, fieldOfView, instant) end

---This function allows you to set the camera's current goggle effect. This means you can activate nightvision or infrared effects by script
---@param goggleEffect string The goggle effect you wish to set.
---@param noiseEnabled boolean? Whether or not there should be a fuzzy noise effect.
---@return boolean Returns true if the effect was set correctly, false otherwise.
---@markup { MTA:SA Client }
function setCameraGoggleEffect(goggleEffect, noiseEnabled) end

---Sets the interior of the local camera. Only the interior of the camera is changed, the local player stays in the interior he was in.
---@param thePlayer player The player whose camera interior will be set.
---@param interior integer The interior to place the camera in.
---@return boolean Returns true if the camera's interior was changed successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function setCameraInterior(thePlayer, interior) end

---This function sets the camera's position and direction. The first three arguments are the point at which the camera lies, the last three are the point the camera faces (or the point it "looks at").
---@param thePlayer player The player whose camera is to be changed.
---@param positionX number The x coordinate of the camera's position.
---@param positionY number The y coordinate of the camera's position.
---@param positionZ number The z coordinate of the camera's position.
---@param lookAtX number? The x coordinate of the point the camera faces.
---@param lookAtY number? The y coordinate of the point the camera faces.
---@param lookAtZ number? The z coordinate of the point the camera faces.
---@param roll number? The camera roll angle, -180 to 180. A value of 0 means the camera sits straight, positive values will turn it counter-clockwise and negative values will turn it clockwise. -180 or 180 means the camera is upside down.
---@param fov number? The field of view angle, 0.01 to 179. The higher this value is, the more you will be able to see what is to your sides.
---@return boolean Returns true if the arguments are valid, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function setCameraMatrix(thePlayer, positionX, positionY, positionZ, lookAtX, lookAtY, lookAtZ, roll, fov) end

---This function allows you to set a player's camera to follow other elements instead. Currently supported element type is player, ped and vehicle.
---@param thePlayer player The player whose camera you wish to modify.
---@param target element? The element who you want the camera to follow. If none is specified, the camera will target the player.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared/Client }
function setCameraTarget(thePlayer, target) end

---This function allows you to set the camera view modes. This indicates at what distance the camera will follow the player or vehicle.
---@param vehicleCameraMode integer? The view mode you wish to use when inside vehicles.
---@param pedCameraMode integer? The view mode you wish to use when you are not inside vehicles.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function setCameraViewMode(vehicleCameraMode, pedCameraMode) end

---This function allows you to trigger camera shake effect (just like explosion does).
---@param force number Intensity and time of the shake. The higher the value, the longer the camera shakes.
---@param x number? Center X coordinate of the shake.
---@param y number? Center Y coordinate of the shake.
---@param z number? Center Z coordinate of the shake.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function shakeCamera(force, x, y, z) end

-- Clothes_and_body

---This function adds a new wearable clothing item for CJ.
---@param clothesTexture string A string determining the clothes texture that will be added.
---@param clothesModel string A string determining the clothes model that will be added.
---@param clothesType integer A int representing the clothes slot/type the clothes should be added to.
---@return boolean Returns true if the clothing was added, and false otherwise.
---@markup { MTA:SA Client }
function addClothingModel(clothesTexture, clothesModel, clothesType) end

---This function is used to get the name of a body part on a player.
---@param bodyPartID integer An integer representing the body part ID you wish to retrieve the name of.
---@return string|false This function returns a string containing the body part name if the ID is valid, false otherwise.
---@markup { MTA:SA Shared/Server }
function getBodyPartName(bodyPartID) end

---This function is used to get the texture and model of clothes by the clothes type and index. (Scans through the list of clothes for the specific type).
---@param clothesType integer An integer representing the clothes slot/type to scan through.
---@param clothesIndex integer An integer representing the index (0 based) set of clothes in the list you wish to retrieve. Each type has a different number of valid indexes.
---@return string|false | string This function returns 2 strings, a texture and model respectively, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function getClothesByTypeIndex(clothesType, clothesIndex) end

---This function is used to get the name of a certain clothes type.
---@param clothesType integer An integer determining the type of clothes you want to get the clothes of.
---@return string|false This function returns a string (the name of the clothes type) if found, false otherwise.
---@markup { MTA:SA Shared/Server }
function getClothesTypeName(clothesType) end

---This function is used to get the clothes type and index from the texture and model. (Scans through the list of clothes for the specific type).
---@param clothesTexture string A string determining the clothes texture that you wish to retrieve the type and index from. See the clothes catalog.
---@param clothesModel string A string determining the corresponding clothes model that you wish to retrieve the type and index from. See the clothes catalog.
---@return integer|false | integer This function returns two ints, type and index respectively, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function getTypeIndexFromClothes(clothesTexture, clothesModel) end

-- Colshape

---This function is used to add a new point to an existing colshape polygon.
---@param shape colshape The colshape polygon you wish add a point to.
---@param fX number The X position of the new bound point.
---@param fY number The Y position of the new bound point.
---@param index integer? The index where the new point will be inserted in the polygon. The points are indexed in order, with 1 being the first bound point. Passing 0 will insert the point as the last one in the polygon.
---@return boolean Returns true if the polygon was changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function addColPolygonPoint(shape, fX, fY, index) end

---This function creates a collision circle. This is a shape that has a position and a radius and infinite height. Events will be triggered when a element enters or leaves it.
---@param fX number The collision circle's center point's X axis position.
---@param fY number The collision circle's center point's Y axis position.
---@param radius number The radius of the collision circle. Can not be smaller than 0.1.
---@return colshape|false Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColCircle(fX, fY, radius) end

---This function creates a collision cuboid. This is a shape that has a position, width, depth and height. See Wikipedia for a definition of a cuboid. The XYZ of the col starts at the southwest bottom corner of the shape.
---@param fX number The X position of the collision cuboid's western side.
---@param fY number The Y position of the collision cuboid's southern side.
---@param fZ number The Z position of the collision cuboid's lowest side.
---@param fWidth number The collision cuboid's width.
---@param fDepth number The collision cuboid's depth.
---@param fHeight number The collision cuboid's height.
---@return colshape|false Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColCuboid(fX, fY, fZ, fWidth, fDepth, fHeight) end

---This function creates a collision polygon. See Wikipedia for a definition of a polygon. The first set of X Y of this shape is not part of the colshape bounds, so can set anywhere in the game world, however for performance, place it as close to the centre of the polygon as you can. It should be noted this shape is 2D. There should be at least 3 bound points set.
---@param fCenterX number The X position of the collision polygon's position - the position that will be returned from getElementPosition.
---@param fCenterY number The Y position of the collision polygon's position - the position that will be returned from getElementPosition.
---@param fX1 number The 1st X position of the collision polygon's bound point
---@param fY1 number The 1st Y position of the collision polygon's bound point
---@param fX2 number The 2nd X position of the collision polygon's bound point
---@param fY2 number The 2nd Y position of the collision polygon's bound point
---@param fX3 number The 3rd X position of the collision polygon's bound point
---@param fY3 number The 3rd Y position of the collision polygon's bound point
---@param ... any From the 3rd position you can have as many points as you require to create the colshape.
---@return colshape|false Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColPolygon(fCenterX, fCenterY, fX1, fY1, fX2, fY2, fX3, fY3, ...) end

---This function creates a collision rectangle. This is a shape that has a position and a width and a depth and infinite height. See Rectangle for a definition of a rectangle. XY marks on the south west corner of the colshape.
---@param fX number The X position of the collision rectangle's west side.
---@param fY number The Y position of the collision rectangle's south side.
---@param fWidth number The collision rectangle's width.
---@param fDepth number The collision rectangle's depth.
---@return colshape|false Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColRectangle(fX, fY, fWidth, fDepth) end

---This function creates a collision sphere. This is a shape that has a position and a radius. See Wikipedia for a definition of a sphere.
---@param fX number The collision sphere's center point's X axis position.
---@param fY number The collision sphere's center point's Y axis position.
---@param fZ number The collision sphere's center point's Z axis position.
---@param fRadius number The collision sphere's radius.
---@return colshape|false Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColSphere(fX, fY, fZ, fRadius) end

---This function creates a collision tube. This is a shape that has a position and a 2D (X/Y) radius and a height. See Cylinder) for a definition of a tube. A tube is similar to a colcircle, except that it has a limited height, this means you can limit the distance above the position defined by (fX, fY, fZ) that the collision is detected.
---@param fX number The position of the base of the tube's center on the X axis.
---@param fY number The position of the base of the tube's center on the Y axis.
---@param fZ number The position of the base of the tube's center on the Z axis.
---@param fRadius number The collision tube's radius.
---@param fHeight number The collision tube's height.
---@return colshape Returns a colshape element if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared/Server }
function createColTube(fX, fY, fZ, fRadius, fHeight) end

---This function is used to get the height of an existing colshape polygon. By default, a colshape polygon is infinitely tall.
---@param shape colshape The colshape polygon.
---@return number|false | number Returns two floats , indicating the floor and ceiling of the colshape height, false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function getColPolygonHeight(shape) end

---This function is used to get the position of a bound point in a colshape polygon.
---@param shape colshape The colshape polygon you wish to change.
---@param index integer The index of the point you wish to retrieve. The points are indexed in order, with 1 being the first bound point.
---@return number|false | number Returns two floats - x and y, indicating the position of the point, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getColPolygonPointPosition(shape, index) end

---This function is used to get all bound points in a colshape polygon.
---@param shape colshape The colshape polygon you wish to get the points of.
---@return table|false Returns a table of coordinates, each coordinate being a table containing the x and y position of a bound point, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getColPolygonPoints(shape) end

---This function is used to get the radius of a colshape. Valid types are circle, sphere and tube.
---@param shape colshape The colshape you wish to get the radius of.
---@return number|false Returns a float containing the radius of the colshape, false if an invalid colshape was passed.
---@markup { MTA:SA Shared }
function getColShapeRadius(shape) end

---This function is used to get the size of a colshape. Valid types are rectangle, cuboid and tube.
---@param shape colshape The colshape you wish to get the size of.
---@return number|false | number | number Returns up to 3 floats depending on the colshape type (see below), false if invalid arguments were passed.  cuboid: width, depth, height rectangle: width, depth tube: height
---@markup { MTA:SA Shared }
function getColShapeSize(shape) end

---This function is used to retrieve the type of an colshape.
---@param shape colshape The colshape you wish to get the type of.
---@return integer|false Returns false if invalid arguments were passed, or an integer of the type of the colshape (see above).
---@markup { MTA:SA Shared }
function getColShapeType(shape) end

---This function checks if a 3D position is inside a colshape or not.
---@param theShape colshape The colshape you're checking the position against.
---@param posX number The X coordinate of the position you're checking.
---@param posY number The Y coordinate of the position you're checking.
---@param posZ number The Z coordinate of the position you're checking.
---@return boolean Returns true if the position is inside the colshape, false if it isn't or if any parameters are invalid.
---@markup { MTA:SA Shared }
function isInsideColShape(theShape, posX, posY, posZ) end

---This function is used to remove a point from an existing colshape polygon.
---@param shape colshape The colshape polygon you wish to remove a point from.
---@param index integer The index of the point you wish to remove. The points are indexed in order, with 1 being the first bound point. You can't remove the last 3 points.
---@return boolean Returns true if the polygon was changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function removeColPolygonPoint(shape, index) end

---This function is used to change the height of an existing colshape polygon. By default, a colshape polygon is infinitely tall.
---@param shape colshape The colshape polygon.
---@param floor number The polygon floor (lowest Z coordinate). Parse false to reset this value to 0.
---@param ceil number The polygon ceiling (highest Z coordinate). Parse false to reset this value to infinitely tall.
---@return boolean Returns true if the polygon was changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function setColPolygonHeight(shape, floor, ceil) end

---This function is used to set the position of a bound point in a colshape polygon.
---@param shape colshape The colshape polygon you wish to change.
---@param index integer The index of the point you wish to change. The points are indexed in order, with 1 being the first bound point.
---@param fX number The new X position of the bound point.
---@param fY number The new Y position of the bound point.
---@return boolean Returns true if the polygon was changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setColPolygonPointPosition(shape, index, fX, fY) end

---This function is used to set the radius of a colshape. Valid types are circle, sphere and tube.
---@param shape colshape The colshape you wish to change the radius of.
---@param radius number The radius you want to set.
---@return boolean Returns true if the radius was changed, or false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setColShapeRadius(shape, radius) end

---This function is used to set the size of a colshape. Valid types are rectangle, cuboid and tube.
---@param shape colshape The colshape you wish to change the size of.
---@param a number width for cuboid and rectangle or height for tube.
---@param b number? depth for cuboid or height for rectangle.
---@param c number? height for cuboid.
---@return boolean Returns true if the size was changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setColShapeSize(shape, a, b, c) end

-- Cursor

---This function is used to get the client's cursor alpha (transparency).
---@return integer Returns a number between 0 and 255, where 255 is fully opaque and 0 is fully transparent.
---@markup { MTA:SA Client }
function getCursorAlpha() end

---This function gets the current position of the mouse cursor.
---@return number|false | number | number | number | number Returns 5 values: cursorX, cursorY, worldX, worldY, worldZ. The first two values are the 2D relative screen coordinates of the cursor. The last 3 values are the 3D world map coordinates that the cursor points at. If the cursor isn't showing, returns false as the first value.
---@markup { MTA:SA Client }
function getCursorPosition() end

---This function determines the state of a player's cursor.
---@return boolean Returns true if the player's cursor is visible, and false if it is not.
---@markup { MTA:SA Shared/Server/Client }
function isCursorShowing() end

---This function is used to change alpha (transparency) of the client's cursor.
---@param alpha integer The alpha value to set. Value can be in between 0 and 255, where 255 is fully opaque and 0 is fully transparent.
---@return boolean Returns true if the new alpha value was set, or false otherwise.
---@markup { MTA:SA Client }
function setCursorAlpha(alpha) end

---This function sets the current position of the mouse cursor.
---@param cursorX integer Position for the X axis.
---@param cursorY integer Position for the Y axis.
---@return boolean Returns true if the position has been successfully set, false otherwise.
---@markup { MTA:SA Client }
function setCursorPosition(cursorX, cursorY) end

---This function is used to show or hide a player's cursor.
---@param thePlayer player The player you want to show or hide the cursor of.
---@param show boolean A boolean value determining whether to show (true) or hide (false) the cursor.
---@param toggleControls boolean? A boolean value determining whether to disable controls whilst the cursor is showing. true implies controls are disabled, false implies controls remain enabled.
---@return boolean Returns true if the player's cursor was shown or hidden successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function showCursor(thePlayer, show, toggleControls) end

-- Database

---This function opens a connection to a database and returns an element that can be used with dbQuery and other db functions. To disconnect use destroyElement.
---@param databaseType string The type of database. This can be either sqlite or mysql.
---@param host string The target to connect to. The format of this depends on the database type. - For SQLite it is a filepath to a SQLite database file. If the filepath starts with ":/" then the server's global databases directory is used. The file will be created if it does not exist. - For MySQL it is a list of key=value pairs separated by semicolons. Supported keys are:   - dbname: Name of the database to use e.g. dbname=test   - host: Host address e.g. host=127.0.0.1   - port: Host port e.g. port=3306 (optional, defaults to standard MySQL port if not used).   - unix_socket: Unix socket or named pipe to use (optional).   - charset: Communicate with the server using a character which is different from the default e.g. charset=utf8 (optional).
---@param username string? Usually required for MySQL, ignored by SQLite
---@param password string? Usually required for MySQL, ignored by SQLite
---@param options string? List of key=value pairs separated by semicolons. Supported keys are: - share: which can be set to 0 or 1. (Default value for SQLite is "share=1", for MySQL is "share=0"). When set to 1, the connection is shared and will be used by other calls to dbConnect with the same host string. This is usually a good thing for SQLite connections, but not so good for MySQL unless care is taken. - batch: which can be set to 0 or 1. (Default is "batch=1"). When set to 1, queries called in the same frame are automatically batched together which can significantly speed up inserts/updates. The downside is you lose control of the feature that is used to achieve batching (For SQLite it is transactions, for MySQL it is autocommit mode). Therefore, if you use transactions, lock tables or control autocommit yourself, you may want to disable this feature. - autoreconnect: which can be set to 0 or 1. (Default value "autoreconnect=1"). When set to 1, dropped connections will automatically be reconnected. Note that session variables (incl. SET NAMES), user variables, table locks and temporary tables will be reset because of the reconnection. So if you use these fancy features, you will need to turn autoreconnect off and cope with dropped connections some other way. - log: which can be set to 0 or 1. (Default value "log=1"). When set to 0, activity from this connection will not be recorded in the database debug log file. - tag: (Default value "tag=script"). A string which helps identify activity from this connection in the database debug log file. - suppress: A comma separated list of error codes to ignore. (eg. "suppress=1062,1169"). - multistatements: Enable multiple statements (separated by a semi-colon) in one query. Use dbPrepareString when building a multiple statement query to reduce SQL injection risks. - queue: Name of the queue to use. (Default value for SQLite is "sqlite", for MySQL default is the host string from the host argument). Asynchronous database queries in the same queue are processed in order, one at a time. Any name can be used. - usessl: which can be set to 0 or 1. (Default value is 0), ignored by SQLite. - getserverpublickey: which can be set to 0 or 1. (Default value is 1), ignored by SQLite. When set to 1, this enables the client to request from the server the public key required for RSA key pair-based password exchange. This option applies to clients that authenticate with the `cachingsha2_password`` authentication plugin.
---@return db-connection Returns a database connection element unless there are problems, in which case it return false.
---@markup { MTA:SA Server }
function dbConnect(databaseType, host, username, password, options) end

---This function executes a database query using the supplied connection. No query result is returned.
---@param databaseConnection db-connection A database connection element previously returned from dbConnect.
---@param query string An SQL query. Positions where parameter values will be inserted are marked with a `?`.
---@param param1 [, var param2 ...] var A variable number of parameters. These must be strings or numbers - it is important to make sure they are of the correct type. Also, the number of parameters passed must be equal to the number of `?` characters in the query string. String parameters are automatically quoted and escaped as required. (If you do not want a string quoted, use `??`). Make sure that numbers are in number format as a string number is treated differently.
---@return boolean Returns true unless the connection is incorrect, in which case it returns false.
---@markup { MTA:SA Server }
function dbExec(databaseConnection, query, param1 [, var param2 ...]) end

---This function frees a database query handle. dbFree only needs to be used if a result has not been obtained with dbPoll.
---@param queryHandle db-query A query handle previously returned from dbQuery.
---@return boolean Returns true if the handle was successfully freed, false otherwise.
---@markup { MTA:SA Server }
function dbFree(queryHandle) end

---This function checks the progress of a database query.
---@param queryHandle db-query A query handle previously returned from dbQuery.
---@param timeout integer How many milliseconds to wait for a result. Use 0 for an instant response (which may return nil). Use -1 to wait until a result is ready. Note: A wait here will freeze the entire server just like executeSQLQuery.
---@param multipleResults boolean? Set to true to enable the return values from multiple queries.
---@return table|false Returns nil if the query results are not yet ready. You should try again in a little while. (If you give up waiting for a result, be sure to call dbFree). Returns false if the query string contained an error, the connection has been lost or the query handle is incorrect. This automatically frees the query handle, so you do not have to call dbFree. This also returns two extra values: error code and error message. Returns a table with the result of the query when the query has successfully completed. This automatically frees the query handle, so you do not have to call dbFree. If multipleResults is set to true, it will first return a table pertaining to one query, followed by the results for that query and so on for the next queries. This also returns extra values: number of affected rows and last insert id. The table is of the format {   { colname1=value1, colname2=value2, ... },   { colname1=value3, colname2=value4, ... },   ... }
---@markup { MTA:SA Server }
function dbPoll(queryHandle, timeout, multipleResults) end

---This function escapes arguments in the same way as dbQuery, except dbPrepareString returns the query string instead of processing the query. This allows you to safely build complex query strings from component parts and help prevent (one class of) SQL injection.
---@param db-connection element A database connection element previously returned from dbConnect.
---@param query string An SQL query. Positions where parameter values will be inserted are marked with a `?`.
---@param param1 [, var param2 ...] var A variable number of parameters. These must be strings or numbers - it is important to make sure they are of the correct type. Also, the number of parameters passed must be equal to the number of `?` characters in the query string. String parameters are automatically quoted and escaped as required. (If you do not want a string quoted, use `??`). Make sure that numbers are in number format as a string number is treated differently.
---@return string|false Returns a prepare SQL query string, or false if an error occurred.
---@markup { MTA:SA Server }
function dbPrepareString(db-connection, query, param1 [, var param2 ...]) end

---This function starts a database query using the supplied connection. Use the returned query handle with dbPoll to get the result, or dbFree if you don't want the result.
---@param callbackFunction() function? An optional function to be called when a result is ready. The function will only be called if the result has not already been read with dbPoll. The function is called with the query handle as the first argument.
---@param callbackArguments table? An optional table containing extra arguments (excluding functions) to be sent to the callback function.
---@param databaseConnection db-connection A database connection element previously returned from dbConnect.
---@param query string An SQL query. Positions where parameter values will be inserted are marked with a `?`.
---@param param1 [, var param2 ...] var A variable number of parameters. These must be strings or numbers - it is important to make sure they are of the correct type. Also, the number of parameters passed must be equal to the number of `?` characters in the query string. String parameters are automatically quoted and escaped as required. (If you do not want a string quoted, use `??`). Make sure that numbers are in number format as a string number is treated differently.
---@return db-query Returns a query handle unless the connection is incorrect, in which case it return false.
---@markup { MTA:SA Server }
function dbQuery(callbackFunction(), callbackArguments, databaseConnection, query, param1 [, var param2 ...]) end

---This function executes an arbitrary SQL query and returns the result rows if there are any. It allows parameter binding for security (SQL injection is rendered impossible).
---@param query string An SQL query. Positions where parameter values will be inserted are marked with a `?`.
---@param param1 [, var param2 ... ] var A variable number of parameters. These must be strings or numbers - it is important to make sure they are of the correct type. Also, the number of parameters passed must be equal to the number of `?` characters in the query string. String parameters are automatically quoted and escaped as required. (If you do not want a string quoted, use `??`). Make sure that numbers are in number format as a string number is treated differently.
---@return table|false Returns a table with the result of the query if it was a SELECT query, or false if otherwise. In case of a SELECT query the result table may be empty (if there are no result rows). The table is of the form: The table is of the format {   { colname1=value1, colname2=value2, ... },   { colname1=value3, colname2=value4, ... },   ... }
---@markup { MTA:SA Server }
function executeSQLQuery(query, param1 [, var param2 ... ]) end

-- Discord

---The function returns the client Discord UserID.
---@return string It will return an empty string ("") if the user has not given consent or has disabled the Rich Presence synchronization option. Otherwise, it will return the userid as a string.
---@markup { MTA:SA Client }
function getDiscordRichPresenceUserID() end

---The function checks if the client has Discord Rich Presence enabled.
---@return boolean Returns true if Discord Rich Presence is enabled on the client, false if disabled.
---@markup { MTA:SA Client }
function isDiscordRichPresenceConnected() end

---The function resets the Discord Rich Presence configuration to default.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function resetDiscordRichPresenceData() end

---The function can assign your own application to use in Rich Presence. You can create an application here
---@param applicationID string a string representing your Discord application's ID.
---@return boolean Returns true if function succeeds, false if the client has disabled rich presence.
---@markup { MTA:SA Client }
function setDiscordApplicationID(applicationID) end

---Using this function you can set the large image asset of the application. The maximum size of assets is 1024x1024, the minimum is 512x512.
---@param assetImage string A string containing the key of the image you uploaded to your application's asset list.
---@param text string A string to be displayed when someone hovers over the large image asset in Discord. Max 128 characters.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceAsset(assetImage, text) end

---The function sets a custom button through which we can access the website on Discord.
---@param index integer A int representing the index of the button (possible values: 1 or 2)
---@param text string A string containing the title of the button. Max 32 characters.
---@param url string A string containing the button URL (only works with https:// or mtasa://)
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceButton(index, text, url) end

---This function sets the details text of Discord Rich Presence.
---@param details string A string containing the details text. Max 128 characters.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceDetails(details) end

---This function sets the remaining time of Discord Rich Presence.
---@param seconds integer An integer representing the number of seconds that are remaining. If 0, or lower than the start time ( setDiscordRichPresenceStartTime ) the timer will not be displayed.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceEndTime(seconds) end

---This function sets the party size of Discord Rich Presence.
---@param size integer An integer representing the current party size.
---@param max integer An integer representing the maximum party size.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresencePartySize(size, max) end

---Using this function, you can set the small image asset of the application. The maximum size of assets is 1024x1024, the minimum 512x512.
---@param assetImage string A string containing the key of the small image asset you uploaded to your application's asset list.
---@param text string A string containing the hover text of the small image asset. Max 128 characters.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceSmallAsset(assetImage, text) end

---This function sets the elapsed time of Discord Rich Presence.
---@param seconds integer An integer representing the number of seconds that has elapsed. If 0, the timer will not be displayed.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceStartTime(seconds) end

---This function sets the status of the Discord Rich Presence application.
---@param state string A string containing the status text. Max 128 characters.
---@return boolean Returns true if function succeeds, false otherwise.
---@markup { MTA:SA Client }
function setDiscordRichPresenceState(state) end

-- Drawing

---This function converts pixels from one format to another.
---@param pixels string The pixels to convert the format of.
---@param newFormat string The new format required.
---@param quality integer? The quality of the returned pixels if the new format is `jpeg`.
---@return string|false Returns a copy of the pixels in the new format, or false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxConvertPixels(pixels, newFormat, quality) end

---This function creates a DX Font element that can be used in dxDrawText. Successful font creation is not guaranteed, and may fail due to hardware or memory limitations.
---@param filepath string The name of the file containing the font.
---@param size integer? Size of the font.
---@param bold boolean? Flag to indicate if the font should be bold.
---@param quality string? The font quality.
---@return dx-font|false Returns a DX font element if successful, false if invalid arguments were passed to the function, or there is insufficient resources available.
---@markup { MTA:SA Client }
function dxCreateFont(filepath, size, bold, quality) end

---This function creates a render target element, which is a special type of texture that can be drawn on with the dx functions. Successful render target creation is not guaranteed, and may fail due to hardware or memory limitations.
---@param width integer The width of the texture in pixels.
---@param height integer The height of the texture in pixels.
---@param withAlpha boolean? The render target will be created with an alpha channel. false will turn images alpha channels to black color.
---@return dx-rendertarget Returns a texture element if successful, false if the system is unable to create a render target.
---@markup { MTA:SA Client }
function dxCreateRenderTarget(width, height, withAlpha) end

---This function creates a screen source, which is a special type of texture that contains the screen as rendered by GTA.
---@param width integer The width of the texture in pixels.
---@param height integer The height of the texture in pixels.
---@return dx-screensource|false Returns a texture element if successful, false if invalid arguments were passed to the function or there is insufficient resources available.
---@markup { MTA:SA Client }
function dxCreateScreenSource(width, height) end

---This function creates a shader element that can be used in the dxDraw functions. Successful shader creation is not guaranteed unless the Effect File contains a fallback technique which will work on every existing PC.
---@param filepath/raw_data string The filepath of the shader Effect File (.fx) file or whole data buffer of the shader file.
---@param macros table? A table contains macros in an ordered and/or unordered way. See example below.
---@param priority number? If more than one shader is matched to a world texture, the shader with the highest priority will be used. If there is more than one shader with the same highest priority, the most recently created shader is used.
---@param maxDistance number? If non-zero, the shader will be applied to textures nearer than maxDistance only. This can speed up rendering, but (to look good) may require the shader to fade out it's own effect as the texture reaches maxDistance.
---@param layered boolean? When set to true, the shader will be drawn in a separate render pass. Several layered shaders can be drawn on the same world texture. (To avoid Z fighting artifacts, you may have to add `DepthBias=-0.0002;` to the technique pass, but this might cause visual artifacts when applied on vehicles).
---@param elementTypes string? A comma seperated list of element types to restrict this shader to. Valid element types are: - world - Textures in the GTA world - ped - Player and ped textures - vehicle - Vehicles textures - object - Objects textures other - other - Element textures which are not peds, vehicles or objects - all - Everything
---@return shader|false | string Returns a shader element and the name of the technique that will be used if successful, false if invalid arguments were passed to the function or there is insufficient resources available.
---@markup { MTA:SA Client }
function dxCreateShader(filepath/raw_data, macros, priority, maxDistance, layered, elementTypes) end

---This function creates a texture element that can be used in the dxDraw functions.
---@param pixels/filepath string Pixels containing image data. (`plain`, `jpeg` or `png` pixels can be used here). Or The filepath of the image. (.bmp, .dds, .jpg, .png, and .tga images are supported) - for .svg use svgCreate. Image files should ideally have dimensions that are a power of two, to prevent possible blurring.
---@param textureFormat string? A string representing the desired texture format.
---@param mipmaps boolean? true to create a mip-map chain so the texture looks good when drawn at various sizes.
---@param textureEdge string? A string representing the desired texture edge handling.
---@return texture|false Returns a texture if successful, false if invalid arguments were passed to the function or there is insufficient resources available.
---@markup { MTA:SA Client }
function dxCreateTexture(pixels/filepath, textureFormat, mipmaps, textureEdge) end

---This function draws a circle shape on the screen - rendered for one frame. This should be used in conjunction with onClientRender in order to be display continuously.
---@param posX number An integer representing the absolute X position of the circle center, represented by pixels on the screen.
---@param posY number An integer representing the absolute Y position of the circle center, represented by pixels on the screen.
---@param radius number An integer representing the radius scale of the circle that is being drawn.
---@param startAngle number? An integer representing the angle of the first point of the circle.
---@param stopAngle number? An integer representing the angle of the last point of the circle.
---@param theColor integer? An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param theCenterColor integer? An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param segments integer? An integer ranging from 3-1024 representing how many triangles are used to form the circle, more segments = smoother circle. Note: using lots of segments may cause lag.
---@param ratio integer? Ratio between width and height, e.g: 2 would mean that the width of the circle is 2 times the height.
---@param postGUI boolean? A bool representing whether the circle should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@return boolean Returns true if the creation of the 2D circle was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawCircle(posX, posY, radius, startAngle, stopAngle, theColor, theCenterColor, segments, ratio, postGUI) end

---Draws an image on the screen for a single frame. In order for the image to stay visible continuously, you need to call this function with the same parameters on each frame update (see onClientRender). Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Power of two: 2px, 4px, 8px, 16px, 32px, 64px, 128px, 256px, 512px, 1024px...
---@param posX number The absolute X coordinate of the top left corner of the image.
---@param posY number The absolute Y coordinate of the top left corner of the image.
---@param width number The absolute width of the examples/dxDrawImageSection-1.lua
---@param height number The absolute height of the image.
---@param image string/texture Either a texture element or a filepath of the image which is going to be drawn. Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Use a texture created with dxCreateTexture to speed up drawing.
---@param rotation number? The rotation, in degrees for the image.
---@param rotationCenterOffsetX number? The absolute X offset from the image center for which to rotate the image from.
---@param rotationCenterOffsetY number? The absolute Y offset from the image center for which to rotate the image from.
---@param color integer? Tints the image with a value produced by tocolor or hexadecimal number in format 0xAARRGGBB (RR = red, GG = green, BB = blue, AA = alpha).
---@param postGUI boolean? A bool representing whether the image should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawImage(posX, posY, width, height, image, rotation, rotationCenterOffsetX, rotationCenterOffsetY, color, postGUI) end

---Differing from dxDrawImage, this function only draws a part of an image on the screen for a single frame. In order for the image to stay visible continuously, you need to call this function with the same parameters on each frame update (see onClientRender). Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Power of two: 2px, 4px, 8px, 16px, 32px, 64px, 128px, 256px, 512px, 1024px...
---@param posX number The absolute X coordinate of the top left corner of the image.
---@param posY number The absolute Y coordinate of the top left corner of the image.
---@param width number The absolute width of the image.
---@param height number The absolute height of the image.
---@param u number The absolute X coordinate of the top left corner of the section which should be drawn from image.
---@param v number The absolute Y coordinate of the top left corner of the section which should be drawn from image.
---@param usize number The absolute width of the image section.
---@param vsize number The absolute height of the image section.
---@param image string/texture Either a texture element or a filepath of the image which is going to be drawn. Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Use a texture created with dxCreateTexture to speed up drawing.
---@param rotation number? The rotation, in degrees for the image.
---@param rotationCenterOffsetX number? the absolute X offset from the image center for which to rotate the image from.
---@param rotationCenterOffsetY number? the absolute Y offset from the image center for which to rotate the image from.
---@param color integer? the color of the image, a value produced by tocolor or hexadecimal number in format: 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param postGUI boolean? A bool representing whether the image should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawImageSection(posX, posY, width, height, u, v, usize, vsize, image, rotation, rotationCenterOffsetX, rotationCenterOffsetY, color, postGUI) end

---This function draws a 2D line across the screen - rendered for one frame. This should be used in conjunction with onClientRender in order to display continuously.
---@param startX integer An integer representing the absolute start X position of the line, represented by pixels on the screen.
---@param startY integer An integer representing the absolute start Y position of the line, represented by pixels on the screen.
---@param endX integer An integer representing the absolute end X position of the line, represented by pixels on the screen.
---@param endY integer An integer representing the absolute end Y position of the line, represented by pixels on the screen.
---@param color integer An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param width number? The width/thickness of the line.
---@param postGUI boolean? A bool representing whether the line should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawLine(startX, startY, endX, endY, color, width, postGUI) end

---This function draws a 3D line between two points in the 3D world - rendered for one frame. This should be used in conjunction with onClientRender/onClientPreRender in order to display continuously.
---@param startX number The start X position of the 3D line, representing a coordinate in the GTA world.
---@param startY number The start Y position of the 3D line, representing a coordinate in the GTA world.
---@param startZ number The start Z position of the 3D line, representing a coordinate in the GTA world.
---@param endX number The end X position of the 3D line, representing a coordinate in the GTA world.
---@param endY number The end Y position of the 3D line, representing a coordinate in the GTA world.
---@param endZ number The end Z position of the 3D line, representing a coordinate in the GTA world.
---@param color integer? An integer of the hex color, produced using tocolor or 0xAARRGGBB.
---@param width number? The width/thickness of the line.
---@param stage string? A string representing a stage at which the actual drawcall should happen.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawLine3D(startX, startY, startZ, endX, endY, endZ, color, width, stage) end

---This function draws a textured 3D line between two points in the 3D world - rendered for one frame. This should be used in conjunction with onClientRender/onClientPreRender in order to display continuously.
---@param startX number The start X position of the 3D line, representing a coordinate in the GTA world.
---@param startY number The start Y position of the 3D line, representing a coordinate in the GTA world.
---@param startZ number The start Z position of the 3D line, representing a coordinate in the GTA world.
---@param endX number The end X position of the 3D line, representing a coordinate in the GTA world.
---@param endY number The end Y position of the 3D line, representing a coordinate in the GTA world.
---@param endZ number The end Z position of the 3D line, representing a coordinate in the GTA world.
---@param flipUV boolean? A bool representing whether a UV orientation should be flipped.
---@param material texture A texture to draw the line with.
---@param width number The width/thickness of the line in GTA world units. (This is 1/75th of the width used in dxDrawLine3D).
---@param color integer? An integer of the hex color, produced using tocolor or 0xAARRGGBB.
---@param stage string? A string representing a stage at which the actual drawcall should happen.
---@param faceTowardX number? The X position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@param faceTowardY number? The Y position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@param faceTowardZ number? The Z position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawMaterialLine3D(startX, startY, startZ, endX, endY, endZ, flipUV, material, width, color, stage, faceTowardX, faceTowardY, faceTowardZ) end

---This function draws a 2D primitive shape with material applied to it across the screen - rendered for one frame. This should be used in conjunction with onClientRender in order to display continuously. If image file is used, it should ideally have dimensions that are a power of two, to prevent possible blurring.  Power of two: 2px, 4px, 8px, 16px, 32px, 64px, 128px, 256px, 512px, 1024px...
---@param pType string Type of primitive to be drawn. More info on MSDN site.aspx).
---@param material string/texture Either a texture element or a filepath of the image which is going to be drawn. Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Use a texture created with dxCreateTexture to speed up drawing.
---@param name string A string representing a stage at which the actual drawcall should happen.
---@param vertex1 table Tables representing each primitive vertex, required amount of them is determined by primitive type. See vertices format below: - posX - An float representing the absolute X position of the vertex, represented by pixels on the screen. - posY - An float representing the absolute Y position of the vertex, represented by pixels on the screen. - color (optional) - An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue). If it's not specified, white color is used. - u - An float representing the relative X coordinate of the top left corner of the material which should be drawn from image. - v - An float representing the relative Y coordinate of the top left corner of the material which should be drawn from image.
---@param vertex2... table? Tables representing each primitive vertex, required amount of them is determined by primitive type. Check table format above.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawMaterialPrimitive(pType, material, name, vertex1, vertex2...) end

---This function draws a 3D primitive shape with material applied to it in the 3D world - rendered for one frame. This should be used in conjunction with onClientRender/onClientPreRender in order to display continuously. If image file is used, it should ideally have dimensions that are a power of two, to prevent possible blurring.  Power of two: 2px, 4px, 8px, 16px, 32px, 64px, 128px, 256px, 512px, 1024px...
---@param pType string Type of primitive to be drawn. More info on MSDN site.aspx).
---@param material string/texture Either a texture element or a filepath of the image which is going to be drawn. Image files should ideally have dimensions that are a power of two, to prevent possible blurring. Use a texture created with dxCreateTexture to speed up drawing.
---@param name string A string representing a stage at which the actual drawcall should happen.
---@param vertex1 table Tables representing each primitive vertex, required amount of them is determined by primitive type. See vertices format below: - posX - An float representing the X position of the vertex in the GTA world. - posY - An float representing the Y position of the vertex in the GTA world. - posZ - An float representing the Z position of the vertex in the GTA world. - color (optional) - An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue). If it's not specified, white color is used. - u - An float representing the relative X coordinate of the top left corner of the material which should be drawn from image. - v - An float representing the relative Y coordinate of the top left corner of the material which should be drawn from image.
---@param vertex2... table? Tables representing each primitive vertex, required amount of them is determined by primitive type. Check table format above.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawMaterialPrimitive3D(pType, material, name, vertex1, vertex2...) end

---This function draws a textured 3D line between two points in the 3D world - rendered for one frame. This should be used in conjunction with onClientRender/onClientPreRender in order to display continuously.
---@param startX number The start X position of the 3D line, representing a coordinate in the GTA world.
---@param startY number The start Y position of the 3D line, representing a coordinate in the GTA world.
---@param startZ number The start Z position of the 3D line, representing a coordinate in the GTA world.
---@param endX number The end X position of the 3D line, representing a coordinate in the GTA world.
---@param endY number The end Y position of the 3D line, representing a coordinate in the GTA world.
---@param endZ number The end Z position of the 3D line, representing a coordinate in the GTA world.
---@param u number The absolute X coordinate of the top left corner of the section.
---@param v number The absolute Y coordinate of the top left corner of the section.
---@param usize number The absolute width of the section.
---@param vsize number The absolute height of the section.
---@param flipUV boolean? A bool representing whether a UV orientation should be flipped.
---@param material texture A texture to draw the line with.
---@param width number The width/thickness of the line in GTA world units. (This is 1/75th of the width used in dxDrawLine3D).
---@param color integer? An integer of the hex color, produced using tocolor or 0xAARRGGBB.
---@param stage string? A string representing a stage at which the actual drawcall should happen.
---@param faceTowardX number? The X position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@param faceTowardY number? The Y position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@param faceTowardZ number? The Z position the front of the line should face towards. If this is not set, the camera position is used, so the front of the line faces toward the camera.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawMaterialSectionLine3D(startX, startY, startZ, endX, endY, endZ, u, v, usize, vsize, flipUV, material, width, color, stage, faceTowardX, faceTowardY, faceTowardZ) end

---This function draws a 3D model - rendered for one frame. Drawn models are indistinguishable from this one created by createObject function. This should be used in conjunction with onClientRender or onClientPreRender in order to display continuously.
---@param modelId integer Object you want to draw, must be regular object, you can not draw vehicles and peds.
---@param positionX number A floating point number representing the X coordinate on the map.
---@param positionY number A floating point number representing the Y coordinate on the map.
---@param positionZ number A floating point number representing the Z coordinate on the map.
---@param rotationX number A floating point number representing the rotation about the X axis in degrees.
---@param rotationY number A floating point number representing the rotation about the Y axis in degrees.
---@param rotationZ number A floating point number representing the rotation about the Z axis in degrees.
---@param scaleX number? a float containing the new scale on the X axis
---@param scaleY number? a float containing the new scale on the Y axis
---@param scaleZ number? a float containing the new scale on the Z axis
---@param lighting number? Lighting of model. Allowed range is 0-1.
---@return boolean Returns true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawModel3D(modelId, positionX, positionY, positionZ, rotationX, rotationY, rotationZ, scaleX, scaleY, scaleZ, lighting) end

---This function draws a 2D primitive shape across the screen - rendered for one frame. This should be used in conjunction with onClientRender in order to display continuously.
---@param pType string Type of primitive to be drawn.
---@param postGUI boolean A bool representing whether the line should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@param vertex1 table Tables representing each primitive vertex, required amount of them is determined by primitive type. See vertices format below: - posX - An float representing the absolute X position of the vertex, represented by pixels on the screen. - posY - An float representing the absolute Y position of the vertex, represented by pixels on the screen. - color (optional) - An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue). If it's not specified, white color is used.
---@param vertex2... table? Tables representing each primitive vertex, required amount of them is determined by primitive type. Check table format above.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawPrimitive(pType, postGUI, vertex1, vertex2...) end

---This function draws a 3D primitive in the 3D world - rendered for one frame. This should be used in conjunction with onClientRender/onClientPreRender in order to display continuously.
---@param pType string Type of primitive to be drawn.
---@param stage string A string representing a stage at which the actual drawcall should happen.
---@param vertex1 table Tables representing each primitive vertex, required amount of them is determined by primitive type. See vertices format below: - posX - An float representing the X position of the vertex in the GTA world. - posY - An float representing the Y position of the vertex in the GTA world. - posZ - An float representing the Z position of the vertex in the GTA world. - color (optional) - An integer of the hex color, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue). If it's not specified, white color is used.
---@param vertex2... table? Tables representing each primitive vertex, required amount of them is determined by primitive type. Check table format above.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawPrimitive3D(pType, stage, vertex1, vertex2...) end

---This function draws a 2D rectangle across the screen - rendered for one frame. This should be used in conjunction with onClientRender in order to display continuously.
---@param startX number An float representing the absolute origin X position of the rectangle, represented by pixels on the screen.
---@param startY number An float representing the absolute origin Y position of the rectangle, represented by pixels on the screen.
---@param width number An float representing the width of the rectangle, drawn in a right direction from the origin.
---@param height number An float representing the height of the rectangle, drawn in a downwards direction from the origin.
---@param color integer? the hex color of the rectangle, produced using tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param postGUI boolean? A bool representing whether the line should be drawn on top of or behind any ingame GUI.
---@param subPixelPositioning boolean? A bool representing whether the rectangle can be positioned sub-pixel-ly.
---@return boolean Returns true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawRectangle(startX, startY, width, height, color, postGUI, subPixelPositioning) end

---Draws a string of text on the screen for one frame. In order for the text to stay visible continuously, you need to call this function with the same parameters on each frame update (see onClientRender).
---@param text string The text to draw.
---@param leftX number The absolute X coordinate of the top left corner of the text.
---@param topY number The absolute Y coordinate of the top left corner of the text.
---@param rightX number? The absolute X coordinate of the right side of the text bounding box. Used for text aligning, clipping and word breaking.
---@param bottomY number? The absolute Y coordinate of the bottom side of the text bounding box. Used for text aligning, clipping and word breaking.
---@param color integer? The color of the text, a value produced by tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue).
---@param textSize number The size of the text scale.
---@param font string/dx-font? Either a custom DX font element or the name of a built-in DX font. Note: Some fonts are incompatible with certain languages such as Arabic.
---@param alignX string? Horizontal alignment of the text within the bounding box. Can be "left" , "center" or "right" .
---@param alignY string? Vertical alignment of the text within the bounding box. Can be "top" , "center" or "bottom" .
---@param clip boolean? If set to true, the parts of the text that don't fit within the bounding box will be cut off.
---@param wordBreak boolean? If set to true, the text will wrap to a new line whenever it reaches the right side of the bounding box. If false, the text will always be completely on one line.
---@param postGUI boolean? A bool representing whether the text should be drawn on top of or behind any ingame GUI (rendered by CEGUI).
---@param colorCoded boolean? Set to true to enable embedded #FFFFFF color codes. Note: clip and wordBreak are forced false if this is set.
---@param subPixelPositioning boolean? A bool representing whether the text can be positioned sub-pixel-ly. Looks nicer for moving/scaling animations.
---@param fRotation number? Rotation.
---@param fRotationCenterX number? Rotation Origin X.
---@param fRotationCenterY number? Rotation Origin Y.
---@param fLineSpacing number? Distance in pixels between the lines of text, this can be a negative number, works only when colorCoded is set to true.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawText(text, leftX, topY, rightX, bottomY, color, textSize, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY, fLineSpacing) end

---This function drawn same sphere as `/showcol`. It provides 4 levels of iterations which mean density of sphere.
---@param x number X position in world of sphere.
---@param y number Y position in world of sphere.
---@param z number Z position in world of sphere.
---@param radius number A radius of sphere.
---@param theColor integer A color of sphere from tocolor function or in the AARRGGBB format.
---@param fLineWidth number A width of line.
---@param iterations integer Number 1, 2, 3 or 4. 1 mean low density, 4 mean high.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function dxDrawWiredSphere(x, y, z, radius, theColor, fLineWidth, iterations) end

---This function returns the current blend mode for the dxDraw functions. The blend mode is set using dxSetBlendMode.
---@return string Returns the current blend mode.
---@markup { MTA:SA Client }
function dxGetBlendMode() end

---This function returns the height of a single line of text for the given font. If you want to check the height of the entire multi-line text, use dxGetTextSize.
---@param scale number? The size of the text.
---@param font string/dx-font? Either a custom DX font element or the name of a built-in DX font. Note: Some fonts are incompatible with certain languages such as Arabic.
---@return integer|false Returns an integer of the height of the text or false if invalid arguments passed.
---@markup { MTA:SA Client }
function dxGetFontHeight(scale, font) end

---This gets the dimensions of the supplied texture element.
---@param texture element The texture element whose size is to be gotten.
---@return integer|false | integer | integer Returns two ints representing the width and height in pixels of the texture, or false if an invalid parameter was passed to the function. If the texture is a volume texture, this function will return three ints representing the width, height and depth.
---@markup { MTA:SA Client }
function dxGetMaterialSize(texture) end

---This function gets the color of a single pixel from pixels contained in a string.
---@param pixels string The pixels to use.
---@param x integer The X coordinate for the pixel.
---@param y integer The Y coordinate for the pixel.
---@return integer|false | integer | integer | integer Returns 4 int s representing the rgba color value of the pixel if succesful, or false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxGetPixelColor(pixels, x, y) end

---This function returns the format of pixels contained in a string.
---@param pixels string The pixels to get the format of.
---@return string Returns the format of the pixels if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxGetPixelsFormat(pixels) end

---This function gets the dimensions of pixels contained in a string. It works with all pixel formats.
---@param pixels string The pixels to get the dimensions of.
---@return integer|false | integer Returns width and height of the pixels if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxGetPixelsSize(pixels) end

---This function retrieves the width and height (in pixels) of a certain piece of text, if it were to be drawn using dxDrawText.
---@param text string A string representing the text for which you wish to retrieve with width for.
---@param width number? The width of the text. Use with wordBreak = true.
---@param scaleX number? The X scale of the text. Scale can also be inputted as a Vector2.
---@param scaleY number? The Y scale of the text. Scale can also be inputted as a Vector2.
---@param font string/dx-font? Either a custom DX font element or the name of a built-in dx font.
---@param wordBreak boolean? If set to true, the text will wrap to a new line whenever it reaches the right side of the bounding box. If false, the text will always be completely on one line.
---@param colorCoded boolean? Should we exclude color codes from the width? False will include the hex in the length.
---@return number|false | number Returns two floats representing the width and height of the text in pixels, false if invalid arguments passed.
---@markup { MTA:SA Client }
function dxGetTextSize(text, width, scaleX, scaleY, font, wordBreak, colorCoded) end

---This function retrieves the theoretical width (in pixels) of a certain piece of text, if it were to be drawn using dxDrawText.
---@param text string A string representing the text for which you wish to retrieve with width for.
---@param scale number? The size of the text.
---@param font string/dx-font? Either a custom DX font element or the name of a built-in dx font.
---@param bColorCoded boolean? Should we exclude color codes from the width? (false will include the hex in the length).
---@return number|false Returns the float of the width of the text (in pixels) or false if invalid arguments passed.
---@markup { MTA:SA Client }
function dxGetTextWidth(text, scale, font, bColorCoded) end

---This function fetches the pixels from a texture element. It can be used with a standard texture, render target or screen source.
---@param surfaceIndex integer? Desired slice to get if the texture is a volume texture, or desired face to get if the texture is a cube map. (Cube map faces: 0=+X 1=-X 2=+Y 3=-Y 4=+Z 5=-Z)
---@param texture texture The texture element to get the pixels from.
---@param pixelsFormat string? Pixels format.
---@param textureFormat string? A string representing the desired texture format. Use `unkown` to determine automatically based on texture format.
---@param mipmaps boolean true to create a mip-map chain for `dds` pixels so the texture looks good when drawn at various sizes.
---@param x integer? Rectangle left position.
---@param y integer? Rectangle top position.
---@param width integer? Rectangle width.
---@param height integer? Rectangle height.
---@return string|false Returns pixels string if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxGetTexturePixels(surfaceIndex, texture, pixelsFormat, textureFormat, mipmaps, x, y, width, height) end

---This function gets the current aspect ratio set by dxSetAspectRatioAdjustmentEnabled.
---@return boolean | number It returns a boolean indicating whether aspect ratio adjustment is enabled, and a float representing the aspect ratio.
---@markup { MTA:SA Client }
function dxIsAspectRatioAdjustmentEnabled() end

---This function allows for the positioning of dxDraw calls to be automatically adjusted according to the client's aspect ratio setting. This lasts for a single execution of an event handler for one of the following events: onClientRender, onClientPreRender and onClientHUDRender. So the function has to be called every frame, just like dxDraws. This is particularly useful for draws that must align with the GTA HUD, for which the sizing and positioning can vary for different aspect ratios.
---@param bEnabled boolean Should the adjustment be enabled or disabled.
---@param sourceRatio number? This should be set to the aspect ratio the dxDraws were originally designed in.
---@return boolean Returns true when it was changed successfully, or false otherwise.
---@markup { MTA:SA Client }
function dxSetAspectRatioAdjustmentEnabled(bEnabled, sourceRatio) end

---This function sets the current blend mode for the dxDraw functions. Changing the blend mode can increase the quality when drawing text or certain other images to a render target. As a general guide use modulate\_add when drawing text to a render target, and add when drawing the render target to the screen. Don't forget to restore the default blend at the end \- See the example below.
---@param blendMode string The blend mode to use.
---@return boolean Returns true if successful, or false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxSetBlendMode(blendMode) end

---This function sets the color of a single pixel for pixels contained in a string.
---@param pixels string The pixels to use.
---@param x integer The X coordinate for the pixel.
---@param y integer The Y coordinate for the pixel.
---@param r integer The red channel for the color (0-255).
---@param g integer The green channel for the color (0-255).
---@param b integer The blue channel for the color (0-255).
---@param a integer? The alpha channel for the color (0-255).
---@return boolean Returns true if successful, or false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxSetPixelColor(pixels, x, y, r, g, b, a) end

---This function changes the drawing destination for the dx functions. It can be used to select a previously created render target, or if called with no arguments, restore drawing directly to the screen.
---@param renderTarget dx-rendertarget The render target element whose pixels we want to draw on.
---@param clear boolean? If set to true, the render target will also be cleared.
---@return boolean Returns true if the render target was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function dxSetRenderTarget(renderTarget, clear) end

---This function sets the amount of geometric sub-division to use when drawing a shader element with dxDrawImage. Using tessellation allows a shader to manipulate the shape of the rendered image at each sub-division boundary.
---@param theShader shader The shader element whose tessellation is to be changed.
---@param tessellationX integer The number of sub-division points along the X axis. Range is 1 to 500.
---@param tessellationY integer The number of sub-division points along the Y axis. Range is 1 to 500.
---@return boolean Returns true if the shader element's tessellation was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function dxSetShaderTessellation(theShader, tessellationX, tessellationY) end

---This function applies a 3D transformation to a shader element when it is drawn with dxDrawImage.
---@param theShader element The shader element whose transformation is to be changed.
---@param rotationX number Rotation angle in degrees around the X axis (Left,right). This will make the shader rotate along its width.
---@param rotationY number Rotation angle in degrees around the Y axis (Up,down). This will make the shader rotate along its height.
---@param rotationZ number Rotation angle in degrees around the Z axis (In,out). This will make the shader rotate in a similar way to the rotation argument in dxDrawImage.
---@param rotationCenterOffsetX number? The center of rotation offset X position in screen relative units.
---@param rotationCenterOffsetY number? The center of rotation offset Y position in screen relative units.
---@param rotationCenterOffsetZ number? The center of rotation offset Z position in screen relative units.
---@param bRotationCenterOffsetOriginIsScreen boolean? Set to true if the center of rotation origin should be the center of the screen rather than the center of the image.
---@param perspectiveCenterOffsetX number? The center of perspective offset X position in screen relative units.
---@param perspectiveCenterOffsetY number? The center of perspective offset Y position in screen relative units.
---@param bPerspectiveCenterOffsetOriginIsScreen boolean? Set to true if the center of perspective origin should be the center of the screen rather than the center of the image.
---@return boolean Returns true if the shader element's transform was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function dxSetShaderTransform(theShader, rotationX, rotationY, rotationZ, rotationCenterOffsetX, rotationCenterOffsetY, rotationCenterOffsetZ, bRotationCenterOffsetOriginIsScreen, perspectiveCenterOffsetX, perspectiveCenterOffsetY, bPerspectiveCenterOffsetOriginIsScreen) end

---This sets a named parameter for a shader element.
---@param theShader element The shader element whose parameter is to be changed.
---@param parameterName string The name of parameter.
---@param value mixed The value to set, which can be a texture, a bool, a int/float or a list of numbers (max 16 floats(numbers) ).
---@return boolean Returns true if the shader element's parameter was successfully changed, false otherwise.
---@markup { MTA:SA Client }
function dxSetShaderValue(theShader, parameterName, value) end

---This function is used for testing scripts written using guiCreateFont, dxCreateFont, dxCreateShader, dxCreateRenderTarget, dxCreateTexture and dxCreateScreenSource. Each one of the 3 test modes should be used in turn to help highlight any potential problems.
---@param testMode string The test mode to be set.
---@return boolean Returns true if the test mode was successfully set, false otherwise.
---@markup { MTA:SA Client }
function dxSetTestMode(testMode) end

---This functions allows you to change the edge handling after creating the texture.
---@param theTexture texture The affected texture.
---@param textureEdge string The texture edge mode.
---@param border-color integer? If textureEdge is set to `border`, you are able to define a border color here.
---@return boolean Returns true if success, false otherwise.
---@markup { MTA:SA Client }
function dxSetTextureEdge(theTexture, textureEdge, border-color) end

---This function sets the pixels of a texture element. It can be used with a standard texture, render target or screen source.
---@param surfaceIndex integer? Desired slice to set if the texture is a volume texture, or desired face to set if the texture is a cube map. (Cube map faces: 0=+X 1=-X 2=+Y 3=-Y 4=+Z 5=-Z).
---@param texture texture The texture element to set the pixels of.
---@param pixels string The plain format pixels to use.
---@param x integer? Rectangle left position.
---@param y integer? Rectangle top position.
---@param width integer? Rectangle width.
---@param height integer? Rectangle height.
---@return boolean Returns true if successful, false if invalid arguments were passed to the function.
---@markup { MTA:SA Client }
function dxSetTexturePixels(surfaceIndex, texture, pixels, x, y, width, height) end

---This function updates the contents of a screen source texture with the screen output from GTA.
---@param screenSource dx-screensource The screen source element whose pixels we want to fill with the screen capture.
---@param resampleNow boolean? A bool to indicate if the screen should be captured immediately. The default is false which means the screen from the end of the previous frame is used (better for performance and consistency). Use true for layering fullscreen effects.
---@return boolean Returns true if the screen was successfully captured, false otherwise.
---@markup { MTA:SA Client }
function dxUpdateScreenSource(screenSource, resampleNow) end

-- Effects

---Creates an effect on specified position.
---@param name string A string contains effect name. See effects list.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rX number A floating point number representing the rotation about the X axis in degrees.
---@param rY number A floating point number representing the rotation about the Y axis in degrees.
---@param rZ number A floating point number representing the rotation about the Z axis in degrees.
---@param drawDistance number? A floating point number between 1 and 8191 which represents the draw distance of the effect, or 0 to use the default draw distance.
---@param soundEnable boolean? To enable the sound of the effect.
---@return effect|false Returns the effect element if creation was successful, false otherwise.
---@markup { MTA:SA Client }
function createEffect(name, x, y, z, rX, rY, rZ, drawDistance, soundEnable) end

---Creates a blood splatter particle effect.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect.
---@param dirY number The direction Y coordinate of the effect.
---@param dirZ number The direction Z coordinate of the effect.
---@param count integer? The number of flying droplets to create.
---@param brightness number? The brightness. Ranges from 0 (almost black) to 1 (normal color).
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddBlood(posX, posY, posZ, dirX, dirY, dirZ, count, brightness) end

---Creates a bullet impact particle effect, consisting of a small smoke cloud and a number of sparks.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect.
---@param dirY number The direction Y coordinate of the effect.
---@param dirZ number The direction Z coordinate of the effect.
---@param smokeSize integer? The size of the smoke cloud.
---@param sparkCount integer? The number of sparks to create.
---@param smokeIntensity number? The amount/transparency of smoke, ranges from 0 to 1.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddBulletImpact(posX, posY, posZ, dirX, dirY, dirZ, smokeSize, sparkCount, smokeIntensity) end

---This function creates a bullet splash particle effect, normally created when shooting into water.
---@param posX number A float representing the X position of the splash.
---@param posY number A float representing the Y position of the splash.
---@param posZ number A float representing the Z position of the splash.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddBulletSplash(posX, posY, posZ) end

---Creates a debris particle effect (e.g. bits that fly off a car when ramming a wall).
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param colorR integer? The color (Red) of the debris effect.
---@param colorG integer? The color (Green) of the debris effect.
---@param colorB integer? The color (Blue) of the debris effect.
---@param colorA integer? The color (Alpha) of the debris effect.
---@param scale number? The size of the chunks.
---@param count integer? The number of chunks to create.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddDebris(posX, posY, posZ, colorR, colorG, colorB, colorA, scale, count) end

---This function creates a foot splash particle effect, normally created when walking into water.
---@param posX number A float representing the X position of the splash.
---@param posY number A float representing the Y position of the splash.
---@param posZ number A float representing the Z position of the splash.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddFootSplash(posX, posY, posZ) end

---This function creates a glass particle effect.
---@param posX number A float representing the X position of the glass.
---@param posY number A float representing the Y position of the glass.
---@param posZ number A float representing the Z position of the glass.
---@param colorR integer? The color (Red) of the glass effect.
---@param colorG integer? The color (Green) of the glass effect.
---@param colorB integer? The color (Blue) of the glass effect.
---@param colorA integer? The color (Alpha) of the glass effect.
---@param scale number? A float representing the size of the particle effect, where 1 is the standard size.
---@param count integer? The density of the particle effect.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddGlass(posX, posY, posZ, colorR, colorG, colorB, colorA, scale, count) end

---This function creates a gunshot particle effect.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate where the bullet is fired.
---@param dirY number The direction Y coordinate where the bullet is fired.
---@param dirZ number The direction Z coordinate where the bullet is fired.
---@param includeSparks boolean? A bool representing whether the particle effect will generate sparks.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddGunshot(posX, posY, posZ, dirX, dirY, dirZ, includeSparks) end

---Creates a punch impact particle effect (a small dust cloud).
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect.
---@param dirY number The direction Y coordinate of the effect.
---@param dirZ number The direction Z coordinate of the effect.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddPunchImpact(posX, posY, posZ, dirX, dirY, dirZ) end

---Creates a number of sparks originating from a point or along a line.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect. The longer the distance from position is, the faster sparks fly.
---@param dirY number The direction Y coordinate of the effect. The longer the distance from position is, the faster sparks fly.
---@param dirZ number The direction Z coordinate of the effect. The longer the distance from position is, the faster sparks fly.
---@param force number? The higher this value, the faster and further the sparks fly.
---@param count integer? The number of effects to create.
---@param acrossLineX number? If specified, the sparks will be created along a line going from pos to pos - acrossLine. If not specified, all sparks originate from the point at pos.
---@param acrossLineY number? If specified, the sparks will be created along a line going from pos to pos - acrossLine. If not specified, all sparks originate from the point at pos.
---@param acrossLineZ number? If specified, the sparks will be created along a line going from pos to pos - acrossLine. If not specified, all sparks originate from the point at pos.
---@param blur boolean? if false, creates standard bullet impact-like sparks. If true, adds motion blur to the sparks.
---@param spread number? determines how strongly the particles deviate from each other. With low values the particles will stay quite close together, high values will make them fly in all directions. Also affects their speed.
---@param life number? the higher this value, the longer the sparks survive before they disappear.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddSparks(posX, posY, posZ, dirX, dirY, dirZ, force, count, acrossLineX, acrossLineY, acrossLineZ, blur, spread, life) end

---This function creates a tank firing particle effect.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate where the tank fire is directed to.
---@param dirY number The direction Y coordinate where the tank fire is directed to.
---@param dirZ number The direction Z coordinate where the tank fire is directed to.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddTankFire(posX, posY, posZ, dirX, dirY, dirZ) end

---Creates a tyre burst particle effect (a small white smoke puff).
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect.
---@param dirY number The direction Y coordinate of the effect.
---@param dirZ number The direction Z coordinate of the effect.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddTyreBurst(posX, posY, posZ, dirX, dirY, dirZ) end

---This function creates a water hydrant particle effect.
---@param posX number A float representing the X position of the hydrant.
---@param posY number A float representing the Y position of the hydrant.
---@param posZ number A float representing the Z position of the hydrant.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddWaterHydrant(posX, posY, posZ) end

---This function creates a water splash particle effect.
---@param posX number A float representing the X position of the splash.
---@param posY number A float representing the Y position of the splash.
---@param posZ number A float representing the Z position of the splash.
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddWaterSplash(posX, posY, posZ) end

---Creates a wood splinter particle effect.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate of the effect.
---@param dirY number The direction Y coordinate of the effect.
---@param dirZ number The direction Z coordinate of the effect.
---@param count integer? The number of splinters to create.
---@param brightness number? The brightness. Ranges from 0 (black) to 1 (normal color).
---@return boolean Returns a true if the operation was successful, false otherwise.
---@markup { MTA:SA Client }
function fxAddWood(posX, posY, posZ, dirX, dirY, dirZ, count, brightness) end

---Creates the given particles of the specified color. Can be useful for creating flares, toxic fumes, reward effects, etc.
---@param particle string The name of the particle to create. See particles list.
---@param posX number The world X coordinate where the effect originates.
---@param posY number The world Y coordinate where the effect originates.
---@param posZ number The world Z coordinate where the effect originates.
---@param dirX number The direction X coordinate where the particles flies to.
---@param dirY number The direction Y coordinate where the particles flies to.
---@param dirZ number The direction Z coordinate where the particles flies to.
---@param r number The color (Red) of the particle.
---@param g number The color (Green) of the particle.
---@param b number The color (Blue) of the particle.
---@param a number The color (Alpha) of the particle.
---@param randomizeColors boolean? Specifies whether the color should be fixed (r,g,b) or randomly calculated for each particle based on the given color. This allows to create colorful effects.
---@param count integer? The number of flying particles to create.
---@param brightness number? The brightness. Ranges from 0 (almost black) to 1 (normal color).
---@param size number? Particles size. If randomSizes is set then when 0 is specified the minimum size is 0.3.
---@param randomSizes boolean? Specifies whether all particles should be the same fixed size or each particle should have a random size.
---@param life number? The higher this value, the longer the particles survive before they disappear.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function fxCreateParticle(particle, posX, posY, posZ, dirX, dirY, dirZ, r, g, b, a, randomizeColors, count, brightness, size, randomSizes, life) end

---This function gets the density of certain effect.
---@param theEffect effect The effect to get density of.
---@return number|false Returns float as effect density or false if invalid effect element passed.
---@markup { MTA:SA Client }
function getEffectDensity(theEffect) end

---This function gets the speed of a specified effect.
---@param theEffect effect The effect to get the speed of.
---@return number|false Returns float containing the effect's speed, false if invalid arguments were specified.
---@markup { MTA:SA Client }
function getEffectSpeed(theEffect) end

---This function sets the density of a specified effect.
---@param theEffect effect The effect to change the speed of.
---@param density number The level of density (from 0 to 2).
---@return boolean Returns true if the density was succesfully changed, false otherwise.
---@markup { MTA:SA Client }
function setEffectDensity(theEffect, density) end

---This function sets the speed of a specified effect.
---@param theEffect effect The effect to change the speed of.
---@param speed number The speed to set.
---@return boolean Returns true if the effect speed was succesfuly changed, false otherwise.
---@markup { MTA:SA Client }
function setEffectSpeed(theEffect, speed) end

-- Element

---This function subscribes a player to specific element data. This function is used together with setElementData in `"subscribe"` mode.
---@param theElement element The element you wish to subscribe the player to.
---@param key string The key you wish to subscribe the player to.
---@param thePlayer player The player you wish to subscribe.
---@return boolean Returns true if the player was subscribed, false otherwise.
---@markup { MTA:SA Server }
function addElementDataSubscriber(theElement, key, thePlayer) end

---This function attaches one element to another, so that the first one follows the second whenever it moves. Supported element types are ped, player, blip, vehicle, object, marker, pickup, sound, colshape, weapon, camera, light.
---@param theElement element The element to be attached.
---@param theAttachToElement element The element to attach the first to.
---@param xPosOffset number? The X offset, if you want the elements to be a certain distance from one another.
---@param yPosOffset number? The Y offset.
---@param zPosOffset number? The Z offset.
---@param xRotOffset number? The X rotation offset.
---@param yRotOffset number? The Y rotation offset.
---@param zRotOffset number? The Z rotation offset.
---@return boolean Returns true if the attaching process was successful, false otherwise.
---@markup { MTA:SA Shared/Client }
function attachElements(theElement, theAttachToElement, xPosOffset, yPosOffset, zPosOffset, xRotOffset, yRotOffset, zRotOffset) end

---This function clears any settings added by setElementVisibleTo and restores an element to its default Visibility.
---@param theElement element The element in which you wish to restore to its default visibility.
---@return boolean Returns true if the operation was successful, false otherwise.
---@markup { MTA:SA Server }
function clearElementVisibleTo(theElement) end

---This function clones (creates an exact copy of) an already existing element.
---@param theElement element The element that you wish to clone.
---@param xPos number? A floating point number representing the X coordinate on the map.
---@param yPos number? A floating point number representing the Y coordinate on the map.
---@param zPos number? A floating point number representing the Z coordinate on the map.
---@param cloneChildren boolean? A boolean value representing whether or not the element's children will be cloned.
---@return element Returns the handle of the new cloned element of the parent, false if invalid arguments were passed.
---@markup { MTA:SA Server }
function cloneElement(theElement, xPos, yPos, zPos, cloneChildren) end

---This function is used to create a new dummy element in the element tree which do not necessarily represent an entity within the San Andreas world. A common use for this function is for creating custom elements, such as a Flag or a Base.
---@param elementType string The type of element being created.
---@param elementID string? The ID of the element being created.
---@return element|false Returns the element if it was successfully created. Returns false if the arguments are wrong.
---@markup { MTA:SA Shared }
function createElement(elementType, elementID) end

---This function destroys an element and all elements within it in the hierarchy (its children, the children of those children etc). player elements cannot be destroyed using this function. A player can only be removed from the hierarchy when they quit or are kicked. The root element also cannot be destroyed, however, passing the root as an argument will wipe all elements from the server, except for the players and clients, which will become direct descendants of the root node, and other elements that cannot be destroyed, such as resource root elements.
---@param elementToDestroy element The element you wish to destroy.
---@return boolean Returns true if the element was destroyed successfully, false if either the element passed to it was invalid or it could not be destroyed for some other reason (for example, clientside destroyElement can't destroy serverside elements).
---@markup { MTA:SA Shared/Server }
function destroyElement(elementToDestroy) end

---This function detaches attached elements from one another.
---@param theElement element The element to be detached (the "child").
---@param theAttachToElement element? The element you wish to detach from, will detach from the attached element if this isn't specified.
---@return boolean Returns true if the detaching was successful, false otherwise.
---@markup { MTA:SA Shared }
function detachElements(theElement, theAttachToElement) end

---Returns a table of all element data of an element.
---@param theElement element The element you want to get the element data of.
---@return table|false If successful, returns a table with as keys the names of the element data and as values the corresponding element data values. Returns false in case of failure.
---@markup { MTA:SA Shared/Server }
function getAllElementData(theElement) end

---This function returns a table of all the elements attached to the specified element.
---@param theElement element The element which you require the information from.
---@return table|false Returns a table of all the elements attached to the specified element or false if invalid element passed.
---@markup { MTA:SA Shared/Client }
function getAttachedElements(theElement) end

---This function returns the alpha (transparency) value for the specified element. This can be a player, ped, object, marker, vehicle or weapon.
---@param theElement element The element whose alpha you want to retrieve.
---@return integer|false Returns an integer (0-255; 0 = transparent) indicating the element's alpha, or false if invalid arguments were passed.
---@markup { MTA:SA Shared/Client }
function getElementAlpha(theElement) end

---Gets the current angular velocity of a specified element. This can be a player, ped, object, vehicle or weapon.
---@param theElement element The element to retrieve the angular velocity from.
---@return number|false | number | number Returns three floats describing the x, y and z rotation or false if invalid element was passed.
---@markup { MTA:SA Shared/Server/Client }
function getElementAngularVelocity(theElement) end

---This function returns the offsets of an element that has been attached to another element using attachElements.
---@param theElement element The attached element.
---@return number|false | number | number | number | number | number Returns 6 floats, of which the first 3 indicate the position offset (x, y, z), and the last 3 indicate the rotation offset (x, y, z), if successful. false otherwise.
---@markup { MTA:SA Shared/Client }
function getElementAttachedOffsets(theElement) end

---This function determines the element that the specified element is attached to.
---@param theElement element The element you require the information for.
---@return element|false Returns the element that the chosen element is attached to, or false if the element isn't attached to another element or invalid element was passed.
---@markup { MTA:SA Shared/Server }
function getElementAttachedTo(theElement) end

---Returns the 3D world coordinates of a specific bone of a given element. This can be a player or ped.
---@param theElement element The element to get the bone position on.
---@param boneId integer The ID of the bone to get the position of. See Bone IDs.
---@return number|false | number | number Returns 3 floats, representing the X, Y, Z world position of the bone or false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getElementBonePosition(theElement, boneId) end

---This function retrieves how a particular bone rotates in relation to the element. This can be a player or ped.
---@param ped element The element from which the bone's rotation will be retrieved.
---@param bone integer The ID of the bone to retrieve the quaternion of. See Bone IDs.
---@return number|false | number | number | number Returns four floats: x, y, z, w, or false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getElementBoneQuaternion(ped, bone) end

---Returns the orientation of a specific bone relative to the element. This can be a player or ped.
---@param theElement element The element to get the bone rotation on.
---@param boneId integer The ID of the bone to get the rotation of. See Bone IDs.
---@return number|false | number | number Returns 3 floats, representing the yaw, pitch, roll rotation values or false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getElementBoneRotation(theElement, boneId) end

---This function returns the minimum and maximum coordinates of an element's bounding box.
---@param theElement element The element whose bounding box we want to get.
---@return number|false | number | number | number | number | number Returns min x, min y, min z, max x, max y, max z if the passed element is valid and streamed in, false otherwise.
---@markup { MTA:SA Client }
function getElementBoundingBox(theElement) end

---This function returns an element from the specified ID. If more than one element with the same ID exists, only the first one in the order it appears in the XML tree will be returned by this function.
---@param id string The ID of the element as it appears in the XML file or as set by setElementID.
---@param index integer? If there are two or more elements of the same ID it will return the element with the specified index starting at 0.
---@return element|false Returns the element with the given ID, or false if no such element exists.
---@markup { MTA:SA Shared }
function getElementByID(id, index) end

---This function returns an element of the specified type with the specified index.
---@param theType string The type of the element to be returned. See element types.
---@param index integer? The element's index (0 for the first element, 1 for the second, etc).
---@return element|false Returns the requested element, or false if it doesn't exist.
---@markup { MTA:SA Shared/Client }
function getElementByIndex(theType, index) end

---This function returns one of the child elements of a given parent element. The child element is selected by its index (0 for the first child, 1 for the second and so on).
---@param parent element The element above the one to be returned in the hierarchy.
---@param index integer The element's index (0 for the first element, 1 for the second, etc).
---@return element|false Returns the requested element if it exists, or false if it doesn't.
---@markup { MTA:SA Shared/Server }
function getElementChild(parent, index) end

---This function is used to retrieve a list of the child elements of a given parent element. Note that it will only return direct children and not elements that are further down the element tree.
---@param parent element Supply this argument with the parent of the children you want returned.
---@param theType string? The type of element you want a list of. This is the same as the tag name in the .map file, so this can be used with a custom element type if desired. See element types.
---@return table|false This function returns a table that contains a list of elements that the parent has. If the element has no children, it will return an empy table. It will return false if the parent element does not exist.
---@markup { MTA:SA Shared/Server }
function getElementChildren(parent, theType) end

---This function returns the number of children an element has. Note that only the direct children are counted and not elements that are further down the element tree.
---@param parent element The parent element.
---@return integer|false Returns an int with the number of child elements, or false if the parent element does not exist.
---@markup { MTA:SA Shared }
function getElementChildrenCount(parent) end

---Elements like marker and pickup have an associated colshape. This function is used to get the associated colshape element.
---@param theElement element The element you want to get the colshape of.
---@return colshape|false Returns colshape of the element, false if not or an invalid argument was passed to the function.
---@markup { MTA:SA Shared/Server }
function getElementColShape(theElement) end

---This function indicates if a specific element is set to have collisions disabled. An element without collisions does not interact with the physical environment and remains static.
---@param theElement element The element for which you want to check whether collisions are enabled.
---@return boolean Returns true if the collisions are enabled, false otherwise.
---@markup { MTA:SA Shared }
function getElementCollisionsEnabled(theElement) end

---This function retrieves element data attached to an element under a certain key.
---@param theElement element This is the element with data you want to retrieve.
---@param key string The name of the element data entry you want to retrieve. (Max 128 characters).
---@param inherit boolean? Toggles whether or not the function should go up the hierarchy to find the requested key in case the specified element doesn't have it.
---@return mixed|false This function returns a variable containing the requested element data, or false if the element or the element data does not exist. When getting data corresponding to a XML attribute, this is always a string.
---@markup { MTA:SA Shared/Server }
function getElementData(theElement, key, inherit) end

---This function allows you to retrieve the dimension of an element. See Dimension for the list of valid element types. The dimension determines what/who the element is visible to.
---@param theElement element The element in which you'd like to retrieve the dimension of.
---@return integer|false Returns an integer for the dimension if theElement is valid, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function getElementDimension(theElement) end

---This function is used to retrieve the distance between a element's centre of mass to the base of the model. This can be used to calculate the position the element has to be set to, to have it on ground level.
---@param theElement element The element you want to retrieve the value of.
---@return number|false Returns a float with the distance, or false if the element is invalid.
---@markup { MTA:SA Client }
function getElementDistanceFromCentreOfMassToBaseOfModel(theElement) end

---This function returns the current health for the specified element. This can be a player, ped, vehicle, object or weapon.
---@param theElement element The element whose health you want to check.
---@return number|false Returns a float indicating the element's health, or false if invalid arguments were passed.
---@markup { MTA:SA Shared/Client }
function getElementHealth(theElement) end

---This function gets the ID of an element. This is the `id` attribute of the element and is a string, NOT a number like a model ID, weapons ID or similar.
---@param theElement element The element from which to retrieve the ID.
---@return string|false This returns a string containing the element ID. It will return an empty string if it has no ID. It will return false if the element is invalid.
---@markup { MTA:SA Shared }
function getElementID(theElement) end

---This function allows you to retrieve the interior of any element. An interior is the current loaded place, 0 being outside.
---@param theElement element The element of which you'd like to retrieve the interior.
---@return integer|false Returns an int for the interior if element is valid, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function getElementInterior(theElement) end

---This function returns the lighting value for the specified element. This can be a player, ped, vehicle, object or weapon.
---@param theElement element The element whose lighting you want to retrieve.
---@return number|false Returns a float (0.0-0.5; 0 = dark; 0.5 = light) indicating the element's lighting, or false if invalid arguments were passed.
---@markup { MTA:SA Client }
function getElementLighting(theElement) end

---Returns the model ID of a given element. This can be a player, ped, vehicle, object, weapon, building, pickup or projectile.
---@param theElement element The element to retrieve the model ID of.
---@return integer|false Returns the model ID if successful, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function getElementModel(theElement) end

---This function is used to determine the parent of an element.
---@param theElement element The child of the parent element you want returned.
---@return element|false This returns the parent as an element. It returns false if element is invalid, or is the root node.
---@markup { MTA:SA Shared/Server }
function getElementParent(theElement) end

---This function allows you to retrieve the position coordinates of an element.
---@param theElement element The element which you'd like to retrieve the location of.
---@return number|false | number | number Returns three floats indicating the position of the element, x, y and z respectively. Returns false if invalid element was passed.
---@markup { MTA:SA Shared/Client }
function getElementPosition(theElement) end

---This function gets the radius of an element. This can be a player, ped, vehicle, object or weapon. Normally, sphere or circle\-shaped elements tend to return a more accurate and expected radius than others with another shapes.
---@param theElement element The element to get the radius of.
---@return number|false Returns a float containing the radius if the element is valid, false otherwise.
---@markup { MTA:SA Client }
function getElementRadius(theElement) end

---Retrieve the rotation of elements.
---@param theElement element The element whose rotation will be retrieved.
---@param rotOrder string? A string representing the rotation order desired when returning the euler angles.
---@return number|false | number | number Returns 3 floats representing the Euler rotation angles on the axis X, Y and Z (with the rotation order depending on the rotOrder argument) if element exists and is a valid element, false if it's invalid.
---@markup { MTA:SA Shared/Client }
function getElementRotation(theElement, rotOrder) end

---This function gets the syncer of an element. The syncer is the player who is in control of the element.
---@param theElement element The element to get the syncer of.
---@return element|false Returns the element that is the syncer of theElement or false if the element does not have a syncer or invalid element passed.
---@markup { MTA:SA Server }
function getElementSyncer(theElement) end

---This function is used to retrieve the type of an element.
---@param theElement element The element you wish to get the type of.
---@return string|false Returns a string containing the element type, false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function getElementType(theElement) end

---This function returns three floats containing the velocity (movement speeds) along the X, Y, and Z axis respectively. This means that velocity values can be positive and negative for each axis. Supported element types are player, ped, vehicle, object, weapon, projectile and sound.
---@param theElement element The element you wish to retrieve the velocity of.
---@return number|false | number | number If succesful, returns three floats that represent the element's current velocity along the x, y and z axis respectively. This function will fail if the element specified does not have a velocity, or does not exist. In case of failure, the first return value will be false.
---@markup { MTA:SA Shared/Server }
function getElementVelocity(theElement) end

---This function allows you to retrieve the zone name of an element (eg. Verdant Bluffs or Ocean Docks).
---@param theElement element The element which you'd like to retrieve the zone name from.
---@param citiesonly boolean? An optional argument to choose if you want to return the city name (eg Las Venturas).
---@return string|false Returns the string of the elements zone name or false if invalid element was passed.
---@markup { MTA:SA Server }
function getElementZoneName(theElement, citiesonly) end

---This function is used to retrieve a list of all elements of the specified type. This can be useful, as it disregards where in the element tree it is. It can be used with either the built in types or with any custom type used in a .map file. For example, if there is an element of type "flag" (e.g. \) in the .map file, the using "flag" as the type argument would find it.
---@param theType string The type of element you want a list of. This is the same as the tag name in the .map file, so this can be used with a custom element type if desired. See element types.
---@param startat element? The element the search should start at. Children of this element are searched, siblings or parents will not be found. By default, this is the root element which should suit most uses.
---@param streamedIn boolean? If true, function will only return elements that are streamed in.
---@return table|false Returns a table containing all the elements of the specified type. Returns an empty table if there are no elements of the specified type. Returns false if the string specified is invalid (or not a string).
---@markup { MTA:SA Shared/Server }
function getElementsByType(theType, startat, streamedIn) end

---This function is used to retrieve a list of all elements of specified type within a range of 3D coordinates.
---@param x number The x coordinate at which to retrieve elements.
---@param y number The y coordinate at which to retrieve elements.
---@param z number The z coordinate at which to retrieve elements.
---@param range number The range at the coordinates in which to retrieve elements.
---@param elemType string? The type of element you want a list of.
---@param interior integer? The interior you want to limit the search to. If not specified, it can return elements in any interior.
---@param dimension integer? The dimension you want to limit the search to. If not specified, it can return elements in any dimension.
---@return table|false Returns a table containing all the elements of the specified type within range. Returns an empty table if there are no elements within range. Returns false if the arguments are invalid.
---@markup { MTA:SA Shared/Server }
function getElementsWithinRange(x, y, z, range, elemType, interior, dimension) end

---This function return the low LOD element that an element is associated with.
---@param theElement element The element whose low LOD version we want to get. This can be a object or building.
---@return element|false Returns a low LOD element if successful, false otherwise.
---@markup { MTA:SA Shared }
function getLowLODElement(theElement) end

---This function returns the root node of the element tree, called root. This node contains every other element - all resource root elements, players etc. It is never destroyed and cannot be destroyed using destroyElement. It is often used to attach handler functions to events triggered for any element, or also to make a scripting function affect all elements.
---@return element Returns the root element.
---@markup { MTA:SA Shared/Client }
function getRootElement() end

---This function checks if an element has element data available under a certain key.
---@param theElement element This is the element with data you want to check.
---@param key string The name of the element data entry you want to check for. (Max 128 characters).
---@param inherit boolean? Toggles whether or not the function should go up the hierarchy to find the requested key in case the specified element doesn't have it.
---@return boolean This function returns true if the element contains element data for key, or false if the element doesn't exist or there is no data associated with the key.
---@markup { MTA:SA Shared/Server/Client }
function hasElementData(theElement, key, inherit) end

---This function returns whether a player is subscribed to specific element data. This function is used together with setElementData in subscribe mode.
---@param theElement element The element you wish to check whether the player is subscribed to.
---@param key string The key you wish to check whether the player is subscribed to.
---@param thePlayer player The player you wish to check.
---@return boolean Returns true if the player is subscribed, false otherwise.
---@markup { MTA:SA Server }
function hasElementDataSubscriber(theElement, key, thePlayer) end

---This function checks if a value is an element or not.
---@param theValue var The value that we want to check.
---@return boolean Returns true if the passed value is an element, false otherwise.
---@markup { MTA:SA Shared/Server }
function isElement(theValue) end

---This functions checks whether or not an element is attached to another element.
---@param theElement element The element to check for attachment.
---@return boolean Returns true if the specified element is attached to another element, false if it is not attached or nil if an improper argument was passed.
---@markup { MTA:SA Shared/Server }
function isElementAttached(theElement) end

---This functions checks if certain element has call propagation enabled.
---@param theElement element The element to check.
---@return boolean Returns true if the propagation is enabled, false if disabled or invalid arguments have been passed.
---@markup { MTA:SA Shared }
function isElementCallPropagationEnabled(theElement) end

---This function can be used to check whether specified element is collidable with another element. This can be a player, ped, vehicle or object.
---@param theElement element The element which colliding you want to get.
---@param withElement element The other element which colliding with the first entity you want to get.
---@return boolean Returns true if the elements collide with each other, false otherwise.
---@markup { MTA:SA Client }
function isElementCollidableWith(theElement, withElement) end

---This function checks whether an element is double\-sided as set by setElementDoubleSided or not.
---@param theElement element The element in which you'd like to check the double-sidedness of.
---@return boolean Returns true if the theElement is double-sided, false otherwise.
---@markup { MTA:SA Shared/Server }
function isElementDoubleSided(theElement) end

---This function checks if element has been frozen.
---@param theElement element The element whose freeze status we want to check.
---@return boolean Returns true if the element is frozen, false if it isn't or if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function isElementFrozen(theElement) end

---This function checks whether an element is submerged in water.
---@param theElement element The element to check.
---@return boolean Returns true if the passed element is in water, false if it isn't, or if the element is invalid.
---@markup { MTA:SA Shared/Server/Client }
function isElementInWater(theElement) end

---This function checks whether a clientside element is local to the client (doesn't exist in the server) or not.
---@param theElement element The element that we want to check.
---@return boolean Returns true if the passed element is local, false if not or if invalid parameters are passed.
---@markup { MTA:SA Client }
function isElementLocal(theElement) end

---This function reveals if an element is low LOD.
---@param theElement element The element whose low LOD status we want to get.
---@return boolean Returns true if the element is low LOD, false otherwise.
---@markup { MTA:SA Shared }
function isElementLowLOD(theElement) end

---This function checks if the specified element is on fire or not. This can be a player, ped, vehicle or object.
---@param theElement element The element to check.
---@return boolean Returns true if the element is on fire, false otherwise.
---@markup { MTA:SA Shared }
function isElementOnFire(theElement) end

---This function will check if an element is on the screen. Elements behind objects but still in the camera view count as being on screen.
---@param theElement element The element of which you wish to check whether it's being rendered on screen.
---@return boolean Returns true if element is on screen, false if not.
---@markup { MTA:SA Client }
function isElementOnScreen(theElement) end

---This function checks whether an element is streamable as set by setElementStreamable or not.
---@param theElement element The element to check the streamability of.
---@return boolean Returns true if the passed element is streamable like normal, false if this element must always be streamed in.
---@markup { MTA:SA Client }
function isElementStreamable(theElement) end

---This function checks whether an element is currently streamed in (not virtualized) and are actual GTA objects in the world. You can force an element to be streamed in using setElementStreamable.
---@param theElement element The element to check whether is streamed in or not.
---@return boolean Returns true if the passed element is currently streamed in, false if it is virtualized.
---@markup { MTA:SA Client }
function isElementStreamedIn(theElement) end

---This function checks whether an element is synced by the local player or not. This can be a ped, vehicle or object.
---@param theElement element The element to check.
---@return boolean Returns true if the passed element is synced by the local player, false otherwise.
---@markup { MTA:SA Client }
function isElementSyncer(theElement) end

---This checks if an element is visible to a player. This does not check if the player can literally see the element, just that they are aware that it exists. Some so-called per-player elements are able to be visible only to some players (see Visibility), as such this checks if this is the case for a particular element/player combination.
---@param theElement element The element you want to check the visibility of.
---@param visibleTo element The player you want to check against.
---@return boolean Returns true if element is visible to the specified player, false if not or an invalid argument was passed to the function.
---@markup { MTA:SA Server }
function isElementVisibleTo(theElement, visibleTo) end

---This function checks whether MTA has frozen an element because it is above map objects which are still loading or not. This can be a player, ped or vehicle.
---@param theElement element The element to check its frozen waiting for custom map objects to load status.
---@return boolean Returns true if the specified element is frozen waiting for collisions of custom map objects to load. Returns false if it's not or if the specified element is invalid.
---@markup { MTA:SA Client }
function isElementWaitingForGroundToLoad(theElement) end

---This function is used to determine if an element is within a collision shape.
---@param theElement element The element you're checking.
---@param theShape colshape The colshape you're checking.
---@return boolean Returns true if the element is within the colshape, false otherwise.
---@markup { MTA:SA Shared/Server }
function isElementWithinColShape(theElement, theShape) end

---This function is used to determine if an element is within a marker.
---@param theElement element The element you're checking.
---@param theMarker marker The marker you're checking.
---@return boolean Returns true if the element is within the marker, false otherwise
---@markup { MTA:SA Shared/Server }
function isElementWithinMarker(theElement, theMarker) end

---This function removes the element data with the given key for that element. The element data removal is synced with all the clients.
---@param theElement element The element you wish to remove the data from.
---@param key string The key string you wish to remove. Max 128 characters.
---@return boolean Returns true if the data was removed succesfully, false if the given key does not exist in the element or the element is invalid.
---@markup { MTA:SA Server }
function removeElementData(theElement, key) end

---This function unsubscribes a player from specific element data. This function is used together with setElementData in `"subscribe"` mode. This function works only on players who were previously added to subscription using addElementDataSubscriber.
---@param theElement element The element you wish to unsubscribe the player from.
---@param key string The key you wish to unsubscribe the player from.
---@param thePlayer player The player you wish to unsubscribe.
---@return boolean Returns true if the player was unsubscribed, false otherwise.
---@markup { MTA:SA Server }
function removeElementDataSubscriber(theElement, key, thePlayer) end

---This function sets the alpha (transparency) value for the specified element. This can be a player, ped, object, weapon, vehicle or marker.
---@param theElement element The element whose alpha you want to set.
---@param alpha integer The alpha value to set. Values are 0-255, where 255 is fully opaque and 0 is fully transparent. Note: Objects are fully transparent at 140.
---@return boolean Returns true or false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server/Client }
function setElementAlpha(theElement, alpha) end

---Sets the angular velocity of a specified, supported element (Applies a spin to it).
---@param theElement element The element to apply the spin to. Can be either a player, ped, object, vehicle or weapon.
---@param rx number Velocity around the X axis.
---@param ry number Velocity around the Y axis.
---@param rz number Velocity around the Z axis.
---@return boolean Returns true if it was succesful, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementAngularVelocity(theElement, rx, ry, rz) end

---This function updates the offsets of an element that has been attached to another element using attachElements.
---@param theElement element The attached element.
---@param xPosOffset number? The x offset, if you want the elements to be a certain distance from one another.
---@param yPosOffset number? The y offset.
---@param zPosOffset number? The z offset.
---@param xRotOffset number? The x rotation offset.
---@param yRotOffset number? The y rotation offset.
---@param zRotOffset number? The z rotation offset.
---@return boolean Returns true if the attaching process was successful, false otherwise.
---@markup { MTA:SA Shared/Client }
function setElementAttachedOffsets(theElement, xPosOffset, yPosOffset, zPosOffset, xRotOffset, yRotOffset, zRotOffset) end

---This function sets the position of a bone to the specified coordinates. Currently the player and ped element types are accepted.
---@param theElement element The element to set the bone position on.
---@param bone integer The ID of the bone to set the position of. See Bone IDs.
---@param x number The X coordinate of the destination.
---@param y number The Y coordinate of the destination.
---@param z number The Z coordinate of the destination.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Client }
function setElementBonePosition(theElement, bone, x, y, z) end

---This function determines how a particular bone rotates in relation to the element. This can be a player or ped.
---@param ped element The element on which the bone's rotation will be set.
---@param bone integer The ID of the bone to set the quaternion of. See Bone IDs.
---@param x number The quaternion's coefficient of the 𝑖 component, representing rotation around the x-axis.
---@param y number The quaternion's coefficient of the 𝑗 component, representing rotation around the y-axis.
---@param z number The quaternion's coefficient of the 𝑘 component, representing rotation around the z-axis.
---@param w number The real part of the quaternion, which is linked to the angle of rotation.
---@return boolean Returns true if the set was successful, otherwise returns false.
---@markup { MTA:SA Client }
function setElementBoneQuaternion(ped, bone, x, y, z, w) end

---This function sets the rotation of a specific bone relative to the element. Currently the player and ped element types are accepted.
---@param theElement element The element to set the bone rotation on.
---@param boneId integer The ID of the bone to set the rotation of. See Bone IDs.
---@param yaw number The yaw rotation value.
---@param pitch number The pitch rotation value.
---@param roll number The roll rotation value.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Client }
function setElementBoneRotation(theElement, boneId, yaw, pitch, roll) end

---This function enables/disables call propagation on a certain element. Look at the example for a practical application.
---@param theElement element The element whose propagation behaviour you'd like to change.
---@param enabled boolean Whether propagation should be enabled or not.
---@return boolean Returns true, if the propagation behaviour has been changed successfully, false otherwise.
---@markup { MTA:SA Shared/Client }
function setElementCallPropagationEnabled(theElement, enabled) end

---This function can be used to set an element to collide with another element. An element with collisions disabled does not interact physically with the other element. This can be a player, ped, vehicle, object or weapon.
---@param theElement element The element which colliding you want to change.
---@param withElement element The other element you wish the first entity to collide with.
---@param enabled boolean A boolean to indicate whether elements should be able to collide with each other (true) or not (false).
---@return boolean Returns true if the collisions were set succesfully, false otherwise.
---@markup { MTA:SA Client }
function setElementCollidableWith(theElement, withElement, enabled) end

---This function can disable or enable an element's collisions. An element without collisions does not interact with the physical environment and remains static.
---@param theElement element The element you wish to set the collisions of.
---@param enabled boolean A boolean to indicate whether collisions are enabled (true) or disabled (false).
---@return boolean Returns true if the collisions were set succesfully, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementCollisionsEnabled(theElement, enabled) end

---This function stores element data under a certain key, attached to an element. Element data set using this is then synced with all clients and the server (by default).
---@param theElement element The element you wish to attach the data to.
---@param key string The key you wish to store the data under. (Maximum 128 characters.)
---@param value var The value you wish to store. See element data restrictions.
---@param syncMode string? Synchronization mode.
---@param clientChangesPolicy string? Client changes policy.
---@return boolean Returns true if the data was set successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function setElementData(theElement, key, value, syncMode, clientChangesPolicy) end

---This function allows you to set the dimension of an element.
---@param theElement element The element in which you'd like to set the dimension of.
---@param dimension integer An integer representing the dimension ID. You can also use -1 to make the element visible in all dimensions (only valid to objects). Valid values are 0 to 65535.
---@return boolean Returns true if theElement and dimension are valid, false otherwise. Also returns false if `theElement` is a player and it's not alive.
---@markup { MTA:SA Shared/Server }
function setElementDimension(theElement, dimension) end

---This function allows you to set the double\-sidedness of an element's model. When an element's model is double\-sided, it's back facing triangles become visible. See what is back-face culling.
---@param theElement element The element in which you'd like to set the double-sidedness of.
---@param enable boolean Set to true/false to enable/disable double-sidedness.
---@return boolean Returns true if theElement is valid, false otherwise.
---@markup { MTA:SA Shared }
function setElementDoubleSided(theElement, enable) end

---This function freezes an element (stops it in its position and disables movement) or unfreezes it.
---@param theElement element The element whose freeze status we want to change.
---@param freezeStatus boolean A boolean denoting whether we want to freeze (true) or unfreeze (false) it.
---@return boolean Returns true if the element was frozen, false if it wasn't or if invalid arguments are passed.
---@markup { MTA:SA Shared/Server }
function setElementFrozen(theElement, freezeStatus) end

---This function sets the health for the specified element. This can be a player/ped, object or a vehicle.
---@param theElement element The element whose health you want to set.
---@param newHealth number A float indicating the new health to set for the element.
---@return boolean Returns true if the new health was set successfully, or false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server }
function setElementHealth(theElement, newHealth) end

---This function sets the ID of an element to a string. This can be anything from an identifying number, to a name.
---@param theElement element The element you want to set the ID of.
---@param name string The new ID for theElement.
---@return boolean This returns true if successful. It will return false if theElement is invalid, or does not exist, or if name is invalid, or is not a string.
---@markup { MTA:SA Shared }
function setElementID(theElement, name) end

---This function allows you to set the interior of any element. An interior is the current loaded place, 0 being outside.
---@param theElement element The element in which you'd like to set the interior of.
---@param interior integer The interior you want to set the element to. Valid values are 0 to 255.
---@param x number? A floating point number representing the X coordinate on the map.
---@param y number? A floating point number representing the Y coordinate on the map.
---@param z number? A floating point number representing the Z coordinate on the map.
---@return boolean Returns true if theElement and interior are valid arguments, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementInterior(theElement, interior, x, y, z) end

---This function changes the lighting value for the specified element. This can be a player, ped, vehicle, object or a weapon.
---@param theElement element The element whose lighting you want to change.
---@param lighting number The lighting value that you want to set.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Client }
function setElementLighting(theElement, lighting) end

---This function sets matrix to element.
---@param theElement element The element which you set matrix.
---@param theMatrix table The matrix.
---@return boolean Returns true if the matrix was set succesfully, false otherwise.
---@markup { MTA:SA Shared }
function setElementMatrix(theElement, theMatrix) end

---Sets the model of a given element. This can be a player, ped, vehicle, object, weapon, building or projectile.
---@param theElement element The element you want to change.
---@param model integer The model ID to set. - For players/peds: A GTASA player model (skin) ID. See Character Skins. - For vehicles: A GTASA vehicle model ID. See Vehicle Models. - For objects: A GTASA object model ID. See Object Models or IDE list.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementModel(theElement, model) end

---This function can be used to set a element on fire or extinguish a fire on it. Supported types are player/ped, vehicle and object.
---@param theElement element The element that we want to set/unset.
---@param isOnFire boolean Set true to set the element on fire, false to extinguish any fire on it.
---@return boolean Returns true if successful, false otherwise
---@markup { MTA:SA Shared/Server }
function setElementOnFire(theElement, isOnFire) end

---This function is used for setting an element as the parent of another element.
---@param theElement element The element that you wish to set the parent of.
---@param parent element The element you wish to be the parent of theElement .
---@return boolean Returns true if both elements are valid, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementParent(theElement, parent) end

---This function sets the position of an element to the specified coordinates.
---@param theElement element A valid element to be moved.
---@param x number The x coordinate of the destination.
---@param y number The y coordinate of the destination.
---@param z number The z coordinate of the destination.
---@param warp boolean? Teleports players, resetting any animations they were doing. Setting this to false preserves the current animation.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared/Server }
function setElementPosition(theElement, x, y, z, warp) end

---Sets the rotation of elements according to the world.
---@param theElement element The element whose rotation will be set.
---@param rotX number The element's rotation around the x axis in degrees.
---@param rotY number The element's rotation around the y axis in degrees.
---@param rotZ number The element's rotation around the z axis in degrees.
---@param rotOrder string? A string representing the rotation order desired when interpreting the provided euler angles.
---@param conformPedRotation boolean? Relevant only for peds and will be ignored for other element types. A bool which should be set to true to ensure the ped rotation is correctly set in all circumstances. Failing to set this argument may result in the ped rotation being inverted whilst it is in the air and other inconsistencies. The default value of false is for backward compatibility with scripts which may depend upon the incorrect behaviour.
---@return boolean Returns true if the element rotation was successfully set and false otherwise.
---@markup { MTA:SA Shared/Client }
function setElementRotation(theElement, rotX, rotY, rotZ, rotOrder, conformPedRotation) end

---This function can be used to disable streaming for an element. This will make sure the element is not virtualized (streamed out from GTA) when the player moves far away from it. This function only works in elements with a physical representation in the world (entities), such as player, ped, vehicle and object.
---@param theElement element The element you wish to set the streaming of.
---@param streamable boolean Set true if this element should stream in/out like normal, false if it should always be streamed in.
---@return boolean Returns whether the element could be set to be streamable.
---@markup { MTA:SA Client }
function setElementStreamable(theElement, streamable) end

---This function can be used to change the syncer (player) of an element. The syncer is the player who is responsible for informing the server about the state of that element - it's position, orientation and other state information. The function can be also used to remove an element's syncer.
---@param theElement element The element whose syncer you wish to change.
---@param thePlayer player The player who should be the new syncer of the element. If set to false, this element will not have a syncer. If set to true, MTA will pick automatically the nearest or most relevant player to that element.
---@param persist boolean? If true, the server will not automatically change the syncer. If set to false, default syncer behavior resumes.
---@return boolean Returns true if the syncer was changed successfully, false if the element passed was not a ped or vehicle.
---@markup { MTA:SA Server }
function setElementSyncer(theElement, thePlayer, persist) end

---This function sets the velocity (movement speeds) along each axis, for an element. This can be a player, ped, vehicle, object, weapon, projectile or sound.
---@param theElement element The element you wish to set the velocity of.
---@param speedX number A floating point value determining the speed along the X axis.
---@param speedY number A floating point value determining the speed along the Y axis.
---@param speedZ number A floating point value determining the speed along the Z axis.
---@return boolean Returns true if the speed was set successfully, false if a bad element was specified or other bad arguments.
---@markup { MTA:SA Shared/Server/Client }
function setElementVelocity(theElement, speedX, speedY, speedZ) end

---This function can change an element's visibility. This can be a marker, blip or radararea.
---@param theElement element The element you want to control the visibility of.
---@param visibleTo element The element you wish the element to be visible or invisible to. Any child elements that are players will also be able to see the element. See visibility.
---@param visible boolean Whether you are making it visible or invisible to the player.
---@return boolean Returns true if the element's visibility was changed successfully, false otherwise, for example if you are trying to change the visibility of a vehicle, player or object.
---@markup { MTA:SA Server }
function setElementVisibleTo(theElement, visibleTo, visible) end

---This function assigns a low LOD element to an element. The low LOD element is displayed when its associated element is not fully visible. If a low LOD element is assigned to several elements, it will be displayed when any of these elements are not fully visible.
---@param theElement element The element whose low LOD version we want to change.
---@param lowLODElement element A low LOD element to display when the first element is not fully visible.
---@return boolean Returns true if the assignment was successful, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function setLowLODElement(theElement, lowLODElement) end

---This function updates GTA bone animation for a given element. Currently the player and ped element types are accepted. It must be called after setElementBoneRotation for changes to take effect. It should only be called once per frame, after you are done rotating bones on that element, as it is quite heavy.
---@param theElement element The element to update the bone animations.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Client }
function updateElementRpHAnim(theElement) end

-- Engine

---This function adds new CJ clothing model.
---@param theModel dff The model that will be added.
---@param fileName string Name of the file containing the DFF extension.
---@return boolean Returns true if the model was added, and throws an error otherwise.
---@markup { MTA:SA Client }
function engineAddClothingModel(theModel, fileName) end

---This function adds new CJ clothing texture.
---@param theTexture txd The texture that will be added.
---@param fileName string Name of the file containing the TXD extension.
---@return boolean Returns true if the texture was added, and throws an error otherwise.
---@markup { MTA:SA Client }
function engineAddClothingTXD(theTexture, fileName) end

---This function adds an IMG file container to GTA streamer. After this GTA will asynchronously load models from IMG.
---@param imgArchive img The IMG file you want to add to GTA world.
---@return boolean Returns true if the IMG element was successfully added, false otherwise.
---@markup { MTA:SA Client }
function engineAddImage(imgArchive) end

---This function applies a shader to one or more world textures.
---@param shader element The shader which is to be applied.
---@param textureName string The name of the world texture to apply the shader to. Wildcard matching e.g. `"ro?ds*"` can be used to apply to more than one texture at a time.
---@param targetElement element? The element to restrict applying the shader to. If this is not set the shader will be applied to everything using the texture name. Valid element types for targetElement are vehicle, object and ped.
---@param appendLayers boolean? Allows two or more layered shaders to be applied in the same texture. You may want to modify the DepthBias in the technique pass to avoid Z-fighting artifacts when using this.
---@return boolean Returns true if the shader was successfully applied, false otherwise.
---@markup { MTA:SA Client }
function engineApplyShaderToWorldTexture(shader, textureName, targetElement, appendLayers) end

---This function is used to un\-assign the specified model ID from the engineRequestModel assignment.
---@param modelID integer The model ID you want to have un-assigned.
---@return boolean Returns true if the model was successfully freed, false otherwise.
---@markup { MTA:SA Client }
function engineFreeModel(modelID) end

---This function is used to un\-assign the specified TXD ID from the engineRequestTXD assignment.
---@param txdID integer The TXD ID you want to have un-assigned.
---@return boolean Returns true if the TXD was successfully freed, false otherwise.
---@markup { MTA:SA Client }
function engineFreeTXD(txdID) end

---This function returns model flags.
---@param modelID integer ID of the model you want to get flags.
---@return integer Returns int with model flags in GTA format, throws an error otherwise.
---@markup { MTA:SA Client }
function engineGetModelFlags(modelID) end

---This function gets the model ID of an object model from object name.
---@param modelName string The model name of the object.
---@return integer|false Returns an int with the ID of the object model, false otherwise.
---@markup { MTA:SA Client }
function engineGetModelIDFromName(modelName) end

---This function gets the LOD distance for any object / model ID.
---@param model integer The model / object ID number you want to get the LOD distance of.
---@return number|false Returns a float representing the LOD distance of the model, or false if the model argument is incorrect.
---@markup { MTA:SA Client }
function engineGetModelLODDistance(model) end

---This function gets the model name of an object model from model ID.
---@param modelID integer The model ID of the object.
---@return string|false Returns a string with the name of the object model, false otherwise.
---@markup { MTA:SA Client }
function engineGetModelNameFromID(modelID) end

---This function gets physical properties group id used by given model.
---@param modelID integer The id of model which you wish to get physical properties group of.
---@return integer Returns id of physical properties group that requested model uses, in range of 0-159, if the object doesn't have a group assigned, -1 is returned. If passed arguments were wrong, error is triggered.
---@markup { MTA:SA Client }
function engineGetModelPhysicalPropertiesGroup(modelID) end

---This function gets TXD ID from a model.
---@param modelID integer ID of the model you want to get TXD ID from.
---@return integer Returns ID if successful, otherwise error is triggered.
---@markup { MTA:SA Client }
function engineGetModelTXDID(modelID) end

---This function returns a table of the world textures which are applied to the specified model.
---@param modelIdOrName string You can either use the model id or the model name.
---@return table|false Returns a table if this function succeeds, false if it fails for some reason.
---@markup { MTA:SA Client }
function engineGetModelTextureNames(modelIdOrName) end

---This function allows you to get the textures of any model.
---@param modelName/modelID string/int Either the model ID or model name.
---@param textureNames string/table? Only return textures with specified name(s). You can provide a single string or a table of strings. Wildcard matching e.g. "ro?ds*" can be used.
---@return table|false Returns a table of texture elements [textureName, texture], false otherwise.
---@markup { MTA:SA Client }
function engineGetModelTextures(modelName/modelID, textureNames) end

---This function returns a model's visibility time, this is used for example for building lights being shown after 23:00\.
---@param modelNameOrID string/int The model ID or name of the model.
---@return integer | integer Returns 2 integers, indicating timeOn and timeOff. Returns false if invalid model provided.
---@markup { MTA:SA Client }
function engineGetModelVisibleTime(modelNameOrID) end

---This function gets physical property of given properties group.
---@param groupID integer The id of physical properties group (in range 0-159) which you wish to get a property from.
---@param property string The property which you wish to get. See physical properties.
---@return var Returns the value contained in given property if everything went well, error is raised otherwise.
---@markup { MTA:SA Client }
function engineGetObjectGroupPhysicalProperty(groupID, property) end

---This function returns the capacity of the provided pool.
---@param pool string Name of the pool. See pools.
---@return integer Returns the capacity of the provided pool as a positive number, or throws an error if an invalid argument is passed.
---@markup { MTA:SA Client }
function engineGetPoolCapacity(pool) end

---This function returns the default capacity of the provided pool.
---@param pool string Name of the pool. See pools.
---@return integer Returns the default capacity of the provided pool as positive number or throws error if invalid argument passed.
---@markup { MTA:SA Client }
function engineGetPoolDefaultCapacity(pool) end

---This function returns the used capacity of the provided pool.
---@param pool string Name of the pool. See pools.
---@return integer Returns the used capacity of the provided pool as positive number or throws error if invalid argument passed.
---@markup { MTA:SA Client }
function engineGetPoolUsedCapacity(pool) end

---This function retrieves the value of a surface property.
---@param surfaceID integer Material ID from 0 to 178. See surface materials.
---@param property string Property name. See surface properties.
---@return var|false Returns the current property value, false if invalid arguments passed.
---@markup { MTA:SA Client }
function engineGetSurfaceProperties(surfaceID, property) end

---This function returns a list of the world textures which are being used to draw the current scene.
---@param nameFilter string? Only include textures that match the wildcard string.
---@param modelIdOrName string? Only include textures that are used by the model id (or model name).
---@return table|false Returns a table of texture names if successful, false otherwise.
---@markup { MTA:SA Client }
function engineGetVisibleTextureNames(nameFilter, modelIdOrName) end

---This function gets a file from an IMG container.
---@param img_file img The IMG file you want to get file from.
---@param file string/int Name or position of the file you want to get.
---@return string Returns the file's binary data if successful; otherwise, it throws an error. Data size is bonded to 2 Kb block size.
---@markup { MTA:SA Client }
function engineImageGetFile(img_file, file) end

---This function gets the list of files from an IMG container.
---@param imgArchive img The IMG file handler you want to get files from.
---@return table Returns array table with files in the IMG element if successfull; otherwise, it throws an error.
---@markup { MTA:SA Client }
function engineImageGetFiles(imgArchive) end

---This function returns the number of files an IMG file has.
---@param imgArchive img The IMG archive handler.
---@return integer Returns an int with the number of files if successfull; otherwise, it throws an error.
---@markup { MTA:SA Client }
function engineImageGetFilesCount(imgArchive) end

---This function links DFF file with an IMG container. This function does not change a model immediately. You should use engineRestreamWorld to reload models.
---@param img_file img The IMG file you want to link.
---@param file string/int Name or position of the DFF file you want to link.
---@param modelID integer ID of the model you want to link to.
---@return boolean Returns true if the IMG file was successfully linked, false otherwise, or throws an error if invalid arguments were provided.
---@markup { MTA:SA Client }
function engineImageLinkDFF(img_file, file, modelID) end

---This function links TXD file with an IMG container. This function does not change a model texture immediately. You should use engineRestreamWorld to reload models.
---@param img_file img The IMG file you want to link.
---@param file string/int Name or position of the TXD file you want to link.
---@param txdID integer ID of the texture dictionary you want to link to. Use engineGetModelTXDID or engineRequestTXD to get this value.
---@return boolean Returns true if the IMG file was successfully linked, false otherwise, or throws an error if invalid arguments were provided.
---@markup { MTA:SA Client }
function engineImageLinkTXD(img_file, file, txdID) end

---This function imports (adds) a loaded RenderWare Texture Dictionary into a specific model. This is necessary in order for the DFF loader to find any new textures. Please call this function before loading the DFF model file, in order to allow the DFF loading process to find the new textures. This function can also replace default GTA textures, so that it becomes possible to e.g. put custom images on existing billboards - ped and weapon textures are also supported.
---@param texture txd The TXD element that was loaded with engineLoadTXD.
---@param model string/int The model id or model name to import the TXD into.
---@return boolean Returns true if the function executed succesfully, false otherwise.
---@markup { MTA:SA Client }
function engineImportTXD(texture, model) end

---This function loads a RenderWare Collision (COL 1/2/3\) file into GTA. The collisions can then be used to provide collisions for in-game objects.
---@param filePath/rawData string The filepath to the COL file you want to load or whole data buffer of the COL file.
---@return col|false Returns a COL if the file was loaded, false otherwise.
---@markup { MTA:SA Client }
function engineLoadCOL(filePath/rawData) end

---This function loads a RenderWare Model (DFF) file into GTA.
---@param filePath/rawData string The filepath to the DFF file you want to load or whole data buffer of the DFF file.
---@return dff|false Returns a DFF element if the dff file loaded, false otherwise.
---@markup { MTA:SA Client }
function engineLoadDFF(filePath/rawData) end

---This function loads an animation library (IFP) file into GTA with a custom block name. All three IFP formats are supported ANPK, ANP2, and ANP3\. Unfortunately, GTA 3 animations are not supported, however, you can load GTA:VC IFP files using this function. You don't have to replace any animation to play a custom one, to play a custom animation, load the IFP file using this function, then use setPedAnimation.
---@param filePath/rawData string The filepath to the IFP file you want to load or whole data buffer of the IFP file.
---@param custom_block_name string The new block name for the IFP file. You cannot use the GTA default internal block names. You should namespace this name using a string like `resource.blockname`.
---@return ifp|false Returns an IFP element if the IFP file loaded, false otherwise.
---@markup { MTA:SA Client }
function engineLoadIFP(filePath/rawData, custom_block_name) end

---This function loads an IMG container.
---@param img_file string The filepath to the IMG file you want to load.
---@return img Returns an IMG element if the IMG file loaded; otherwise, it throws an error.
---@markup { MTA:SA Client }
function engineLoadIMG(img_file) end

---This function loads a RenderWare Texture Dictionary (TXD) file into GTA. The texture dictionary can then be used to provide textures.
---@param filePath/rawData string The filepath to the TXD file you want to load or whole data buffer of the TXD file.
---@param filteringEnabled boolean? Whether to enable texture filtering.
---@return txd|false Returns a TXD if the file was loaded, false otherwise.
---@markup { MTA:SA Client }
function engineLoadTXD(filePath/rawData, filteringEnabled) end

---This function allows a specific area to be loaded immediately, which can be useful when teleporting a player. The function is not based on a radius, but a specific zone is loaded.
---@param x number Position in the X axis.
---@param y number Position in the Y axis
---@param z number Position in the z axis.
---@param loadingOption string? Argument of what exactly is to be loaded.
---@return nil Nothing.
---@markup { MTA:SA Client }
function enginePreloadWorldArea(x, y, z, loadingOption) end

---This function disables streaming from an IMG container.
---@param img_file img The IMG file you want to remove.
---@return boolean Returns true if stremaing from IMG file was successfully disabled, false otherwise.
---@markup { MTA:SA Client }
function engineRemoveImage(img_file) end

---This function removes a shader from one or more world textures.
---@param shader element The shader which is to be removed.
---@param textureName string The name of the world texture to remove the shader from. It should be exactly the same string as used with engineApplyShaderToWorldTexture when the shader was initially applied.
---@param targetElement element? The element to remove the shader from. It should be the same element as used with engineApplyShaderToWorldTexture when the shader was initially applied.
---@return boolean Returns true if the shader was successfully removed, false otherwise.
---@markup { MTA:SA Client }
function engineRemoveShaderFromWorldTexture(shader, textureName, targetElement) end

---This function replaces a specific internal (default) animation with a custom one that has been loaded using engineLoadIFP function. This function only affects a specific player or ped, the internal animation is not replaced for everyone, for instance, different players and peds are able to have completely different crouching, walking, and fighting etc., animations running simultaneously at the same time. Also, it's not synchronized, you'll need to execute this function on every client in Lua to synchronize it. Internal animations replaced using this function can still be played with setPedAnimation. You can restore replaced animations back with engineRestoreAnimation.
---@param thePed ped The player or ped you want to replace an animation for.
---@param InternalBlockName string The internal block name.
---@param InternalAnimName string The internal animation name inside InternalBlockName.
---@param CustomBlockName string The custom block name of the loaded IFP file that you passed to engineLoadIFP as second parameter.
---@param CustomAnimName string The custom animation name inside the loaded IFP file with CustomBlockName.
---@return boolean Returns true on success, false in case of failure.
---@markup { MTA:SA Client }
function engineReplaceAnimation(thePed, InternalBlockName, InternalAnimName, CustomBlockName, CustomAnimName) end

---This function replaces the collision file of the given model id to the collision file passed. Use engineLoadCOL to load the collision file first.
---@param theCol col The collision file to replace with.
---@param modelID integer The model ID whose collision file you want to replace.
---@return boolean Returns true if the collision was successfully replaced, false or nil if the collision could not be replaced for a reason.
---@markup { MTA:SA Client }
function engineReplaceCOL(theCol, modelID) end

---This function replaces the given model with the model contained in a DFF file loaded by engineLoadDFF.
---@param theModel dff The model to replace the given model with.
---@param modelNameOrID string/int The model ID or name of the model to be replaced.
---@param alphaTransparency boolean? Set to true if model uses semi-transparent textures, e.g. windows. This will ensure other objects behind the semi-transparent textures are rendered correctly. Can slightly impact performance, so only set when required.
---@return boolean Returns true if the model was successfully replaced, false if it failed for some reason, ie. the DFF or the model ID is not valid.
---@markup { MTA:SA Client }
function engineReplaceModel(theModel, modelNameOrID, alphaTransparency) end

---This function is used to assign the next available model ID to a certain element type.
---@param elementType string Element type: `ped`, `vehicle`, `object`, `timed-object`, `clump`, `object-damageable`.
---@param parentID integer? The ID of the parent model (by default this is: 1337 - objects, 400 - vehicles, 7 - peds, 3425 - clump models, 4715 - timed objects, 994 - damageable objects).
---@return integer|false Returns an integer of the model ID that was available to be assigned to the element type, false if no free model ID available or invalid element type.
---@markup { MTA:SA Client }
function engineRequestModel(elementType, parentID) end

---This function is used to register the next available TXD ID.
---@param name string TXD name string up to 24 characters.
---@return integer|false Returns an integer of the TXD ID that was available to be assigned to game models, false if no free TXD ID available.
---@markup { MTA:SA Client }
function engineRequestTXD(name) end

---This function restores model flags to default state.
---@param modelID integer ID of the model you want to reset.
---@return boolean Returns true if model flags was successfully restored, false otherwise.
---@markup { MTA:SA Client }
function engineResetModelFlags(modelID) end

---This function resets the LOD distance for an model ID.
---@param model integer The model ID number you want to reset the LOD distance of.
---@return boolean Returns true if the LOD distance was reset to default, or false if the model argument is incorrect, or the LOD distance hasn't been changed.
---@markup { MTA:SA Client }
function engineResetModelLODDistance(model) end

---This function restores the original TXD ID of the given model ID. Reverses the effect of engineSetModelTXDID.
---@param modelID integer The ID of the model to restore the model of.
---@return boolean Returns true if this function succeeds, throw a error if it fails for some reason.
---@markup { MTA:SA Client }
function engineResetModelTXDID(modelID) end

---This function resets a surface property to its default value. If no ID is provided, it will reset all surfaces' properties to their original values.
---@param surfaceID integer Material ID from 0 to 178. See surface materials.
---@return boolean Returns true if the function executed succesfully, false or nil otherwise.
---@markup { MTA:SA Client }
function engineResetSurfaceProperties(surfaceID) end

---This function restores internal (default) animations that were replaced using engineReplaceAnimation function. This function only affects a specific player or ped just like engineReplaceAnimation. If only 1st parameter (ped) is provided to this function, all replaced animations are restored. If block name is also provided for 2nd parameter, then replaced animations within that block are restored. If 3rd parameter (animation name) is provided, then only that specific animation within that specific block is restored.
---@param thePed ped The player or ped you want to restore an animation(s) for.
---@param InternalBlockName string? The internal block name.
---@param InternalAnimName string? The internal animation name inside InternalBlockName.
---@return boolean Returns true on success, false in case of failure.
---@markup { MTA:SA Client }
function engineRestoreAnimation(thePed, InternalBlockName, InternalAnimName) end

---This function restores the original collision model of the given model ID. Reverses the effect of engineReplaceCOL.
---@param modelID integer The ID of the model to restore the model of.
---@return boolean Returns true if this function succeeds, false or nil if it fails for some reason.
---@markup { MTA:SA Client }
function engineRestoreCOL(modelID) end

---This function restores changes to DFF file from IMG container. This function reverses the effect of engineImageLinkDFF.
---@param modelID integer ID of the model you want to restore.
---@return boolean Returns true if IMG file was successfully restored, false or throws error otherwise.
---@markup { MTA:SA Client }
function engineRestoreDFFImage(modelID) end

---This function restores the visual DFF model of the given model ID. This restores the result of engineReplaceModel.
---@param modelID integer The model ID to restore the visuals of.
---@return boolean Returns true if the model was successfully restored, false or nil if it failed for some reason.
---@markup { MTA:SA Client }
function engineRestoreModel(modelID) end

---This function restores original physical properties group used by given model.
---@param modelID integer The id of model which you wish to restore original physical properties group of.
---@return boolean Returns true if there were no issues, if passed arguments were invalid an error is raised.
---@markup { MTA:SA Client }
function engineRestoreModelPhysicalPropertiesGroup(modelID) end

---This function restores all physical properties of given properties group.
---@param groupID integer The id of physical properties group (in range 0-159) which you wish to restore.
---@return boolean Returns true if everything went well, error is raised otherwise.
---@markup { MTA:SA Client }
function engineRestoreObjectGroupPhysicalProperties(groupID) end

---This function restores changes to TXD file from IMG container. This function reverses the effect of engineImageLinkTXD.
---@param modelID integer ID of the model you want to restore.
---@return boolean Returns true if IMG file was successfully restored, false or throws error otherwise.
---@markup { MTA:SA Client }
function engineRestoreTXDImage(modelID) end

---This function re-streams a specific group of models and can be used as a more stable alternative to engineRestreamWorld when you only need to re-stream a specific model group rather than the entire world.
---@param restreamOption string? Which group of models should be re-streamed and can be one of the following: `world`, `vehicles`, `peds`, or `objects`.
---@return nil This function always returns nil.
---@markup { MTA:SA Client }
function engineRestream(restreamOption) end

---This function re-streams a specific model by its ID. It can be used as a more efficient alternative to engineRestreamWorld when you only need to re-stream a single model. For example, after using engineImageLinkDFF, instead of calling engineRestreamWorld, you can call engineRestreamModel to re-stream only the replaced model, improving performance.
---@param modelId integer The ID of the model you want to re-stream.
---@return boolean The function returns true if the model was successfully re-streamed, and false otherwise.
---@markup { MTA:SA Client }
function engineRestreamModel(modelId) end

---This function re\-streams everything in the GTA world. This function will force unload all models. This can be useful if you try to replace buildings in SA world.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function engineRestreamWorld() end

---This function enables or disables asynchronous model loading. Enabling asynchronous model loading may reduce the small pauses that occur when a new model is displayed for the first time. However, it can cause the new models to appear slightly later than they might have otherwise. If asynchronous loading is disabled, MTA requests all resources to be loaded at the time they have been requested. This will halt game execution for the time being. Otherwise, all resource requests are queued up on the to-be-loaded queue. At the beginning of the game frame, the GTA:SA streaming system is updated, along with its streaming slicers. This is when a model is loaded after going through multiple stages. Having asynchronous loading disabled forces all stages to be consecutively run through. For more details read GTA:SA Resource Streaming.
---@param enable boolean Set to true/false to enable/disable asynchronous loading.
---@param force boolean? If set to true, ignores the client's preferences.
---@return boolean Returns true if the function executed successfully, false otherwise.
---@markup { MTA:SA Client }
function engineSetAsynchronousLoading(enable, force) end

---This function changes specific model flag.
---@param modelID integer ID of the model you want to set flag.
---@param flagName string Flag name. Check model flags.
---@param state boolean Flag state.
---@return boolean Returns boolean with flag state, throws an error otherwise.
---@markup { MTA:SA Client }
function engineSetModelFlag(modelID, flagName, state) end

---This function changes model flags.
---@param modelID integer ID of the model you want to change.
---@param flags integer Flags.
---@param ideFlags boolean Use IDE flag format.
---@return boolean Returns true if model flags was successfully changed, throws an error otherwise
---@markup { MTA:SA Client }
function engineSetModelFlags(modelID, flags, ideFlags) end

---This function sets a custom LOD distance for any object / model ID. This is the distance at which objects of that model ID are switched to their LOD model, or (if there is no LOD model) become invisible.
---@param modelNameOrID string/int The model ID or name of the model you want to change the LOD distance of.
---@param distance number New LOD distance value in San Andreas units.
---@param extendedLod boolean? Allows to set a greater distance than the current 325 units.
---@return boolean Returns true if the function executed succesfully, false otherwise.
---@markup { MTA:SA Client }
function engineSetModelLODDistance(modelNameOrID, distance, extendedLod) end

---This function sets physical properties group id used by given model.
---@param modelID integer The id of model which you wish to set physical properties group of.
---@param groupID integer The id of new physical properties group (in range -1 to 159) to be used by given model. Use -1 to disable model physics.
---@return boolean Returns true if there were no issues with group change, otherwise an error is raised.
---@markup { MTA:SA Client }
function engineSetModelPhysicalPropertiesGroup(modelID, groupID) end

---This function changes the TXD ID of the given model ID.
---@param modelID integer The ID of the model to update TXD ID.
---@param txdID integer The ID of target TXD. Use engineRequestTXD to get a new TXD ID.
---@return boolean Returns true if this function succeeds, throw a error if it fails for some reason.
---@markup { MTA:SA Client }
function engineSetModelTXDID(modelID, txdID) end

---This function changes model visibility time, this is used for example for building lights being shown after 23:00.
---@param modelNameOrID string/int The model ID or name of the model.
---@param timeOn integer Value between 0 and 24 that states when the model should appear.
---@param timeOff integer Value between 0 and 24 that states when the model should disappear.
---@return boolean Returns true if the change was successful, false otherwise.
---@markup { MTA:SA Client }
function engineSetModelVisibleTime(modelNameOrID, timeOn, timeOff) end

---This function sets physical property of given properties group.
---@param groupID integer The id of physical properties group which you wish to set a property of.
---@param property string The property which you wish to set. See physical properties.
---@param newValue var New value of the property, with proper type.
---@return boolean Returns true if everything went well, error is raised otherwise.
---@markup { MTA:SA Client }
function engineSetObjectGroupPhysicalProperty(groupID, property, newValue) end

---This function changes the capacity of the provided pool.
---@param pool string Name of the pool. See pools.
---@param capacity number New size.
---@return boolean Return true if the pool capacity was changed and false if not. Throws an error if the pool is invalid.
---@markup { MTA:SA Client }
function engineSetPoolCapacity(pool, capacity) end

---This function changes a property of a surface.
---@param surfaceID integer Material ID from 0 to 178. See surface materials.
---@param property string Property name. See surface properties.
---@param value var New value.
---@return boolean Returns true if the function executed succesfully, false otherwise.
---@markup { MTA:SA Client }
function engineSetSurfaceProperties(surfaceID, property, value) end

---This function frees up the streaming RAM memory.
---@param bytes integer The amount of RAM to be freed up in bytes.
---@return nil This functon returns nothing.
---@markup { MTA:SA Client }
function engineStreamingFreeUpMemory(bytes) end

---Get the streaming buffer size \[not maximum memory size].
---@return integer The streaming buffer size. It is always a positive non-zero number.
---@markup { MTA:SA Client }
function engineStreamingGetBufferSize() end

---Gets the maximum amount of RAM \[in bytes] that can be used for streaming.
---@return integer The maximum amount of RAM [in bytes] that can be used for streaming. It is always a non-zero positive number.
---@markup { MTA:SA Client }
function engineStreamingGetMemorySize() end

---This function returns load state of model.
---@param modelID number ID of the model you want to get flags.
---@return string Returns string with model load state or throws error if invalid model ID is passed.
---@markup { MTA:SA Client }
function engineStreamingGetModelLoadState(modelID) end

---This function gets the amount of memory (in bytes) used by the GTA streamer.
---@return integer Returns a int containing the amount of memory in bytes.
---@markup { MTA:SA Client }
function engineStreamingGetUsedMemory() end

---This function sends a unloading request to the game model streamer.
---@param modelID number ID of the model you want to unload.
---@param removeRef boolean? Decrease references counter.
---@return boolean Returns true if the model was unloaded, false otherwise or throws error if invalid model ID is passed.
---@markup { MTA:SA Client }
function engineStreamingReleaseModel(modelID, removeRef) end

---This function sends a loading request to the game model streamer.
---@param modelID number ID of the model you want to load.
---@param addRef boolean? Increase references counter to prevent the model from unloading.
---@param isBlocking boolean? Load model immediately or use async loading.
---@return boolean Returns true if a new request was created, false otherwise and throws error if invalid model ID is passed.
---@markup { MTA:SA Client }
function engineStreamingRequestModel(modelID, addRef, isBlocking) end

---This function resets the streaming buffer. The value is automatically reset when disconnected.
---@return nil This function returns nothing.
---@markup { MTA:SA Client }
function engineStreamingRestoreBufferSize() end

---Restores the maximum amount of RAM \[in bytes] that can be used for streaming to the default value.
---@return nil This functions returns nothing.
---@markup { MTA:SA Client }
function engineStreamingRestoreMemorySize() end

---Set the streaming buffer size. The larger it is, the more models can be loaded in one go BUT increases the RAM \[not streaming memory!] usage. Can help with custom IMG loading speed by reducing pop\-in.
---@param sizeBytes integer The streaming buffer size. Must be a positive non-zero number.
---@return boolean Returns true if there was enough memory to allocate the buffer, false otherwise.
---@markup { MTA:SA Client }
function engineStreamingSetBufferSize(sizeBytes) end

---Sets the maximum amount of RAM \[in bytes] that can be used for streaming.
---@param sizeBytes integer The maximum amount of RAM [in bytes] that can be used for streaming. Must be a positive non-zero number.
---@return nil This functions returns nothing.
---@markup { MTA:SA Client }
function engineStreamingSetMemorySize(sizeBytes) end

---This function sets custom cache limits for vehicle and pedestrian models based on provided values. The arguments that receive zero mean complete deactivation.
---@param numVehicles integer? Specifies the maximum number of vehicle models that can be cached.
---@param numPeds integer? Specifies the maximum number of pedestrian models that can be cached.
---@return nil This function returns nothing.
---@markup { MTA:SA Client }
function engineStreamingSetModelCacheLimits(numVehicles, numPeds) end

-- Event

---This function allows you to register a custom event. Custom events function exactly like the built\-in events. See event system for more information on the event system.
---@param eventName string The name of the event you wish to create.
---@param allowRemoteTrigger boolean? A boolean specifying whether this event can be called remotely using triggerClientEvent / triggerServerEvent or not.
---@return boolean Returns true if the event was added successfully, otherwise false if the event already exists built-in game events or if it fails for any other reason.
---@markup { MTA:SA Shared }
function addEvent(eventName, allowRemoteTrigger) end

---This function will add an event handler. An event handler is a function that will be called when the event it's attached to is triggered. See event system for more information on how the event system works.
---@param eventName string The name of the event you want to attach the handler function to. Note: The maximum allowed length is 100 ASCII characters (that is, English letters and numerals)
---@param attachedTo element The element you wish to attach the handler to. The handler will only be called when the event it is attached to is triggered for this element, or one of its children. Often, this can be the root element (meaning the handler will be called when the event is triggered for any element).
---@param handlerFunction() function The handler function you wish to call when the event is triggered. This function will be passed all of the event's parameters as arguments, but it isn't required that it takes all of them.
---@param propagate boolean? A boolean representing whether the handler will be triggered if the event was propagated down or up the element tree (starting from the source), and not triggered directly on attachedTo (that is, handlers attached with this argument set to false will only be triggered if source == this ). In GUI events you will probably want to set this to false .
---@param priority string? A string representing the trigger order priority relative to other event handlers of the same name. Possible values are:
---@return boolean Returns true if the event handler was attached successfully. otherwise false if the specified event could not be found or any parameters were invalid.
---@markup { MTA:SA Shared }
function addEventHandler(eventName, attachedTo, handlerFunction(), propagate, priority) end

---This function is used to stop the automatic internal handling of events event.
---@return boolean Always returns true.
---@markup { MTA:SA Shared/Server/Client }
function cancelEvent() end

---Stops a latent event from completing.
---@param thePlayer player The player who is receiving the event.
---@param handle integer A handle previous got from getLatentEventHandles.
---@return boolean Returns a true if the latent event was successfully cancelled, otherwise false.
---@markup { MTA:SA Shared/Server/Client }
function cancelLatentEvent(thePlayer, handle) end

---Gets the reason for cancelling an event.
---@return string Returns the reason that was given with cancelEvent.
---@markup { MTA:SA Server }
function getCancelReason() end

---This function gets the attached functions from the event and attached element from current lua script.
---@param eventName string The name of the event.
---@param attachedTo element The element attached to.
---@return table Returns table with attached functions, otherwise empty table.
---@markup { MTA:SA Shared/Server/Client }
function getEventHandlers(eventName, attachedTo) end

---Gets the currently queued latent events. The last one in the table is always the latest event queued.
---@return table Returns a table of handles, otherwise false if invalid arguments were passed.
---@markup { MTA:SA Shared/Server/Client }
function getLatentEventHandles() end

---Gets the status of one queued latent event.
---@param thePlayer player The player who is receiving the event.
---@param handle integer A handle previous got from getLatentEventHandles.
---@return table Returns a table with the following info, otherwise false if invalid arguments were passed.
---@markup { MTA:SA Shared/Client }
function getLatentEventStatus(thePlayer, handle) end

---This functions removes a handler function from an event, so that the function is not called anymore when the event is triggered. See event system for more information on how the event system works.
---@param eventName string The name of the event you want to detach the handler function from.
---@param attachedTo element The element the handler was attached to.
---@param functionVar() function The handler function that was attached.
---@return boolean Returns true if the event handler was removed successfully, otherwise false if the specified event handler could not be found or invalid parameters were passed.
---@markup { MTA:SA Shared/Client }
function removeEventHandler(eventName, attachedTo, functionVar()) end

---This function triggers an event previously registered on a client. This is the primary means of passing information between the server and the client. Clients have a similar triggerServerEvent function that can do the reverse. You can treat this function as if it was an asynchronous function call, using triggerServerEvent to pass back any returned information if necessary.
---@param sendTo table/element? The event will be sent to all players that are children of the specified element. By default this is the root element, and hence the event is sent to all players. If you specify a single player it will just be sent to that player. This argument can also be a table of player elements.
---@param name string The name of the event to trigger client side. You should register this event with addEvent and add at least one event handler using addEventHandler.
---@param sourceElement element The element that is the source of the event.
---@param arguments mixed? A list of arguments to trigger with the event. You can pass any lua data type (except functions). You can also pass elements.
---@return boolean Returns true if the event trigger has been sent, otherwise false if invalid arguments were specified.
---@markup { MTA:SA Server }
function triggerClientEvent(sendTo, name, sourceElement, arguments) end

---This function will trigger a named event on a specific element in the element tree. See event system for more information on how the event system works. You can use the value returned from this function to determine if the event was cancelled by one of the event handlers. You should determine what your response (if any) to this should be based on the event's purpose. Generally, cancelling an event should prevent any further code being run that is dependent on whatever triggered that event. For example, if you have an `onFlagCapture` event, cancelling it would be expected to prevent the flag being able to be captured. Similarly, if you have `onPlayerKill` as an event you trigger, canceling it would either be expected to prevent the player being killed from dying or at least prevent the player from getting a score for it.
---@param eventName string The name of the event you wish to trigger.
---@param baseElement element The element you wish to trigger the event on. See event system for information on how this works.
---@param arguments mixed? The first argument that the event handler expects should be added after the baseElement variable. NOTE: This function can have more than one of these arguments specified, once for each argument the event handler is expecting.
---@return boolean Returns true if the event was triggered successfully, otherwise false if the event was cancelled using cancelEvent, or nil if the arguments are invalid or the event could not be found.
---@markup { MTA:SA Shared }
function triggerEvent(eventName, baseElement, arguments) end

---This function is the same as triggerClientEvent except the transmission rate of the data contained in the arguments can be limited and other network traffic is not blocked while the data is being transferred.
---@param sendTo table/element? The event will be sent to all players that are children of the specified element. By default this is the root element, and hence the event is sent to all players. If you specify a single player it will just be sent to that player. This argument can also be a table of player elements.
---@param name string The name of the event to trigger client side. You should register this event with addEvent and add at least one event handler using addEventHandler.
---@param bandwidth integer? The bytes per second rate to send the data contained in the arguments.
---@param persist boolean? A bool indicating whether the transmission should be allowed to continue even after the resource that triggered it has since stopped.
---@param theElement element The element that is the source of the event. This could be another player, or if this isn't relevant, use the root element.
---@param arguments mixed? A list of arguments to trigger with the event. You can pass any Lua data type (except functions). You can also pass elements. The total amount of data should not exceed 100MB.
---@return boolean Returns true if the event trigger has been sent, otherwise false if invalid arguments were specified.
---@markup { MTA:SA Server }
function triggerLatentClientEvent(sendTo, name, bandwidth, persist, theElement, arguments) end

---This function is the same as triggerServerEvent except the transmission rate of the data contained in the arguments can be limited and other network traffic is not blocked while the data is being transferred.
---@param event string The name of the event to trigger server-side. You should register this event with addEvent and add at least one event handler using addEventHandler.
---@param bandwidth integer? The bytes per second rate to send the data contained in the arguments.
---@param persist boolean? A bool indicating whether the transmission should be allowed to continue even after the resource that triggered it has since stopped.
---@param theElement element The element that is the source of the event. This could be another player, or if this isn't relevant, use the root element.
---@param arguments mixed? A list of arguments to trigger with the event. You can pass any Lua data type (except functions). You can also pass elements . The total amount of data should not exceed 100MB.
---@return boolean Returns true if the event trigger has been sent, otherwise false if invalid arguments were specified.
---@markup { MTA:SA Client }
function triggerLatentServerEvent(event, bandwidth, persist, theElement, arguments) end

---This function triggers an event previously registered on the server. This is the primary means of passing information between the client and the server. Servers have a similar triggerClientEvent function that can do the reverse. You can treat this function as if it was an asynchronous function call, using triggerClientEvent to pass back any returned information if necessary.
---@param event string The name of the event to trigger server-side. You should register this event with addEvent and add at least one event handler using addEventHandler.
---@param theElement element The element that is the source of the event.
---@param arguments mixed? A list of arguments to trigger with the event. You can pass any lua data type (except functions). You can also pass elements.
---@return boolean Returns true if the event trigger has been sent, false if invalid arguments were specified or a client side element was a parameter.
---@markup { MTA:SA Client }
function triggerServerEvent(event, theElement, arguments) end

---This function checks if the last completed event was cancelled. This is mainly useful for custom events created by scripts. Events can be cancelled using cancelEvent, this indicates that the resource which triggered the event should do whatever it can to reverse any changes made by whatever caused the event. See triggerEvent for a more detailed explanation of this.
---@return boolean Returns true if the event was cancelled, otherwise false.
---@markup { MTA:SA Shared/Server }
function wasEventCancelled() end

-- Explosion

---Creates an explosion of a certain type at a specified point in the world. If creator is specified, the explosion will occur only in its dimension.
---@return boolean Return true if the explosion was created. false if invalid parameters were passed.
---@markup { MTA:SA Shared/Server/Client }
function createExplosion() end

-- File

---Closes a file handle obtained by fileCreate or fileOpen.
---@param theFile file The file handle to close.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function fileClose(theFile) end

---This function copies a file.
---@param filePath string The path of the file you want to copy.
---@param copyToFilePath string Where to copy the specified file to.
---@param overwrite boolean? If set to true it will overwrite a file that already exists at `copyToFilePath`.
---@return boolean Return true if the file was copied, else false if the `filePath` doesn't exist.
---@markup { MTA:SA Shared/Server/Client }
function fileCopy(filePath, copyToFilePath, overwrite) end

---Creates a new file in a directory of a resource. If there already exists a file with the specified name, it is overwritten with an empty file.
---@param filePath string The path of the file you want to copy.
---@return boolean If successful, returns a file handle which can be used with other file functions (fileWrite, fileClose etc.). Returns false if an error occured.
---@markup { MTA:SA Shared }
function fileCreate(filePath) end

---Deletes the specified file.
---@param filePath string The Filepath of the file to delete in the following format: `:resourceName/path`. `resourceName` is the name of the resource the file is in, and 'path' is the path from the root directory of the resource to the file. For example, if you want to delete a file name "myFile.txt" in the resource 'fileres', it can be deleted from another resource this way: `fileDelete(":fileres/myFile.txt")`. If the file is in the current resource, only the file path is necessary, e.g. `fileDelete("myFile.txt")`.
---@return boolean Returns true if successful, false otherwise (for example if there exists no file with the given name, or it does exist but is in use).
---@markup { MTA:SA Shared }
function fileDelete(filePath) end

---This functions checks whether a specified file exists inside a resource.
---@param filePath string The Filepath of the file, whose existence is going to be checked, in the following format: `:resourceName/path`. `resourceName` is the name of the resource the file is checked to be in, and 'path' is the path from the root directory of the resource to the file. For example, if you want to check whether a file named 'myfile.txt' exists in the resource 'mapcreator', it can be done from another resource this way: `fileExists(":mapcreator/myfile.txt")`. If the file, whose existence is going to be checked, is in the current resource, only the file path is necessary, e.g. `fileExists("myfile.txt")`. Note that you must use forward slashes '/' for the folders, backslashes '\' will return false.
---@return boolean Returns true if the file exists, false otherwise.
---@markup { MTA:SA Shared }
function fileExists(filePath) end

---Forces pending disk writes to be executed. fileWrite doesn't directly write to the hard disk but places the data in a temporary buffer; only when there is enough data in the buffer it is actually written to disk. Call this function if you need the data written right now without closing the file. This is useful for log files that might want to be read while the resource is still executing. `fileFlush` can be called after each log entry is written. Without this, the file may appear empty or outdated to the user.
---@param theFile file The file handle of the file you wish to flush.
---@return boolean Returns true if succeeded, false in case of failure (e.g. the file handle is invalid).
---@markup { MTA:SA Shared }
function fileFlush(theFile) end

---Reads the entire contents of the file, optionally verifies the read contents by computing and comparing the checksum with the expected one, and returns the content as string. The file cursor position is not modified by calls to this function. File must be added in the meta.xml.
---@param theFile file A handle to the file you wish to get the contents from. Use fileOpen to obtain this handle.
---@param verifyContents boolean? Set to true, to compare the computed and the expected checksum of the file content.
---@return string|nil Returns the bytes that were read from the file, but only if verification was disabled or if the checksum comparison succeeded. On failure, this function returns nil.
---@markup { MTA:SA Shared }
function fileGetContents(theFile, verifyContents) end

---This function returns a hash of the entire file in the specified algorithm. This function does not move the file pointer/position. Beware though, there will always be a minuscule period of time between checking the hash and loading the contents of the file, which can be abused by a potential attacker to modify the contents.
---@param theFile file A handle to the file you wish to get the hash from. Use fileOpen to obtain this handle.
---@param algorithm string A string which must be one of these: "md5", "sha1", "sha224", "sha256", "sha384", "sha512", "hmac".
---@param options table? A table with options and other necessary data for the algorithm, as detailed below. hmac (HMAC) key: a key to encode the input with. algorithm: a string which must be one of these: "md5", "sha1", "sha224", "sha256", "sha384", "sha512".
---@return string|nil Returns the hash of the entire file on success, and nil on failure.
---@markup { MTA:SA Shared }
function fileGetHash(theFile, algorithm, options) end

---This function retrieves the path of the given file.
---@param theFile file The file you want to get the path.
---@return string|false Returns a string representing the file path, false if invalid file was provided.
---@markup { MTA:SA Shared }
function fileGetPath(theFile) end

---Returns the current read/write position in the given file.
---@param theFile file The file handle you wish to get the position of.
---@return integer|false Returns the file position if successful, or false if an error occured (e.g. an invalid handle was passed).
---@markup { MTA:SA Shared }
function fileGetPos(theFile) end

---Returns the total size in bytes of the given file.
---@param theFile file The file handle you wish to get the size of.
---@return integer|false Returns the file size if successful, or false if an error occured (e.g. an invalid file handle was passed).
---@markup { MTA:SA Shared }
function fileGetSize(theFile) end

---Checks if the file position is at the end of the file.
---@param theFile file A handle to the file you wish to check.
---@return boolean Returns true if the file position of the specified file is at the end of the file, false otherwise.
---@markup { MTA:SA Shared }
function fileIsEOF(theFile) end

---Opens an existing file for reading and writing.
---@param filePath string The Filepath of the file in the following format: `:resourceName/path`. `resourceName` is the name of the resource the file is in, and 'path' is the path from the root directory of the resource to the file. For example, if there is a file named `coolObjects.txt` in the resource `objectSearch`, it can be opened from another resource this way: `fileOpen(":objectSearch/coolObjects.txt")`. If the file is in the current resource, only the file path is necessary, e.g. `fileOpen("coolObjects.txt")`.
---@param readOnly boolean? By default, the file is opened with reading and writing access. You can specify true for this parameter if you only need reading access.
---@return file|false If successful, returns a file handle for the file. Otherwise returns false (f.e. if the file doesn't exist).
---@markup { MTA:SA Shared }
function fileOpen(filePath, readOnly) end

---Reads the specified number of bytes from the given file starting at its current read/write position, and returns them as a string.
---@param theFile file A handle to the file you wish to read from. Use fileOpen to obtain this handle.
---@param count integer The number of bytes you wish to read.
---@return string|false Returns the bytes that were read in a string. Note that this string might not contain as many bytes as you specified if an error occured, i.e. end of file.
---@markup { MTA:SA Shared/Client }
function fileRead(theFile, count) end

---Renames the specified file.
---@param filePath string The filepath of the source file in the following format: `:resourceName/path`. `resourceName` is the name of the resource the file is in, and 'path' is the path from the root directory of the resource to the file. If the file is in the current resource, only the file path is necessary.
---@param newFilePath string Destination Filepath for the specified source file in the same format.
---@return boolean If successful, returns true. Otherwise returns false.
---@markup { MTA:SA Shared }
function fileRename(filePath, newFilePath) end

---Sets the current read/write position in the file.
---@param theFile file The file handle of which you want to change the read/write position.
---@param offset integer The new position. This is the number of bytes from the beginning of the file. If this value is larger than the file size, it is limited to `52,428,800` bytes (50 MB).
---@return integer|false Returns where the offset was actually set at. I.e. if offset was past the end of the file, it will be set at the end of the file, and this position will be returned. Returns false in case of failure (e.g. the specified file handle is invalid).
---@markup { MTA:SA Shared }
function fileSetPos(theFile, offset) end

---Writes one or more strings to a given file, starting at the current read/write position. Advances the position over the number of bytes that were written.
---@param theFile file A handle to the file you wish to write to. The file must have been opened with write access, i.e. the file handle must be a result of fileCreate or fileOpen with the readonly parameter set to false.
---@param string1 string The string to write.
---@param string2 string? You can provide any number of additional strings to write after string1. These will be written in the order in which they are specified.
---@return integer|false Returns the number of bytes successfully written to the file, returns false if invalid arguments were specified.
---@markup { MTA:SA Shared }
function fileWrite(theFile, string1, string2) end

-- Fire

---Creates a patch of fire that will spread a bit and die out after a while. Because it's a client side only function, other players won't see it, so custom events or custom objects will be needed to make a fire visible to some players.
---@param x number The X coordinate when the initial patch of fire will be created.
---@param y number The Y coordinate when the initial patch of fire will be created.
---@param z number The Z coordinate when the initial patch of fire will be created.
---@param size number? A float value indicating the size of the initial patch of fire, this value also affects the duration of how long the fire remains.
---@return boolean Returns true if successful, false if bad arguments were passed or the limit of active fires was reached. There can be a maximum of 60 active fires.
---@markup { MTA:SA Client }
function createFire(x, y, z, size) end

---This function is used to extinguish all spreading fire, or spreading fire at specified coordinates.
---@param x number? The X coordinate at which any fire will be extinguished.
---@param y number? The Y coordinate at which any fire will be extinguished.
---@param z number? The Z coordinate at which any fire will be extinguished.
---@param radius number? A float value indicating the radius in which to extinguish fire.
---@return boolean Always returns true.
---@markup { MTA:SA Client }
function extinguishFire(x, y, z, radius) end

-- GUI

---Gets the current maximum amount of characters that can be input via chatbox
---@return integer Returns a number between 0-255, representing the chatbox input character limit
---@markup { MTA:SA Shared }
function getChatboxCharacterLimit() end

---Returns information about how the chatbox looks.
---@param CVar string the name of the property you want returned. Can be the following values: chatfont - Returns the chatbox font chatlines - Returns how many lines the chatbox has chatcolor - Returns the background color of the chatbox chattextcolor - Returns the chatbox text color chatinputcolor - Returns the background color of the chatbox input chatinputprefixcolor - Returns the color of the input prefix text chatinputtextcolor - Returns the color of the text in the chatbox input chatscale - Returns the scale of the text in the chatbox chatpositionoffsetx - Returns the x position offset setting chatpositionoffsety - Returns the y position offset setting chatpositionhorizontal - Returns the horizontal alignment setting chatpositionvertical - Returns the vertical alignment setting chattextalignment - Returns the text alignment setting chatwidth - Returns the scale of the background width chatcssstyletext - Returns whether text fades out over time chatcssstylebackground - Returns whether the background fades out over time chatlinelife - Returns how long it takes for text to start fading out chatlinefadeout - Returns how long takes for text to fade out chatusecegui - Returns whether CEGUI is used to render the chatbox textscale - Returns text scale chattext_outline - Returns whether text black/white outline is used
---@return boolean|integer|table This code makes the chatbox empty when you type /clear
---@markup { MTA:SA Shared }
function getChatboxLayout(CVar) end

---This function defocuses a focused GUI element. Used primarily for edit fields and memos.
---@param guiElement element the GUI element that you want to defocus
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function guiBlur(guiElement) end

---This function brings a GUI element on top of others.
---@param guiElement element the GUI element that you want to move to the front.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function guiBringToFront(guiElement) end

---This function gets a checkbox's selection state.
---@param theCheckbox element MISSINGPARAMDESC
---@return boolean Returns true if the checkbox is selected, false if it is not.
---@markup { MTA:SA Shared }
function guiCheckBoxGetSelected(theCheckbox) end

---This function selects (ticks) or unselects a checkbox.
---@param theCheckbox element The GUI element in which you wish to change the selection state of
---@param state boolean The state of the checkbox, where true indicates selected, and false indicates unselected.
---@return boolean Returns true if the checkbox's selection state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiCheckBoxSetSelected(theCheckbox, state) end

---Adds an item to a combobox.
---@param comboBox element The combobox you want to add a row to
---@param value string The text that the item will contain.
---@return integer Returns the item ID if it has been created, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxAddItem(comboBox, value) end

---This function removes all the items from a combobox.
---@param comboBox element The combobox element to be cleared
---@return boolean Returns true if the combobox element is valid and has been cleared successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxClear(comboBox) end

---This function returns the number of items in a combo box.
---@param comboBox element The combo box to get the number of items from.
---@return integer Returns the number of items if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxGetItemCount(comboBox) end

---This function retrieves the text from a specific combobox item.
---@param comboBox element The combobox containing the item you're interested in
---@param itemId integer The index of the item
---@return string Returns the text of the item if the arguments are right, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxGetItemText(comboBox, itemId) end

---This function returns the index of the selected combobox item.
---@param comboBox element the combobox you want to know the selected item index of
---@return integer Returns the index of the selected item if the specified combobox is valid and has a selected item, -1 if no item is selected, nil otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxGetSelected(comboBox) end

---This function returns the state of combobox.
---@param comboBox element The combo box to get the state.
---@return boolean Returns true if combobox is opened, false if combobox is closed, nil otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxIsOpen(comboBox) end

---This function removes an item from a combobox.
---@param comboBox element The combobox containing the item you're interested in
---@param itemId integer The index of the item to remove
---@return boolean Returns true if the item was removes successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxRemoveItem(comboBox, itemId) end

---This function changes the text of a combobox item.
---@param comboBox element The combobox containing the item you're interested in
---@param itemId integer The index of the item
---@param text string The text you want to put in (does NOT accept numbers, use tostring() for that)
---@return boolean Returns true if the text was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxSetItemText(comboBox, itemId, text) end

---This function set combo box state as open or close.
---@param comboBox element The combobox to be opened or closed.
---@param state boolean The state of combobox. true, if the combobox is to be opened. false if the combobox is to be closed.
---@return boolean Returns true if is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxSetOpen(comboBox, state) end

---This function sets the selected item from a combobox.
---@param comboBox element the combobox you want to select an item from
---@param itemIndex integer the item you want to select (item 0 is the first item). If -1 is specified, then the combo box text is set to it's caption .
---@return boolean Returns true if the selected item has been changed successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiComboBoxSetSelected(comboBox, itemIndex) end

---This function creates a new CEGUI web browser element.    The difference between this and createBrowser is that this function handles inputs internally, and it can be attached to GUI windows. So the createBrowser function is more suitable for custom dx based interfaces, while this one is favorable for CEGUI all\-in\-all integration. You can learn more about the differences \[here].
---@param x number A float of the 2D x position of the browser on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the browser on a player's screen. This is affected by the relative argument.
---@param width number The browser's native width. This should be greater than or equal to 1.
---@param height number The browser's native height. This should be greater than or equal to 1.
---@param isLocal boolean Sets whether the browser can only show local content or content from the internet (see examples over here for more information)
---@param isTransparent boolean true if you want the browser to support transparency, false otherwise
---@param isRelative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes/positions as a fraction of the screen size. If false , then the size and co-ordinates are based on client's resolution, accessible using guiGetScreenSize .
---@param parent gui-element? This is the parent that the radio button is attached to. If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return gui-browser Returns a gui-browser element if it was created successfully, false otherwise. Returns also false , if the user disabled remote pages and isLocal was set to false .
---@markup { MTA:SA Shared }
function guiCreateBrowser(x, y, width, height, isLocal, isTransparent, isRelative, parent) end

---This function allows creation of a GUI Button, which is a clickable item as part of GUI.
---@param x number A float of the 2D x position of the GUI button on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI button on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI button. This is affected by the relative argument.
---@param height number A float of the height of the GUI button. This is affected by the relative argument.
---@param text string A string of the text that will be displayed as a label on the button.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x, y, width and height floats must be between 0 and 1, representing sizes relative to the parent.
---@param parent gui-element? This is the parent that the gui button is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns an element of the created button if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateButton(x, y, width, height, text, relative, parent) end

---This function creates a checkbox.
---@param x number A float of the 2D x position of the checkbox on a player's screen. This is affected by the relative argument.
---@param y number A float of the 2D y position of the checkbox on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the text field next to the checkbox. This is affected by the relative argument.
---@param height number A float of the height of the text field next to the checkbox. This is affected by the relative argument.
---@param text string The text to be displayed next to the checkbox.
---@param selected boolean A boolean representing whether the checkbox created should be selected by default.
---@param relative boolean? This is whether sizes and positioning are relative. If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the checkbox is attached to. If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns element of the checkbox if it was created succesfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateCheckBox(x, y, width, height, text, selected, relative, parent) end

---This function creates a combobox GUI element, which you can compare to a gridlist with a dropdown feature.
---@param x number A float of the 2D x position of the GUI combobox on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI combobox on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI combobox. This is affected by the relative argument.
---@param height number A float of the height of the GUI combobox. This is affected by the relative argument. Note: height must be enough to fit the drop down menu, else the drop down won't appear.
---@param caption string A string for what the title of your combobox will be. This will be shown if no item is selected.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes relative to the parent.
---@param parent gui-element? This is the parent that the GUI combobox is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns an element of the created combobox if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateComboBox(x, y, width, height, caption, relative, parent) end

---This function is for creating a new GUI edit box. This is a text box in which the user can input text. Edit boxes only allow a single line of text. If you want to allow multiple lines of text create a memo box using guiCreateMemo.
---@param x number A float of the 2D x position of the GUI edit box on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI edit box on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI edit box. This is affected by the relative argument.
---@param height number A float of the height of the GUI edit box. This is affected by the relative argument.
---@param text string A string of the text that will be displayed by default in the edit box.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the GUI edit box is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns a gui-edit element of the created edit box if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateEdit(x, y, width, height, text, relative, parent) end

---This function creates a GUI font element that can be used in guiSetFont. Successful font creation is not guaranteed, and may fail due to hardware or memory limitations.
---@param filepath string the name of the file containing the font.
---@param size integer? size of the font.
---@return element Returns a GUI font element if successful, false if invalid arguments were passed to the function, or there is insufficient resources available.
---@markup { MTA:SA Shared }
function guiCreateFont(filepath, size) end

---This function creates a grid list GUI element. These are menu's which are designed in lists and can have multiple columns. A good example of a gridlist element can be found in MTA's settings box, under Controls.
---@param x number A float of the 2D x position of the GUI gridlist on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI gridlist on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI gridlist. This is affected by the relative argument.
---@param height number A float of the height of the GUI gridlist. This is affected by the relative argument.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes relative to the parent.
---@param parent gui-element? This is the parent that the gui gridlist is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns an element of the created gridlist if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateGridList(x, y, width, height, relative, parent) end

---This function is for creating a new GUI label. A label is simply a piece of text that cannot be edited by the user. If you would like to have a bigger text you'd have to change its font because font size is not supported.
---@param x number A float of the 2D x position of the GUI label on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI label on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI label. This is affected by the relative argument.
---@param height number A float of the height of the GUI label. This is affected by the relative argument.
---@param text string A string of the text that will be displayed by the label.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes relative to the parent.
---@param parent gui-element? This is the parent that the gui label is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns an element of the created label if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateLabel(x, y, width, height, text, relative, parent) end

---This function creates a new GUI memo. This is a multiline edit box in which the user can input text.
---@param x number A float of the 2D x position of the GUI memo on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI memo on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI memo. This is affected by the relative argument.
---@param height number A float of the height of the GUI memo. This is affected by the relative argument.
---@param text string A string of the text that will be displayed by default in the memo.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the GUI memo is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return gui-memo Returns a gui-memo element of the created memo if it was successfully created, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateMemo(x, y, width, height, text, relative, parent) end

---This function creates a progress bar.
---@param x number A float of the 2D x position of the progress bar on a player's screen. This is affected by the relative argument.
---@param y number A float of the 2D y position of the progress bar on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the progress bar. This is affected by the relative argument.
---@param height number A float of the height of the progress bar. This is affected by the relative argument.
---@param relative boolean? This is whether sizes and positioning are relative. If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the progress bar is attached to. If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns element of the progress bar if it was created succesfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateProgressBar(x, y, width, height, relative, parent) end

---This function creates a radio button.
---@param x number A float of the 2D x position of the radio button on a player's screen. This is affected by the relative argument.
---@param y number A float of the 2D y position of the radio button on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the text field next to the radio button. This is affected by the relative argument.
---@param height number A float of the height of the text field next to the radio button. This is affected by the relative argument.
---@param text string The text to be displayed next to the radio button.
---@param relative boolean? This is whether sizes and positioning are relative. If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the radio button is attached to. If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns element of the radio button if it was created succesfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateRadioButton(x, y, width, height, text, relative, parent) end

---This function creates a GUI scrollbar. You can use the functions guiScrollBarSetScrollPosition and guiScrollBarGetScrollPosition to read and modify the scrollbar's scroll.
---@param x number the 2D x offset of the GUI scrollbar from its parent.  This is affected by the relative argument.
---@param y number the 2D y offset of the GUI scrollbar from its parent. This is affected by the relative argument.
---@param width number the width of the GUI scrollbar. This is affected by the relative argument.
---@param height number the height of the GUI scrollbar. This is affected by the relative argument.
---@param horizontal boolean whether this scrollbar is horizontal ( true ) or vertical ( false ).
---@param relative boolean? whether sizes and positions are relative to their parent's.  If this is true , then all measures must be between 0 and 1, representing sizes/positions as a fraction of the parent widget's size.
---@param parent gui-element? the gui-element this scrollbar is attached to. By default, it is nil, meaning the widget is attached to the background.
---@return gui-scrollbar Returns a gui-scrollbar if it was created successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateScrollBar(x, y, width, height, horizontal, relative, parent) end

---This creates a GUI scroll pane.
---@param x number the 2D x offset of the GUI scrollpane from its parent. This is affected by the relative argument.
---@param y number the 2D y offset of the GUI scrollpane from its parent. This is affected by the relative argument.
---@param width number the width of the GUI scrollpane. This is affected by the relative argument.
---@param height number the height of the GUI scrollpane. This is affected by the relative argument.
---@param relative boolean? whether sizes and positions are relative to their parent's. If this is true, then all measures must be between 0 and 1, representing sizes/positions as a fraction of the parent widget's size.
---@param parent gui-element? the gui-element this scrollpane is attached to. By default, it is nil, meaning the widget is attached to the background.
---@return element The gui-element if created, otherwise false.
---@markup { MTA:SA Shared }
function guiCreateScrollPane(x, y, width, height, relative, parent) end

---This function creates a static image using a .png image in the resource.
---@param x number A float of the 2D x position of the image on a player's screen. This is affected by the relative argument.
---@param y number A float of the 2D y position of the image on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the image. This is affected by the relative argument.
---@param height number A float of the height of the image. This is affected by the relative argument.
---@param path string The filepath of the image file that is being loaded.
---@param relative boolean? This is whether sizes and positioning are relative. If this is true , then all x,y,width,height floats must be between 0 and 1, representing measures relative to the parent.
---@param parent gui-element? This is the parent that the image is attached to. If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns element if image was created successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateStaticImage(x, y, width, height, path, relative, parent) end

---This function creates a tab on a pre\-existing tab panel. A tab is a button as well as a 'dimension' that can be used to switch between information by clicking on the tabs. Tabs are sorted on a tab panel in the order that they are created.
---@param text string The caption for the tab
---@param parent gui-element The parent tab panel, as a tab panel element type
---@return element Returns a tab element if successful, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateTab(text, parent) end

---This function creates a Tab Panel, which acts as a template to create Tabs upon.
---@param x number A float of the 2D x position of the GUI tab panel on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI tab panel on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI tab panel. This is affected by the relative argument.
---@param height number A float of the height of the GUI tab panel. This is affected by the relative argument.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes relative to the parent.
---@param parent gui-element? This is the parent that the tab panel is attached to.  If the relative argument is true, sizes and positioning will be made relative to this parent. If the relative argument is false, positioning will be the number of offset pixels from the parent's origin. If no parent is passed, the parent will become the screen - causing positioning and sizing according to screen positioning.
---@return element Returns a GUI tab panel element if successful, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateTabPanel(x, y, width, height, relative, parent) end

---This function is for creating a new GUI window. This provides a base for other gui elements to be created within. However, windows do not have a parent and cannot be created in any GUI elements.
---@param x number A float of the 2D x position of the GUI window on a player's screen.  This is affected by the relative argument.
---@param y number A float of the 2D y position of the GUI window on a player's screen. This is affected by the relative argument.
---@param width number A float of the width of the GUI window. This is affected by the relative argument.
---@param height number A float of the height of the GUI window. This is affected by the relative argument.
---@param titleBarText string A string of the text that will be displayed in the title bar of the window.
---@param relative boolean? This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes/positions as a fraction of the screen size. If false , then the size and co-ordinates are based on client's resolution, accessible using guiGetScreenSize .
---@return element Returns a gui window element if it was created successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiCreateWindow(x, y, width, height, titleBarText, relative) end

---This function deletes a tab from a tab panel.
---@param tabToDelete element This is an element representing the tab that you want to delete.
---@param tabPanel element This is the tab panel parent that the tab is attached to.
---@return boolean Returns true the tab was successfully deleted, false otherwise.
---@markup { MTA:SA Shared }
function guiDeleteTab(tabToDelete, tabPanel) end

---This function returns the caret (the text cursor) position within the editbox.
---@param theElement element The edit box you want to get the caret position from
---@return integer Returns the caret index on success, false otherwise.
---@markup { MTA:SA Shared }
function guiEditGetCaretIndex(theElement) end

---This function returns the maximum text length that can be typed within an edit box.
---@param guiEdit gui-edit The edit box you want to get the maximum text length of.
---@return integer Returns the maximum text length on success, false otherwise.
---@markup { MTA:SA Shared }
function guiEditGetMaxLength(guiEdit) end

---This function checks if an edit box is masked.
---@param guiEdit gui-edit the edit box to check masked flag of.
---@return boolean Returns true if the edit box is masked, false if not, nil if an invalid edit box was provided.
---@markup { MTA:SA Shared }
function guiEditIsMasked(guiEdit) end

---This function checks if an edit box is read\-only.
---@param guiEdit gui-edit The edit box to check read-only status of.
---@return boolean Returns true if the edit box is read-only, false if not, nil if an invalid edit box was provided.
---@markup { MTA:SA Shared }
function guiEditIsReadOnly(guiEdit) end

---This function sets the current position of the caret (the text cursor) within the edit box.
---@param theElement element The edit box to be changed.
---@param index integer An integer referring to the desired position within the box.
---@return boolean Returns true if the index was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiEditSetCaretIndex(theElement, index) end

---This function sets or removes masking (covering up the text being typed) for password text fields.
---@param theElement element The edit box to be changed.
---@param status boolean A boolean value indicating whether masking is to be enabled or disabled.
---@return boolean Returns true if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiEditSetMasked(theElement, status) end

---This function sets the maximum text length that can be typed into an edit box.
---@param guiEdit element MISSINGPARAMDESC
---@param length integer An integer indicating the maximum number of characters that can be typed into the box.
---@return boolean Returns true if the max length was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiEditSetMaxLength(guiEdit, length) end

---This function allows you to set or remove read\-only status for an edit box. If read\-only is set to true, the box is not editable.
---@param editField element The element of the edit field to be modified.
---@param status boolean A boolean value indicating whether read-only is to be enabled or disabled.
---@return boolean Returns true if edit field's read-only status was changed successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiEditSetReadOnly(editField, status) end

---This function focuses a defocused GUI element. Used primarily for edit fields and memos.
---@param guiElement element the GUI element that you want to focus
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function guiFocus(guiElement) end

---Alpha represents the transparency of a gui element. This function allows retrieval of a gui element's current alpha.
---@param guiElement element The gui element in which you want to retrieve the alpha of.
---@return number This function returns a positive integer in between 0 and 1 of the gui element's current alpha, or false if it could not be retrieved.
---@markup { MTA:SA Shared }
function guiGetAlpha(guiElement) end

---This function gets the browser element behind a gui\-browser (a browser that has been created via guiCreateBrowser).
---@param theBrowser gui-browser The gui-browser
---@return browser Returns the Browser element if a correct gui-browser has been passed, false otherwise.
---@markup { MTA:SA Shared }
function guiGetBrowser(theBrowser) end

---This function is used to get the type of the current cursor image.
---@return string Returns a string containing the cursor type:
---@markup { MTA:SA Shared }
function guiGetCursorType() end

---This function determines if a GUI element is enabled.
---@param guiElement element the GUI element to be checked.
---@return boolean Returns true if the element is enabled, false otherwise.
---@markup { MTA:SA Shared }
function guiGetEnabled(guiElement) end

---This function is used to get the current font that is used to draw text in GUI elements.
---@param guiElement element element you wish to get the font of.
---@return string | element This example sets and gets the font of a pre-made gui element and outputs it to chat box.
---@markup { MTA:SA Shared }
function guiGetFont(guiElement) end

---This function checks whether user input is focused on the GUI or the game.
---@return boolean Returns true if input is focused on GUI, false if it's focused on the game.
---@markup { MTA:SA Shared }
function guiGetInputEnabled() end

---This function returns the current input mode as set by guiSetInputMode. Default mode is "allow\_binds".
---@return string Returns a string defining the current input mode, potential values are:
---@markup { MTA:SA Shared }
function guiGetInputMode() end

---This function allows retrieval of a GUI element's current position, relative to its parent.
---@param guiElement element The gui element of which you wish to retrieve the position.
---@param relative boolean A boolean representing whether the position should be relative to the element's parent width, or the number of offset pixels from the parent's origin.
---@return number | number Returns floats representing the x and y position of the element, or false if the position could not be retrieved.
---@markup { MTA:SA Shared }
function guiGetPosition(guiElement, relative) end

---This function gets a list of the CEGUI property names and values of a GUI element. To find out what the different properties mean, check out the CEGUI properties page.
---@param guiElement element the GUI element you wish to get the properties of.
---@return table If the function succeeds, the return value is a table. Its keys are property names, the corresponding values are the values of the properties (both names and values are always strings). If the function fails, it returns false .
---@markup { MTA:SA Shared }
function guiGetProperties(guiElement) end

---This function gets the value of a specific CEGUI property of a GUI element. For a list of properties and their meaning, see the CEGUI properties page.
---@param guiElement element the GUI element you wish to get a property of.
---@param property string the name of of property you want the value of.
---@return string If the function succeeds, it returns a string with the value of the property. If it fails, it returns false .
---@markup { MTA:SA Shared }
function guiGetProperty(guiElement, property) end

---This function retrieves the local screen size according to the resolution they are using.
---@return float float This returns two floats representing the player's screen resolution, width and height .
---@markup { MTA:SA Shared }
function guiGetScreenSize() end

---This function returns the currently selected tab in the specified tab panel.
---@param tabPanel element The tab panel which current tab you want to retrieve.
---@return element Returns an element of the tab if a tab was selected or nil if no tab was selected. If passed arguments were invalid or something went wrong, the function will return false .
---@markup { MTA:SA Shared }
function guiGetSelectedTab(tabPanel) end

---This function gets the size of a GUI element.
---@param theElement element The GUI element to get size of.
---@param relative boolean A boolean representing whether the size should be relative to the element's parent width, or an absolute size in pixels.
---@return float float Returns the GUI element size x and y if the function has been successful, false otherwise.
---@markup { MTA:SA Shared }
function guiGetSize(theElement, relative) end

---This function is used to get the text of GUI elements like edit boxes, labels, buttons etc.
---@param guiElement element element you wish to get text of.
---@return string Returns a string containing the requested element's text, or false if the gui element passed to the function is invalid.
---@markup { MTA:SA Shared }
function guiGetText(guiElement) end

---This function determines if a GUI element is visible.
---@param guiElement element the GUI element to be checked
---@return boolean Returns true if the element is visible, false otherwise.
---@markup { MTA:SA Shared }
function guiGetVisible(guiElement) end

---This function is used to create columns in grid lists.
---@param gridList element The grid list you want to add a column to
---@param title string Title of the column
---@param width number Column width, relative to the grid list width
---@return integer Returns the column id if it was created, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListAddColumn(gridList, title, width) end

---Adds a row to a grid list, and optionally add simple text items with your rows. Use guiGridListSetItemText to add row headers.
---@param gridList element The grid list you want to add a row to
---@param itemText1 int/string The text for the first column item in the row.  Either a string or a number can be passed (use numbers for sorting purposes).
---@param itemText2 int/string The text for the second column item in the row.  Either a string or a number can be passed (use numbers for sorting purposes).
---@param ... unknown Item text for any other columns
---@return integer Returns the row id if it has been created, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListAddRow(gridList, itemText1, itemText2, ...) end

---This allows you to automatically size a column to display everything in it correctly, with the most minimal width.
---@param gridList element The grid list element where the column is located.
---@param columnIndex integer The ID of the column you want to be auto-sized.
---@return boolean Returns true if the column was auto-sized, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListAutoSizeColumn(gridList, columnIndex) end

---This function clears all the data from a grid list.
---@param gridList element The grid list element to be cleared
---@return boolean Returns true if the grid list element is valid and has been cleared successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListClear(gridList) end

---This allows you to get the count of existing columns in a gridlist.
---@param gridList element The grid list you want to add a column to
---@return integer Returns an integer with the amount of columns in the gridlist, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetColumnCount(gridList) end

---This function is used to get the column title of a gridlist column.
---@param guiGridlist element The grid list you want to get the column title from
---@param columnIndex integer Column ID
---@return string Returns a string containing the column title, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetColumnTitle(guiGridlist, columnIndex) end

---This allows you to get the width of an existing column in a gridlist.
---@param gridList element The grid list you want to add a column to
---@param columnIndex integer Column ID of the Get size
---@param relative boolean A boolean defining whether width measurements will be relative to the Gridlist size, or absolute pixels.
---@return number Returns the width of the gridlist column, false if bad arguments were given.
---@markup { MTA:SA Shared }
function guiGridListGetColumnWidth(gridList, columnIndex, relative) end

---This function is used to get the horizontal scroll position from a grid list
---@param guiGridlist element The grid list you want to get the horizontal scroll position from
---@return number Returns a integer between 0 and 100 indicating the horizontal scroll position, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetHorizontalScrollPosition(guiGridlist) end

---This function gets the color of a gridlist item.
---@param gridList element The grid list element
---@param rowIndex integer Row ID
---@param columnIndex integer Column ID
---@return int int int int Returns four int values, representing the amount of red, green, blue and alpha if successful. false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetItemColor(gridList, rowIndex, columnIndex) end

---With this function you can retrieve the string data associated with an item in a grid list. This is not the text that is displayed on the item, but an internal string that you can use to hold extra information about the item.   Note: This function will only work after you set the item's text using guiGridListSetItemText!
---@param gridList element the grid list containing the item you're interested in
---@param rowIndex integer the row index of the item
---@param columnIndex integer the column index of the item
---@return var Returns the item data of the specified item if succesful, false if one of the arguments was invalid.
---@markup { MTA:SA Shared }
function guiGridListGetItemData(gridList, rowIndex, columnIndex) end

---This function retrieves the text from a specific grid list item.
---@param gridList element the gridlist containing the item you're interested in
---@param rowIndex integer row id of the item (first is 0)
---@param columnIndex integer column id of the item (first is 0)
---@return string Returns the text of the item if the arguments are right, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetItemText(gridList, rowIndex, columnIndex) end

---This function returns the number of rows in a grid list.
---@param gridList element The grid list to get the number of rows from.
---@return integer Returns the number of rows if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetRowCount(gridList) end

---This function returns the amount of options selected in the specified grid list.
---@param gridList element The grid list which amount of selected items you want to retrieve.
---@return integer Returns an integer representing the amount of selected options if everything was successful or false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function guiGridListGetSelectedCount(gridList) end

---This function returns the row and column indexes of the selected item in a grid list. First selected row and column is (0, 0\).
---@param gridList element the grid list you want to know the selected row index of
---@return integer | integer Returns the row and column indexes of the selected item if the specified grid list is valid and has a selected item, (-1, -1) if no item is selected, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetSelectedItem(gridList) end

---This function returns the items selected in the specified grid list.
---@param gridList element The grid list which selected items you want to retrieve.
---@return table Returns a table over the selected items in the grid list in this format:
---@markup { MTA:SA Shared }
function guiGridListGetSelectedItems(gridList) end

---This function retrieves the current selection mode of a gui gridlist.
---@param gridlist gui-element The gridlist you want to get the selection mode of.
---@return integer Returns the ID of the current gridlist's selection mode.
---@markup { MTA:SA Shared }
function guiGridListGetSelectionMode(gridlist) end

---This function is used to get the vertical scroll position from a grid list
---@param guiGridlist element The grid list you want to get the vertical scroll position from
---@return number Returns a integer between 0 and 100 indicating the vertical scroll position, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListGetVerticalScrollPosition(guiGridlist) end

---This allows you to insert a new row after a specified row, and simultaneously set text. Good for inserting new rows in the middle of existing rows. To insert at the top use \-1 as row index.
---@param gridList element The grid list you want to add a row to
---@param rowIndex integer Row ID of the row you want to insert the new row after.
---@return integer Returns row id if the row was successfully added, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListInsertRowAfter(gridList, rowIndex) end

---This function checks whether the gridlist sorting is enabled or disabled.
---@param guiGridlist element The GUI gridlist you wish to check if sorting is enabled or not.
---@return boolean Returns true if sorting is enabled, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListIsSortingEnabled(guiGridlist) end

---This allows you to delete columns that exist in grid lists.
---@param gridList element The grid list you want to remove a column from
---@param columnIndex integer Column ID
---@return boolean Returns true if the grid list column was successfully removed, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListRemoveColumn(gridList, columnIndex) end

---This allows you to delete rows that exist in grid lists.
---@param gridList element The grid list you want to remove a row from
---@param rowIndex integer The row ID which you want to remove
---@return boolean Returns true if the grid list row was successfully removed, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListRemoveRow(gridList, rowIndex) end

---This function is used to change the column title of a gridlist column.
---@param guiGridlist element The grid list you want to change the column title from
---@param columnIndex integer Column ID
---@param title string The title of the column
---@return boolean Returns true if the new title was set, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetColumnTitle(guiGridlist, columnIndex, title) end

---This allows you to set the width of an existing column in a gridlist.
---@param gridList element The grid list you want to add a column to
---@param columnIndex integer Column ID of the size you want to change
---@param width number A float or integer of the width of the column depending on the relative argument.
---@param relative boolean A boolean defining whether width measurements will be relative to the Gridlist size, or absolute pixels.
---@return boolean Returns true if the gridlist column width was successfully set, false if bad arguments were given.
---@markup { MTA:SA Shared }
function guiGridListSetColumnWidth(gridList, columnIndex, width, relative) end

---This function is used to set the horizontal scroll position from a grid list
---@param guiGridlist element The grid list you want to set the horizontal scroll position from
---@param fPosition number A float representing the horizontal scroll position (0-100)
---@return boolean Returns true if the horizontal scroll position was set, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetHorizontalScrollPosition(guiGridlist, fPosition) end

---This function changes the color of a gridlist item.
---@param gridList element The grid list element
---@param rowIndex integer Row ID
---@param columnIndex integer Column ID
---@param red integer The amount of red in the color (0-255)
---@param green integer The amount of green in the color (0-255)
---@param blue integer The amount of blue in the color (0-255)
---@param alpha integer? The amount of alpha in the color (0-255).
---@return boolean Returns true if the item color was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetItemColor(gridList, rowIndex, columnIndex, red, green, blue, alpha) end

---This function sets a Item Data associated to a grid list item.   Note: This function will only work after you set the item's text using guiGridListSetItemText!
---@param gridList element A gridlist element of the data you wish to set to
---@param rowIndex integer The row of the item you wish to set to
---@param columnIndex integer The column of the item you wish to set to
---@param data var The data you wish to set to the item.
---@return boolean Returns true if the data was set successfully, false otherwise
---@markup { MTA:SA Shared }
function guiGridListSetItemData(gridList, rowIndex, columnIndex, data) end

---This function changes the text of a gridlist item.
---@param gridList element The grid list element
---@param rowIndex integer Row ID
---@param columnIndex integer Column ID
---@param text string The text you want to put in (does NOT accept numbers, use tostring() for that)
---@param section boolean Determines if the item is a section
---@param number boolean Tells whether the text item is a number value or not (used for sorting)
---@return boolean Returns true if the item text was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetItemText(gridList, rowIndex, columnIndex, text, section, number) end

---This function allows a gridlist's scrollbar to be forced on, or returned to default.
---@param guiGridlist element The GUI gridlist you wish to change the state of scrollbars
---@param horizontalBar boolean A bool where true forces the horizontal scrollbar on, and false returns them to default.
---@param verticalBar boolean A bool where true forces the verical scrollbar on, and false returns them to default.
---@return boolean Returns true if the scrollbars were successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetScrollBars(guiGridlist, horizontalBar, verticalBar) end

---This function selects an item from a gridlist. If you wish to deselect whatever item is selected, pass 0 as both the rowIndex and columnIndex arguments.
---@param gridList element the grid list you want to select an item from
---@param rowIndex integer the row you want to select (index 0 is the first row)
---@param columnIndex integer the column you want to select (index 1 is the first column)
---@param bReset boolean? MISSINGPARAMDESC
---@return boolean Returns true if the passed arguments are correct and the item has been selected, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetSelectedItem(gridList, rowIndex, columnIndex, bReset) end

---This function sets the selection mode of a gui gridlist. For example, the MTA server browser selects a whole row, while the Controls dialog selects a single cell. To select multiple items you must be holding down 'ctrl'.
---@param gridlist gui-element The gridlist in which you wish to set the selection mode.
---@param mode integer The mode of the selection.  Can be the following values: 0: Single row selection 1: Multiple row selection 2: Single cell selection 3: Multiple cell selection 4: Nominated(First) single column selection 5: Nominated(First) multiple column selection 6: Single column selection 7: Multiple column selection 8: Nominated(First) single row selection 9: Nominated(First) multiple row selection
---@return boolean Returns true if the selection mode was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetSelectionMode(gridlist, mode) end

---This function allows the disabling or enabling of sorting within a gridlist. Sorting is achieved by clicking a column header. Gridlist items will be sorted according to the clicked column. By default, gridlists have sorting enabled. This function will allow you to toggle this.
---@param guiGridlist element The GUI gridlist you wish to toggle the sorting of.
---@param enabled boolean A boolean representing whether the sorting is enabled, or disabled.
---@return boolean Returns true if sorting was successfully toggled., false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetSortingEnabled(guiGridlist, enabled) end

---This function is used to set the vertical scroll position from a grid list
---@param guiGridlist element The grid list you want to set the vertical scroll position from
---@param fPosition number A float representing the vertical scroll position (0-100)
---@return boolean Returns true if the vertical scroll position was set, or false otherwise.
---@markup { MTA:SA Shared }
function guiGridListSetVerticalScrollPosition(guiGridlist, fPosition) end

---This function gets the color of a label.
---@param theLabel gui-element The label to get color.
---@return int int int Returns three int values, representing the amount of red, green, blue if successful. false otherwise.
---@markup { MTA:SA Shared }
function guiLabelGetColor(theLabel) end

---This function returns the height of the font currently used in a GUI text label.
---@param theLabel element The text label to get the font height from.
---@return number Returns the absolute height of the font currently used in the text label if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiLabelGetFontHeight(theLabel) end

---This function returns the extent, or width, of the current text inside a GUI text label.
---@param theLabel element The text label to get the text extent from.
---@return number Returns the absolute width of the current text inside the text label if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiLabelGetTextExtent(theLabel) end

---This function allows you to set the color of a GUI label.
---@param theElement element The label to be changed.
---@param red integer An integer specifying the amount of red (0 to 255).
---@param green integer An integer specifying the amount of green (0 to 255).
---@param blue integer An integer specifying the amount of blue (0 to 255).
---@return boolean Returns true if the the color of the gui label was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function guiLabelSetColor(theElement, red, green, blue) end

---This function sets the horizontal alignment of a text label.
---@param theLabel element The text label to set the horizontal alignment on.
---@param align string The alignment type. Valid type strings are: "left" "center" "right"
---@param wordwrap boolean? Whether or not to enable wordwrap for the gui-label.
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function guiLabelSetHorizontalAlign(theLabel, align, wordwrap) end

---This function sets the vertical alignment of a text label.
---@param theLabel element The text label to set the vertical alignment on.
---@param align string The alignment type. Valid type strings are: "top" "center" "bottom"
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function guiLabelSetVerticalAlign(theLabel, align) end

---This function returns the caret (the text cursor) position within the memo box.
---@param theElement element The memo box you want to get the caret position from
---@return integer Returns the caret index on success, false otherwise.
---@markup { MTA:SA Shared }
function guiMemoGetCaretIndex(theElement) end

---This function is used to get the vertical scroll position of a memo as a percentage.
---@param theMemo gui-memo the memo you want to know the vertical scroll position of.
---@return number Returns a float ranging between 0 and 100, or false otherwise.
---@markup { MTA:SA Shared }
function guiMemoGetVerticalScrollPosition(theMemo) end

---This function checking if memo is read only or no.
---@param theMemo gui-memo The memo to check read-only status of.
---@return boolean Returns true if the memo is read only, false if the memo isn't read only, nil otherwise.
---@markup { MTA:SA Shared }
function guiMemoIsReadOnly(theMemo) end

---This function sets the current position of the caret (the text cursor) within the memo.
---@param theMemo gui-memo The memo edit box where the caret position is to be changed.
---@param index integer An integer referring to the desired character position within the box. 0 would be before the first character in the box, 1 before the second, etc.
---@return boolean Returns true if the caret was successfully moved, false otherwise.
---@markup { MTA:SA Shared }
function guiMemoSetCaretIndex(theMemo, index) end

---This function allows you to set or remove read\-only status for a GUI memo. If read\-only is set to true, the contents are not editable.
---@param theMemo gui-memo The memo to change read-only status of.
---@param status boolean A boolean value indicating whether read-only is to be enabled or disabled.
---@return boolean Returns true if the status was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function guiMemoSetReadOnly(theMemo, status) end

---This function is used to set the vertical scroll position of a memo as a percentage.
---@param theMemo gui-memo the memo you want to change the vertical scroll position of.
---@param position number a float ranging between 0 and 100.
---@return boolean Returns true if the position was set, false otherwise.
---@markup { MTA:SA Shared }
function guiMemoSetVerticalScrollPosition(theMemo, position) end

---This function moves a GUI element to the very back of all other GUI elements.
---@param guiElement element the GUI element that you want to move to the back
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function guiMoveToBack(guiElement) end

---This function gets the progress of a progress bar as a percentage.
---@param theProgressbar progressBar The progressbar you want to check.
---@return number Returns a float ranging between 0 and 100.
---@markup { MTA:SA Shared }
function guiProgressBarGetProgress(theProgressbar) end

---This function is used to set the progress of a progressbar as a percentage.
---@param theProgressbar progressBar The progressbar you want to change the progress of
---@param progress number a float ranging from 0 - 100
---@return boolean Returns true if the progress was set, false otherwise.
---@markup { MTA:SA Shared }
function guiProgressBarSetProgress(theProgressbar, progress) end

---This function gets a radio button's selection state.
---@param guiRadioButton element The radio button you wish to retrieve the selection state of.
---@return boolean Returns true if the radio button is selected, false if it is not.
---@markup { MTA:SA Shared }
function guiRadioButtonGetSelected(guiRadioButton) end

---This function selects or unselects a radio button.
---@param guiRadioButton element The GUI radio button in which you wish to change the selection state of
---@param state boolean The state of the radio button, where true indicates selected, and false indicates unselected.
---@return boolean Returns true if the radio button's selection state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiRadioButtonSetSelected(guiRadioButton, state) end

---This function gets the scroll amount of a scrollbar as a percentage.
---@param theScrollBar gui-scrollBar The scrollbar you want to check.
---@return number Returns a float ranging between 0 and 100, representing the amount the scrollbar has been scrolled.
---@markup { MTA:SA Shared }
function guiScrollBarGetScrollPosition(theScrollBar) end

---This function is used to set the scroll amount of a scrollbar as a percentage.
---@param theScrollBar gui-scrollBar The scrollbar you want to change the progress of
---@param amount number a float ranging from 0 - 100 representing the amount you wish to set the scroll bar.
---@return boolean Returns true if the scroll position was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiScrollBarSetScrollPosition(theScrollBar, amount) end

---This function is used to get the position of a horizontal scroll pane as a percentage.
---@param horizontalScrollPane element The scroll pane you want to know the position of
---@return number Returns a float ranging between 0 and 100, or false otherwise.
---@markup { MTA:SA Shared }
function guiScrollPaneGetHorizontalScrollPosition(horizontalScrollPane) end

---This function is used to get the position of a vertical scroll pane as a percentage.
---@param verticalScrollPane element The scroll pane you want to know the position of
---@return number Returns a float ranging between 0 and 100, or false otherwise.
---@markup { MTA:SA Shared }
function guiScrollPaneGetVerticalScrollPosition(verticalScrollPane) end

---This function is used to set the position of a horizontal scroll pane as a percentage.
---@param horizontalScrollPane element The scroll pane you want to change the position of
---@param position number a float ranging from 0 - 100
---@return boolean Returns true if the position was set, false otherwise.
---@markup { MTA:SA Shared }
function guiScrollPaneSetHorizontalScrollPosition(horizontalScrollPane, position) end

---This function allows a scrollpane's scrollbars to be forced on, or returned to default.
---@param scrollPane element the GUI scrollpane element you want to set the scrollbars of.
---@param horizontal boolean A bool where true forces the horizontal scrollbar on, and false returns them to default.
---@param vertical boolean A bool where true forces the vertical scrollbar on, and false returns them to default.
---@return boolean Returns true if the call was successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiScrollPaneSetScrollBars(scrollPane, horizontal, vertical) end

---This function is used to set the position of a vertical scroll pane as a percentage.
---@param verticalScrollPane element The scroll pane you want to change the position of
---@param position number a float ranging from 0 - 100
---@return boolean Returns true if the position was set, false otherwise.
---@markup { MTA:SA Shared }
function guiScrollPaneSetVerticalScrollPosition(verticalScrollPane, position) end

---This changes the alpha level (the visibleness/transparency) of a GUI element
---@param guielement element MISSINGPARAMDESC
---@param alpha number The visibility/transparency of the GUI element. Ranges from 0 (fully transparent) to 1 (fully opaque). Default value is 0.80.
---@return boolean Returns true if the gui element's alpha was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function guiSetAlpha(guielement, alpha) end

---This function enables/disables a GUI element. A disabled GUI element can't be used, gets a gray aspect and doesn't receive any events.
---@param guiElement element the GUI element you wish to enable or disable
---@param enabled boolean the new state
---@return boolean If the function succeeds it returns true , if it fails it returns false .
---@markup { MTA:SA Shared }
function guiSetEnabled(guiElement, enabled) end

---This function sets the font of a GUI element to be used when drawing text.
---@param guiElement element The GUI element you wish to change the font of
---@param font mixed Either a custom GUI font element or the name of a built-in GUI font. See Standard GUI Font Names
---@return boolean Returns true if the font has been successfully set on the gui element, false otherwise.
---@markup { MTA:SA Shared }
function guiSetFont(guiElement, font) end

---This function enables or disables input focus for the GUI. This means that any keybinds or MTA binds are overidden so that text can be input into an editbox, for example. In other words, keys such as t and y which activate the chatbox are disabled.
---@param enabled boolean true if input should go to GUI, false if it should go to the game.
---@return boolean Returns true if input mode could be changed, false if invalid parameters are passed.
---@markup { MTA:SA Shared }
function guiSetInputEnabled(enabled) end

---This function controls the input mode to define whether or not (and when) keybinds or MTA binds are overridden (disabled) so that text can be input into an editbox, for example. Available input modes are:
---@param mode string a string representing the desired input mode. Accepted values are: "allowbinds": binds are enabled, hence using a key such as t in an editbox will still open the chatbox (default) "nobinds": binds are disabled, hence using a key such as t will never open the chatbox "nobindswhen_editing": binds are enabled except when an editbox or memo has input focus
---@return boolean Returns true if input mode could be changed, false if invalid parameters are passed.
---@markup { MTA:SA Shared }
function guiSetInputMode(mode) end

---This function sets the position of a GUI element.
---@param theElement element The GUI element to change position for
---@param x number Position over the X axis
---@param y number Position over the Y axis
---@param relative boolean Bool that indicates if the x/y positions are relative to the elements parent element.
---@return boolean Returns true if the position has been successfully set, false otherwise.
---@markup { MTA:SA Shared }
function guiSetPosition(theElement, x, y, relative) end

---This function sets the value of a specific CEGUI property of a GUI element. For a list of properties and their meaning, see the CEGUI properties page.
---@param guiElement element the GUI element you wish to get a property of.
---@param property string the name of of property you want the value of.
---@param value string the new value for the property.
---@return boolean If the function succeeds it returns true , if it fails it returns false .
---@markup { MTA:SA Shared }
function guiSetProperty(guiElement, property, value) end

---This function is used to change the currently selected tab in a tab panel.
---@param tabPanel element The tab panel which current tab you want to change.
---@param theTab element The tab which will be the new active tab.
---@return boolean Returns true if the selected tab was changed to a new one successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiSetSelectedTab(tabPanel, theTab) end

---This function sets the dimensions (size) of a GUI element. It refers to the bounding box size for GUI elements. It does not make GUI elements smaller or larger in appearance.
---@param guiElement element the GUI element whose visibility is to be changed
---@param width number The desired width setting for the gui element
---@param height number The desired height setting for the gui element
---@param relative boolean This is whether sizes and positioning are relative.  If this is true , then all x,y,width,height floats must be between 0 and 1, representing sizes relative to the parent.
---@return boolean Returns true if the gui element's size was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function guiSetSize(guiElement, width, height, relative) end

---This function sets the text of a GUI element.
---@param guiElement element The GUI element you wish to change the text of
---@param text string The new text
---@return boolean Returns true if text has been successfully set on the gui element, false otherwise.
---@markup { MTA:SA Shared }
function guiSetText(guiElement, text) end

---This function changes the visibility state of a GUI element.
---@param guiElement element the GUI element whose visibility is to be changed
---@param state boolean the new visibility state
---@return boolean Returns true if the element's visibility could be changed, false otherwise.
---@markup { MTA:SA Shared }
function guiSetVisible(guiElement, state) end

---This function gets the native size of image. That means the original size in pixels of the image file.
---@param theImage element The static image element to get the original size of.
---@return integer | integer Returns two integers where first is the width and second the height of the image in pixels, false if the image element was invalid.
---@markup { MTA:SA Shared }
function guiStaticImageGetNativeSize(theImage) end

---This function allows you to change the image in GUI static image element to another one. Tip: If you set other images as children you will have to use setElementCallPropagationEnabled to only affect the parent image.
---@param theElement element The static image element to be changed.
---@param filename string A string specifying the filepath of the image file being loaded in current resource.
---@return boolean Returns true if the the image in the static image element was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function guiStaticImageLoadImage(theElement, filename) end

---This function checks if a GUI window is movable.
---@param guiWindow gui-window the window to check the movable flag of
---@return boolean Returns true if the window is movable, false if not, nil if an invalid window was provided.
---@markup { MTA:SA Shared }
function guiWindowIsMovable(guiWindow) end

---This function checks if a GUI window is sizable.
---@param guiWindow gui-window the window to check the sizable flag of
---@return boolean Returns true if the window is sizable, false if not, nil if an invalid window was provided.
---@markup { MTA:SA Shared }
function guiWindowIsSizable(guiWindow) end

---This function allows you to specify whether or not a user can move a GUI window.
---@param theElement element The window to be changed.
---@param status boolean A boolean value indicating whether the window is movable or not.
---@return boolean Returns true if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiWindowSetMovable(theElement, status) end

---This function enables or disables user resizing of a GUI window.
---@param theElement element The window to be changed.
---@param status boolean A boolean value indicating whether user resizing is to be enabled or disabled.
---@return boolean Returns true if the function is successful, false otherwise.
---@markup { MTA:SA Shared }
function guiWindowSetSizable(theElement, status) end

---This function returns whether the ingame chatbox is being used (accepting chatbox input) or not.
---@return boolean Returns true if the chatbox is receiving input, false if not active.
---@markup { MTA:SA Shared }
function isChatBoxInputActive() end

---This function returns whether the ingame console window is visible or not.
---@return boolean Returns true if the console is visible, false if not.
---@markup { MTA:SA Shared }
function isConsoleActive() end

---This function returns whether the ingame debug window is visible or not. This is the debugwindow visible using the "debugscript \" command.
---@return boolean Returns true if the debug view is visible, false if not.
---@markup { MTA:SA Shared }
function isDebugViewActive() end

---This function returns whether any system windows that take focus are active. This includes:
---@return boolean Returns true if the focus is on the MTA window, false if it isn't.
---@markup { MTA:SA Shared }
function isMTAWindowActive() end

---This function returns whether the user is in the mainmenu or not.
---@return boolean Returns true if the mainmenu is visible, false if not.
---@markup { MTA:SA Shared }
function isMainMenuActive() end

---This function returns whether the file downloading dialog box is active or not. This appears when a resource is started and the client doesn't have all the files that resource requires the client to have.
---@return boolean Returns true if the file transfer box is visible, false if not.
---@markup { MTA:SA Shared }
function isTransferBoxActive() end

---Sets the maximum amount of characters that can be input via chatbox
---@param charLimit integer an integer between 0-255. Passing -1 will reset the character limit (96)
---@return boolean Returns true if the character limit was set, false otherwise
---@markup { MTA:SA Shared }
function setChatboxCharacterLimit(charLimit) end

---This function enables or disables the debug window.
---@param enabled boolean true if debug window should be visible, false otherwise.
---@return boolean Returns true , false if invalid parameters are passed.
---@markup { MTA:SA Shared }
function setDebugViewActive(enabled) end

-- HTTP

---This function removes all text from the current HTML output.
---@return boolean Returns true if the output buffer was cleared successfully, false otherwise.
---@markup { MTA:SA Shared }
function httpClear() end

---This function makes the user's browser show a 'basic authentication' login box. The result of the login is handled automatically by the server. If the user has not logged in satisfactorily, you should just call the httpRequestLogin function again. It is the script's responsibility to judge when the user is logged in satisfactorily \- you can use the user variable can be used to check if the user has logged in with an account you are happy with. If the logged in user doesn't meet whatever criteria you have, you can just call httpRequestLogin again and they will be re\-promoted for their password.
---@return boolean Returns true if the relevant headers and return codes have been set, false otherwise. Essentially, always returns true .
---@markup { MTA:SA Shared }
function httpRequestLogin() end

---This function sets the HTTP status code that will be sent for the current HTML page.
---@param code integer MISSINGPARAMDESC
---@return boolean Returns true if the code was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function httpSetResponseCode(code) end

---This function sets the value for the specified HTTP cookie of the current HTML page.
---@param cookieName string MISSINGPARAMDESC
---@param cookieValue string MISSINGPARAMDESC
---@return boolean Returns true if the cookie value was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function httpSetResponseCookie(cookieName, cookieValue) end

---This function sets the value for the specified HTTP response header of the current HTML page.
---@param headerName string MISSINGPARAMDESC
---@param headerValue string MISSINGPARAMDESC
---@return boolean Returns true if the header value was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function httpSetResponseHeader(headerName, headerValue) end

---This function adds text to the output of the current HTTP file of the HTTP interface. The function can only be used on parsed (i.e not marked as raw) HTTP pages. httpWrite can support outputing binary data, if you specify the length of the data you are outtputing. If you do this, you should ensure you set an accurate content\-type using httpSetResponseHeader otherwise it may be displayed inconsistently by browsers.
---@param data string the data to be added to the page's output.
---@param length integer The length of the data being written. Generally only should be required for writing binary data.
---@return boolean Returns true if the text was added to the output buffer successfully, false otherwise.
---@markup { MTA:SA Shared }
function httpWrite(data, length) end

-- Input

---This function will attach a scripting function (handler) to a console command, so that whenever a player or administrator uses the command the function is called.
---@return boolean Returns true if the command handler was added successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function addCommandHandler() end

---Binds a player's key to a handler function or command, which will be called when the key is pressed.
---@param thePlayer player The player you wish to bind the key of.
---@param key string The key or control you wish to bind to the command. See key names for a list of possible keys.
---@param keyState string A string that has one of the following values: "up": If the bound key should trigger the function when the key is released "down": If the bound key should trigger the function when the key is pressed "both": If the bound key should trigger the function when the key is pressed or released
---@param commandName string The name of the command that the key should be binded to.
---@param arguments string
---@return boolean Returns true if the key was bound, false otherwise.
---@markup { MTA:SA Server/Client }
function bindKey(thePlayer, key, keyState, commandName, arguments) end

---This function will call all the attached functions of an existing console command, for a specified player.
---@param commandName string MISSINGPARAMDESC
---@param thePlayer player MISSINGPARAMDESC
---@param args string MISSINGPARAMDESC
---@return boolean Returns true if the command handler was called successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function executeCommandHandler(commandName, thePlayer, args) end

---This retrieves the analog control state of a control. This is useful for detecting sensitive controls, such as those used on a joypad.
---@param control string The control that you want to get the state of. See control names for a list of possible controls.
---@param rawValue boolean A bool indicating if it should return the raw player input value.
---@return number Returns a float between 0 and 1 indicating the amount the control is pressed.
---@markup { MTA:SA Shared }
function getAnalogControlState(control, rawValue) end

---Returns a list of key names that are bound to the specified game control or console command.
---@param command/control string the name of a game control or a console command. See the control names page for valid controls.
---@return table If one or more keys are bound to the specified control or console command, a table is returned indexed by the names of the keys and containing key states as values. If no keys are bound or an invalid name was passed, returns false .
---@markup { MTA:SA Shared }
function getBoundKeys(command/control) end

---This function is used to retrieve a list of all the registered command handlers of a given resource (or of all resources). Function also added client\-side.
---@param theResource resource The resource from which you wish to retrieve all command handlers. Or leave it empty to retrieve command handlers of all resources.
---@return table Returns a table containing all the commands of the given resource or a table with subtables containing the command and theResource pointer ( { "command", theResource } ). See examples below if you don't understand it.
---@markup { MTA:SA Shared }
function getCommandHandlers(theResource) end

---Gets the commands bound to a key.
---@param theKey string See key names for a list of possible keys
---@param keyState string A string that has one of the following values: "up": If the bound key should trigger the function when the key is released "down": If the bound key should trigger the function when the key is pressed "both": If the bound key should trigger the function when the key is pressed or released
---@return table Returns a table of the commands bound on that key.
---@markup { MTA:SA Shared }
function getCommandsBoundToKey(theKey, keyState) end

---Gets the functions bound to a key. To bind a function to a key use the bindKey function
---@param thePlayer player The player to get the functions from a key.
---@param key string MISSINGPARAMDESC
---@param keyState string A string that has one of the following values: "up": If the bound key should trigger the function when the key is released "down": If the bound key should trigger the function when the key is pressed "both": If the bound key should trigger the function when the key is pressed or released
---@return table Returns a table of the key function(s).
---@markup { MTA:SA Server/Client }
function getFunctionsBoundToKey(thePlayer, key, keyState) end

---This function allow you get first key bound to command.
---@param command string command what you need check.
---@return string Returns a string of first key binded to current command.
---@markup { MTA:SA Shared }
function getKeyBoundToCommand(command) end

---getKeyBoundToFunction allows retrieval of the first key bound to a function.
---@param thePlayer player The player you are checking the function bound to a key
---@param theFunction function The function in which you would like to check the bound key
---@return string Returns a string of the first key the function was bound to.
---@markup { MTA:SA Server/Client }
function getKeyBoundToFunction(thePlayer, theFunction) end

---This function determines if a certain key is pressed or not.
---@param keyName string The name of the key you're checking state of. See Key names .
---@return boolean Returns true if the specified key is pressed, false if it isn't or if an invalid key name is passed.
---@markup { MTA:SA Shared }
function getKeyState(keyName) end

---This function returns the state of the caps lock.
---@return boolean Returns true if caps lock is toggled (on), false otherwise.
---@markup { MTA:SA Shared }
function isCapsLockEnabled() end

---Checks whether a GTA control is enabled or disabled for a certain player.
---@param thePlayer player The player you wish the control status of.
---@param control string The control you wish to check. See control names for a list of possible controls.
---@return boolean Returns true if control is enabled, false otherwise.
---@markup { MTA:SA Server/Client }
function isControlEnabled(thePlayer, control) end

---This function can be used to find out if a key has already been bound. If you do not specify a keyState or handler, any instances of key being bound will cause isKeyBound to return true.
---@param thePlayer player The player you're checking.
---@param key string The key you're checking. See Key names for a list of valid key names.
---@param keyState string Is the state of the key when it calls the function, Can be either: "up": when the key is released "down": when the key is pressed
---@param handler function The function you're checking against
---@return boolean Returns true if the key is bound, false otherwise.
---@markup { MTA:SA Shared }
function isKeyBound(thePlayer, key, keyState, handler) end

---This function removes a command handler, that is one that has been added using addCommandHandler. This function can only remove command handlers that were added by the resource that it is called in.
---@param commandName string the name of the command you wish to remove.
---@param handler function the specific handler function to remove. If not specified, all handler functions for the command (from the calling resource) will be removed. This argument is only available in the server.
---@return boolean Returns true if the command handler was removed successfully, false if the command doesn't exist.
---@markup { MTA:SA Shared }
function removeCommandHandler(commandName, handler) end

---This sets the analog control state of a control for the local player. To change the analog controls for a ped, please use setPedAnalogControlState.
---@param control string The control that you want to set the state of. See control names for a list of possible controls.
---@param state number A float between 0 and 1 indicating the amount the control is pressed. If no value is provided, the analog control is removed.
---@param forceOverrideNextFrame boolean? MISSINGPARAMDESC
---@return boolean Returns true if the control state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setAnalogControlState(control, state, forceOverrideNextFrame) end

---Enables or disables the use of all GTA controls for a specified player.
---@param thePlayer player The player you wish to toggle the control ability of.
---@param enabled boolean A boolean value representing whether or not the controls will be usable.
---@param gtaControls boolean? A boolean deciding whether the enabled parameter will affect GTA's internal controls.
---@param mtaControls boolean? A boolean deciding whether the enabled parameter will affect MTA's own controls., e.g. chatbox.
---@return boolean This function returns true if controls were toggled successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function toggleAllControls(thePlayer, enabled, gtaControls, mtaControls) end

---Enables or disables the use of a GTA control for a specific player.
---@param thePlayer player The player you wish to toggle the control ability of.
---@param control string The control that you want to toggle the ability of. See control names for a list of possible controls.
---@param enabled boolean A boolean value representing whether or not the key will be usable or not.
---@return boolean This function true if the control was set successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function toggleControl(thePlayer, control, enabled) end

---Removes an existing key bind from the specified player.
---@param thePlayer player The player you wish to unbind the key of.
---@param key string The key you wish to unbind. See Key names for a list of valid key names.
---@param keyState string is optional in Syntax 2.
---@param command string MISSINGPARAMDESC
---@return boolean Returns ' true if the key was unbound, false if it was not previously bound or invalid arguments were passed to the function.
---@markup { MTA:SA Server/Client }
function unbindKey(thePlayer, key, keyState, command) end

-- Light

---This function creates a 3D light in the world.
---@param lightType integer An integer representing the type of light to create. 0 : Point light, which illuminates surroundings evenly across the light radius. 1 : Spot light, which illuminates the direction of the light defined by dirX , dirY and dirZ . 2 : Dark light, which darkens its surrounding elements to full black.
---@param posX number A floating point number representing the X coordinate on the map.
---@param posY number A floating point number representing the Y coordinate on the map.
---@param posZ number A floating point number representing the Z coordinate on the map.
---@param radius number? A floating point number representing the radius of the light.
---@param r integer? An integer number representing the amount of red to use in the colouring of the light (0 - 255).
---@param g integer? An integer number representing the amount of green to use in the colouring of the light (0 - 255).
---@param b integer? An integer number representing the amount of blue to use in the colouring of the light (0 - 255).
---@param dirX number? A floating point number representing the light direction's X coordinate on the map.
---@param dirY number? A floating point number representing the light direction's Y coordinate on the map.
---@param dirZ number? A floating point number representing the light direction's Z coordinate on the map.
---@return light Returns the light element if creation was successful, false otherwise.
---@markup { MTA:SA Shared }
function createLight(lightType, posX, posY, posZ, radius, r, g, b, dirX, dirY, dirZ) end

---This function returns the color for a light element.
---@param theLight light The light that you wish to retrieve the color of.
---@return integer | integer | integer Returns three ints corresponding to the amount of red, green and blue (respectively) of the light, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getLightColor(theLight) end

---This function returns the direction for a light element.
---@param theLight light The light that you wish to retrieve the direction of.
---@return number | number | number Returns three ints corresponding to the x, y and z coordinates (respectively) of the light direction, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getLightDirection(theLight) end

---This function returns the radius for a light element.
---@param theLight light The light that you wish to retrieve the radius of.
---@return number Returns a float containing the radius of the specified light, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getLightRadius(theLight) end

---This function returns the type for a light element.
---@param theLight light The light that you wish to retrieve the type of.
---@return integer Returns an int containing the type of the specified light, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getLightType(theLight) end

---This function sets the color for a light element.
---@param theLight light The light that you wish to set the color of.
---@param r number MISSINGPARAMDESC
---@param g number MISSINGPARAMDESC
---@param b number MISSINGPARAMDESC
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setLightColor(theLight, r, g, b) end

---This function sets the direction for a light element.
---@param theLight light The light that you wish to set the direction of.
---@param x number MISSINGPARAMDESC
---@param y number MISSINGPARAMDESC
---@param z number MISSINGPARAMDESC
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setLightDirection(theLight, x, y, z) end

---This function sets the radius for a light element.
---@param theLight light The light that you wish to set the radius of.
---@param radius number MISSINGPARAMDESC
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setLightRadius(theLight, radius) end

-- Map

---This function is intended to load data from a loaded XML file into the element tree. This could be used for loading an external map, or part of another map.
---@param node xmlnode The node that you wish to load into the element tree .
---@param parent element The node you wish to be the parent of the new map data.
---@return element Returns an element object that corresponds to the root of the new data added, i.e. an element that represents the node xmlnode passed to the function. Returns false if the arguments are invalid.
---@markup { MTA:SA Shared }
function loadMapData(node, parent) end

---This function is used to reset the state of a player. It is intended to restore a player to his default state as if he had just joined the server, without any scripts affecting him.
---@param thePlayer player? The specific player you wish to restore the state of.  Not specifying this will result in all players map info being reset.
---@return boolean Returns true if the map info was reset successfully, otherwise false .
---@markup { MTA:SA Shared }
function resetMapInfo(thePlayer) end

---This converts a set of elements in the element tree into XML. This is a format that can then be loaded as a map file. Each element represents a single XML node.
---@param node xmlnode An existing node that should contain the contents of baseElement
---@param baseElement element The first element to output to the XML tree. This element and all its children (and their children, etc) will be output.
---@param childrenOnly boolean? Defines if you want to only save children of the specified element.
---@return boolean Saving your resource's data to an map file (untested)
---@markup { MTA:SA Shared }
function saveMapData(node, baseElement, childrenOnly) end

-- Marker

---This function creates a marker. A marker is a 3D model in the world that can highlight a particular point or area, often used to instruct players where to go to perform actions such as entering buildings.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param string theType [,? MISSINGPARAMDESC
---@return marker Returns the marker element that was created, or false if the arguments are incorrect.
---@markup { MTA:SA Server/Client }
function createMarker(x, y, z, string theType) end

---This function returns the color and transparency for a marker element.
---@param theMarker marker The marker that you wish to retrieve the color of.
---@return integer | integer | integer | integer Returns four ints corresponding to the amount of red , green , blue and alpha (respectively) of the marker, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getMarkerColor(theMarker) end

---Returns the number of markers that currently exist in the world.
---@return integer Returns the number of markers that currently exist.
---@markup { MTA:SA Shared }
function getMarkerCount() end

---This function returns the icon name for a marker.
---@param theMarker marker A marker element referencing the specified marker.
---@return string Returns false if the marker passed is invalid or a string containing one of the following:
---@markup { MTA:SA Shared }
function getMarkerIcon(theMarker) end

---This function returns a float containing the size of the specified marker.
---@param myMarker marker The marker that you wish to retrieve the size of.
---@return number Returns a float containing the size of the specified marker.
---@markup { MTA:SA Shared }
function getMarkerSize(myMarker) end

---This function returns the position of the specified marker's target, the position it points to. This only works for checkpoint markers and ring markers. For checkpoints it returns the position the arrow is pointing to, for ring markers it returns the position the ring is facing. You can set this target with setMarkerTarget.
---@param theMarker marker The marker you wish to retrieve the target position of.
---@return float float float Returns three float s if a target is set, or false in the first variable and nil in the two others if the marker is invalid or no target is set.
---@markup { MTA:SA Shared }
function getMarkerTarget(theMarker) end

---function returns the color, transparency and size for a checkpoint marker's target arrow.
---@param theMarker marker The marker that you wish to retrieve the color and size of.
---@return integer | integer | integer | integer | integer Returns five ints corresponding to the amount of red , green , blue , alpha and size of the marker's target arrow, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getMarkerTargetArrowProperties(theMarker) end

---This function returns a marker's type.
---@param theMarker marker A marker element referencing the specified marker.
---@return string If an invalid marker is specified, false is returned.
---@markup { MTA:SA Shared }
function getMarkerType(theMarker) end

---This function gets visibility of corona reflection.
---@param theMarker marker marker
---@return boolean
---@markup { MTA:SA Shared }
function isCoronaReflectionEnabled(theMarker) end

---This function sets visibility of corona reflection.
---@param theMarker marker the corona marker that you wish set visibility of corona reflection
---@param enabled boolean whenever corona reflection should be visible
---@return boolean Returns true if marker type is corona , false otherwise.
---@markup { MTA:SA Shared }
function setCoronaReflectionEnabled(theMarker, enabled) end

---This function sets the color of the specified marker by modifying the values for red, green, blue and alpha.
---@param theMarker marker The marker that you wish to set the color of.
---@param r integer The amount of red in the final color (0 to 255).
---@param g integer The amount of green in the final color (0 to 255).
---@param b integer The amount of blue in the final color (0 to 255).
---@param a integer The amount of alpha in the final color (0 to 255).
---@return boolean
---@markup { MTA:SA Shared }
function setMarkerColor(theMarker, r, g, b, a) end

---This function allows changing the icon of a checkpoint marker.
---@param theMarker marker The marker to change the visual style of
---@param icon string A string referring to the type of icon, acceptable values are: "none" : No icon "arrow" : Arrow icon. Only 5 arrows can be visible at the same time. "finish" : Finish icon (at end of race)
---@return boolean
---@markup { MTA:SA Shared }
function setMarkerIcon(theMarker, icon) end

---This function sets the size of the specified marker.
---@param theMarker marker The marker that you wish to set the size of.
---@param size number A float representing new size of the marker.
---@return boolean Returns true if successful, false if failed.
---@markup { MTA:SA Shared }
function setMarkerSize(theMarker, size) end

---This function sets the 'target' for a marker. Only the checkpoint and ring marker types can have a target.
---@param theMarker marker The marker to set the target of
---@param x number The x axis of the coordinate to target the marker at
---@param y number The y axis of the coordinate to target the marker at
---@param z number The z axis of the coordinate to target the marker at
---@return boolean Returns true if target was set, false otherwise.
---@markup { MTA:SA Shared }
function setMarkerTarget(theMarker, x, y, z) end

---This function changes the color and size of the checkpoint marker's target arrow.
---@param marker element MISSINGPARAMDESC
---@param r integer? The amount of red in the final color (0 to 255).
---@param g integer? The amount of green in the final color (0 to 255).
---@param b integer? The amount of blue in the final color (0 to 255).
---@param a integer? The amount of alpha in the final color (0 to 255).
---@param size number? Target arrow size.
---@return boolean
---@markup { MTA:SA Shared }
function setMarkerTargetArrowProperties(marker, r, g, b, a, size) end

---This function changes a marker's type. The type controls how the marker is displayed in the game. It's important that you use marker types that users are used to from the single player game. For example, checkpoints are used in races, rings are used for aircraft races, arrows are used for entering buildings etc.
---@param theMarker marker A marker element referencing the specified marker.
---@param markerType string A string denoting the marker type. Valid values are: "checkpoint" : A race checkpoint. These are very tall, but not infinite, light pillars. Checkpoints snap to ground and become invisible after going over a certain Z height. "ring" : Doughnut shaped ring, normally used for aircraft. "cylinder" : Small glowing ground ring. These are the glow markers you walk into to activate missions or events in single player. "arrow" : Arrow pointing down. These are the arrows on the doors you can enter in single player, except MTA's are not animated by default. "corona" : A glowing ball of light.
---@return boolean Returns true if the marker type was changed, false if it wasn't or marker values were invalid.
---@markup { MTA:SA Shared }
function setMarkerType(theMarker, markerType) end

-- Module

---This function returns all the currently loaded modules of the server.
---@return table Returns a table of all the currently loaded modules . If no modules are loaded, the table will be empty.
---@markup { MTA:SA Shared }
function getLoadedModules() end

---This function returns information about the specified module.
---@param moduleName string A string containing the module you wish to get information of e.g. "hashing.dll"
---@return table Returns a table containing information about module. These keys are present in the table:
---@markup { MTA:SA Shared }
function getModuleInfo(moduleName) end

-- Object

---This function breaks a specific object.
---@param theObject object an object element
---@return boolean This example checks if the object created is breakable and if it is then breaks it.
---@markup { MTA:SA Shared }
function breakObject(theObject) end

---Creates an object element at a given position and rotation.
---@param modelId integer A whole integer specifying the GTA:SA object model ID. See Object IDs for a list of model IDs.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rx number A floating point number representing the rotation about the X axis in degrees.
---@param ry number A floating point number representing the rotation about the Y axis in degrees.
---@param rz number A floating point number representing the rotation about the Z axis in degrees.
---@param isLowLOD boolean? MISSINGPARAMDESC
---@return object
---@markup { MTA:SA Shared }
function createObject(modelId, x, y, z, rx, ry, rz, isLowLOD) end

---This function returns the mass of a specified object.
---@param theObject object the object whose mass you want to get.
---@return number This script basically creates an object then get's the mass and set's its mass 300 more than it's original mass, then tell the client the old and new mass of the object.
---@markup { MTA:SA Shared }
function getObjectMass(theObject) end

---This function gets a property of the specified object.
---@param theObject object the object you wish to get a property of.
---@param property string the property you want to get the value of:
---@return mixed On success: table for all , 3 floats for centerofmass or float for other properties
---@markup { MTA:SA Shared }
function getObjectProperty(theObject, property) end

---This function returns the visible size of an object.
---@param theObject object the object you wish to return the scale of.
---@return number | number | number
---@markup { MTA:SA Shared }
function getObjectScale(theObject) end

---This function checks if an object / model ID is breakable.
---@param theObject / int modelId object MISSINGPARAMDESC
---@return boolean This example creates an object when the resource starts and checks if the object is breakable.
---@markup { MTA:SA Shared }
function isObjectBreakable(theObject / int modelId) end

---This function checks if an object is moving.
---@param theObject object The object element .
---@return boolean This example creates an object when the resource starts and checks if the object is moving:
---@markup { MTA:SA Shared }
function isObjectMoving(theObject) end

---This function checks if the object has respawn enabled, which can be toggled using toggleObjectRespawn.
---@param theObject object an object element.
---@return boolean Returns true if the object has respawning enabled, false otherwise.
---@markup { MTA:SA Shared }
function isObjectRespawnable(theObject) end

---This function will smoothly move an object from its current position to a specified rotation and position.
---@param theObject object the object that will be moved.
---@param time integer the time in milliseconds the object will arrive at the destination.
---@param targetx number the X value of the target position
---@param targety number the Y value of the target position
---@param targetz number the Z value of the target position
---@param moverx number the rotation along the X axis relative to its current rotation, which is its starting angle.
---@param movery number the rotation along the Y axis relative to its current rotation, which is its starting angle.
---@param moverz number the rotation along the Z axis relative to its current rotation, which is its starting angle.
---@param strEasingType string the easing function to use for the interpolation (default is "Linear")
---@param fEasingPeriod number the period of the easing function (only some easing functions use this parameter)
---@param fEasingAmplitude number the amplitude of the easing function (only some easing functions use this parameter)
---@param fEasingOvershoot number the overshoot of the easing function (only some easing functions use this parameter)
---@return boolean
---@markup { MTA:SA Shared }
function moveObject(theObject, time, targetx, targety, targetz, moverx, movery, moverz, strEasingType, fEasingPeriod, fEasingAmplitude, fEasingOvershoot) end

---This function respawns a specific object.
---@param theObject object an object element
---@return boolean This example prevents objects from despawning. When an object breaks, it gets respawned right away.
---@markup { MTA:SA Shared }
function respawnObject(theObject) end

---This function sets an object to be breakable/unbreakable.
---@param theObject object MISSINGPARAMDESC
---@param breakable boolean
---@return boolean This example creates an object when the resource starts and sets it to be breakable.
---@markup { MTA:SA Shared }
function setObjectBreakable(theObject, breakable) end

---This function sets the mass of a specified object. Changing the mass leads to a different movement behavior for especially dynamic objects.
---@param theObject object the object whose mass will be set.
---@param mass number the new mass.
---@return boolean This script basically creates an object then get's the mass and set's its mass 300 more than it's original mass, then tell the client the old and new mass of the object.
---@markup { MTA:SA Shared }
function setObjectMass(theObject, mass) end

---This function sets a property of the specified object.
---@param theObject object the object you wish to change a property of.
---@param property string the property you want to set the value of:
---@param value var MISSINGPARAMDESC
---@return boolean Returns true if the property was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setObjectProperty(theObject, property, value) end

---This function changes the visible size of an object.
---@param theObject object the object you wish to change the scale of.
---@param scale number a float containing the new scale. 1.0 is the standard scale, with 0.5 being half the size and 2.0 being twice the size. If the scaleY is set, this will be scaleX.
---@param scaleY number? a float containing the new scale on the Y axis
---@param scaleZ number? a float containing the new scale on the Z axis
---@return boolean This example creates an antenna, and changes the size of it.
---@markup { MTA:SA Shared }
function setObjectScale(theObject, scale, scaleY, scaleZ) end

---This will allow you to stop an object that is currently moving.
---@param theObject object the object whose movement you wish to stop
---@return boolean This will allow you to toggle the random movement of a staircase object model using a randomObjectMovement function and stop it immediately with the stopObject command.  This is achieved by using a "toggleobjectmove" command with a "on" or "off" parameter.
---@markup { MTA:SA Shared }
function stopObject(theObject) end

---This function is used to toggle if an object should respawn after it got destroyed
---@param theObject object the object you want to toggle the respawn from
---@param respawn boolean a bool denoting whether we want to enable ( true ) or disable ( false ) respawning
---@return boolean This example adds command tos that toggles respawn of all the objects.
---@markup { MTA:SA Shared }
function toggleObjectRespawn(theObject, respawn) end

-- Output

---This function clears the chatbox. It does not clear the console (F8\)
---@param element clearFor [? MISSINGPARAMDESC
---@return boolean Returns true if the player's chat was cleared successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function clearChatBox(element clearFor) end

---This function clears the debug box.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function clearDebugBox() end

---This function checks if the player's chat input is blocked.
---@return boolean Returns true if the chat input is blocked, false otherwise.
---@markup { MTA:SA Shared }
function isChatInputBlocked() end

---This function checks if player's chat is visible.
---@return boolean Returns true if the chat is visible, false otherwise.
---@markup { MTA:SA Shared }
function isChatVisible() end

---This outputs the specified text string to the chatbox. It can be specified as a message to certain player(s) or all players.
---@param text string MISSINGPARAMDESC
---@param visibleTo table/element? MISSINGPARAMDESC
---@param r integer? MISSINGPARAMDESC
---@param g integer? MISSINGPARAMDESC
---@param b integer? MISSINGPARAMDESC
---@param colorCoded boolean? MISSINGPARAMDESC
---@return boolean Returns true if the message was displayed successfully. Returns false if invalid arguments are specified.
---@markup { MTA:SA Server/Client }
function outputChatBox(text, visibleTo, r, g, b, colorCoded) end

---This outputs the specified text string to the console window (accessed with F8 or \~ key). It can be specified as a message to certain player(s) or all players.
---@param text string The text string that you wish to send to the console window
---@param element visibleTo [? MISSINGPARAMDESC
---@return boolean
---@markup { MTA:SA Server/Client }
function outputConsole(text, element visibleTo) end

---This function outputs scripting debug messages, which can be read by enabling the debug textbox. The debug display level can then be set so that info or warning messages get filtered out.
---@param text string the text to be output to the debug box.
---@param level integer? the debug message level. Possible values are: 0: Debug message 1: Error message 2: Warning message 3: Information message (default) 4: Custom message (omits file path and line number)
---@param red integer? The amount of red in the color of the text. Default value is 255.
---@param green integer? The amount of green in the color of the text. Default value is 255.
---@param blue integer? The amount of blue in the color of the text. Default value is 255.
---@return boolean Returns true if the debug message was successfully output, false if invalid arguments are specified.
---@markup { MTA:SA Shared }
function outputDebugString(text, level, red, green, blue) end

---This outputs a line of text to the server's log. This could be useful for debugging.
---@param text string The text to be output to the log.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function outputServerLog(text) end

---This function is used to show or hide the player's chat.
---@param thePlayer player The player whose chat is to be hidden or shown.
---@param show boolean A boolean value determining whether to show ( true ) or hide ( false ) the chat.
---@param inputBlocked boolean A boolean value determining whether chat input is blocked/hidden, regardless of chat visibility. If unset, this will keep the default behaviour prior to r20898 ( true when chat is hidden, false when chat is visible).
---@return boolean Returns true if the player's chat was shown or hidden successfully, false otherwise.
---@markup { MTA:SA Server/Client }
function showChat(thePlayer, show, inputBlocked) end

-- Path

---Checks if a specified path points to a directory.
---@param path string A string containing a path you want to check against
---@return boolean Returns true if the path points to a directory, false otherwise.
---@markup { MTA:SA Shared }
function pathIsDirectory(path) end

---Checks if a specified path points to a file.
---@param path string A string containing a path you want to check against
---@return boolean Returns true if the path points to a file, false otherwise.
---@markup { MTA:SA Shared }
function pathIsFile(path) end

---Reads a specified directory and returns all entries inside of it. These entries can be file or folder names.
---@param path string A string containing a path you want to get entries from
---@return table Returns table with all entries in a specified directory.
---@markup { MTA:SA Shared }
function pathListDir(path) end

-- Ped

---This function checks if player feets are bleeding.
---@param thePlayer element The player to give bloody foot prints to.
---@return boolean Returns true if feets are bleeding, false otherwise
---@markup { MTA:SA Shared }
function IsPedFootBloodEnabled(thePlayer) end

---This function is used to set the current clothes on a ped.
---@param thePed ped The ped whose clothes you want to change.
---@param clothesTexture string A string determining the clothes texture that will be added. See the clothes catalog .
---@param clothesModel string A string determining the clothes model that will be added. See the clothes catalog .
---@param clothesType integer A integer representing the clothes slot/type the clothes should be added to. See the clothes catalog .
---@return boolean This function returns true if the clothes were successfully added to the ped, false otherwise.
---@markup { MTA:SA Shared }
function addPedClothes(thePed, clothesTexture, clothesModel, clothesType) end

---This function checks if the given ped can fall off bikes.
---@param thePed ped the ped you want to check.
---@return boolean Returns true if the ped can be knocked off bikes, false if he cannot or an invalid element was passed.
---@markup { MTA:SA Shared }
function canPedBeKnockedOffBike(thePed) end

---Creates a Ped in the GTA world.
---@param modelid integer A whole integer specifying the GTASA skin ID .
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rot number? MISSINGPARAMDESC
---@param synced boolean? MISSINGPARAMDESC
---@return ped Returns a ped element if it was successfully created.
---@markup { MTA:SA Server/Client }
function createPed(modelid, x, y, z, rot, synced) end

---This function returns an integer that contains the ammo in a specified ped's weapon. See Weapon Info
---@param thePed ped The ped whose ammo you want to check.
---@param weaponSlot integer? an integer representing the weapon slot (set to the ped's currently selected slot if not specified).
---@return integer Returns an int containing the amount of ammo in the specified ped's currently selected or specified clip, or 0 if the ped specified is invalid.
---@markup { MTA:SA Shared }
function getPedAmmoInClip(thePed, weaponSlot) end

---This function retrieves the analog control state of a ped, as set by setPedAnalogControlState.
---@param thePed ped The ped you wish to retrieve the control state of.
---@param controlName string The control. See control names for a list of possible controls.
---@param rawValue boolean A bool indicating if it should return the raw player input value (will always return script value for non-player peds).
---@return number Returns a float between 0 (full release) and 1 (full push) indicating the amount the control is pushed.
---@markup { MTA:SA Shared }
function getPedAnalogControlState(thePed, controlName, rawValue) end

---Gets the animation of a player or ped that was set using setPedAnimation.
---@param thePed ped the player or ped you want to get the animation of.
---@return string | string | integer | integer | boolean | boolean | boolean | integer | boolean The function returns 9 values in the same order as required by setPedAnimation :
---@markup { MTA:SA Shared }
function getPedAnimation(thePed) end

---This function returns the current armor of the specified ped.
---@param thePed ped The ped whose armor you want to check
---@return number A float with the armor, false if an invalid ped was given.
---@markup { MTA:SA Shared }
function getPedArmor(thePed) end

---Returns the 3D world coordinates of a specific bone of a given ped.
---@param thePed ped the ped you want to inspect.
---@param bone integer the number of the bone to get the position of.
---@return number | number | number Returns the x, y, z world position of the bone.
---@markup { MTA:SA Shared }
function getPedBonePosition(thePed, bone) end

---This function gets the current camera rotation of a ped.
---@param thePed ped the ped to retrieve the camera rotation of.
---@return number Returns the camera rotation of the ped in degrees if successful. Returns false if an invalid element was passed.
---@markup { MTA:SA Shared }
function getPedCameraRotation(thePed) end

---This function is used to get the current clothes texture and model of a certain type on a ped.
---@param thePed ped The ped whose clothes you want to retrieve.
---@param clothesType integer The type/slot of clothing you want to get.
---@return string | string This function returns 2 strings , the clothes texture and model. The first return value will be false if this player's clothes type is empty or an invalid player was specified.
---@markup { MTA:SA Shared }
function getPedClothes(thePed, clothesType) end

---This function detects the element a ped is standing on. This can be a vehicle or an object.
---@param thePed ped The ped of which you want to get the element he is standing on.
---@return element Returns an object or a vehicle if the ped is standing on one, false if he is touching none or an invalid element was passed.
---@markup { MTA:SA Shared }
function getPedContactElement(thePed) end

---Checks whether a ped or the localplayer has a certain control pressed.
---@param thePed ped the ped you want to check.
---@param control string the control to get the status of. See control names for a list of valid names.
---@return boolean Returns true if the ped is pressing the specified control, false if not or an invalid argument was passed.
---@markup { MTA:SA Shared }
function getPedControlState(thePed, control) end

---Retrieves the fighting style a player/ped is currently using. Function also added client\-side.
---@param thePed ped the ped whose current fighting style ID you wish to retrieve.
---@return integer Returns the ped's current fighting style as an integer ID, false if it fails to retrieve a value.
---@markup { MTA:SA Shared }
function getPedFightingStyle(thePed) end

---This function returns the current gravity for the specified ped. The default gravity is 0\.008\.
---@param thePed ped The ped whose gravity you want to check.
---@return number Returns a float indicating the ped's gravity, or false if the ped is invalid. Default value is 0.008.
---@markup { MTA:SA Shared }
function getPedGravity(thePed) end

---This function returns the current move state for the specified ped.
---@param thePed ped The ped whose move state you want to know
---@return string Returns a string indicating the ped's move state, or false if the ped is not streamed in, the movement type is unknown, the ped is in a vehicle or the ped is invalid.
---@markup { MTA:SA Shared }
function getPedMoveState(thePed) end

---This function gets the vehicle that the ped is currently in or is trying to enter, if any.
---@param thePed ped The ped whose vehicle you're looking up.
---@return vehicle Returns the vehicle that the specified ped is in, or false if the ped is not in a vehicle or is an invalid ped.
---@markup { MTA:SA Shared }
function getPedOccupiedVehicle(thePed) end

---This function gets the seat that a specific ped is sitting in in a vehicle.
---@param thePed ped The ped whose vehicle seat you're looking up.
---@return integer Returns false if the ped is on foot, or the ped doesn't exist.
---@markup { MTA:SA Shared }
function getPedOccupiedVehicleSeat(thePed) end

---This function returns the current oxygen level of the specified ped.
---@param thePed ped The ped whose oxygen level you want to check
---@return number A float with the oxygen level, false if an invalid ped was given.
---@markup { MTA:SA Shared }
function getPedOxygenLevel(thePed) end

---This function is used to get the name of a specified ped's current simplest task.
---@param thePed ped The ped whose task you want to retrieve.
---@return string Returns a string representing the name of the ped's simplest, active task .
---@markup { MTA:SA Shared }
function getPedSimplestTask(thePed) end

---This function returns the value of the specified statistic of a specific ped.
---@param thePed ped The ped whose stat you want to retrieve.
---@param stat integer A whole number determining the stat ID.
---@return number Returns the value of the requested statistic.
---@markup { MTA:SA Shared }
function getPedStat(thePed, stat) end

---This function is used to get the element a ped is currently targeting.
---@param thePed ped The ped whose target you want to retrieve.
---@return element Returns the element that's being targeted, or false if there isn't one.
---@markup { MTA:SA Shared }
function getPedTarget(thePed) end

---This function allows retrieval of where a ped's target is blocked. It will only be blocked if there is an obstacle within a ped's target range.
---@param targetingPed ped This is the ped whose target collision you wish to retrieve
---@return float float float Returns three floats, x , y , z , representing the position where the ped's target collides, or false if it was unsuccessful.
---@markup { MTA:SA Shared }
function getPedTargetCollision(targetingPed) end

---This function allows retrieval of the position where a ped's target range ends, when he is aiming with a weapon.
---@param targetingPed ped the ped who is targeting whose target end you wish to retrieve
---@return float float float Returns three floats, x , y , z , representing the position where the ped's target ends according to his range, or false if it was unsuccessful.
---@markup { MTA:SA Shared }
function getPedTargetEnd(targetingPed) end

---This function allows retrieval of the position a ped's target range begins, when he is aiming with a weapon.
---@param targetingPed ped The ped whose target start you wish to retrieve
---@return float float float Returns three floats, x,y,z, representing the position where the ped's target starts, or false if it was unsuccessful.
---@markup { MTA:SA Shared }
function getPedTargetStart(targetingPed) end

---This function is used to get any simple or complex task of a certain type for a ped.
---@param thePed ped The ped whose task you want to retrieve.
---@param priority string A string determining which set of tasks you want to retrieve it from. This must be either "primary" or "secondary".
---@param taskType integer An integer value representing the task type (or slot) you want to get the task from. Types can be: PRIMARY TASKS 0: TASKPHYSICALRESPONSE 1: TASKEVENTRESPONSETEMP 2: TASKEVENTRESPONSENONTEMP 3: TASKPRIMARY 4: TASKDEFAULT SECONDARY TASKS 0: TASKSECONDARYATTACK 1: TASKSECONDARYDUCK 2: TASKSECONDARYSAY 3: TASKSECONDARYFACIALCOMPLEX 4: TASKSECONDARYPARTIALANIM 5: TASKSECONDARYIK
---@return string | string | string | string Returns the name of the most complex task. See list of player tasks for valid strings. Returns false if invalid arguments are specified or if there is no task of the type specified. Returns between 1 and 4 strings. The first string contains the name of the most complex task, with simpler sub-tasks being named in the following strings. See list of player tasks for valid strings. Returns false if invalid arguments are specified or if there is no task of the type specified.
---@markup { MTA:SA Shared }
function getPedTask(thePed, priority, taskType) end

---This function returns an integer that contains the total ammo in a specified ped's weapon. See Weapon Info
---@param thePed ped The ped whose ammo you want to check.
---@param weaponSlot integer? an integer representing the weapon slot (set to the ped's current slot if not given)
---@return integer Returns an int containing the total amount of ammo for the specified ped's weapon, or 0 if the ped specified is invalid.
---@markup { MTA:SA Shared }
function getPedTotalAmmo(thePed, weaponSlot) end

---Gets the current voice of a ped.
---@param thePed ped the ped to get the voice of.
---@return string | string If successul, returns the current voice type name and the voice name of the ped (see ped voices for possible names). Returns false in case of failure.
---@markup { MTA:SA Shared }
function getPedVoice(thePed) end

---Returns the walking style ID of a ped. This ID determines the set of animations that is used for walking, running etc.
---@param thePed ped the ped whose walking style to retrieve.
---@return integer Returns the walking style ID if successful, false otherwise. The possible walking styles are as follows:
---@markup { MTA:SA Shared }
function getPedWalkingStyle(thePed) end

---This function tells you which weapon type is in a certain weapon slot of a ped.
---@param thePed ped the ped you want to get the weapon type from.
---@param weaponSlot integer? an integer representing the weapon slot (set to the ped's current slot if not given).
---@return integer Returns an int indicating the type of the weapon the ped has in the specified slot. If the slot is empty, it returns 0.
---@markup { MTA:SA Shared }
function getPedWeapon(thePed, weaponSlot) end

---Returns the world position of the muzzle of the weapon that a ped is currently carrying. The weapon muzzle is the end of the gun barrel where the bullets/rockets/... come out.
---@param thePed ped the ped whose weapon muzzle position to retrieve.
---@return number | number | number If successful, returns the x/y/z coordinates of the weapon muzzle. Returns false otherwise.
---@markup { MTA:SA Shared }
function getPedWeaponMuzzlePosition(thePed) end

---This function gets a ped's selected weapon slot.
---@param thePed ped the ped to get the current weapon slot of.
---@return integer Returns the selected weapon slot ID on success, false otherwise.
---@markup { MTA:SA Shared }
function getPedWeaponSlot(thePed) end

---This function returns all valid ped models. The syntax is different for server and client sides.
---@return table Returns a table with all valid ped models that exist on the server.
---@markup { MTA:SA Server/Client }
function getValidPedModels() end

---This function gives the specified weapon to the specified ped. This function can't be used on players, use giveWeapon for that.
---@param thePed ped A ped element.
---@param weapon integer A whole number integer that refers to a Weapon ID. Click here for a list of possible weapon IDs.
---@param ammo integer? A whole number integer serving as the ammo amount for the given weapon. For weapons that do not require ammo, such as melee, this should be at least 1.
---@param setAsCurrent boolean? A boolean value determining whether or not the weapon will be set as the peds currently selected weapon.
---@return boolean Returns true if weapon was successfully given to the ped, false otherwise.
---@markup { MTA:SA Shared }
function givePedWeapon(thePed, weapon, ammo, setAsCurrent) end

---This function gets the state of a player's or ped's bleeding effect.
---@param thePed ped The player or ped whose bleeding effect state you want to get.
---@return boolean Returns true if the player or ped is bleeding, false otherwise.
---@markup { MTA:SA Shared }
function isPedBleeding(thePed) end

---This function checks if the specified ped is choking (coughing) or not. This happens as a result of weapons that produce smoke \- smoke grenades, fire extinguisher and the spray can.
---@param thePed ped The ped you wish to check
---@return boolean Returns true if the ped is choking, false otherwise.
---@markup { MTA:SA Shared }
function isPedChoking(thePed) end

---This function checks if the specified ped is dead or not.
---@param thePed ped the ped you want to check up on.
---@return boolean Returns true if the ped is dead, false otherwise.
---@markup { MTA:SA Shared }
function isPedDead(thePed) end

---This function checks if the ped is in the driveby state.
---@param thePed ped The ped element whose state is to be checked.
---@return boolean Returns true if the driveby state is enabled, false otherwise.
---@markup { MTA:SA Shared }
function isPedDoingGangDriveby(thePed) end

---This function checks if the specified ped is carrying out a certain task.
---@param thePed ped The ped you want to check.
---@param taskName string A string containing the name of the task you're checking for.
---@return boolean Returns true if the player is currently doing the task, false otherwise.
---@markup { MTA:SA Shared }
function isPedDoingTask(thePed, taskName) end

---This function checks if the specified ped is ducked (crouched) or not.
---@param thePed ped The ped to check.
---@return boolean Returns true if the ped is ducked, false otherwise.
---@markup { MTA:SA Shared }
function isPedDucked(thePed) end

---With this function, you can check if a ped has a head or not.
---@param thePed ped The ped to check.
---@return boolean Returns true if the ped is headless, false otherwise.
---@markup { MTA:SA Shared }
function isPedHeadless(thePed) end

---Checks whether or not a given ped is currently in a vehicle.
---@param thePed ped the ped you want to check.
---@return boolean Returns true if the ped is in a vehicle, false if he is on foot or an invalid element was passed.
---@markup { MTA:SA Shared }
function isPedInVehicle(thePed) end

---This function is used to determine whether or not a ped is on the ground. This is for on\-foot usage only.
---@param thePed ped The ped you are checking.
---@return boolean Returns true if the ped is on foot and on the ground, false otherwise, even if he is in a car that stands still or on object outside world map.
---@markup { MTA:SA Shared }
function isPedOnGround(thePed) end

---This function is used to determine whether or not a ped is currently reloading their weapon. Useful to stop certain quick reload exploits.
---@param thePed ped The ped you are checking.
---@return boolean Returns true if the ped is currently reloading a weapon, false otherwise.
---@markup { MTA:SA Shared }
function isPedReloadingWeapon(thePed) end

---This function checks whether health target markers are drawn as set by setPedTargetingMarkerEnabled or not.
---@return boolean Returns true if the health target markers are enabled, false if not.
---@markup { MTA:SA Shared }
function isPedTargetingMarkerEnabled() end

---Checks whether or not a ped is currently wearing a jetpack.
---@param thePed ped the ped you want to check
---@return boolean Returns true if the ped is carrying a jetpack, false if he is not or an invalid element was passed.
---@markup { MTA:SA Shared }
function isPedWearingJetpack(thePed) end

---This function kills the specified ped.
---@param thePed ped The ped to kill
---@param theKiller ped? The ped responsible for the kill
---@param weapon integer? The ID of the weapon or Damage Types that should appear to have killed the ped (doesn't affect how they die)
---@param bodyPart integer? The ID of the body part that should appear to have been hit by the weapon (doesn't affect how they die) 3: Torso 4: Ass 5: Left Arm 6: Right Arm 7: Left Leg 8: Right Leg 9: Head
---@param stealth boolean? Boolean value, representing whether or not this a stealth kill
---@return boolean Returns true if the ped was killed, false if the ped specified could not be killed or is invalid.
---@markup { MTA:SA Shared }
function killPed(thePed, theKiller, weapon, bodyPart, stealth) end

---This function allows playing specific voice lines of a ped.
---@param thePed ped The ped who will speak the lines.
---@param lineId number The ID of the line to be spoken (0-359). See ID List
---@param probability number? The probability that the line will be spoken (0 - 1), where 1 means 100%.
---@return nil The function returns nothing, always nil .
---@markup { MTA:SA Shared }
function playPedVoiceLine(thePed, lineId, probability) end

---This function makes a pedestrian reload their weapon.
---@param thePed ped The ped who will reload their weapon.
---@return boolean Returns true if the pedestrian was made to reload, or false if invalid arguments were passed or that pedestrian has a weapon which cannot be reloaded.
---@markup { MTA:SA Shared }
function reloadPedWeapon(thePed) end

---This function is used to remove the current clothes of a certain type on a ped. It will remove them if the clothesTexture and clothesModel aren't specified, or if they match the current clothes on that slot.
---@param thePed ped The ped you want to remove clothes from.
---@param clothesType integer the clothes slot/type to remove. See the clothes catalog .
---@param clothesTexture string (Server only) A string determining the clothes texture that will be removed. See the clothes catalog .
---@param clothesModel string (Server only) A string determining the clothes model that will be removed. See the clothes catalog .
---@return boolean This function returns true if the clothes were successfully removed from the ped, false otherwise.
---@markup { MTA:SA Shared }
function removePedClothes(thePed, clothesType, clothesTexture, clothesModel) end

---This function removes a ped from a vehicle immediately. This works for drivers and passengers. Note that this removes the ped from the vehicle and puts him in the exact position where the command was initiated.
---@param thePed ped The ped you wish to remove from a vehicle
---@return boolean Returns true if the operation was successful, false if the specified ped is not valid or if it isn't in a vehicle.
---@markup { MTA:SA Shared }
function removePedFromVehicle(thePed) end

---Resets the voice of a ped to a default one.
---@param thePed ped the ped whose voice to reset.
---@return boolean Returns true when the voice was successfully reset, false otherwise.
---@markup { MTA:SA Shared }
function resetPedVoice(thePed) end

---This function allows you to set a ped's aim target to a specific point. If a ped is within a certain range defined by getPedTargetStart and getPedTargetEnd he will be targeted and shot.
---@param thePed ped The ped whose target you want to set. Only peds and remote players will work; this function has no effect on the local player.
---@param x number The x coordinate of the aim target point.
---@param y number The y coordinate of the aim target point.
---@param z number The z coordinate of the aim target point.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedAimTarget(thePed, x, y, z) end

---Sets an analog state of a specified ped's control, as if they pressed or released it.
---@param thePed ped The ped you wish to set the control state of.
---@param control string The control that you want to set the state of. See control names for a list of possible controls.
---@param state number A float between 0 and 1 indicating the amount the control is pressed.
---@return boolean Returns true if the control state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setPedAnalogControlState(thePed, control, state) end

---Sets the current animation of a player or ped. Not specifying the type of animation will automatically cancel the current one.
---@param thePed ped the player or ped you want to apply an animation to.
---@param block string? the animation block's name.
---@param anim string? the name of the animation within the block.
---@param time integer? how long the animation will run for in milliseconds.
---@param loop boolean? indicates whether or not the animation will loop.
---@param updatePosition boolean? will change the actual coordinates of the ped according to the animation. Use this for e.g. walking animations.
---@param interruptable boolean? if set to false other tasks wont be able to interupt the animation. Setting this to 'false' also gives this function more power to override other animations that are running. For example, squatting after a jump can be terminated.
---@param freezeLastFrame boolean? if set to true after animation the last frame will be frozen, otherwise the animation will end and controls will return.
---@param blendTime integer? how long the animation will mixed with the previous one in milliseconds.
---@param retainPedState boolean? MISSINGPARAMDESC
---@return boolean Returns true if succesful, false otherwise.
---@markup { MTA:SA Shared }
function setPedAnimation(thePed, block, anim, time, loop, updatePosition, interruptable, freezeLastFrame, blendTime, retainPedState) end

---Sets the current animation progress of a player or ped.
---@param thePed ped the player or ped you want to change animation progress.
---@param anim string the animation name currently applied to ped, if not supplied, the animation will stop
---@param progress number current animation progress you want to apply, value from 0.0 to 1.0, if not supplied will default to 0.0
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedAnimationProgress(thePed, anim, progress) end

---Sets the speed of a currently running animation for a particular player or ped.
---@param thePed ped the player or ped you want to change animation speed of.
---@param anim string? the animation name it will affect.
---@param speed number? a float containing the speed between 0.0–1.0 you want to apply to the animation. This limitation may be adjusted in the future, so do not provide speeds outside this boundary. The limit is now 0.0 to 10.0.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedAnimationSpeed(thePed, anim, speed) end

---This function allows you to set the armor value of a ped. Function also added client\-side.
---@param thePed ped the ped whose armor you want to modify.
---@param armor number the amount of armor you want to set on the ped. Valid values are from 0 to 100.
---@return boolean Returns true if the armor was changed succesfully. Returns false if an invalid ped was specified, or the armor value specified is out of acceptable range.
---@markup { MTA:SA Shared }
function setPedArmor(thePed, armor) end

---This function allows you to set player's or ped's bleeding effect.
---@param thePed ped The player or ped whose bleeding effect you want to set of.
---@param bleeding boolean Boolean specifying whether the player or ped is bleeding or not.
---@return boolean Returns true if the bleeding state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setPedBleeding(thePed, bleeding) end

---This function sets the camera rotation of a ped, e.g. where its camera will look at. Don't confuse this with getCameraMatrix, because that function is designed for fixed (scripted) camera moves.
---@param thePed ped The ped whose camera rotation is to be changed.
---@param cameraRotation number The new direction that the ped will walk if you set their forwards control state. If the ped is the local player, it will also change where his camera is looking at if it isn't fixed (i.e. camera target is the local player).
---@return boolean Returns true if the camera rotation was changed, false otherwise.
---@markup { MTA:SA Shared }
function setPedCameraRotation(thePed, cameraRotation) end

---This function controls if a ped can fall of his bike by accident \- namely by banging into a wall.
---@param thePed ped the ped whose knockoffstatus is being changed
---@param canBeKnockedOffBike boolean true or false
---@return boolean
---@markup { MTA:SA Shared }
function setPedCanBeKnockedOffBike(thePed, canBeKnockedOffBike) end

---This function can be used to force the ped to do the choking (coughing) animation until he respawns or toggled off using this function. The animation can not be cancelled by a player it's applied to, and he will not loose health.
---@param thePed ped The ped whose choking status to toggle
---@param choking boolean true to make the ped choke, false to no longer force his choking animation
---@return boolean Returns true if successful, false otherwise (e.g. player handle is invalid)
---@markup { MTA:SA Shared }
function setPedChoking(thePed, choking) end

---This function makes a ped or player press or release a certain control.
---@param thePed ped the ped you want to press or release a control.
---@param control string the name of the control of which to change the state. See control names for a list of valid names.
---@param state boolean the new control state. true means pressed, false is released.
---@return boolean Returns true if successful, false if otherwise.
---@markup { MTA:SA Shared }
function setPedControlState(thePed, control, state) end

---This function sets the driveby state of a ped.
---@param thePed ped The ped element whose state is to be changed.
---@param state boolean A boolean value representing the drive-by state, true meaning enabled and false disabled.
---@return boolean Returns true if the driveby state could be changed, false otherwise.
---@markup { MTA:SA Shared }
function setPedDoingGangDriveby(thePed, state) end

---This function makes a ped enter a vehicle, similar to the enter\_exit control state.
---@param thePed ped The player or ped to enter the vehicle. Note: The player must be the local player. Note: The ped must be synced by the client. Use isElementSyncer clientside to check if the client is syncing. Use setElementSyncer serverside to change the syncer manually.
---@param theVehicle vehicle? MISSINGPARAMDESC
---@param passenger boolean? If set to true , the ped will enter as passenger in the nearest available seat, otherwise he will enter as driver.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedEnterVehicle(thePed, theVehicle, passenger) end

---This function makes a ped exit a vehicle, similar to the enter\_exit control state.
---@param thePed ped The player or ped to exit the vehicle.
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedExitVehicle(thePed) end

---Changes a ped's fighting style. Most styles only change the 'special attack' which is done using the Aim and Enter keys. Function also added client\-side.
---@param thePed ped The ped whose fighting style to change.
---@param style integer The fighting style ID to apply.
---@return boolean Returns true in case of success, false otherwise.
---@markup { MTA:SA Shared }
function setPedFightingStyle(thePed, style) end

---This function makes a ped's footprints bloody.
---@param thePlayer element the ped to give bloody footprints to.
---@param enabled boolean boolean specifying whether or not to have bloody feet.
---@return boolean Returns true if changing the ped's bloody feet status worked.
---@markup { MTA:SA Shared }
function setPedFootBloodEnabled(thePlayer, enabled) end

---This function sets the gravity level of a ped.
---@param thePed ped The ped whose gravity to change.
---@param gravity number MISSINGPARAMDESC
---@return boolean Returns true if the gravity was successfully set, false otherwise
---@markup { MTA:SA Shared }
function setPedGravity(thePed, gravity) end

---With this function, you can set if a ped has a head or not.
---@param thePed ped The ped to check.
---@param headState boolean head state, use true if you want the ped be headless, use false to give back the head.
---@return boolean Returns true if successful, false otherwise
---@markup { MTA:SA Shared }
function setPedHeadless(thePed, headState) end

---Makes a ped turn his head and look at a specific world position or element.
---@param thePed ped the ped to change the lookat of.
---@param x number the x coordinate of the world position to look at.
---@param y number the y coordinate of the world position to look at.
---@param z number the z coordinate of the world position to look at.
---@param time integer? the time, in milliseconds, during which the ped will look at the target. Once this time has elapsed, he will look ahead again like before the function was applied. A time of 0 will immediately stop any lookat. A negative time will make the ped look at the target indefinitely.
---@param target element? if this argument is specified, the position arguments will be mean offsets relative to the target and the ped's gaze will follow the specified element instead. Can be a player, a vehicle, another ped etc.
---@return boolean
---@markup { MTA:SA Shared }
function setPedLookAt(thePed, x, y, z, time, target) end

---This function allows you to set the oxygen level of a ped.
---@param thePed ped the ped whose oxygen level you want to modify.
---@param oxygen number the amount of oxygen you want to set on the ped . Native values are from 0 to 1000. Each of the stamina (22) and underwater stamina (225) stat maximum adds a bonus of 1500. So the maximum oxygen level is 4000.
---@return boolean Returns true if the oxygen level was changed succesfully. Returns false if an invalid ped and/or oxygen level was specified.
---@markup { MTA:SA Shared }
function setPedOxygenLevel(thePed, oxygen) end

---This function allows you to set the value of a specific statistic for a ped. Visual stats (FAT and BODY\_MUSCLE) can only be used on the CJ skin, they have no effect on other skins. When this function is used client\-side, it can only be used on client\-side created peds.
---@param thePed ped the ped whose statistic you want to modify.
---@param stat integer the stat ID.
---@param value number MISSINGPARAMDESC
---@return boolean Returns true if the statistic was changed succesfully. Returns false if an invalid player is specified, if the stat ID/value is out of acceptable range or if the FAT or BODY_MUSCLE stats are used on non-CJ players.
---@markup { MTA:SA Shared }
function setPedStat(thePed, stat, value) end

---This function is used to toggle the health target marker on top of all pedestrians.
---@param enabled boolean A boolean denoting whether we want to enable ( true ) or disable ( false ) the markers.
---@return boolean Returns true if the markers were enabled, false if weren't or if invalid arguments are passed.
---@markup { MTA:SA Shared }
function setPedTargetingMarkerEnabled(enabled) end

---Changes the voice of a ped.
---@param thePed ped the ped whose voice to change.
---@param voiceType string the voice type. See ped voices for possible types.
---@param voiceName string the voice name within the specified type. See ped voices for possible voices.
---@return boolean Returns true when the voice was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setPedVoice(thePed, voiceType, voiceName) end

---Sets the walking style of a ped. A walking style consists of a set of animations that are used for walking, running etc.
---@param thePed ped the ped whose walking style to change.
---@param style integer the walking style to set.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPedWalkingStyle(thePed, style) end

---This function changes the selected weapon slot of a ped.
---@param thePed ped the ped whose weapon slot you want to set. In a clientside script, this cannot be used on remote players.
---@param weaponSlot integer the weapon slot to set.
---@return boolean Returns true if successful in setting the ped's equipped weapon slot, false otherwise.
---@markup { MTA:SA Shared }
function setPedWeaponSlot(thePed, weaponSlot) end

---This function is used to give or take a jetpack from a ped, it won't work if the ped is in a vehicle.
---@param thePed ped The ped you want to give a jetpack to.
---@param state boolean A boolean representing whether to give or take the jetpack.
---@return boolean Returns true if a jetpack was successfully set for the ped, false if setting it failed.
---@markup { MTA:SA Shared }
function setPedWearingJetpack(thePed, state) end

---This function is used to warp or force a ped into a vehicle. There are no animations involved when this happens.
---@param thePed ped The ped which you wish to force inside the vehicle
---@param theVehicle vehicle The vehicle you wish to force the ped into
---@param seat integer? An integer representing the seat ID. 0: Front-left 1: Front-right 2: Rear-left 3: Rear-right
---@return boolean Returns true if the operation is successful, false otherwise.
---@markup { MTA:SA Shared }
function warpPedIntoVehicle(thePed, theVehicle, seat) end

-- Pickup

---This function creates a pickup element, which is placed in the GTA world and can be picked up to retrieve a health, armour or a weapon.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param theType integer This is an integer representing the type of pickup, representing the following types: 0 : Health Pickup 1 : Armour Pickup 2 : Weapon Pickup 3 : Custom Pickup
---@param amount/weapon/model integer MISSINGPARAMDESC
---@param respawnTime integer? How long before the pickup respawns in milliseconds ( This parameter is ignored on the client! )
---@param ammo integer? An integer representing the amount of ammo a pickup contains.  This is only valid when the pickup type is a weapon pickup.
---@return pickup Returns pickup element if the pickup was created succesfully, otherwise returns false .
---@markup { MTA:SA Shared }
function createPickup(x, y, z, theType, amount/weapon/model, respawnTime, ammo) end

---This function retrieves the amount of ammo in a weapon pickup.
---@param thePickup pickup The pickup in which you wish to retrieve the ammo of
---@return integer Returns an integer of the amount of ammo in the pickup, false if the pickup element is invalid, 0 if it's no weapon pickup.
---@markup { MTA:SA Shared }
function getPickupAmmo(thePickup) end

---This function retrieves the amount of health or armor given from a pickup.
---@param thePickup pickup The pickup you wish to retrieve the amount from.
---@return integer Returns an integer of the amount the pickup is set to, false if it's invalid, 0 if it's no health or amor pickup.
---@markup { MTA:SA Shared }
function getPickupAmount(thePickup) end

---Returns the time it takes before a pickup respawns after a player picked it up. The time is specified in milliseconds.
---@param thePickup pickup the pickup you want the respawn time of
---@return integer Returns the respawn time of the pickup if successful, false in case of failure.
---@markup { MTA:SA Shared }
function getPickupRespawnInterval(thePickup) end

---This function retrieves the type of a pickup, either a health, armour or weapon pickup.
---@param thePickup pickup The pickup you wish to retrieve the type of.
---@return integer Returns false if the pickup is invalid, or an integer of the type of the pickup, which include:
---@markup { MTA:SA Shared }
function getPickupType(thePickup) end

---This function retrieves the weapon ID of a weapon pickup.
---@param thePickup pickup The pickup of which you wish to retrieve the weapon
---@return integer Returns the Weapon ID of the pickup, or false if the pickup is invalid.
---@markup { MTA:SA Shared }
function getPickupWeapon(thePickup) end

---This function checks if a pickup is currently spawned (is visible and can be picked up) or not (a player picked it up recently).
---@param thePickup pickup the pickup you want to check.
---@return boolean Returns true if the pickup is spawned, false if it's not spawned or an invalid pickup was specified.
---@markup { MTA:SA Shared }
function isPickupSpawned(thePickup) end

---Sets the time it takes for a pickup to respawn after a player picked it up.
---@param thePickup pickup the pickup to set the respawn time of
---@param ms integer the new respawn time in ms
---@return boolean Returns true if the new respawn time was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setPickupRespawnInterval(thePickup, ms) end

---This function allows changing the type of a pickup to a Weapon, Armour or Health pickup, and allows you to set the health points or the weapon and ammo that the pickup will give.
---@param thePickup pickup The pickup which you wish to change the settings of
---@param theType integer An integer representing the type of pickup. You can choose from: 0 : Health Pickup 1 : Armour Pickup 2 : Weapon Pickup 3 : Custom Pickup
---@param amount/weapon/model integer MISSINGPARAMDESC
---@param ammo integer An integer representing the amount of ammo a pickup contains. This argument is only valid when the pickup type is a Weapon Pickup, and must be specified in that case.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPickupType(thePickup, theType, amount/weapon/model, ammo) end

---This function is used to simulate the player using a pickup
---@param thePickup pickup The pickup element to be picked up/used.
---@param thePlayer player The player to use the pickup.
---@return boolean
---@markup { MTA:SA Shared }
function usePickup(thePickup, thePlayer) end

-- Player

---This function is for returning the number of players in the specified team.
---@param theTeam team The team you wish to retrieve the player count of.
---@return integer Returns an integer containing the number of players in the team, false if it could not be retrieved.
---@markup { MTA:SA Shared }
function countPlayersInTeam(theTeam) end

---This function is used to forcefully show a player's map (F11\).
---@param thePlayer player A player object referencing the specified player
---@param forceOn boolean A boolean value representing whether or not the player's map will be forced on
---@return boolean Returns true if the player's map was forced on, false otherwise.
---@markup { MTA:SA Server/Client }
function forcePlayerMap(thePlayer, forceOn) end

---This function returns a table of all the alive players on the server. Opposite function of getDeadPlayers.
---@return table Returns a table of all the alive players.
---@markup { MTA:SA Shared }
function getAlivePlayers() end

---This function will check if a player is pressing a particular control. Controls are those that affect GTA. If you wish to get the state of another key, use bindKey and a command function.
---@param thePlayer player The player you wish to get the control state of. Do not use this parameter when scripting for client.
---@param controlName string The control that you want to get the state of. See control names for a list of possible controls.
---@return boolean Returns the state of the control, false if the control doesn't exist or if the player is dead.
---@markup { MTA:SA Shared }
function getControlState(thePlayer, controlName) end

---This function returns a table of all currently dead players on the server.
---@return table Returns a table of all the dead players.
---@markup { MTA:SA Shared }
function getDeadPlayers() end

---This function gets the player element of the client running the current script.
---@return player Returns the local player element.
---@markup { MTA:SA Shared }
function getLocalPlayer() end

---This function retrieves a players ASE announce value under a certain key.
---@param thePlayer element This is the Player whos value you want to retrieve.
---@param key string The name of the key.
---@return string This function returns a string containing the requested value if a valid key was specified or false otherwise.
---@markup { MTA:SA Shared }
function getPlayerAnnounceValue(thePlayer, key) end

---This function allows you to check the current blur level of a specified player.
---@param thePlayer player The player whose blur level you want to check.
---@return integer Returns the player's blur level if successful, false if an invalid player was given.
---@markup { MTA:SA Server/Client }
function getPlayerBlurLevel(thePlayer) end

---This function returns the number of players currently connected to the server.
---@return integer Returns the number of players connected to the server as an int .
---@markup { MTA:SA Shared }
function getPlayerCount() end

---This function returns a player element for the player with the name passed to the function.
---@param playerName string A string containing the name of the player you want to reference
---@return player Returns a player element for the player with the nickname provided. If there is no player with that name, false is returned.
---@markup { MTA:SA Shared }
function getPlayerFromName(playerName) end

---This function gets the value of the specified HUD property.
---@param component string The component whose property you want to retrieve. See HUD Components .
---@param property string The name of the property you want to read. See HUD Properties .
---@return mixed Returns different values depending on the type. It can be bool , string , int , int int , or int int int int . If something goes wrong, it returns false .
---@markup { MTA:SA Shared }
function getPlayerHudComponentProperty(component, property) end

---This function returns a string containing the IP address of the player.
---@param thePlayer player The player element you want to get the IP of.
---@return string Returns a string containing the requested players's IP, or false if the player passed to the function is invalid.
---@markup { MTA:SA Shared }
function getPlayerIP(thePlayer) end

---This function gets the amount of time in milliseconds that a players position has not changed.
---@param thePlayer player The player you wish to get the idle time of.
---@return integer Returns the amount of time in milliseconds that a player has been idle, false otherwise.
---@markup { MTA:SA Shared }
function getPlayerIdleTime(thePlayer) end

---This function gets the GUI bounding box of the player map (F11\) texture.
---@return integer | integer | integer | integer This example draws the text "Center of SA map" in the F11 map screen where the center of world coordinates is.
---@markup { MTA:SA Shared }
function getPlayerMapBoundingBox() end

---This function allows to get the opacity of the player map (F11\).
---@return integer Returns an integer with a value from 0 to 255, where 0 is fully transparent and 255 is fully opaque.
---@markup { MTA:SA Shared }
function getPlayerMapOpacity() end

---Returns the amount of money a player currently has.
---@param thePlayer player The player you wish the retrieve the amount of money from.
---@return integer Returns an integer with the amount of money the specified player has, false if the player is invalid.
---@markup { MTA:SA Server/Client }
function getPlayerMoney(thePlayer) end

---This function returns a string containing the name of the specified player.
---@param thePlayer player the player you want to get the name of
---@return string Returns a string containing the requested player's name, or false if the player passed to the function is invalid.
---@markup { MTA:SA Shared }
function getPlayerName(thePlayer) end

---This function gets the current color of a player's name tag as RGB values. These are in the range 0\-255\.
---@param thePlayer player The player whose name tag RGB color values you wish to retrieve.
---@return integer | integer | integer Returns red , green and blue values if an existent player was specified, false otherwise.
---@markup { MTA:SA Shared }
function getPlayerNametagColor(thePlayer) end

---This will allow you to retrieve the name tag a player is currently using.
---@param thePlayer player The person whose name tag you want to retrieve
---@return string Returns a string with the nametag text, false if the player is invalid.
---@markup { MTA:SA Shared }
function getPlayerNametagText(thePlayer) end

---This function returns the ping of a specified player. The ping is the number of milliseconds that data takes to travel from the player's client to the server or vice versa. If a player is using a VPN their ping will still be returned correctly.
---@param thePlayer player The player whose ping you want to determine.
---@return integer Returns the ping as an int , or false if the player is invalid.
---@markup { MTA:SA Shared }
function getPlayerPing(thePlayer) end

---This will allow you to retrieve the player current debug script level.
---@param thePlayer player The person whose debug script level you want
---@return integer Returns an int with the player debug script level, false if the player is invalid.
---@markup { MTA:SA Server/Client }
function getPlayerScriptDebugLevel(thePlayer) end

---This function returns the serial for a specified player.
---@param thePlayer player A player object referencing the specified player.
---@return string Returns the serial as a string if it was found, false otherwise.
---@markup { MTA:SA Server }
function getPlayerSerial(thePlayer) end

---This function gets the current team a player is on.
---@param thePlayer player The player whose team you want to find out.
---@return team Returns a team element representing the team the player is on, false if the player is not part of a team.
---@markup { MTA:SA Shared }
function getPlayerTeam(thePlayer) end

---mta \-\> 1\.6   netcode \-\> 474   number \-\> 352   sortable \-\> 1\.6\.0\-9\.22279\.0   tag \-\> 1\.6\-release\-22279   type \-\> Release
---@param thePlayer player The player whose client version you wish to get.
---@return string Returns a string containing the client version, or false if the player is invalid.
---@markup { MTA:SA Shared }
function getPlayerVersion(thePlayer) end

---This function gets a player's current wanted level. The wanted level is indicated by the amount of stars a player has on the GTA HUD.
---@param thePlayer player The player whose wanted level you wish to get
---@return integer Returns an int from 0 to 6 representing the player's wanted level, false if the player does not exist.
---@markup { MTA:SA Server/Client }
function getPlayerWantedLevel(thePlayer) end

---This function retrieves all the players of the specified team.
---@param theTeam team MISSINGPARAMDESC
---@return table Returns a table of all the players in the team, or an empty one if there are none else false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function getPlayersInTeam(theTeam) end

---This function returns a random player.
---@return player Returns a random player , false if the server is empty.
---@markup { MTA:SA Shared }
function getRandomPlayer() end

---This function adds money to a player's current money amount. To set absolute values, setPlayerMoney can be used.
---@param thePlayer player the player you are giving the money to.
---@param amount integer a positive integer number specifying the amount of money to give to the player.
---@return boolean Returns true if the money was added, or false if invalid parameters were passed.
---@markup { MTA:SA Server/Client }
function givePlayerMoney(thePlayer, amount) end

---This function checks if the local player has showing crosshair.
---@return boolean Returns true if the player has the crosshair visible, false otherwise.
---@markup { MTA:SA Shared }
function isPlayerCrosshairVisible() end

---This function can be used to check whether an hud component is visable or not.
---@param component string The component you wish to check. Valid values are:
---@return boolean Returns true if the component is visable, false if not.
---@markup { MTA:SA Shared }
function isPlayerHudComponentVisible(component) end

---This function checks if the specified player's map (F11\) has been forced on or not.
---@param thePlayer player A player object referencing the specified player
---@return boolean Returns true if the player's map is forced on, false otherwise.
---@markup { MTA:SA Server/Client }
function isPlayerMapForced(thePlayer) end

---This function checks if the local player has their map showing (F11\).
---@return boolean Returns true if the player has the map visible, false otherwise.
---@markup { MTA:SA Shared }
function isPlayerMapVisible() end

---Use this function to check if a player has been muted.
---@param thePlayer player The player you are checking.
---@return boolean Returns true if the player is muted and false otherwise.
---@markup { MTA:SA Shared }
function isPlayerMuted(thePlayer) end

---This function will allow you to determine if a player's name tag is currently showing.
---@param thePlayer player The player whose current name tag condition you want to check
---@return boolean Returns true if the player's name tag is being shown, false otherwise.
---@markup { MTA:SA Shared }
function isPlayerNametagShowing(thePlayer) end

---Added to client side. This function allows you to make the server reveal whether or not voice is currently enabled.
---@return boolean Returns true if the voice is enabled on the server, false otherwise.
---@markup { MTA:SA Shared }
function isVoiceEnabled() end

---This function redirects the player to a specified server.
---@param thePlayer player The player you want to redirect
---@param serverIP string? The IP address (or domain name that resolves to the IP address) of the server you want to redirect the player to. Use an empty string to reconnect to the same server.
---@param serverPort integer? The game port of the server you want to redirect the player to, this is usually 22003. Set to zero to use the same port as the current server.
---@param serverPassword string? The password for the server if it's protected
---@return boolean Returns true if the player was redirected successfully, false if bad arguments were passed.
---@markup { MTA:SA Shared }
function redirectPlayer(thePlayer, serverIP, serverPort, serverPassword) end

---This function will force the specified player to resend their AC info, triggering the onPlayerACInfo event again.
---@param thePlayer player A player object referencing the specified player
---@return boolean Returns true if the AC info will be resent, false otherwise.
---@markup { MTA:SA Shared }
function resendPlayerACInfo(thePlayer) end

---This function will force the specified player to resend their mod info, triggering the onPlayerModInfo event again.
---@param thePlayer player A player object referencing the specified player
---@return boolean Returns true if the mod info will be resent, false otherwise.
---@markup { MTA:SA Shared }
function resendPlayerModInfo(thePlayer) end

---This function resets the specified property to its default value.
---@param component string The component whose property you want to reset. See HUD Components .
---@param property string The name of the property you want to reset. See HUD Properties .
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function resetPlayerHudComponentProperty(component, property) end

---Sets a state of a specified player's control, as if they pressed or released it.
---@param thePlayer player The player you wish to set the control state of.
---@param control string The control that you want to set the state of. See control names for a list of possible controls.
---@param state boolean A boolean value representing whether or not the key will be set to pressed or not.
---@return boolean Returns true if the control state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setControlState(thePlayer, control, state) end

---This function allows you to change ASE announce values for any player using a specified key. As an example this can be used to change the "score" value which will be shown at game\-state.com's server list.
---@param thePlayer element The player whos announce value you wish to change.
---@param key string The key which the value will be stored at.
---@param value string The value you wish to store.
---@return boolean Returns true if the value was set succesfully, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerAnnounceValue(thePlayer, key, value) end

---Sets the motion blur level on the clients screen. Accepts a value between 0 and 255\.
---@param thePlayer player The player whose blur level will be changed.
---@param level integer The level to set the blur to (default: 36)
---@return boolean
---@markup { MTA:SA Server/Client }
function setPlayerBlurLevel(thePlayer, level) end

---This function allows for modifying HUD properties, such as text or bar color, position, size, and more.
---@param component string The component you wish to modify. See HUD Components .
---@param property string The name of the property you want to modify. See HUD Properties .
---@param value mixed The value you want to set.
---@return boolean Returns true if the property was successfully modified, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerHudComponentProperty(component, property, value) end

---This function will show or hide a part of the player's HUD.
---@param thePlayer player The player element for which you wish to show/hide a HUD component
---@param component string The component you wish to show or hide. Valid values are:
---@param show boolean MISSINGPARAMDESC
---@return boolean Returns true if the component was shown or hidden succesfully, false if an invalid argument was specified.
---@markup { MTA:SA Server/Client }
function setPlayerHudComponentVisible(thePlayer, component, show) end

---Sets a player's money to a certain value, regardless of current player money. It should be noted that setting negative values does not work and in fact gives the player large amounts of money.
---@param thePlayer player Which player to set the money of.
---@param amount integer A whole integer specifying the new amount of money the player will have.
---@param instant boolean? If set to true money will be set instantly without counting up/down like in singleplayer.
---@return boolean Returns true if the money was added, or false if invalid parameters were passed.
---@markup { MTA:SA Server/Client }
function setPlayerMoney(thePlayer, amount, instant) end

---Use this function to mute or unmute the player. Muted player won't be able to say anything in chat.
---@param thePlayer player The player you are muting or unmuting.
---@param state boolean Use true to mute and false to unmute the player.
---@return boolean Returns true if the player was successfully muted or unmuted, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerMuted(thePlayer, state) end

---This function changes the specified player's name. Note that any change made to a players name with this function is not saved in their settings so the name change only lasts till they disconnect.
---@param thePlayer player the player that will have its name set.
---@param newName string the new name to set for the player.
---@return boolean Returns true if the player name was changed succesfully, false if invalid arguments are specified.
---@markup { MTA:SA Shared }
function setPlayerName(thePlayer, newName) end

---This allows you to change the RGB color mixture in the name tags of players.
---@param thePlayer player The player whose name tag text you wish to change the color of
---@param r integer The amount of red you want in the mixture of RGB (0-255 is valid)
---@param g integer The amount of green you want in the mixture of RGB (0-255 is valid)
---@param b integer The amount of blue you want in the mixture of RGB (0-255 is valid)
---@return boolean Returns true if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerNametagColor(thePlayer, r, g, b) end

---This function allows you to set whether a player's nametag visibility both clientside and serverside
---@param thePlayer player Define the player whos tag visiblity status you want to change
---@param showing boolean Use true or false to show/hide the tag
---@return boolean Returns true if successful, false otherwise
---@markup { MTA:SA Shared }
function setPlayerNametagShowing(thePlayer, showing) end

---This will change the text of a player's nickname in the world to something besides the nickname he chose. This will not change the player's actual nickname, it only changes the visible aspect inside the world (you will see his original nickname in the scoreboard and will refer to his original name in scripts).
---@param thePlayer player The player whose nickname text you wish to change
---@param text string The new nickname text that will be displayed
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerNametagText(thePlayer, text) end

---This will set player's debug level, equivalent to debugscript \.
---@param thePlayer player The player whose debug level you wish to change
---@param level integer 0: close debug console, 1: only errors, 2: errors and warnings, 3: errors, warnings and info messages
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerScriptDebugLevel(thePlayer, level) end

---This function adds a player to an existing team. The player will automatically be removed from his current team if he's on one.
---@param thePlayer player The player you wish to add to a team.
---@param theTeam team The team you want to add the player to, or nil if you wish to unassign a player from his team.
---@return boolean Returns true if the player was successfully added to the specified team or removed from his previous one, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerTeam(thePlayer, theTeam) end

---This function allows you to change who can hear the voice of a player.
---@param thePlayer element The player you wish to change
---@param broadcastTo mixed MISSINGPARAMDESC
---@return boolean Returns true if the value was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerVoiceBroadcastTo(thePlayer, broadcastTo) end

---This function allows you to mute voices for a player.
---@param thePlayer element The player you wish to change
---@param ignoreFrom mixed Element or table of elements which the player should not hear voices from. Use nil if no one should be ignored.
---@return boolean Returns true if the value was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setPlayerVoiceIgnoreFrom(thePlayer, ignoreFrom) end

---This function is used to set a player's wanted level. The wanted level is indicated by the amount of stars a player has on the GTA HUD.
---@param thePlayer player The player whose wanted level is to be set
---@param stars integer An integer from 0 to 6 representing the wanted level
---@return boolean Returns true if the wanted level was set successfully, false if any of the arguments were invalid.
---@markup { MTA:SA Shared }
function setPlayerWantedLevel(thePlayer, stars) end

---This function spawns the player at an arbitrary point on the map.
---@param thePlayer player The player you want to spawn.
---@param x number The x co-ordinate to spawn the player at.
---@param y number The y co-ordinate to spawn the player at.
---@param z number The z co-ordinate to spawn the player at.
---@param int rotation [? MISSINGPARAMDESC
---@return boolean Returns true if the player was spawned successfully, false otherwise.
---@markup { MTA:SA Shared }
function spawnPlayer(thePlayer, x, y, z, int rotation) end

---This function subtracts money from a player's current money amount.
---@param thePlayer player MISSINGPARAMDESC
---@param amount integer MISSINGPARAMDESC
---@return boolean Returns true if the money was taken, or false if invalid parameters were passed.
---@markup { MTA:SA Server/Client }
function takePlayerMoney(thePlayer, amount) end

---This function forces a client to capture the current screen output and send it back to the server. The image will contain the GTA HUD and the output of any dxDraw functions that are not flagged as 'post GUI'. The image specifically excludes the chat box and all GUI (including the client console). The result is received with the event onPlayerScreenShot.
---@param thePlayer player the player to get the screen capture from.
---@param width integer the width of the capture image.
---@param height integer the height of the capture image.
---@param tag string? A string to help identify the screen capture. The string is passed to the matching onPlayerScreenShot event for your personal convenience.
---@param quality integer? Quality of the final JPEG image from 0 to 100. A lower value can reduce the memory used by the image considerably which will result in faster and less intrusive uploads.
---@param maxBandwidth integer? The amount of client upload bandwidth to use (in bytes per second) when sending the image.
---@param maxPacketSize integer? The maximum size of one packet.
---@return boolean Returns true if the function was successfully, false if invalid arguments are specified.
---@markup { MTA:SA Shared }
function takePlayerScreenShot(thePlayer, width, height, tag, quality, maxBandwidth, maxPacketSize) end

-- Projectile

---This function creates a projectile of the specified type on the specified coordinates.
---@param creator element The element representing creator of the projectile. In case you want the projectile to be synced for everybody creator must be the local player or his vehicle.
---@param weaponType integer int representing the projectile weaponType (characteristics). Valid IDs are:
---@param posX number float starting coordinates for the projectile. They are coordinates of creator by default.
---@param posY number MISSINGPARAMDESC
---@param posZ number MISSINGPARAMDESC
---@param force number? float representing the starting force for throwable projectiles.
---@param target element? element target used for heat seeking rockets.
---@param rotX number float starting rotation for the projectile.
---@param rotY number MISSINGPARAMDESC
---@param rotZ number MISSINGPARAMDESC
---@param velX number float starting velocity for the projectile.
---@param velY number MISSINGPARAMDESC
---@param velZ number MISSINGPARAMDESC
---@param model integer Integer representing the projectile's model, uses default model for weaponType if not specified.
---@return projectile Returns a projectile element if projectile creation was successful. Returns false if unable to create a projectile (wrong weapon ID or projectiles limit was reached).
---@markup { MTA:SA Shared }
function createProjectile(creator, weaponType, posX, posY, posZ, force, target, rotX, rotY, rotZ, velX, velY, velZ, model) end

---This function can be used to detonate a players satchels.
---@param Player player MISSINGPARAMDESC
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Server/Client }
function detonateSatchels(Player) end

---Get the time left before a projectile detonates.
---@param projectile projectile the projectile to get the timer of.
---@return integer Returns the the time in milliseconds to detonation which depending on the projectile type will do different things:
---@markup { MTA:SA Shared }
function getProjectileCounter(projectile) end

---This function returns the creator of the specified projectile.
---@param theProjectile projectile The projectile element which creator you want to retrieve.
---@return element Returns the element which created the projectile if successful, false otherwise.
---@markup { MTA:SA Shared }
function getProjectileCreator(theProjectile) end

---This function returns the force of the specified projectile.
---@param theProjectile projectile The projectile element which force you want to retrieve.
---@return number Returns a float if successful, false otherwise.
---@markup { MTA:SA Shared }
function getProjectileForce(theProjectile) end

---This function returns the target of the specified projectile.
---@param theProjectile projectile The projectile element which target you want to retrieve.
---@return element Returns the element which is the projectile's target if the projectile is valid and can have a target (like a heat-seeking rocket), false otherwise.
---@markup { MTA:SA Shared }
function getProjectileTarget(theProjectile) end

---This function returns the type of the specified projectile.
---@param theProjectile projectile The projectile element which type you want to retrieve.
---@return integer Returns an integer over the type of the projectile or false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function getProjectileType(theProjectile) end

---Will change the projectile counter timer which depending on the projectile type will do different things:
---@param projectile projectile The projectile to edit the timer of.
---@param timeToDetonate integer The time in milliseconds to detonation.
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function setProjectileCounter(projectile, timeToDetonate) end

-- Radar_area

---This function can be used to create custom radar areas on the radar.
---@param startPosX number MISSINGPARAMDESC
---@param startPosY number MISSINGPARAMDESC
---@param sizeX number MISSINGPARAMDESC
---@param sizeY number MISSINGPARAMDESC
---@param r integer? MISSINGPARAMDESC
---@param g integer? MISSINGPARAMDESC
---@param b integer? MISSINGPARAMDESC
---@param a integer? MISSINGPARAMDESC
---@param visibleTo element? MISSINGPARAMDESC
---@return radararea
---@markup { MTA:SA Server/Client }
function createRadarArea(startPosX, startPosY, sizeX, sizeY, r, g, b, a, visibleTo) end

---This function can be used to retrieve the current color of a radar area.
---@param theRadararea radararea The radar area you wish to retrieve the colour of.
---@return integer | integer | integer | integer Returns four integers in RGBA format ( red , green , blue , alpha ), with a maximum value of 255 for each.  Alpha decides transparency where 255 is opaque and 0 is transparent.  Returns false if the radararea is invalid.
---@markup { MTA:SA Shared }
function getRadarAreaColor(theRadararea) end

---This function is used for getting the X and Y size of an existing radar area.
---@param theRadararea radararea The radar area element whose size you wish to get.
---@return number | number Returns two floats indicating the X and Y length of the radar area respectively, false if the radar area is invalid.
---@markup { MTA:SA Shared }
function getRadarAreaSize(theRadararea) end

---This function checks if a 2D position is inside a radar area or not.
---@param theArea radararea The radar area you're checking the position against.
---@param posX number The X coordinate of the position you're checking.
---@param posY number The Y coordinate of the position you're checking.
---@return boolean Returns true if the position is inside the radar area, false if it isn't or if any parameters are invalid.
---@markup { MTA:SA Shared }
function isInsideRadarArea(theArea, posX, posY) end

---This function allows detection of whether a radar area is flashing or not.
---@param theRadararea radararea The radar area you wish to check the state of flashing
---@return boolean Returns true if the radar area is flashing, false if it is not or if it doesn't exist.
---@markup { MTA:SA Shared }
function isRadarAreaFlashing(theRadararea) end

---Sets the color of an existing radar area.
---@param theRadarArea radararea the radararea element whose color you wish to set.
---@param r integer an integer representing the amount of red in the color (0 for no red, 255 for solid red)
---@param g integer an integer representing the amount of green in the color (0 for no green, 255 for solid green)
---@param b integer an integer representing the amount of blue in the color (0 for no blue, 255 for solid blue)
---@param a integer an integer representing the color's alpha (0 for transparent, 255 for opaque)
---@return boolean Returns true if the color was set successfully, false if the radar area doesn't exist or the color arguments are improper.
---@markup { MTA:SA Shared }
function setRadarAreaColor(theRadarArea, r, g, b, a) end

---This function makes an existing radar area flash in transparency.
---@param theRadarArea radararea the radararea element we want to change flashing state of.
---@param flash boolean a bool indicating whether the radar area should flash ( true to flash, false to not flash).
---@return boolean Returns true if the new flash state was successfully set, false if the radar area doesn't exist or invalid arguments were passed.
---@markup { MTA:SA Shared }
function setRadarAreaFlashing(theRadarArea, flash) end

---This function changes the size of an existing radar area.
---@param theRadararea radararea the radararea element whose size is to be changed.
---@param x number the x length of the radar area.
---@param y number the y length of the radar area.
---@return boolean Returns true if the size was set successfully, false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function setRadarAreaSize(theRadararea, x, y) end

-- Resource

---Aborts a fetchRemote or callRemote request.
---@param theRequest request returned from fetchRemote , callRemote or getRemoteRequests
---@return boolean Returns true on success, false when invalid request was provided
---@markup { MTA:SA Shared }
function abortRemoteRequest(theRequest) end

---This function adds a new empty config file to an existing resource.
---@param filePath string The filepath of the file to be created in the following format: ":resourceName/path" . 'resourceName' is the name of the resource the file is in, and 'path' is the path from the root directory of the resource to the file.
---@param filetype string? a string indicating whether the file is serverside ("server") or clientside ("client").
---@return xmlnode Returns the new config's root xmlnode if the config was added successfully, false otherwise.
---@markup { MTA:SA Shared }
function addResourceConfig(filePath, filetype) end

---This function adds a new empty mapfile to an existing resource.
---@param filePath string The filepath of the resource map in the following format: ":resourceName/path" . 'resourceName' is the name of the resource the map file will be in, and 'path' is the path from the root directory of the resource to the file.
---@param dimension integer? the dimension in which the map's objects will be placed.
---@return xmlnode Returns the new map's root xmlnode if the map was added successfully, false otherwise.
---@markup { MTA:SA Shared }
function addResourceMap(filePath, dimension) end

---This function is used to call a function from another resource (which must be running).
---@param theResource resource This is a resource pointer which refers to the resource you are calling a function from.
---@param theFunction string This is a string with the name of the function which you want to call.
---@param arguments... unknown MISSINGPARAMDESC
---@return var... Returns anything that the designated function has returned, if the function has no return, nil is returned. If the function does not exist, is not exported, or the call was not successful it will return false.
---@markup { MTA:SA Shared }
function call(theResource, theFunction, arguments...) end

---This function allows you to call functions that have been exported with HTTP access by other MTA servers. The calls are asynchronous so you do not get an immediate result from the call, instead a callback function you specify is called when the call returns.
---@param host string This is a host name - including the HTTP port - of the server you wish to connect to.
---@param queueName string? MISSINGPARAMDESC
---@param connectionAttempts integer? Number of times to retry if the remote host does not respond. In the case of a non-responding remote server, each connection attempt will timeout after 6 seconds. Therefore, the default setting of 10 connection attempts means it will be 60 seconds before your script gets a callback about the error. Reducing this value to 2 for example, will decrease that period to 12 seconds
---@param connectTimeout integer? Number of milliseconds each connection attempt will take before timing out
---@param resourceName string This is a name of the resource that contains the exported function you want to call.
---@param functionName string This is a string with the name of the function which you want to call.
---@param callbackFunction callback This is the function that should receive the data returned from the remote function call. The argument list should match the format of the data returned. The callback function will be passed a string containing "ERROR" followed by an integer indicating the error code when an error occurs calling the function. A list of error codes can be found here .
---@param arguments... unknown MISSINGPARAMDESC
---@return boolean Returns true if the function has been called, false otherwise.
---@markup { MTA:SA Shared }
function callRemote(host, queueName, connectionAttempts, connectTimeout, resourceName, functionName, callbackFunction, arguments...) end

---This function copies a specified resource with a new name.
---@param theResource resource the resource which is going to be copied
---@param newResourceName string the name that the copied resource will receive
---@param organizationalDir string A string containing the path where the resource should be copied to (e.g. "[gamemodes]/[amx]").
---@return resource Returns the resource element of the copy. Returns false if the arguments are incorrect.
---@markup { MTA:SA Shared }
function copyResource(theResource, newResourceName, organizationalDir) end

---This function creates an new, empty resource. This creates a directory matching the name you specify on disk, then creates an empty meta.xml file with a \ element in it.
---@param resourceName string The name of the new resource. This should be a valid file name. It's recommended that you do not have spaces or non-ASCII characters in resource names.
---@param organizationalDir string A string containing the path where the resource should be created (e.g. "[gamemodes]/[amx]").
---@return resource Returns the resource element of the new resource if successful, false otherwise. This could fail if the resource name already is in use, if a directory already exists with the name you've specified (but this isn't a valid resource) or if the name you specify isn't valid. It could also fail if the disk was full or for other similar reasons.
---@markup { MTA:SA Shared }
function createResource(resourceName, organizationalDir) end

---This function deletes a resource from the MTA memory and moves it to the /resources\-cache/trash/ directory.
---@param resourceName string The name of resource to delete.
---@return boolean Returns true if the resource has been deleted successfully, false otherwise.
---@markup { MTA:SA Shared }
function deleteResource(resourceName) end

---This function allows you to post and receive data from HTTP servers. The calls are asynchronous so you do not get an immediate result from the call, instead a callback function you specify is called when the download completes.
---@param URL string A full URL in the format http://hostname/path/file.ext . A port can be specified with a colon followed by a port number appended to the hostname.
---@param options table A table containing any request options: queueName: Name of the queue to use. Any name can be used. If not set, the queue name is "default". Requests in the same queue are processed in order, one at a time. connectionAttempts: Number of times to retry if the remote host does not respond. (Defaults to 10) connectTimeout: Number of milliseconds each connection attempt will take before timing out. (Defaults to 10000) postData: A string specifying any data you want to send to the remote HTTP server. postIsBinary : A boolean specifying if the data is text, or binary. (Defaults to false) method: A string specifying the request method. (Defaults to GET or POST) headers: A table containing HTTP request headers. e.g.{ Pragma="no-cache" } maxRedirects: An integer limiting the number of HTTP redirections to automatically follow. (Defaults to 8) username: A string specifying the username for protected pages. password: A string specifying the password for protected pages. formFields: A table containing form items to submit. (for POST method only) e.g.{ name="bob", email=" [email protected] " }
---@param callbackFunction callback This is the function that should receive the data returned from the remote server. The callback argument list should be: responseData - A string containing the remote response responseInfo - A table containing: success - A boolean indicating if the request was successful. statusCode - An integer status/error code. See the list of possible error values below. headers - A table containing the HTTP response headers arguments... - The arguments that were passed into fetchRemote
---@param callbackArguments table A table containing arguments you may want to pass to the callback.
---@return boolean Returns a request value which can be used with getRemoteRequestInfo or abortRemoteRequest
---@markup { MTA:SA Shared }
function fetchRemote(URL, options, callbackFunction, callbackArguments) end

---Gets informations of an fetchRemote or callRemote request info.
---@param theRequest request returned from fetchRemote , callRemote or getRemoteRequests
---@param postDataLength integer? MISSINGPARAMDESC
---@return table Returns a table when valid, false otherwise The table contains:
---@markup { MTA:SA Shared }
function getRemoteRequestInfo(theRequest, postDataLength) end

---Gets all fetchRemote and callRemote requests currently running.
---@param theResource resource? the resource to get all requests from
---@return table Returns a table with all requests, false if an invalid resource was provided
---@markup { MTA:SA Shared }
function getRemoteRequests(theResource) end

---This function retrieves the ACL request section from the meta.xml file of the given resource.
---@param theResource resource the resource to get the ACL requests for.
---@return table Returns a table with the ACL requests for the given resource, or false if the resource is not valid. A valid resource with no ACL requests will return an empty table.
---@markup { MTA:SA Shared }
function getResourceACLRequests(theResource) end

---This function is used to return the root node of a configuration file. Config files must be predefined in a resource's meta file. An alternative way to load XML files is to use xmlLoadFile.
---@param filePath string The filepath of the file in the following format: ":resourceName/path" . 'resourceName' is the name of the resource the file is in, and 'path' is the path from the root directory of the resource to the file.
---@return xmlnode Returns the root node of the specified configuration file. If the file is corrupted, not defined in the meta file or doesn't exist, returns false.
---@markup { MTA:SA Shared }
function getResourceConfig(filePath) end

---This function retrieves the dynamic element root of a specified resource. The dynamic element root is the parent of elements that are created by scripts (e.g. with createObject) unless they specify a different parent.
---@param theResource resource the resource of which dynamic element root we want.
---@return element Returns an element of the resource's dynamic element root if the resource specified was valid and active (currently running), false otherwise.
---@markup { MTA:SA Shared }
function getResourceDynamicElementRoot(theResource) end

---Returns a table containing the names of the functions that a resource exports. It will return the exports of the current resource if there is no argument passed in.
---@param resource theResource [? MISSINGPARAMDESC
---@return table Returns a table of function names if successful, false otherwise.
---@markup { MTA:SA Shared }
function getResourceExportedFunctions(resource theResource) end

---This function is used to retrieve a resource from its name. A resource's name is the same as its folder or file archive name on the server (without the extension).
---@param resourceName string the name of the resource you wish to get.
---@return resource Returns the resource with the specified name, or false if no resource of that name exists. Note that clientside this will also return false for resources that are in the loaded state, since the client is unaware of resources that have not been started.
---@markup { MTA:SA Shared }
function getResourceFromName(resourceName) end

---This function retrieves a resource's GUI element. The resource's GUI element is the element in the element tree which is the default parent of all GUI elements that belong to a particular resource. It has a predefined variable called guiRoot, and each resource has one of these. You can attach event handlers to this element to easily capture events that originate from your resource (and global events that originate from the root element).
---@param resource theResource [? MISSINGPARAMDESC
---@return element Returns the root GUI element that contains all the other GUI elements.
---@markup { MTA:SA Shared }
function getResourceGUIElement(resource theResource) end

---This function retrieves the value of any attribute in a resource info tag.
---@param theResource resource the resource we are getting the info from.
---@param attribute string the name of the attribute we want info about.
---@return string Returns a string with the attribute value if it exists, false otherwise.
---@markup { MTA:SA Shared }
function getResourceInfo(theResource, attribute) end

---Used to check the last starting time and date of a resource
---@param theResource resource The resource of which you'd like to check the last starting time.
---@return integer If successful, returns the UNIX timestamp when the resource was last started, or the string "never" if the resource has not been started yet, otherwise false. Use in conjunction with getRealTime in order to retrieve detailed information.
---@markup { MTA:SA Shared }
function getResourceLastStartTime(theResource) end

---This function retrieves the reason why a resource failed to start.
---@param theResource resource The resource you wish to check.
---@return string If the resource failed to load, returns a string with the failure reason in it. If it loaded successfully, returns an empty string. Returns false if the resource doesn't exist.
---@markup { MTA:SA Shared }
function getResourceLoadFailureReason(theResource) end

---Gets the date and time at which a resource was last loaded in the server.
---@param res resource the resource you want to know the load time of.
---@return integer If successful, returns the UNIX timestamp when the resource was loaded, otherwise false. Use in conjunction with getRealTime in order to retrieve detailed information.
---@markup { MTA:SA Shared }
function getResourceLoadTime(res) end

---This function retrieves the root element of a certain map") in a specified resource.
---@param theResource resource the resource where the map is located
---@param mapName string name of the maps which root element we want to retrieve, file extension is required
---@return element Returns an the resource's map root element if the map exists and resource specified was valid and active (currently running), false otherwise.
---@markup { MTA:SA Shared }
function getResourceMapRootElement(theResource, mapName) end

---This function gets the name of the specified resource.
---@param resource res [? MISSINGPARAMDESC
---@return string Returns a string with the resource name in it, or false if the resource does not exist.
---@markup { MTA:SA Shared }
function getResourceName(resource res) end

---This function returns the organizational file path (e.g. \[admin]) of a resource.
---@param theResource resource the resource of which you want to know the organizational path
---@return string Returns the organizational folder name of the resource . It returns empty string if the resource is on root resources folder. It returns false if the resource could not be found.
---@markup { MTA:SA Shared }
function getResourceOrganizationalPath(theResource) end

---This function retrieves a resource's root element. The resource's root element is the element in the element tree which is the parent of all elements that belong to a particular resource (except for elements specifically created elsewhere). You can attach event handlers to this element to easily capture events that originate from your resource (and global events that originate from the root element).
---@param theResource [resource? the resource whose root element we are getting. If not specified, assumes the current resource. (the resource returned from getThisResource )
---@return element Returns an element representing the resource's root, false if the specified resource doesn't exist.
---@markup { MTA:SA Shared }
function getResourceRootElement(theResource) end

---This function returns the state of a given resource
---@param theResource resource The resource you wish to get the state of.
---@return string If successful returns a string with the resource state in it, false otherwise. The state can be one of:
---@markup { MTA:SA Shared }
function getResourceState(theResource) end

---This function retrieves a table of all the resources that exist on the server.
---@return table Returns a table of resources.
---@markup { MTA:SA Shared }
function getResources() end

---This function retrieves the resource from which the function call was made.
---@return resource Returns the resource in which the current script is.
---@markup { MTA:SA Shared }
function getThisResource() end

---Checks whether the specified resource is archived. (Currently running from a ZIP file)
---@param resourceElement resource The resource to check.
---@return boolean Returns true if the selected resource is archived, false if it is not archived, and nil if some kind of problem occurred.
---@markup { MTA:SA Shared }
function isResourceArchived(resourceElement) end

---This will check if a resource is currently protected, as defined in mtaserver.conf.
---@param theResource resource the resource to check
---@return boolean Returns true if the resource is 'protected', false otherwise.
---@markup { MTA:SA Shared }
function isResourceProtected(theResource) end

---This function finds new resources and checks for changes to the current ones.
---@param refreshAll boolean? If true MTA will check for changes in all resources. If false , MTA will only check for new resources and try to reload resources with errors
---@param targetResource resource? MISSINGPARAMDESC
---@return boolean Returns true if refresh was successful, false otherwise.
---@markup { MTA:SA Shared }
function refreshResources(refreshAll, targetResource) end

---This function removes a file from the resource.
---@param theResource resource The resource element.
---@param fileName string The filename what you wan't to delete.
---@return boolean Returns true if file was deleted, otherwise false if the resource is in use or the file doesn't exist.
---@markup { MTA:SA Shared }
function removeResourceFile(theResource, fileName) end

---This function renames a resource.
---@param theResource string/resource The name of resource or the resource you want to rename.
---@param newResourceName string The name of what the resource should be renamed to.
---@param organizationalPath string If you want to store the new resource inside a category.
---@return boolean Returns true if the resource has been renamed successfully, false otherwise. This could fail if the resource name already is in use, if a directory already exists with the name you've specified (but this isn't a valid resource) or if the name you specify isn't valid. It could also fail if the disk was full or for other similar reasons. Won't work on a started resource or if the resource is not loaded (not known by MTA (use /refresh))
---@markup { MTA:SA Shared }
function renameResource(theResource, newResourceName, organizationalPath) end

---This function restarts a running resource. Restarting will destroy all the elements that the resource has created (as stopping the resource does).
---@param theResource resource the resource you want to restart.
---@param persistent boolean? Unused
---@param configs boolean? Reload configs?
---@param maps boolean? Reload maps?
---@param scripts boolean? Reload (server) scripts?
---@param html boolean? Reload html files (for resource web access)?
---@param clientConfigs boolean? Reload client configs?
---@param clientScripts boolean? Reload client scripts?
---@param clientFiles boolean? Reload files?
---@return boolean Returns true if the resource was restarted, false if the resource wasn't running, or an invalid resource was passed.
---@markup { MTA:SA Shared }
function restartResource(theResource, persistent, configs, maps, scripts, html, clientConfigs, clientScripts, clientFiles) end

---This function sets the value of any attribute in a resource info tag.
---@param theResource resource the resource we are setting info to.
---@param attribute string the name of the attribute that is to be set.
---@param value string the value of this attribute
---@return boolean Returns true if the info was successfully set, false otherwise
---@markup { MTA:SA Shared }
function setResourceInfo(theResource, attribute, value) end

---This function starts a resource either persistently or as a dependency of the current resource. If you start the resource persistently, the resource will run until stopped either using stopResource or by the server admin. A resource started as a dependency will stop when your resource stops, if no other resources have it as a depdendency. This is the same effect as using an include in your meta.xml file.
---@param resourceToStart resource The resource that should be started.
---@param persistent boolean? A boolean specifying if the resource should continue to run even after the current resource has been stopped or not. If this is true then the resource will run until another resource or user terminates it or the server shuts down. If this is false then resourceToStart will stop when thisResource stops.
---@param startIncludedResources boolean? A boolean specifying if the resource's included/dependant resources will be started.
---@param loadServerConfigs boolean? A boolean specifying if server side config (XML) files should be loaded with the resource.
---@param loadMaps boolean? A boolean specifying if any .map files will be started with the resource.
---@param loadServerScripts boolean? A boolean specifying if server side script files should be started alongside the resource.
---@param loadHTML boolean? A boolean specifying if HTML files should be started alongside the resource.
---@param loadClientConfigs boolean? A boolean specifying if client configs should be loaded alongside the resource.
---@param loadClientScripts boolean? A boolean specifying if client scripts should be loaded and started alongside the resource.
---@param loadFiles boolean? A boolean specifying if client-side files should be loaded alongside the resource.
---@return boolean Returns true if the resource has been started successfully, false otherwise.
---@markup { MTA:SA Shared }
function startResource(resourceToStart, persistent, startIncludedResources, loadServerConfigs, loadMaps, loadServerScripts, loadHTML, loadClientConfigs, loadClientScripts, loadFiles) end

---This function stops a running resource.
---@param theResource resource the resource that should be stopped.
---@return boolean Returns true if the resource was stopped, false if the stopping failed, or an invalid resource was passed.
---@markup { MTA:SA Shared }
function stopResource(theResource) end

---This function changes the access for one ACL request of the given resource.
---@param theResource resource the resource to set the ACL request for.
---@param rightName string a string with the name of the right to set the access for. This has to match an existing ACL request.
---@param access boolean a boolean value setting the access. True is for allow, and false for deny.
---@param byWho string? a string value to identity who is changing the setting.
---@return boolean Returns true if the setting was changed, or false if no change was required or there was a problem with the arguments.
---@markup { MTA:SA Shared }
function updateResourceACLRequest(theResource, rightName, access, byWho) end

-- SVG

---Creates an svg from size (blank document), filepath or raw data.
---@param width integer Desired width, preferably power of two (16, 32, 64 etc.), maximum is 4096
---@param height integer MISSINGPARAMDESC
---@param string pathOrRawData, function callback ( element svg [, MISSINGPARAMDESC
---@return svg This is a basic example of how you can create an SVG from raw data (or path) and draw it with dxDrawImage via onClientRender .
---@markup { MTA:SA Shared }
function svgCreate(width, height, string pathOrRawData, function callback ( element svg) end

---Gets the underlying XML document from an SVG element.
---@param svgElement svg The svg element you want to get the XML document of.
---@return xmlnode See the example for svgSetDocumentXML
---@markup { MTA:SA Shared }
function svgGetDocumentXML(svgElement) end

---Gets the underlying XML document from an SVG element.
---@param svgElement svg The svg you want to get the size of.
---@return integer | integer See the example for svgSetSize .
---@markup { MTA:SA Shared }
function svgGetSize(svgElement) end

---Sets the underlying XML document of an SVG element.
---@param svgElement svg The svg element you want to set the XML document of
---@param xmlDocument xmlnode An xmlnode containing the data to be set on the SVG document
---@param function callback ( element svg [, MISSINGPARAMDESC
---@return boolean This example creates an svg element including a keybind (F2) to add a child rect node, with the use of callbacks to notify in debugscript when the SVG was updated.
---@markup { MTA:SA Shared }
function svgSetDocumentXML(svgElement, xmlDocument, function callback ( element svg) end

---Sets the underlying XML document from an SVG element.
---@param svgElement svg The svg element you want to set the size of.
---@param width integer Desired width, preferably power of two (16, 32, 64 etc.), maximum is 4096
---@param height integer MISSINGPARAMDESC
---@param function callback ( element svg [, MISSINGPARAMDESC
---@return boolean This example creates an svg element including a keybind (F2) to resize the SVG randomly, with the use of callbacks to notify in debugscript when the SVG was updated.
---@markup { MTA:SA Shared }
function svgSetSize(svgElement, width, height, function callback ( element svg) end

---Sets the update callback of an svg element
---@param svgElement svg The svg you want to set the callback function of.
---@param / bool callback function MISSINGPARAMDESC
---@return boolean For example of callback usage, see svgSetSize or svgSetDocumentXML .
---@markup { MTA:SA Shared }
function svgSetUpdateCallback(svgElement, / bool callback) end

-- Searchlight

---This function creates a searchlight. A searchlight is a spotlight which looks like the one available in the Police Maverick.
---@param startX number the X coordinate where the searchlight light cone will start.
---@param startY number the Y coordinate where the searchlight light cone will start.
---@param startZ number the Z coordinate where the searchlight light cone will start.
---@param endX number the X coordinate of the direction where the searchlight will point to.
---@param endY number the Y coordinate of the direction where the searchlight will point to.
---@param endZ number the Z coordinate of the direction where the searchlight will point to.
---@param startRadius number the radius of the searchlight's light cone in its beginning.
---@param endRadius number the radius of the searchlight's light cone in its end.
---@param renderSpot boolean? if true , the searchlight will lighten the surface where it ends.
---@return searchlight If every argument is correct and the limit of 1000 searchlights has not been reached, this function returns a searchlight element . Otherwise, it returns false .
---@markup { MTA:SA Shared }
function createSearchLight(startX, startY, startZ, endX, endY, endZ, startRadius, endRadius, renderSpot) end

---This function gets the end position of a searchlight element.
---@param theSearchLight searchlight the searchlight to get the position where the searchlight's light cone ends.
---@return float float float If the specified searchlight element is valid, this function will return three float , which are the three coordinates of searchlight's end position. If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function getSearchLightEndPosition(theSearchLight) end

---This function gets the end radius of a searchlight element.
---@param theSearchLight searchlight the searchlight to get the radius of the searchlight's light cone in its end.
---@return number If the specified searchlight element is valid, this function will return one float , which is the searchlight's end radius. If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function getSearchLightEndRadius(theSearchLight) end

---This function gets the start position of a searchlight element.
---@param theSearchLight searchlight the searchlight to get the position where the searchlight's light cone starts.
---@return number | number | number If the specified searchlight element is valid, this function will return three float , which are the three coordinates of searchlight's start position. If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function getSearchLightStartPosition(theSearchLight) end

---This function gets the start radius of a searchlight element.
---@param theSearchLight searchlight the searchlight to get the radius of the searchlight's light cone in its beginning.
---@return number If the specified searchlight element is valid, this function will return one float , which is the searchlight's start radius. If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function getSearchLightStartRadius(theSearchLight) end

---This function sets the end position of a searchlight element.
---@param theSearchLight searchlight the searchlight to modify the property of.
---@param endX number the X coordinate where the searchlight light cone will end.
---@param endY number the Y coordinate where the searchlight light cone will end.
---@param endZ number the Z coordinate where the searchlight light cone will end.
---@return boolean If every argument is correct, this function returns true . If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function setSearchLightEndPosition(theSearchLight, endX, endY, endZ) end

---This function sets the end radius of a searchlight element.
---@param theSearchlight searchlight MISSINGPARAMDESC
---@param endRadius number the radius of the searchlight's light cone in its end.
---@return boolean If every argument is correct, this function returns true . If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function setSearchLightEndRadius(theSearchlight, endRadius) end

---This function sets the start position of a searchlight element.
---@param theSearchLight searchlight the searchlight to modify the property of.
---@param startX number the X coordinate where the searchlight light cone will start.
---@param startY number the Y coordinate where the searchlight light cone will start.
---@param startZ number the Z coordinate where the searchlight light cone will start.
---@return boolean If every argument is correct, this function returns true . If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function setSearchLightStartPosition(theSearchLight, startX, startY, startZ) end

---This function sets the start radius of a searchlight element.
---@param theSearchlight searchlight MISSINGPARAMDESC
---@param startRadius number the radius of the searchlight's light cone in its beginning.
---@return boolean If every argument is correct, this function returns true . If not, it will return false plus an error message.
---@markup { MTA:SA Shared }
function setSearchLightStartRadius(theSearchlight, startRadius) end

-- Server

---This function returns the maximum number of player slots on the server.
---@return integer Returns the maximum number of players allowed on the server.
---@markup { MTA:SA Shared }
function getMaxPlayers() end

---This function retrieves server settings which are usually stored in the mtaserver.conf file.
---@param name string MISSINGPARAMDESC
---@return mixed Returns a string containing the current value for the named setting, table if name is module or false if the setting does not exist. If the setting name is serverip , may return the string "auto" on local servers.
---@markup { MTA:SA Shared }
function getServerConfigSetting(name) end

---This function retrieves the server's HTTP port.
---@return integer An integer corresponding to the server's HTTP port.
---@markup { MTA:SA Shared }
function getServerHttpPort() end

---This function returns the remote address as reported by the first master server that provides this value.
---@return string A string containing the remote address of the server as reported, once it's available.
---@markup { MTA:SA Shared }
function getServerIpFromMasterServer() end

---This function retrieves the server's name.
---@return string A string containing the server's name.
---@markup { MTA:SA Shared }
function getServerName() end

---This function returns the current password required to join the server.
---@return string Returns the current server password as a string if it has a password, if not it returns nil .
---@markup { MTA:SA Shared }
function getServerPassword() end

---This function retrieves the server's port.
---@return integer An integer corresponding to the server's port.
---@markup { MTA:SA Shared }
function getServerPort() end

---This function retrieves whether San Andreas game glitches are enabled or not, set by using setGlitchEnabled
---@param glitchName string the name of the property to set. Possible values are:
---@return boolean Returns true if if the glitch was enabled, or false if it is disabled.
---@markup { MTA:SA Shared }
function isGlitchEnabled(glitchName) end

---This function enables or disables glitches that are found in the original Single Player game that can be used to gain an advantage in multiplayer.
---@param glitchName string the name of the property to set. Possible values are:
---@param enable boolean MISSINGPARAMDESC
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setGlitchEnabled(glitchName, enable) end

---This function sets the maximum number of player slots on the server.
---@param slots integer Maximum number of player slots on the server.
---@return boolean Returns true if number of player slots was successfully changed, false or nil otherwise.
---@markup { MTA:SA Shared }
function setMaxPlayers(slots) end

---This function sets server settings which are stored in the mtaserver.conf file.
---@param name string MISSINGPARAMDESC
---@param value string The value of the setting
---@param bSave boolean? Set to true to make the setting permanent, or false for use only until the next server restart.
---@return boolean Returns true if the setting was successfully set, or false otherwise.
---@markup { MTA:SA Shared }
function setServerConfigSetting(name, value, bSave) end

---This function changes the password required to join the server to the given string.
---@param thePassword string The new server password you want. Pass nil or an empty string to remove the password.
---@return boolean Returns true if the password was successfully changed or removed, false or nil otherwise.
---@markup { MTA:SA Shared }
function setServerPassword(thePassword) end

---This function shuts down the server.
---@param reason string? the reason why the server has been shutdown.
---@param exitCode number? MISSINGPARAMDESC
---@return boolean Returns false if it was not possible to shut down the server.
---@markup { MTA:SA Shared }
function shutdown(reason, exitCode) end

-- Settings_registry

---This function gets a setting's value, or a group of settings' values, from the settings registry.
---@param settingName string MISSINGPARAMDESC
---@return var Returns the value of the setting if a single setting was specified and found, or a table (in associative-array form) containing:
---@markup { MTA:SA Shared }
function get(settingName) end

---This function is used to save arbitrary data under a certain name on the settings registry.
---@param settingName string The name of the setting you want to set. See setting names for information on settings names.
---@param value var The value to set the setting to. This can be any Lua data type, except for functions, most userdata (only resources can't be stored) and threads.
---@return boolean Returns true if the setting has been set, false if you do not have access to the setting or invalid arguments were passed.
---@markup { MTA:SA Shared }
function set(settingName, value) end

-- Team

---This function is for creating a new team, which can be used to group players. Players will not join the team until they are respawned.
---@param teamName string A string representing the teams name.
---@param colorR integer? An integer representing the red color value.
---@param colorG integer? An integer representing the green color value.
---@param colorB integer? An integer representing the blue color value.
---@return team Returns a team element if it was successfully created, false if invalid arguments are passed or a team with that name already exists.
---@markup { MTA:SA Shared }
function createTeam(teamName, colorR, colorG, colorB) end

---This function retrieves the color of a team.
---@param theTeam team The team you want to get the color of.
---@return integer | integer | integer Returns 3 integers representing the red, green, and blue color components of the team if it's valid, false otherwise.
---@markup { MTA:SA Shared }
function getTeamColor(theTeam) end

---This function tells you if friendly fire is turned on for the specified team.
---@param theTeam team The team object that will be checked
---@return boolean Returns true if friendly fire is on for the specified team, false if it is turned off or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function getTeamFriendlyFire(theTeam) end

---This function finds a team element using the provided team name.
---@param teamName string A string determining the name of the team you wish to find.
---@return team Returns the team element if it was found, false otherwise.
---@markup { MTA:SA Shared }
function getTeamFromName(teamName) end

---This function gets the team name of a team object.
---@param theTeam team The team you want to retrieve the name of.
---@return string Returns a string representing the team's name if the team object was valid, false otherwise.
---@markup { MTA:SA Shared }
function getTeamName(theTeam) end

---This function is for setting the color of a specified team. This color is shown, for example, in the team players' nametags.
---@param theTeam team The team you want to change the color of.
---@param colorR integer An integer representing the red color value, from 0 to 255.
---@param colorG integer An integer representing the green color value, from 0 to 255.
---@param colorB integer An integer representing the blue color value, from 0 to 255.
---@return boolean Returns true if the team is valid and the color is different, otherwise false .
---@markup { MTA:SA Shared }
function setTeamColor(theTeam, colorR, colorG, colorB) end

---This function sets the friendly fire value for the specified team.
---@param theTeam team The team that will have friendly fire set
---@param friendlyFire boolean A boolean denoting whether the players from the same team can kill each other ( true ) or whether the players can't kill each other ( false ).
---@return boolean Returns true if the friendly fire value is set for the specified team, false if the friendly fire value can't be set for the specified team or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function setTeamFriendlyFire(theTeam, friendlyFire) end

---This function is used to set a team's name.
---@param theTeam team The team you want to change the name of.
---@param newName string A string representing the name you want the team to be called.
---@return boolean Returns true if the team was valid and the name was changed, false otherwise.
---@markup { MTA:SA Shared }
function setTeamName(theTeam, newName) end

-- Text

---A text display is like a canvas that can contain many items of text. Each display can be seen by multiple observers (players) and each player can see multiple displays.
---@return textdisplay
---@markup { MTA:SA Shared }
function textCreateDisplay() end

---This function creates a text item. A text item represents a single area of text, much like a label does in standard GUI programming. A text item can only be seen by players if it is added to a textdisplay using textDisplayAddText. Each text item can be added to multiple displays, if need be.
---@param text string A string of text you want to display
---@param x number A floating point number between 0.0 and 1.0 indicating how far across the screen the text should be shown, as a percentage of the width, from the left hand side.
---@param y number A floating point number between 0.0 and 1.0 indicating how far down the screen the text should be shown, as a percentage of the height, from the top.
---@param priority string How important it is that this text should be up to date on client's screens. Valid values are: "low", "medium", "high" which are aliases for 0, 1 and 2 respectively.
---@param red integer? A value between 0 and 255 indicating how red the text should be.
---@param green integer? A value between 0 and 255 indicating how green the text should be.
---@param blue integer? A value between 0 and 255 indicating how blue the text should be.
---@param alpha integer? A value between 0 and 255 indicating how transparent the text should be, with 0 being fully transparent, and 255 being opaque.
---@param scale number? A floating point value indicating the scale of the text. The default is 1.0, which is around 12pt.
---@param alignX string? A string representing the X-alignment of the text. ("left", "center", "right")
---@param alignY string? A string representing the Y-alignment of the text. ("top", "center", "bottom")
---@param shadowAlpha integer? A value between 0 and 255 indicating how dark the drop shadow should be.
---@return textitem Returns a textitem object.
---@markup { MTA:SA Shared }
function textCreateTextItem(text, x, y, priority, red, green, blue, alpha, scale, alignX, alignY, shadowAlpha) end

---This function destroys a text display and will unlink all the textitems on it. This does not stop the textitems existing, but anyone who was observing the textitems through this display will stop seeing them.
---@param display textdisplay This is the textdisplay that you wish to have destroyed.
---@return boolean
---@markup { MTA:SA Shared }
function textDestroyDisplay(display) end

---This function destroys a textitem object.
---@param theTextitem textitem The text item you wish to destroy.
---@markup { MTA:SA Shared }
function textDestroyTextItem(theTextitem) end

---This function adds a player as an observer of a textdisplay. This allows the player to see any textitems that the textdisplay contains.
---@param display textdisplay The textdisplay to add the player to as an observer.
---@param playerToAdd player The player that should observe the textdisplay .
---@markup { MTA:SA Shared }
function textDisplayAddObserver(display, playerToAdd) end

---This function adds a textitem to a textdisplay. This allows any observers of the textdisplay to see the textitem.
---@param displayToAddTo textdisplay The textdisplay to add the textitem to.
---@param itemToAdd textitem The textitem to add to the display.
---@markup { MTA:SA Shared }
function textDisplayAddText(displayToAddTo, itemToAdd) end

---This function can be used to retrieve all the players currently observing a specified textdisplay.
---@param theDisplay textdisplay The textdisplay of which observers you want to get.
---@return table Returns a table of players that are observers of the display or false if invalid textdisplay is passed.
---@markup { MTA:SA Shared }
function textDisplayGetObservers(theDisplay) end

---This function checks if a player can see the specified textdisplay.
---@param display textdisplay The textdisplay .
---@param thePlayer player The player .
---@return boolean Return true if textdisplay is showing, or false if not.
---@markup { MTA:SA Shared }
function textDisplayIsObserver(display, thePlayer) end

---This function removes a player observer of a textdisplay. This stops the player from being able to see textitems that the textdisplay contains.
---@param display textdisplay The textdisplay to remove the player from as an observer.
---@param playerToRemove player The player that should be removed from the textdisplay .
---@return boolean
---@markup { MTA:SA Shared }
function textDisplayRemoveObserver(display, playerToRemove) end

---This function removes a textitem from a textdisplay. This stops any observers of the textdisplay from being able to see the textitem.
---@param displayToRemoveFrom textdisplay The textdisplay to remove the textitem from.
---@param itemToRemove textitem The textitem to remove from the display.
---@markup { MTA:SA Shared }
function textDisplayRemoveText(displayToRemoveFrom, itemToRemove) end

---This function allows you to retrieve the color of a text item.
---@param theTextItem textitem The text item you wish to retrieve the color of.
---@return int int int int Returns four integers in RGBA format, with a maximum value of 255 for each. The values are, in order, red , green , blue , and alpha . Alpha decides transparency where 255 is opaque and 0 is transparent. false is returned if the text item is invalid.
---@markup { MTA:SA Shared }
function textItemGetColor(theTextItem) end

---This function allows retrieval of the position of a text item.
---@param theTextItem textitem The textitem you wish to retrieve the position of
---@return float float Returns two floats of the x and y position on the screen, where the maximum value is 1.0.
---@markup { MTA:SA Shared }
function textItemGetPosition(theTextItem) end

---This function retrieves the priority of a text item. Priority defines the rate at whihc a text item is updated
---@param textitemToCheck textitem The text item you wish to retrieve the priority of.
---@return integer Returns a integer of the priority of a text item, 0 = low, 1 = medium, 2 = high.
---@markup { MTA:SA Shared }
function textItemGetPriority(textitemToCheck) end

---This function allows retrieval of the scale or size of a text item.
---@param theTextitem textitem The text item you wish to retrieve the scale of
---@return number Returns a floating point of the scale of the text. 1.0 is around 12pt.
---@markup { MTA:SA Shared }
function textItemGetScale(theTextitem) end

---This function returns the current text of the specified textitem.
---@param theTextitem textitem A valid textitem .
---@return string Returns a string containing the text if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function textItemGetText(theTextitem) end

---This function sets the color of a text item.
---@param theTextItem textitem The textitem you wish to set the color of.
---@param r integer MISSINGPARAMDESC
---@param g integer MISSINGPARAMDESC
---@param b integer MISSINGPARAMDESC
---@param a integer MISSINGPARAMDESC
---@return boolean Returns true if the color was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function textItemSetColor(theTextItem, r, g, b, a) end

---This function allows the setting of the position of a text item.
---@param theTextItem textitem The text item that you want to move
---@param x number A floating point number between 0.0 and 1.0 indicating how far across the screen the text should be shown, as a percentage of the width, from the left hand side.
---@param y number A floating point number between 0.0 and 1.0 indicating how far down the screen the text should be shown, as a percentage of the height, from the top.
---@return boolean Returns true if the position was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function textItemSetPosition(theTextItem, x, y) end

---This function sets the priority for a text item. Priority is the importance of sending updated text to the client. The system is implemented as 3 queues, with the high queue being emptied before the medium queue is processed, and with one update sent per server frame. Hence, if you set all your text items to medium priority it has the same effect as if you set them all to high or low.
---@param theTextItem textitem The text item you wish to set priority to.
---@param priority string The priority you wish to set to the item, which can be "high" , "medium" , or "low" respective of their priority.
---@markup { MTA:SA Shared }
function textItemSetPriority(theTextItem, priority) end

---This function allows the setting of the scale of a text item.
---@param theTextitem textitem The text item you wish to set the scale of.
---@param scale number A floating point value indicating the scale of the text you wish to set to. 1.0 is around 12pt.
---@return boolean Returns true if the scale was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function textItemSetScale(theTextitem, scale) end

---Overwrites a previously created text item with the specified text.
---@param theTextitem textitem An existing text item that was previously created with textCreateTextItem
---@param text string The new text for the text item
---@markup { MTA:SA Shared }
function textItemSetText(theTextitem, text) end

-- UTF8_Library

---Returns the codepoints for the i\-th through j\-th character of the string passed.
---@param input string A string character sequence.
---@param i integer? An integer representing the beginning position.
---@param j integer? An integer representing the ending position.
---@return integer | ... Returns a sequence of integer values from the original string if successful, nil otherwise.
---@markup { MTA:SA Shared }
function utf8.byte(input, i, j) end

---Generates a string representing the character codepoints as arguments.
---@param codepoints... integer An variable argument sequence of code points representing the desired unicode characters.
---@return string Returns a string representation of the codepoints passed.
---@markup { MTA:SA Shared }
function utf8.char(codepoints...) end

---Converts the UTF\-8 codepoint position to byte\-string position.
---@param input string A string character sequence.
---@param charpos integer? An integer representing the beginning position (offset will be added/subtracted).
---@param offset integer? An integer representing the offset to charpos.
---@return integer | integer Returns the integer position as in a byte string and the integer codepoint at this position, nil otherwise.
---@markup { MTA:SA Shared }
function utf8.charpos(input, charpos, offset) end

---Escapes a string to a UTF\-8 format string. It supports several escape formats, see the formatting table.
---@param input string A string character sequence.
---@return string Returns a string containing the escaped UTF-8 characters from the original string.
---@markup { MTA:SA Shared }
function utf8.escape(input) end

---Finds the first occurrence of the pattern in the string passed. If an instance of the pattern is found, a pair of values representing the start and the end of the matched string is returned.
---@param input string A string character sequence.
---@param pattern string A string match pattern (you can disable pattern matching by using the optional fourth argument plain ).
---@param startpos integer? An integer representing the beginning position.
---@param plain boolean? A boolean, if pattern matching should be turned off
---@return integer | integer Returns two number values for the beginning and ending position of the matched string, nil otherwise.
---@markup { MTA:SA Shared }
function utf8.find(input, pattern, startpos, plain) end

---Converts a UTF\-8 string to folded case (lowercase), which can be used to compare two strings. If input is an integer, it's treat as a codepoint and a convert codepoint (integer) is returned.
---@param input string|integer A string character sequence OR an integer value.
---@return string|integer Returns a string in lowercase OR returns an integer (see description).
---@markup { MTA:SA Shared }
function utf8.fold(input) end

---This function returns a pattern finding iterator for UTF\-8 strings. The iterator will search through the string input looking for instances of the pattern you passed. For more information on iterators read the ForTutorial and IteratorsTutorial.
---@param input string A string character sequence.
---@param pattern string A string match pattern.
---@return iterator Returns an function for iterations on the input string by using the passed pattern string.
---@markup { MTA:SA Shared }
function utf8.gmatch(input, pattern) end

---Returns a copy of the original input string with replaced matches from the pattern by the replacement value.
---@param input string A string character sequence.
---@param pattern string A string match pattern
---@param replace mixed A string literal OR an integer value OR a function (see examples below) OR a table ({ match = replacement })
---@param match_limit integer? An integer to limit the number of substitutions made.
---@return string Returns a pair of values, the modified string and the integer number of substitutions made.
---@markup { MTA:SA Shared }
function utf8.gsub(input, pattern, replace, match_limit) end

---Inserts a substring into input string. If insert\-position is given, the substring will be inserted before the character at this index, otherwise the substring will concatenate to input. The insert position may be negative.
---@param input string A string character sequence.
---@param insert_pos integer? An integer representing the position, where the substring will be inserted at.
---@param substring string A string character sequence which should be inserted.
---@return string Returns a string with the inserted substring value.
---@markup { MTA:SA Shared }
function utf8.insert(input, insert_pos, substring) end

---Returns the length of the string passed.
---@param input string A string character sequence.
---@param i integer? An integer representing the beginning position for measuring the length of the section (may be negative).
---@param j integer? An integer representing the ending position for measuring the length of the section (may be negative).
---@return integer Returns the length of the string as an integer.
---@markup { MTA:SA Shared/Client }
function utf8.len(input, i, j) end

---@markup { MTA:SA Shared }
function utf8.lower() end

---Extract substrings by matching patterns in the input string. This function can be used to extract specific information from a string.
---@param input string A string character sequence.
---@param pattern string A string match pattern.
---@param index integer? An integer representing the beginning position for the pattern matching.
---@return string | ... Returns a sequence of string matches from the input string, nil otherwise.
---@markup { MTA:SA Shared }
function utf8.match(input, pattern, index) end

---Compares two strings in lower-case and returns the difference indicator (see table below) as an integer value.
---@param a string A string character sequence.
---@param b string A string character sequence.
---@return integer Returns an integer, which indicates the difference, see the table above for further information.
---@markup { MTA:SA Shared/Server }
function utf8.ncasecmp(a, b) end

---This is an iteration function to traverse each single codepoint of a UTF-8 string.
---@param input string A string character sequence.
---@param charpos integer? An integer representing the beginning position (offset will be added/subtracted).
---@param offset integer? An integer representing the offset to charpos.
---@return integer | integer Returns the integer position in bytes and the integer codepoint at this position, nil otherwise.
---@markup { MTA:SA Shared }
function utf8.next(input, charpos, offset) end

---This function removes a substring in a UTF-8 string by using a position range.
---@param input string A string character sequence
---@param start integer? An integer representing the beginning position.
---@param stop integer? An integer representing the ending position.
---@return string Returns the string with the removed substring from the range.
---@markup { MTA:SA Shared }
function utf8.remove(input, start, stop) end

---Reverses the input string.
---@param input string A string character sequence.
---@return string Returns a string containing the reversed original UTF-8 string.
---@markup { MTA:SA Shared }
function utf8.reverse(input) end

---Returns a substring of the string passed. The substring starts at i. If the third argument j is not given, the substring will end at the end of the string. If the third argument is given, the substring ends at and includes j.
---@param input string A string character sequence.
---@param i integer? An integer representing the beginning position (may be negative).
---@param j integer? An integer representing the ending position (may be negative).
---@return string Returns a string substring of the original string, containing the selected range from the original string.
---@markup { MTA:SA Shared }
function utf8.sub(input, i, j) end

---Converts a UTF\-8 string to title case (uppercase). If input is an integer, it is treated as a codepoint and a converted codepoint (integer) is returned.
---@param input string|integer A string character sequence OR an integer value.
---@return string Returns a string in uppercase OR returns an integer (see description).
---@markup { MTA:SA Shared }
function utf8.title(input) end

---@markup { MTA:SA Shared }
function utf8.upper() end

---Calculates the width of UTF\-8 strings with special/unprintable characters, which require special width treatment.
---@param input string|integer A string character sequence OR a codepoint integer
---@param ambi_is_double boolean? A boolean, if set to true , ambiguous character's width is 2 (see example below).
---@param default_width integer? An integer, if given, is used as width for unprintable characters.
---@return integer Returns the integer width of the input string OR the width of the codepoint integer.
---@markup { MTA:SA Shared }
function utf8.width(input, ambi_is_double, default_width) end

---Returns the location, offset and width of the character at the given location in the UTF\-8 string.
---@param input string A string character sequence.
---@param location integer The target display width (in monospace columns). The function walks through the input string, accumulating each character's display width, until the total width reaches or exceeds this value. It then returns the index of the character at which this happens.
---@param ambi_is_double boolean? A boolean, if set to true , ambiguous character's width is 2 (see example).
---@param default_width integer? An integer, if given, is used as width for unprintable characters.
---@return integer | integer | integer Returns the given location, the offset in UTF-8 encoding (if cursor is in the middle of the wide char - offset will be 2) and the width of the character, otherwise only the location as integer will be returned.
---@markup { MTA:SA Shared }
function utf8.widthindex(input, location, ambi_is_double, default_width) end

-- Utility

---This function allows tracing of MTA functions and events. It should only be used when debugging scripts as it may degrade script performance.
---@param hookType string The type of hook to add. This can be: preEvent postEvent preFunction postFunction preEventFunction postEventFunction
---@param callbackFunction function The function to call Returning the string "skip" from the callback function will cause the original function/event to be skipped
---@param nameList table Table of strings for restricting which functions and events the hook will be triggered on addDebugHook and removeDebugHook will only be hooked if they are specified in the name list
---@return boolean Returns true if the hook was successfully added, or false otherwise.
---@markup { MTA:SA Shared }
function addDebugHook(hookType, callbackFunction, nameList) end

---This function performs a bitwise AND\-conjunction on two or more (unsigned) 32\-bit integers. See Bitwise operation for more details.
---@param var1 uint MISSINGPARAMDESC
---@param var2 uint MISSINGPARAMDESC
---@param ... unknown MISSINGPARAMDESC
---@return uint Returns the conjuncted value.
---@markup { MTA:SA Shared }
function bitAnd(var1, var2, ...) end

---This functions performs an arithmetic shift on the integer value by integer n positions. In an arithmetic shift, zeros are shifted in to replace the discarded bits. In a right arithmetic shift, the sign bit is shifted in on the left, thus preserving the sign of the operand. See Bitwise operation for more details.
---@param value integer The value you want to perform the arithmetic shift on.
---@param n integer The amount of positions to shift the value by.
---@return integer Returns the arithmetic shifted value as integer .
---@markup { MTA:SA Shared }
function bitArShift(value, n) end

---This function returns the unsigned number formed by the bits field to field \+ width \- 1 (range: 0\-31\).
---@param var uint The value
---@param field integer The field number
---@param width integer? Number of bits to extract
---@return uint Returns the extracted value/bit sequence.
---@markup { MTA:SA Shared }
function bitExtract(var, field, width) end

---This functions performs a bitwise circular left\-rotation on the integer value by integer n positions. See Bitwise operation for more details.
---@param value integer The value you want to perform the rotation on.
---@param n integer The amount of positions to rotate the value by.
---@return integer Returns the circular left-rotated value as integer .
---@markup { MTA:SA Shared }
function bitLRotate(value, n) end

---This functions performs a logical left shift on the integer value by integer n positions. In a logical shift, zeros are shifted in to replace the discarded bits. See Bitwise operation for more details.
---@param value integer The value you want to perform the shift on.
---@param n integer The amount of positions to shift the value by.
---@return integer Returns the logical left shifted value as integer .
---@markup { MTA:SA Shared }
function bitLShift(value, n) end

---This function performs a bitwise NOT on an (unsigned) 32\-bit integer. See Bitwise operation for more details.
---@param var uint The value you want to perform a bitwise NOT on
---@return uint Returns the value on which the operation has been performed.
---@markup { MTA:SA Shared }
function bitNot(var) end

---This function performs a bitwise OR\-conjunction on two or more (unsigned) 32\-bit integers. See Bitwise operation for more details.
---@param var1 uint MISSINGPARAMDESC
---@param var2 uint MISSINGPARAMDESC
---@param ... unknown MISSINGPARAMDESC
---@return uint Returns the conjuncted value.
---@markup { MTA:SA Shared }
function bitOr(var1, var2, ...) end

---This functions performs a bitwise circular right\-rotation on the integer value by integer n positions. See Bitwise operation for more details.
---@param value integer The value you want to perform the rotation on.
---@param n integer The amount of positions to rotate the value by.
---@return integer Returns the circular right-rotated value as integer .
---@markup { MTA:SA Shared }
function bitRRotate(value, n) end

---This functions performs a logical right shift on the integer value by integer n positions. In a logical shift, zeros are shifted in to replace the discarded bits. See Bitwise operation for more details.
---@param value integer The value you want to perform the shift on.
---@param n integer The amount of positions to shift the value by.
---@return integer Returns the logical right shifted value as integer .
---@markup { MTA:SA Shared }
function bitRShift(value, n) end

---This function returns the unsigned number formed by var value with replacement specified at bits field to field \+ width \- 1
---@param var uint The value
---@param replaceValue uint The replaceValue
---@param field integer The field number
---@param width integer? Number of bits to extract
---@return uint Returns the replaced value/bit sequence.
---@markup { MTA:SA Shared }
function bitReplace(var, replaceValue, field, width) end

---This function performs an AND\-conjunction on two or more (unsigned) 32\-bit integers and checks, whether the conjuncted value is zero or not. See Bitwise operation for more details.
---@param var1 uint MISSINGPARAMDESC
---@param var2 uint MISSINGPARAMDESC
---@param ... unknown MISSINGPARAMDESC
---@return boolean Returns true if the conjuncted value is not zero, false otherwise. If a bad argument was passed to bitTest , you'll get nil .
---@markup { MTA:SA Shared }
function bitTest(var1, var2, ...) end

---This function performs a bitwise XOR\-conjunction (exclusive OR) on two or more (unsigned) 32\-bit integers. See Bitwise operation for more details.
---@param var1 uint MISSINGPARAMDESC
---@param var2 uint MISSINGPARAMDESC
---@param ... unknown MISSINGPARAMDESC
---@return uint Returns the conjuncted value.
---@markup { MTA:SA Shared }
function bitXor(var1, var2, ...) end

---This function creates a notification balloon on the desktop.
---@param notificationText string The text to send in the notification.
---@param iconType string? The notification icon type. Possible values are: "default" (the MTA icon), "info", "warning", "error"
---@param useSound boolean? A boolean value indicating whether or not to play a sound when receiving the notification.
---@return boolean Returns true if the notification is correctly created, false otherwise.
---@markup { MTA:SA Shared }
function createTrayNotification(notificationText, iconType, useSound) end

---debugSleep freezes the client/server for the specified time. This means that all synchronization, rendering and script execution will stop except HTTP processing invoked by fetchRemote. This function only works, if development mode is enabled by setDevelopmentMode and can be utilised to build a debugger that communicates via HTTP requests with the editor/IDE.
---@param sleep integer An integer value in milliseconds.
---@return boolean Returns true if the development mode is enabled and arguments are correct, false otherwise.
---@markup { MTA:SA Shared }
function debugSleep(sleep) end

---This function decodes an encoded string using the specified algorithm. The counterpart of this function is encodeString.
---@param algorithm string The algorithm to use.
---@param input string The input to decode.
---@param options table MISSINGPARAMDESC
---@param callback function providing a callback will run this function asynchronously, the arguments to the callback are the same as the returned values below.
---@return string Returns the decoded string if successful, false otherwise. If a callback was provided, the decoded string is argument to the callback.
---@markup { MTA:SA Shared }
function decodeString(algorithm, input, options, callback) end

---This function will take a reference obtained by the ref function and returns its Lua element.
---@param reference integer The valid reference, which you want to dereference
---@return mixed Returns mixed if the reference were valid. Returns false if the reference were invalid.
---@markup { MTA:SA Shared }
function deref(reference) end

---This function ensures the requested resource file is correct and then triggers onClientFileDownloadComplete. If the file has been previously downloaded and the CRC matches, the file will not be downloaded again but onClientFileDownloadComplete will still run. The file should also be included in the resource meta.xml with the download attribute set to "false", see meta.xml for more details.
---@param fileName string A string referencing the name of the file to download
---@return boolean Returns true if file download has been queued, false otherwise.
---@markup { MTA:SA Shared }
function downloadFile(fileName) end

---This function encodes a string using the specified algorithm. The counterpart of this function is decodeString.
---@param algorithm string The algorithm to use.
---@param input string The input to encode.
---@param options table A table with options and other necessary data for the algorithm, as detailed below.
---@param callback function providing a callback will run this function asynchronously, the arguments to the callback are the same as the returned values below.
---@return string
---@markup { MTA:SA Shared }
function encodeString(algorithm, input, options, callback) end

---This function parses a JSON formatted string into variables. You can use toJSON to encode variables into a JSON string that can be read by this function.
---@param json string A JSON formatted string
---@return var Returns variables read from the JSON string.
---@markup { MTA:SA Shared }
function fromJSON(json) end

---This function creates a new public key and private key for encrypting data
---@param algorithm string The algorithm to use: RSA : use the RSA public-key algorithm
---@param options table table with options for the hashing algorithm, as detailed below.
---@param callback function providing a callback will run this function asynchronously, the arguments to the callback are the same as the returned values below.
---@return string | string Returns 2 strings if successful: private key and public key . Otherwise returns false
---@markup { MTA:SA Shared }
function generateKeyPair(algorithm, options, callback) end

---This function will extract Red, Green, Blue and Alpha values from a hex string you provide it. These strings follow the same format as used in HTML, with addition of the Alpha values.
---@param theColor string A string containing a valid color code.
---@return integer | integer | integer | integer Returns four integers in RGBA format, with a maximum value of 255 for each.  Each stands for red , green , blue , and alpha .  Alpha decides transparancy where 255 is opaque and 0 is transparent. false is returned if the string passed is invalid (for example, is missing the preceeding # sign).
---@markup { MTA:SA Shared }
function getColorFromString(theColor) end

---This function is used to get the development mode of the client or whole server. For more information see setDevelopmentMode
---@return boolean Returns true if the development mode is on, false if off.
---@markup { MTA:SA Shared }
function getDevelopmentMode() end

---This function returns the distance between two 2 dimensional points using the pythagorean theorem.
---@param x1 number The X position of the first point
---@param y1 number The Y position of the first point
---@param x2 number The X position of the second point
---@param y2 number The Y position of the second point
---@return number Returns a float containing the 2D distance between the two points. Returns false if invalid parameters are passed.
---@markup { MTA:SA Shared }
function getDistanceBetweenPoints2D(x1, y1, x2, y2) end

---This function returns the distance between two 3 dimensional points using the pythagorean theorem.
---@param x1 number The X position of the first point
---@param y1 number The Y position of the first point
---@param z1 number The Z position of the first point
---@param x2 number The X position of the second point
---@param y2 number The Y position of the second point
---@param z2 number The Z position of the second point
---@return number Returns a float containing the distance between the two points as a float . Returns false if an argument passed was invalid.
---@markup { MTA:SA Shared }
function getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) end

---Used for custom Lua based interpolation, returns the easing value (animation time to use in your custom interpolation) given a progress and an easing function. In most cases, either moveObject or interpolateBetween can do the job. getEasingValue is only provided in case you want to do your own custom interpolation based on easing.
---@param fProgress number float between 0 and 1 indicating the interpolation progress (0 at the beginning of the interpolation, 1 at the end).
---@param strEasingType string the easing function to use for the interpolation
---@param fEasingPeriod number the period of the easing function (only some easing functions use this parameter)
---@param fEasingAmplitude number the amplitude of the easing function (only some easing functions use this parameter)
---@param fEasingOvershoot number the overshoot of the easing function (only some easing functions use this parameter)
---@return number Returns fAnimationTime the animation time given by the easing function (can be  1 since some easing functions have overshoot or bounce/spring effects, false otherwise (error in parameters).
---@markup { MTA:SA Shared }
function getEasingValue(fProgress, strEasingType, fEasingPeriod, fEasingAmplitude, fEasingOvershoot) end

---This function retrieves the maximum FPS (Frames per second) that players on the server can run their game at.
---@return integer Returns an integer between 25 and 32767 (refer to the note above) of the maximum FPS that players can run their game at.
---@markup { MTA:SA Shared }
function getFPSLimit() end

---This function gets the player's keyboard layout settings, which they are currently (keyboard layout can be changed at any moment) using at the time of invocation.
---@return table Returns a table with keyboard layout properties:
---@markup { MTA:SA Shared }
function getKeyboardLayout() end

---This function gets the player's localization setting as set in the MTA client.
---@return table Returns a table with the following entries:
---@markup { MTA:SA Shared }
function getLocalization() end

---This function returns network status information.
---@param thePlayer element? MISSINGPARAMDESC
---@return table Returns a table, the indexes in the table are the following:
---@markup { MTA:SA Server/Client }
function getNetworkStats(thePlayer) end

---This function returns a table containing network usage information about inbound and outbound packets.
---@return table Returns a table with two fields: "in" and "out". Each of these contain a table with two fields: "bits" and "count". Each of these contain a table with 256 numeric fields ranging from 0 to 255, containing the appropriate network usage data for such packet id.
---@markup { MTA:SA Shared }
function getNetworkUsageData() end

---This function returns performance information.
---@param category string Performance statistics category. If empty string is given, list of all categories is returned.See categories for more information.
---@param options string? Category specific ',' separated options. All categories supports 'h' option for help.
---@param filter string? Case-sensitive filter used to select returned rows. Only 'name' column is filtered.
---@return table table Returns two tables. First contains column names. The second contains result rows. Each row is table of cells.
---@markup { MTA:SA Shared }
function getPerformanceStats(category, options, filter) end

---This function returns a breakdown of the process memory usage. The reported numbers are always byte units and these numbers can be inaccurate.
---@return table|nil Returns a table if successful, otherwise returns nil
---@markup { MTA:SA Shared }
function getProcessMemoryStats() end

---This function gets the server or client (if used client sided it returns time as set on client's computer) real time and returns it in a table. If you want to get the in\-game time (shown on GTA's clock) use getTime.
---@param seconds integer? A count in seconds from the year 1970.  Useful for storing points in time, or for retrieving time information for getBanTime . The valid range of this argument is 0 to 32,000,000,000
---@param localTime boolean? MISSINGPARAMDESC
---@return table Returns a table of substrings with different time format or false if the seconds argument is out of range.
---@markup { MTA:SA Shared }
function getRealTime(seconds, localTime) end

---This function returns the IP of the server the client is currently connected to.
---@param includePort boolean? If set to true , the string will include the port of the server at the end of the string, after a colon (:) character.
---@return string A string containing the remote address of the server the client is currently connected to.
---@markup { MTA:SA Shared }
function getServerIp(includePort) end

---This function returns amount of time that your system has been running in milliseconds. By comparing two values of getTickCount, you can determine how much time has passed (in milliseconds) between two events. This could be used to determine how efficient your code is, or to time how long a player takes to complete a task.
---@return integer Returns an integer containing the number of milliseconds since the system the server is running on started. This has the potential to wrap-around.
---@markup { MTA:SA Shared }
function getTickCount() end

---This function is for getting the details of a running timer.
---@param theTimer timer A timer element.
---@return integer | integer | integer This example creates a 1 second (1000 ms) timer that will run 10 times, and you can see the timer details by using the command: timerdetails.
---@markup { MTA:SA Shared }
function getTimerDetails(theTimer) end

---This function returns a table of all active timers that the resource that calls it has created. Alternatively, only the timers with a remaining time less than or equal to a certain value can be retrieved.
---@param theTime integer? The maximum time left (in milliseconds) on the timers you wish to retrieve.
---@return table Returns a table of all the active timers.
---@markup { MTA:SA Shared }
function getTimers(theTime) end

---This function gets the type of a userdata value, which is not always a element in the element tree.
---@param value userdata A userdata value to get the type of. Userdata types can be: Shared resource-data : a resource pointer . xml-node : a XML node . lua-timer : a timer . vector2 : a 2D vector, used in the Vector2 class. vector3 : a 3D vector, used in the Vector3 class. vector4 : a 4D vector, used in the Vector4 class. matrix : a matrix, used in the Matrix class. request : a userdata type returned via fetchRemote (since r21436 ) userdata : a fallback userdata type return value, when no other type could be found for the object. Server only account : a player account . db-query : a database query handle . acl : an ACL entry . acl-group : an ACL group . ban : a player ban . text-item : a text display item . text-display : a text display item .
---@return string Returns a string containing the specified userdata's type, or false plus an error message if the given value is not userdata.
---@markup { MTA:SA Shared }
function getUserdataType(value) end

---This function gives you various version information about MTA and the operating system.
---@return table Returns a table with version information. Specifically these keys are present in the table:
---@markup { MTA:SA Shared }
function getVersion() end

---This function splits a string using the given separating character and returns one specified substring.
---@param text string the string that should be split.
---@param tokenNumber integer which token should be returned (1 for the first, 2 for the second, and so on).
---@param / int separatingCharacter string MISSINGPARAMDESC
---@return string Returns a string containing the token if it exists, false otherwise.
---@markup { MTA:SA Shared }
function gettok(text, tokenNumber, / int separatingCharacter) end

---This function returns a hash of the specified string in the specified algorithm.
---@param algorithm string A string which must be one of these: "md5", "sha1", "sha224", "sha256", "sha384", "sha512", "hmac"
---@param dataToHash string A string of the data to hash.
---@param options table A table with options and other necessary data for the algorithm, as detailed below.
---@return string Returns the hash of the data, false if an invalid argument was used.
---@markup { MTA:SA Shared }
function hash(algorithm, dataToHash, options) end

---This function returns human\-readable representations of tables and MTA datatypes as a string.
---@param var mixed A variable of any datatype.
---@param options table A table of options. It is not mandatory, but when it is provided, it must be a table. For a list of options, see the Inspect's GitHub page .
---@return string Always returns a string. The contents can change if we update the inspect library, so it is not expected to be consistent across Lua versions.
---@markup { MTA:SA Shared }
function inspect(var, options) end

---Interpolates a 3D Vector between a source value and a target value using either linear interpolation or any other easing function. It can also be used to interpolate 2D vectors or scalars by only setting some of the x, y, z values and putting 0 to the others.
---@param x1 number MISSINGPARAMDESC
---@param y1 number MISSINGPARAMDESC
---@param z1 number MISSINGPARAMDESC
---@param x2 number MISSINGPARAMDESC
---@param y2 number MISSINGPARAMDESC
---@param z2 number MISSINGPARAMDESC
---@param fProgress number float between 0 and 1 indicating the interpolation progress (0 at the beginning of the interpolation, 1 at the end). If it is higher than 1, it will start from the beginning.
---@param strEasingType string the easing function to use for the interpolation
---@param fEasingPeriod number the period of the easing function (only some easing functions use this parameter)
---@param fEasingAmplitude number the amplitude of the easing function (only some easing functions use this parameter)
---@param fEasingOvershoot number the overshoot of the easing function (only some easing functions use this parameter)
---@return float float float Returns x, y, z the interpolated 3D vector/value if successful, false otherwise (error in parameters). As mentioned before, interpolateBetween can be used on 2D vectors or scalars in which case only some (x, y or just x) of the returned values are to be used (cf. alpha interpolation in marker example or size interpolation in window example).
---@markup { MTA:SA Shared }
function interpolateBetween(x1, y1, z1, x2, y2, z2, fProgress, strEasingType, fEasingPeriod, fEasingAmplitude, fEasingOvershoot) end

---This function intelligently outputs debug messages into the Debug Console. It is similar to outputDebugString, but outputs useful information for any variable type, and does not require use of Lua's tostring. This includes information about element types, and table structures. It is especially useful for quick debug tasks.
---@param var1 mixed A variable of any type to print intelligent information for.
---@param var2 mixed MISSINGPARAMDESC
---@param var3... mixed MISSINGPARAMDESC
---@return boolean Always returns nil .
---@markup { MTA:SA Shared }
function iprint(var1, var2, var3...) end

---This function checks whether OOP (Object Oriented Programming) is enabled in the current resource or not.
---@return boolean Returns true or false if OOP is enabled or not. Returns nil if an error arised.
---@markup { MTA:SA Shared }
function isOOPEnabled() end

---This function gets the collision previews state.
---@return boolean You can refer to the example below:
---@markup { MTA:SA Shared }
function isShowCollisionsEnabled() end

---This function indicates if world sound IDs should be printed in the debug window or not.
---@return boolean You can refer to the example below:
---@markup { MTA:SA Shared }
function isShowSoundEnabled() end

---This function checks if a variable is a timer.
---@param theTimer timer The variable that we want to check.
---@return boolean Returns true if the passed value is a timer, false otherwise.
---@markup { MTA:SA Shared }
function isTimer(theTimer) end

---This function allows you to check whether a timer is paused.
---@param theTimer timer The timer you wish to check.
---@return boolean Returns true if the timer is currently paused, false if not or if no such timer existed.
---@markup { MTA:SA Shared }
function isTimerPaused(theTimer) end

---Determines if the transfer box should be always visible during downloads. Players can forcefully show the transfer box through a user setting, even if disabled by scripts.
---@return boolean Returns a boolean , whether the transfer box should be always visible or not.
---@markup { MTA:SA Shared }
function isTransferBoxAlwaysVisible() end

---Determines if the transfer box is visible.
---@return boolean On server this returns a boolean, whether the transfer box should be visible during downloads or not.
---@markup { MTA:SA Shared }
function isTransferBoxVisible() end

---This function returns a boolean value whether the client has enabled tray notifications in his settings or not.
---@return boolean Returns true if the tray notifications are enabled in the settings, false otherwise.
---@markup { MTA:SA Shared }
function isTrayNotificationEnabled() end

---This function allows you to kill/halt existing timers.
---@param theTimer timer The timer you wish to halt.
---@return boolean Returns true if the timer was successfully killed, false if no such timer existed.
---@markup { MTA:SA Shared }
function killTimer(theTimer) end

---Calculates the MD5 hash of the specified string and returns its hexadecimal representation.
---@param str string the string to hash.
---@return string Returns the MD5 hash of the input string if successful, false otherwise.
---@markup { MTA:SA Shared }
function md5(str) end

---This function creates a new password hash using a specified hashing algorithm.
---@param password string The password to hash.
---@param algorithm string The algorithm to use: bcrypt : use the bcrypt hashing algorithm. Hash length: 60 characters. Note that only the prefix $2y$ is supported (older prefixes can cause security issues).
---@param options table table with options for the hashing algorithm, as detailed below.
---@param callback function providing a callback will run this function asynchronously, the arguments to the callback are the same as the returned values below.
---@return string Returns the hash as a string if hashing was successful, false otherwise. If a callback was provided, the aforementioned values are arguments to the callback, and this function will always return true .
---@markup { MTA:SA Shared }
function passwordHash(password, algorithm, options, callback) end

---This function verifies whether a password matches a password hash.
---@param password string The password to check.
---@param hash string A supported hash (see passwordHash ). Note that only the prefix $2y$ is supported for type bcrypt (older prefixes can cause security issues).
---@param options table advanced options insecureBcrypt: If set to true , you can use the $2a$ prefix for bcrypt hashes as well. It is strongly not recommended to use it though, because the underlying implementation has a bug that leads to such hashes being relatively easy to crack. This bug was fixed for $2y$ .
---@param callback function MISSINGPARAMDESC
---@return boolean Returns true if the password matches the hash. Returns false if the password does not match, or if an unknown hash was passed. If a callback was provided, the aforementioned values are arguments to the callback, and this function will always return true .
---@markup { MTA:SA Shared }
function passwordVerify(password, hash, options, callback) end

---This function stops at the first occurrence of the pattern in the input string and returns the result of the search.
---@param subject string The input string
---@param pattern string The pattern string to search for in the input string .
---@param flags int/string Conjuncted value that contains flags ( 1 - ignorecase, 2 - multiline, 4 - dotall, 8 - extended, 16 - unicode ) or ( i - Ignore case, m - Multiline, d - Dotall, e - Extended, u - Unicode )
---@return boolean Returns true if the pattern was found in the input string, false otherwise.
---@markup { MTA:SA Shared }
function pregFind(subject, pattern, flags) end

---This function returns all matches.
---@param base string The base string for replace.
---@param pattern string The pattern for match in base string.
---@param flags int/string? Conjuncted value that contains flags ( 1 - ignorecase, 2 - multiline, 4 - dotall, 8 - extended, 16 - unicode ) or ( i - Ignore case, m - Multiline, d - Dotall, e - Extended, u - Unicode )
---@param maxResults integer? Maximum number of results to return
---@return table Returns a table if one or more match is found, false otherwise.
---@markup { MTA:SA Shared }
function pregMatch(base, pattern, flags, maxResults) end

---This function performs a regular expression search and replace and returns the replaced string.
---@param subject string The input string .
---@param pattern string The pattern string to search for in the input string .
---@param replacement string The replacement string to replace all matches within the input string .
---@param flags int/string Conjuncted value that contains flags ( 1 - ignorecase, 2 - multiline, 4 - dotall, 8 - extended, 16 - unicode ) or ( i - Ignore case, m - Multiline, d - Dotall, e - Extended, u - Unicode )
---@return string Returns the replaced string , or bool false otherwise.
---@markup { MTA:SA Shared }
function pregReplace(subject, pattern, replacement, flags) end

---This function will create a reference to the given argument.
---@param objectToReference mixed MISSINGPARAMDESC
---@return integer Returns an int if the reference were successfully created. Returns false if the parameter were invalid.
---@markup { MTA:SA Shared }
function ref(objectToReference) end

---This function removes hooks added by addDebugHook
---@param hookType string The type of hook to remove. This can be: preEvent postEvent preFunction postFunction
---@param callbackFunction function MISSINGPARAMDESC
---@return boolean Returns true if the hook was successfully removed, or false otherwise.
---@markup { MTA:SA Shared }
function removeDebugHook(hookType, callbackFunction) end

---This function allows you to reset the value of the elapsed time in existing timers. The function resets the "execution time" value for timers with a limited number of repetitions.
---@param theTimer timer The timer whose elapsed time you wish to reset.
---@return boolean Returns true if the timer was successfully reset, false otherwise.
---@markup { MTA:SA Shared }
function resetTimer(theTimer) end

---This function sets the players clipboard text (what appears when you paste with CTRL \+ V)
---@param theText string The new text to be in the players clipboard when the player pastes with CTRL + V.
---@return boolean Returns true if the text in the clip board was set correctly.
---@markup { MTA:SA Shared }
function setClipboard(theText) end

---This function is used to set the development mode. Setting development mode allows access to special commands which can assist with script debugging.
---@param enable boolean A boolean to indicate whether development mode is on ( true ) or off ( false )
---@param enableWeb boolean? MISSINGPARAMDESC
---@return boolean Returns true if the mode was set correctly, false otherwise.
---@markup { MTA:SA Shared }
function setDevelopmentMode(enable, enableWeb) end

---This function sets the maximum FPS (Frames per second) that players on the server can run their game at.
---@param fpsLimit integer An integer value representing the maximum FPS. Refer to the note above for possible values. You can also pass 0 or false , in which case the FPS limit will be the one set in the client settings (by default 100 FPS and the client fps limit should also be manually changed via " fps_limit=0 " in console or MTA San Andreas\MTA\config\coreconfig.xml ).
---@return boolean Returns true if successful, or false if it was not possible to set the limit or an invalid value was passed.
---@markup { MTA:SA Shared }
function setFPSLimit(fpsLimit) end

---This function allows you to trigger a function after a number of milliseconds have elapsed. You can call one of your own functions or a built\-in function. For example, you could set a timer to spawn a player after a number of seconds have elapsed.
---@param theFunction function The function you wish the timer to call.
---@param timeInterval integer MISSINGPARAMDESC
---@param timesToExecute integer MISSINGPARAMDESC
---@param arguments... var MISSINGPARAMDESC
---@return timer Returns a timer pointer if the timer was set successfully, false if the arguments are invalid or the timer could not be set.
---@markup { MTA:SA Shared }
function setTimer(theFunction, timeInterval, timesToExecute, arguments...) end

---This function is used to either pause or resume a timer.
---@param theTimer timer The timer you wish to pause or resume.
---@param paused boolean a boolean value representing whether the timer should be paused or not. To pause the timer, use true .
---@return boolean Returns true if the timer was successfully paused or resumed, false if no such timer existed.
---@markup { MTA:SA Shared }
function setTimerPaused(theTimer, paused) end

---Determines whether or not the transfer box should appear to players.
---@param visible boolean The new transfer box visibility state.
---@return boolean Returns true if the visibility was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setTransferBoxVisible(visible) end

---This function allows the window to flash in the Windows taskbar.
---@param shouldFlash boolean whether the window should flash
---@param count integer? the number of times the window should flash, defaults to 10 times
---@return boolean Returns false if:
---@markup { MTA:SA Shared }
function setWindowFlashing(shouldFlash, count) end

---Calculates the sha256 hash of the specified string.
---@param str string the string to hash.
---@return string Returns the sha256 hash of the input string if successful, false otherwise.
---@markup { MTA:SA Shared }
function sha256(str) end

---Shows collision previews for developers (colshapes in wireframe, useful when writing scripts).
---@param state boolean A boolean indicating if the collision previews should be enabled or disabled.
---@return boolean You can refer to the example below:
---@markup { MTA:SA Shared }
function showCol(state) end

---Prints world sound IDs in the debug output window to help when writing scripts with setWorldSoundEnabled.
---@param state boolean A boolean indicating if the world sound IDs should be printed in the debug window or not.
---@return boolean You can refer to the example below:
---@markup { MTA:SA Shared }
function showSound(state) end

---This function splits a string into substrings. You specify a character that will act as a separating character; this will determine where to split the sub\-strings. For example, it can split the string "Hello World" into two strings containing the two words, by spliting using a space as a separator.
---@param stringToSplit string
---@param / int separatingChar string MISSINGPARAMDESC
---@return table Returns a table of substrings split from the original string if successful, false otherwise.
---@markup { MTA:SA Shared }
function split(stringToSplit, / int separatingChar) end

---This function decrypts given base64 representation of encrypted data using the Tiny Encryption Algorithm.
---@param data string The block of data you want to decrypt
---@param key string The key that should be used for decryption (Only first 16 characters are used)
---@return string Returns string containing the decrypted data if the decryption process was successfully completed, false otherwise.
---@markup { MTA:SA Shared }
function teaDecode(data, key) end

---This functions performs the Tiny Encryption Algorithm on the given string and returns the base64 representation of the encrypted string.
---@param text string The string you want to encrypt. (See second example if you want to encode binary data)
---@param key string The key that should be used for encryption (Only first 16 characters are used)
---@return string Returns the base64 representation of the encrypted string if the encryption process was successfully completed, false otherwise.
---@markup { MTA:SA Shared }
function teaEncode(text, key) end

---This function converts a single value (preferably a Lua table) into a JSON encoded string. You can use this to store the data and then load it again using fromJSON.
---@param value var MISSINGPARAMDESC
---@param compact boolean? a boolean representing whether the string will contain whitespaces. To remove whitespaces from JSON string, use true . String will contain whitespaces per default.
---@param prettyType string? MISSINGPARAMDESC
---@return string Returns a JSON formatted string.
---@markup { MTA:SA Shared }
function toJSON(value, compact, prettyType) end

---This function retrieves the hex number of a specified color, useful for the dx functions. Added server\-side.
---@param red integer The amount of red in the color (0-255).
---@param green integer The amount of green in the color (0-255).
---@param blue integer The amount of blue in the color (0-255).
---@param alpha integer? The amount of alpha in the color (0-255).
---@return integer Returns a single value representing the color.
---@markup { MTA:SA Shared }
function tocolor(red, green, blue, alpha) end

---The function returns the string of the specified UTF code.
---@param characterCode integer The UTF code, to get the string of.
---@return string Returns a string if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function utfChar(characterCode) end

---The function returns the UTF codes of the given string.
---@param theString string The string to get the UTF code of.
---@return integer Returns an int if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function utfCode(theString) end

---The function gets the real length of a string, in characters.
---@param theString string The string to get the length of.
---@return integer Returns an int if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function utfLen(theString) end

---The function returns the byte position at specified character position.
---@param theString string The string .
---@param position integer An int with the specified character position.
---@return integer Returns an int if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function utfSeek(theString, position) end

---The function returns a sub string, from the specified positions on a character.
---@param theString string The string .
---@param Start integer An int with the start position.
---@param End integer An int with the end position.
---@return string Returns a string if the function was successful, false otherwise.
---@markup { MTA:SA Shared }
function utfSub(theString, Start, End) end

-- Vehicle

---This function adds sirens to a vehicle.
---@param theVehicle vehicle The vehicle to add sirens
---@param sirenCount integer The amount of siren points on the vehicle (8 maximum)
---@param sirenType integer An integer between 1 and 6 (1: invisible, 2: single, 3+: dual)
---@param flag360 boolean? Visible from all directions (applies to single type only)
---@param checkLosFlag boolean? Check line of sight between camera and light so it won't draw if blocked
---@param useRandomiser boolean? Randomise the light order, false for sequential
---@param silentFlag boolean? If you want the siren to be silent set this to true
---@return boolean Returns true if sirens were successfully added to the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function addVehicleSirens(theVehicle, sirenCount, sirenType, flag360, checkLosFlag, useRandomiser, silentFlag) end

---This function adds an upgrade to a vehicle, e.g. nitrous, hydraulics.
---@param theVehicle vehicle The element representing the vehicle you wish to add the upgrade to.
---@param upgrade string/int The id of the upgrade you wish to add: 1000 to 1193 ( see Vehicle Upgrades ) or " all" to add all upgrades.
---@return boolean Returns true if the upgrade was successfully added to the vehicle, otherwise false .
---@markup { MTA:SA Shared }
function addVehicleUpgrade(theVehicle, upgrade) end

---This function is used to find out whether the lights of the vehicle are on.
---@param theVehicle vehicle the vehicle you wish to retrieve the lights state of.
---@return boolean Returns true if the lights are on, false otherwise.
---@markup { MTA:SA Shared }
function areVehicleLightsOn(theVehicle) end

---This function attaches a trailer type vehicle to a trailer\-towing\-type vehicle.
---@param theVehicle vehicle the vehicle you wish to attach a trailer to.
---@param theTrailer vehicle the trailer you wish to be attached.
---@return boolean Returns true if the vehicle's were successfully attached, false otherwise.
---@markup { MTA:SA Shared }
function attachTrailerToVehicle(theVehicle, theTrailer) end

---This function will blow up a vehicle. This will cause an explosion and will kill the driver and any passengers inside it.
---@param vehicleToBlow vehicle the vehicle that you wish to blow up.
---@param explode boolean? if this argument is true then the vehicle will explode, otherwise it will just be blown up silently.
---@return boolean Returns true if the vehicle was blown up, false if invalid arguments were passed to the function.
---@markup { MTA:SA Server/Client }
function blowVehicle(vehicleToBlow, explode) end

---This function creates a vehicle at the specified location.
---@param model integer The vehicle ID of the vehicle being created.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rx number A floating point number representing the rotation about the X axis in degrees.
---@param ry number A floating point number representing the rotation about the Y axis in degrees.
---@param rz number A floating point number representing the rotation about the Z axis in degrees.
---@param numberplate string A string that will go on the number plate of the vehicle (max 8 characters).
---@param bDirection boolean Placeholder boolean which provides backward compatibility with some scripts. It never had any effect, but it is read by the code. It is recommended to ignore this argument, passing false or the variant1 argument in its place.
---@param variant1 integer MISSINGPARAMDESC
---@param variant2 integer MISSINGPARAMDESC
---@param synced boolean? MISSINGPARAMDESC
---@return vehicle Returns the vehicle element that was created. Returns false if the arguments are incorrect, or if the vehicle limit of 65535 is exceeded.
---@markup { MTA:SA Shared }
function createVehicle(model, x, y, z, rx, ry, rz, numberplate, bDirection, variant1, variant2, synced) end

---This function detaches an already attached trailer from a vehicle.
---@param theVehicle vehicle The vehicle you wish to detach a trailer from.
---@param theTrailer vehicle? The trailer you wish to be detached.
---@return boolean Returns 'true' if the vehicle's were successfully detached, 'false' otherwise.
---@markup { MTA:SA Shared }
function detachTrailerFromVehicle(theVehicle, theTrailer) end

---This function will set a vehicle's health to full and fix its damage model. If you wish to only change the vehicle's health, without affecting its damage model, use setElementHealth.
---@param theVehicle vehicle the vehicle you wish to fix
---@return boolean Returns true if the vehicle was fixed, false if theVehicle is invalid.
---@markup { MTA:SA Shared }
function fixVehicle(theVehicle) end

---This function gets the state of the helicopter blades collisions on the specified vehicle.
---@param theVehicle vehicle The vehicle that will be checked.
---@return boolean Returns true if the collisions are enabled for specified vehicle, false if the collisions aren't enabled for the specified vehicle, if the vehicle is not a helicopter or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function getHeliBladeCollisionsEnabled(theVehicle) end

---This function returns a table containing the handling data of the specified vehicle model.
---@param modelId integer the vehicle model you wish to get the handling data of.
---@return table Returns a table containing all the handling data, false if an invalid vehicle model is specified. Here is a list of valid table properties and what they return:
---@markup { MTA:SA Shared }
function getModelHandling(modelId) end

---This function returns a table of the original vehicle handling. Use getVehicleHandling if you wish to get the current handling of a vehicle, or getModelHandling for a specific vehicle model.
---@param modelID integer The vehicle ID you wish to get the original handling from.
---@return table Returns a table containing all the handling data, false otherwise. Here a list of valid table properties and what they return:
---@markup { MTA:SA Shared }
function getOriginalHandling(modelID) end

---Gets the direction in which a train is driving (clockwise or counterclockwise).
---@param train vehicle the train of which to get the driving direction.
---@return boolean Returns true if the train is driving clockwise on the train track, false if it is going counterclockwise or a failure occured.
---@markup { MTA:SA Shared }
function getTrainDirection(train) end

---Gets the position the train is currently on the track
---@param train vehicle the train to get the position of
---@return number Returns a float that represents how along the track it is, false if there is problem with train element.
---@markup { MTA:SA Shared }
function getTrainPosition(train) end

---Gets the speed at which a train is traveling on the rails.
---@param train vehicle the train of which to retrieve the speed.
---@return number Returns the train's speed if successful, false otherwise.
---@markup { MTA:SA Shared }
function getTrainSpeed(train) end

---Use this to get the value of a vehicles adjustable property. This property relates to movable parts of a model, for example hydra jets or dump truck tray.
---@param theVehicle vehicle The vehicle you want to get the adjustable property of.
---@return integer Returns a value from 0 upwards representing adjustment. 0 is default position. Maximum varies per vehicle, for example hydra horizontal flight is 5000, while dump truck tray max tilt is 2500. Or returns false if the vehicle passed to the function is invalid.
---@markup { MTA:SA Shared }
function getVehicleAdjustableProperty(theVehicle) end

---This function returns the color of the specified vehicle. A vehicle can have up to four colors.
---@param theVehicle vehicle The vehicle that you wish to get the color of.
---@param bRGB boolean MISSINGPARAMDESC
---@return integer | integer | integer | integer | integer | integer | integer | integer | integer | integer | integer | integer Valid color ids if bRGB is set to false:
---@markup { MTA:SA Shared }
function getVehicleColor(theVehicle, bRGB) end

---This function returns a table of all the compatible upgrades (or all for a specified slot, optionally) for a specified vehicle.
---@param theVehicle vehicle the vehicle you wish to retrieve the list of compatible upgrades of.
---@param slot integer the upgrade slot number for which you're getting the list (from 0 to 16). Compatible upgrades for all slots are listed if this is not specified.
---@return table Returns a table with all the compatible upgrades, or false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function getVehicleCompatibleUpgrades(theVehicle, slot) end

---This function gets the component position of a vehicle. The vehicle must be streamed in.
---@param theVehicle vehicle The vehicle you wish to get component position of.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param base string? A string representing what the returned position is relative to. It can be one of the following values: parent: The position is relative to the parent component. root: The position is relative to the root component. world: The position is a world position.
---@return number | number | number Returns three floats indicating the position of the component, x , y and z respectively.
---@markup { MTA:SA Shared }
function getVehicleComponentPosition(theVehicle, theComponent, base) end

---This function gets the component rotation of a vehicle.
---@param theVehicle vehicle The vehicle you wish to get component rotation of.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param base string? A string representing what the returned rotation is relative to. It can be one of the following values: parent (default if not specified): The rotation is relative to the parent component. root : The rotation is relative to the root component. world : The rotation is a world rotation, relative to the world's coordinates axes.
---@return number | number | number Returns three floats indicating the rotation of the component, x , y and z respectively.
---@markup { MTA:SA Shared }
function getVehicleComponentRotation(theVehicle, theComponent, base) end

---This function gets the component scale of a vehicle.
---@param theVehicle vehicle The vehicle you wish to get component scale of.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param base string? A string representing what the returned scale is relative to. It can be one of the following values: parent: The scale is relative to the parent component. root: The scale  is relative to the root component. world: The scale is a world scale.
---@return number | number | number Returns three floats indicating the scale of the component, x , y and z respectively.
---@markup { MTA:SA Shared }
function getVehicleComponentScale(theVehicle, theComponent, base) end

---This function get component visibility for vehicle.
---@param theVehicle vehicle The vehicle you wish to get component visibility of.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@return boolean Returns a bool indicating the visible state of the component.
---@markup { MTA:SA Shared }
function getVehicleComponentVisible(theVehicle, theComponent) end

---This function gets a table of the components currently on a vehicle.
---@param theVehicle vehicle The vehicle you wish to get the components of.
---@return table Returns a table containing the name of the component as the key and visibility flag of that component as the value
---@markup { MTA:SA Shared }
function getVehicleComponents(theVehicle) end

---This function is used to get the player in control of the specified vehicle which includes somebody who is trying to enter the drivers seat.
---@param theVehicle vehicle the vehicle you want to get the 'controller' of.
---@return player Returns a player object, if there isn't a driver, it will search the 'trailer chain' for the front driver, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleController(theVehicle) end

---Gets the specified vehicle's current gear.
---@param theVehicle vehicle the vehicle to get the gear of
---@return integer Returns the gear if successful, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleCurrentGear(theVehicle) end

---This function tells you how open a door is (the 'open ratio'). Doors include boots/trunks and bonnets on vehicles that have them.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param door integer MISSINGPARAMDESC
---@return number Returns a number between 0 and 1 that indicates how open the door is. 0 is closed, and 1 is fully open. Returns false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function getVehicleDoorOpenRatio(theVehicle, door) end

---This function returns the current state of the specifed door on the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param door integer MISSINGPARAMDESC
---@return integer If successful, one of the following integers will be returned:
---@markup { MTA:SA Shared }
function getVehicleDoorState(theVehicle, door) end

---This function returns the position of the dummy for the given vehicle.
---@param theVehicle vehicle The vehicle you want to get the dummy positions from.
---@param dummy string The dummy whose position you want to get.
---@return number | number | number Returns 3 floats indicating the position X, Y and Z of the vehicle's dummy. It returns false otherwise.
---@markup { MTA:SA Shared }
function getVehicleDummyPosition(theVehicle, dummy) end

---This function returns a vehicle's engine state (on or off).
---@param theVehicle vehicle the vehicle you wish to get the engine state of.
---@return boolean Returns true if the vehicle's engine is started, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleEngineState(theVehicle) end

---This function returns a table containing the positions to 4 possible entry points to a vehicle. This function can be used alongside setPedEnterVehicle to make a ped enter a specific seat by first moving the ped to a entry point retrieved through getVehicleEntryPoints and then using setPedEnterVehicle to make them enter.
---@param theVehicle vehicle MISSINGPARAMDESC
---@return table If the vehicle has entry points, it returns a table containing the positions of the 4 possible entry points to the vehicle, otherwise it returns false .
---@markup { MTA:SA Shared }
function getVehicleEntryPoints(theVehicle) end

---Retrieves the current gravity vector of a vehicle. This is the direction in which the vehicle falls, also the cameras of any passengers will be rotated to match it.
---@param theVehicle vehicle the vehicle to retrieve the gravity vector of.
---@return float float float Returns the x, y and z components of the gravity vector if successful, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleGravity(theVehicle) end

---This function returns a table of the current vehicle handling data.
---@param theVehicle element the vehicle you wish to get the handling data of.
---@param property string MISSINGPARAMDESC
---@return mixed Returns a table containing all the handling data, false otherwise. If a property is specified, it returns the value of the specific property. Here's a list of valid table properties and what they return:
---@markup { MTA:SA Shared }
function getVehicleHandling(theVehicle, property) end

---This function will get the headlight color of a vehicle.
---@param theVehicle vehicle The vehicle that you wish to set the headlight color of.
---@return integer | integer | integer Returns three integers for the red, green and blue of the headlight color for the specified vehicle, false if an invalid vehicle was specified.
---@markup { MTA:SA Shared }
function getVehicleHeadLightColor(theVehicle) end

---This function gets the time delay (in milliseconds) the vehicle will remain at its position while empty.
---@param theVehicle vehicle The vehicle you wish to get the idle delay of.
---@return integer Returns the delay in milliseconds.
---@markup { MTA:SA Shared }
function getVehicleIdleRespawnDelay(theVehicle) end

---This function is used to check whether a vehicle's landing gear is down or not. Only planes can be used with this function.
---@param theVehicle vehicle the vehicle of which you wish to check the landing gear state.
---@return boolean Returns true if landing gear is down, false if the landing gear is up. Returns nil if the vehicle has no landing gear, or is invalid.
---@markup { MTA:SA Shared }
function getVehicleLandingGearDown(theVehicle) end

---This function returns the current state of the specified light on the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param light integer MISSINGPARAMDESC
---@return integer Returns 0 (working) or 1 (broken)
---@markup { MTA:SA Shared }
function getVehicleLightState(theVehicle, light) end

---This function returns the maximum number of passengers that a specified vehicle can hold. Only passenger seats are counted, the driver seat is excluded.
---@param theVehicle / int modelID vehicle MISSINGPARAMDESC
---@return integer Returns an int indicating the maximum number of passengers that can enter a vehicle. Returns false if vehicle (or its ID) is a trailer
---@markup { MTA:SA Shared }
function getVehicleMaxPassengers(theVehicle / int modelID) end

---This function gets the default position of the dummies contained in a vehicle model.
---@param modelId integer The model ID which you want to apply the change to.
---@param dummy string The dummy whose position you want to get.
---@return number | number | number Returns 3 floats indicating the default position X, Y and Z of the given dummy. It returns false otherwise.
---@markup { MTA:SA Shared }
function getVehicleModelDummyDefaultPosition(modelId, dummy) end

---This function gets position of the dummies contained in a vehicle model.
---@param modelID integer The model ID which you want to apply the change to
---@param dummy string The dummy whose position you want to get
---@return number | number | number Returns three floats indicating the position x , y and z of given dummy. It returns false otherwise.
---@markup { MTA:SA Shared }
function getVehicleModelDummyPosition(modelID, dummy) end

---This function returns the position of the exhaust fumes the vehicle model emits.
---@param modelID integer The vehicle model ID.
---@return number | number | number Returns the position of the exhaust fumes if everything went fine or false otherwise.
---@markup { MTA:SA Shared }
function getVehicleModelExhaustFumesPosition(modelID) end

---This function retrieves the model ID of a vehicle as an integer value from its name.
---@param name string A string containing the name of the vehicle.
---@return integer Returns an integer if the name exists, false otherwise. If you use this function on vehicles with shared names, such as "police", it will return the earliest occurrence of that vehicle's ID.
---@markup { MTA:SA Shared }
function getVehicleModelFromName(name) end

---This function gets the size of a group of wheels for a vehicle model.
---@param vehicleModel integer The vehicle model ID.
---@param wheelGroup string The group of wheels of the vehicle model to retrieve their size value. If not specified, it defaults to allwheels . The following values are supported: frontaxle : Represents the wheels in the front axle. rearaxle : Represents the wheels in the rear axle. allwheels : Convenience group that returns all the wheel sizes in a table of the following format:
---@return number|table Returns a decimal number or a table, depending on the specified wheel group. If the specified vehicle model ID or wheel group are not valid, an error is raised instead. The meaning of the wheel size values is documented in setVehicleModelWheelSize .
---@markup { MTA:SA Shared }
function getVehicleModelWheelSize(vehicleModel, wheelGroup) end

---This function returns a string containing the name of the vehicle
---@param theVehicle vehicle the vehicle you want to get the name of.
---@return string Returns a string containing the requested vehicle's name, or false if the vehicle passed to the function is invalid.
---@markup { MTA:SA Shared }
function getVehicleName(theVehicle) end

---Gets the name of a vehicle by its model ID.
---@param model integer This is the vehicle model ID. See vehicle IDs to see what values will return names.
---@return string Returns the name of the vehicle if the model ID was valid, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleNameFromModel(model) end

---This function gets the nitro count of the vehicle.
---@param theVehicle vehicle
---@return integer Returns an integer determining the amount of nitro counts of the vehicle, false if there is no nitro in the vehicle.
---@markup { MTA:SA Shared }
function getVehicleNitroCount(theVehicle) end

---This function gets the nitro level of the vehicle.
---@param theVehicle vehicle
---@return number Returns a float determining the nitro level (ranges from 0.0001 to 1.0) of the vehicle, false if there is no nitro in the vehicle.
---@markup { MTA:SA Shared }
function getVehicleNitroLevel(theVehicle) end

---This function gets the player sitting/trying to enter the specified vehicle.
---@param theVehicle vehicle the vehicle of which you wish to retrieve the driver or a passenger.
---@param seat integer? the seat where the player is sitting (0 for driver, 1+ for passengers).
---@return player Returns the player sitting in the vehicle, or false if the seat is unoccupied or doesn't exist.
---@markup { MTA:SA Shared }
function getVehicleOccupant(theVehicle, seat) end

---This function gets all peds sitting in the specified vehicle.
---@param theVehicle vehicle the vehicle of which you wish to retrieve the occupants.
---@return table Returns a table with seat ID as an index and the occupant as an element like this: table[seat] = occupant
---@markup { MTA:SA Shared }
function getVehicleOccupants(theVehicle) end

---This function is used to find out the current state of the override\-lights setting of a vehicle.
---@param theVehicle vehicle the vehicle you wish to retrieve the override lights setting of.
---@return integer Returns an integer value: 0 (No override), 1 (Force off) or 2 (Force on).
---@markup { MTA:SA Shared }
function getVehicleOverrideLights(theVehicle) end

---This function gets the current paintjob on the specified vehicle.
---@param theVehicle vehicle the vehicle you wish to get the paintjob of.
---@return integer Returns an integer representing the current paintjob on the vehicle.
---@markup { MTA:SA Shared }
function getVehiclePaintjob(theVehicle) end

---This function returns the current state of a specifed panel on the vehicle. A vehicle can have up to 7 panels.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param panel integer MISSINGPARAMDESC
---@return integer Returns an int indicating the state of the specified the panel. This is a value between 0 and 3, with 0 indicating the panel is undamaged and 3 indicating it is very damaged.
---@markup { MTA:SA Shared }
function getVehiclePanelState(theVehicle, panel) end

---This function is used to retrieve the text on the number plate of a specified vehicle.
---@param theVehicle vehicle the vehicle that you wish to retrieve the plate text from.
---@return string Returns a string that corresponds to the plate on the text, false if a bad argument was passed or if it is not a vehicle. Every vehicle (including planes, boats, etc.) has a numberplate, even if it's not visible.
---@markup { MTA:SA Shared }
function getVehiclePlateText(theVehicle) end

---This function gets the time delay (in milliseconds) the vehicle will remain wrecked before respawning.
---@param theVehicle vehicle The vehicle you wish to get the respawn delay of.
---@return integer Returns the delay in milliseconds.
---@markup { MTA:SA Shared }
function getVehicleRespawnDelay(theVehicle) end

---This function retrieves the respawn coordinates of a vehicle.
---@param theVehicle vehicle The vehicle which you'd like to retrieve the respawn coordinates of.
---@return float float float Returns three floats indicating the respawn coordinates of the vehicle , x , y and z respectively.
---@markup { MTA:SA Shared }
function getVehicleRespawnPosition(theVehicle) end

---This function retrieves the respawn rotation of a vehicle.
---@param theVehicle vehicle The vehicle which you'd like to retrieve the respawn rotation of.
---@return float float float Returns three floats indicating the respawn rotation of the vehicle , x , y and z respectively.
---@markup { MTA:SA Shared }
function getVehicleRespawnRotation(theVehicle) end

---Retrieves the speed at which the rotor of a helicopter or plane rotates.
---@param theVehicle vehicle the vehicle element (helicopter or plane) to get the rotor speed of.
---@return number Returns the rotor speed if successful. This is 0 when the helicopter or plane is stationary, and about 0.2 when it is fully spun up. It can be negative if the rotor rotates counter-clockwise. Returns false in case of failure (an invalid element or a vehicle element that is not a helicopter or plane was passed).
---@markup { MTA:SA Shared }
function getVehicleRotorSpeed(theVehicle) end

---This function returns a vehicle's (plane or helicopter) rotor state (on or off).
---@param theVehicle vehicle the vehicle you wish to get the engine state of.
---@return boolean Returns true if the vehicle's rotor is started, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleRotorState(theVehicle) end

---This function get the parameters of a vehicles siren.
---@param theVehicle vehicle The vehicle to get the siren parameters of
---@return table Returns a table with the siren count, siren type and a sub table for the four flags. False otherwise.
---@markup { MTA:SA Shared }
function getVehicleSirenParams(theVehicle) end

---This function gets the properties of a vehicle's sirens.
---@param theVehicle vehicle The vehicle to get siren information of.
---@return table If the vehicle is invalid, it returns false . Otherwise, returns a table with sub tables containing the properties of each siren point in the following manner:
---@markup { MTA:SA Shared }
function getVehicleSirens(theVehicle) end

---This function returns whether the sirens are turned on for the specified vehicle.
---@param theVehicle vehicle The vehicle that will be checked.
---@return boolean Returns true if the sirens are turned on for the specified vehicle, false if the sirens are turned off for the specified vehicle, if the vehicle doesn't have sirens or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function getVehicleSirensOn(theVehicle) end

---This function is used to get the vehicle being towed by another.
---@param theVehicle vehicle The vehicle you wish to get the towed vehicle from.
---@return vehicle Returns the vehicle that theVehicle is towing, false if it isn't towing a vehicle.
---@markup { MTA:SA Shared }
function getVehicleTowedByVehicle(theVehicle) end

---This function is used to get the vehicle that is towing another.
---@param theVehicle vehicle the vehicle being towed.
---@return vehicle This example will create a trailer and a trailer-tower, attach them, then check if they attached.
---@markup { MTA:SA Shared }
function getVehicleTowingVehicle(theVehicle) end

---This function gets the position of a vehicle's turret, if it has one. Vehicles with turrets include firetrucks and tanks.
---@param turretVehicle vehicle The vehicle whose turret position you want to retrieve. This should be a vehicle with a turret.
---@return number | number Returns two floats for the X (horizontal) and Y (vertical) axis rotation respectively. These values are in radians. The function will return 0, 0 if the vehicle is not a vehicle with a turret.
---@markup { MTA:SA Shared }
function getVehicleTurretPosition(turretVehicle) end

---This function retrieves the type of a vehicle (such as if it is a car or a boat).
---@param theVehicle vehicle MISSINGPARAMDESC
---@return string Returns a string with vehicle type or false if an invalid modelID has been supplied, or an empty string if the vehicle is blocked internally (some trailers).
---@markup { MTA:SA Shared }
function getVehicleType(theVehicle) end

---This function returns the current upgrade id on the specified vehicle's 'upgrade slot' An upgrade slot is a certain type of upgrade (eg: exhaust, spoiler), there are 17 slots (0 to 16\).
---@param theVehicle vehicle The vehicle whose upgrade you want to retrieve.
---@param slot integer The slot id of the upgrade. ( Upgrade list ordered by slot number)
---@return integer Returns an integer with the upgrade on the slot if correct arguments were passed, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleUpgradeOnSlot(theVehicle, slot) end

---This function returns the name of an upgrade slot name (e.g. roof, spoiler).
---@param slot/upgrade integer the slot ID or corresponding upgrade ID of which you want the name. 0 : Hood 1 : Vent 2 : Spoiler 3 : Sideskirt 4 : Front Bullbars 5 : Rear Bullbars 6 : Headlights 7 : Roof 8 : Nitro 9 : Hydraulics 10 : Stereo 11 : Unknown 12 : Wheels 13 : Exhaust 14 : Front Bumper 15 : Rear Bumper 16 : Misc
---@return string Returns a string with the slot name if a valid slot or upgrade ID was given, false otherwise.
---@markup { MTA:SA Shared }
function getVehicleUpgradeSlotName(slot/upgrade) end

---This function returns a table of all the upgrades on a specifed vehicle.
---@param theVehicle vehicle The vehicle you wish to retrieve the upgrades of.
---@return table Returns a table of all the upgrades on each slot of a vehicle, which may be empty, or false if a valid vehicle is not passed.
---@markup { MTA:SA Shared }
function getVehicleUpgrades(theVehicle) end

---This function gets the variant of a specified vehicle. In GTA: San Andreas some vehicles are different; for example the labelling on trucks or the contents of a pick\-up truck and the varying types of a motor bike. For the default variant list see: Vehicle variants.
---@param theVehicle vehicle The vehicle that you want to get the variant of.
---@return integer | integer Returns 2 int containing the vehicle variants, false otherwise (the specified vehicle doesn't exist).
---@markup { MTA:SA Shared }
function getVehicleVariant(theVehicle) end

---This function returns the current wheel friction state of the vehicle.
---@param theVehicle vehicle The vehicle that you wish to get the wheel friction state.
---@param wheel integer The wheel you want to check. (0: front left, 1: rear left, 2: front right, 3: rear right)
---@return integer Returns a int indicating the wheel friction state. This value can be:
---@markup { MTA:SA Shared }
function getVehicleWheelFrictionState(theVehicle, wheel) end

---This function gets the scale of all the wheels of a vehicle.
---@param theVehicle vehicle The vehicle to get its wheel scale of.
---@return number Returns the wheel scale of the specified vehicle as a decimal number, or an error if the vehicle is invalid. For more information about the returned number, see setVehicleWheelScale .
---@markup { MTA:SA Shared }
function getVehicleWheelScale(theVehicle) end

---This function returns the current states of all the wheels on the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@return integer | integer | integer | integer Returns 4 ints indicating the states of the wheels (front left, rear left, front right, rear right). These values can be:
---@markup { MTA:SA Shared }
function getVehicleWheelStates(theVehicle) end

---This function scans through all the current vehicles and returns the ones matching the given model.
---@param model integer The model of vehicles you want.
---@return table Returns a table of existing vehicles matching the specified model.
---@markup { MTA:SA Shared }
function getVehiclesOfType(model) end

---This function checks if a train is a chain engine (moves the rest of the chain's carriages) or not.
---@param theTrain vehicle MISSINGPARAMDESC
---@return boolean The next code snippet adds a /isthistrainachainengine, which checks if the train occupied by the player who types the command is a chain engine or not.
---@markup { MTA:SA Shared }
function isTrainChainEngine(theTrain) end

---This function will check if a train or tram is derailable.
---@param vehicleToCheck vehicle The vehicle you wish to check.
---@return boolean Returns true if the train is derailable, false otherwise.
---@markup { MTA:SA Shared }
function isTrainDerailable(vehicleToCheck) end

---This function will check if a train or tram is derailed.
---@param vehicleToCheck vehicle the vehicle that you wish to check is derailed.
---@return boolean Returns true if the train is derailed, false if the train is still on the rails
---@markup { MTA:SA Shared }
function isTrainDerailed(vehicleToCheck) end

---This function allows you to determine whether a vehicle is blown or still intact.
---@param theVehicle vehicle The vehicle that you want to obtain the blown status of.
---@return boolean Returns true if the vehicle specified has blown up, false if it is still intact or the vehicle specified is invalid.
---@markup { MTA:SA Shared }
function isVehicleBlown(theVehicle) end

---This function checks if a vehicle is damage proof (set with setVehicleDamageProof).
---@param theVehicle vehicle the vehicle whose invincibility status we want to check.
---@return boolean Returns true if the vehicle is damage proof, false if it isn't or if invalid arguments were passed.
---@markup { MTA:SA Shared }
function isVehicleDamageProof(theVehicle) end

---This will tell you if a vehicle's petrol tank is explodable.
---@param theVehicle vehicle The vehicle that you want to obtain the fuel tank status of.
---@return boolean Returns true if the specified vehicle is valid and its fuel tank is explodable, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleFuelTankExplodable(theVehicle) end

---This will tell you if a vehicle is locked.
---@param theVehicle vehicle The vehicle that you want to obtain the locked status of.
---@return boolean Returns true if the vehicle specified is locked, false if is unlocked or the vehicle specified is invalid.
---@markup { MTA:SA Shared }
function isVehicleLocked(theVehicle) end

---This function checks if nitro is activated on the vehicle.
---@param theVehicle vehicle
---@return boolean Returns true if the nitro is currently activated on the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleNitroActivated(theVehicle) end

---This function checks if nitro is recharging on the vehicle.
---@param theVehicle vehicle
---@return boolean Returns true if the nitro is currently recharging on the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleNitroRecharging(theVehicle) end

---Checks to see if a vehicle has contact with the ground.
---@param theVehicle vehicle The vehicle you wish to check.
---@return boolean Returns true if vehicle is on the ground, false if it is not.
---@markup { MTA:SA Shared }
function isVehicleOnGround(theVehicle) end

---This function check if the vehicle is respawnable.
---@param theVehicle vehicle The vehicle which you'd like to get respawn state of.
---@return boolean Returns three true if the vehicle is respawnable, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleRespawnable(theVehicle) end

---This function is used to check planes smoke trail enabled or disabled.
---@param veh vehicle MISSINGPARAMDESC
---@return isVehicleSmokeTrailEnabled If it enabled it returns true , false otherwise.
---@markup { MTA:SA Shared }
function isVehicleSmokeTrailEnabled(veh) end

---This function will get the taxi light state of a taxi (vehicle IDs 420 and 438\)
---@param taxi vehicle The vehicle element of the taxi that you wish to get the light state of.
---@return boolean Returns true if the light is on, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleTaxiLightOn(taxi) end

---This function returns a boolean whether the vehicle's wheel is on ground (true) or in air (false).
---@param theVehicle vehicle
---@param wheel string/int "frontleft" or 0 "rearleft" or 1 "frontright" or 2 "rearright" or 3
---@return boolean Returns true if the vehicle wheel is on ground/collided, false otherwise.
---@markup { MTA:SA Shared }
function isVehicleWheelOnGround(theVehicle, wheel) end

---This function gets the vehicle window state.
---@param theVehicle vehicle The vehicle that you wish to get the window state.
---@param window integer An integer representing a vehicle window. It can be: 0: motorbike shield 1: rear window 2: right front window 3: right back window 4: left front (driver) window 5: left back window 6: windshield
---@return boolean This function returns a boolean which represents window open state.
---@markup { MTA:SA Shared }
function isVehicleWindowOpen(theVehicle, window) end

---This function removes sirens from a vehicle.
---@param theVehicle vehicle The vehicle to remove the sirens of
---@return boolean Returns true if sirens were successfully removed from the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function removeVehicleSirens(theVehicle) end

---This function removes an already existing upgrade from the specified vehicle, eg: nos, hydraulics. Defined in San Andreas\\data\\maps\\veh\mods\\veh\mods.ide.
---@param theVehicle vehicle The element representing the vehicle you wish to remove the upgrade from
---@param upgrade integer The ID of the upgrade you wish to remove.
---@return boolean Returns true if the upgrade was successfully removed from the vehicle, otherwise false .
---@markup { MTA:SA Shared }
function removeVehicleUpgrade(theVehicle, upgrade) end

---This function reset to default component position for vehicle.
---@param theVehicle vehicle The vehicle you wish to reset component position.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@return boolean Returns true if the position of the component was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetVehicleComponentPosition(theVehicle, theComponent) end

---This function reset to default component rotation for vehicle.
---@param theVehicle vehicle The vehicle you wish to reset component rotation.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@return boolean Returns true if the rotation of the component was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetVehicleComponentRotation(theVehicle, theComponent) end

---This function reset to default component scale for vehicle.
---@param theVehicle vehicle The vehicle you wish to reset component scale.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@return boolean Returns true if the scale of the component was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetVehicleComponentScale(theVehicle, theComponent) end

---This function resets the vehicle dependent dummy positions to the vehicle's current model dummy positions.
---@param theVehicle vehicle The vehicle to reset the dummy positions.
---@return boolean Returns true if the dummy positions have been reset, false otherwise.
---@markup { MTA:SA Shared }
function resetVehicleDummyPositions(theVehicle) end

---Resets the vehicle explosion time. This is the point in time at which the vehicle last exploded: at this time plus the vehicle's respawn delay, the vehicle is respawned. You can use this function to prevent the vehicle from respawning.
---@param theVehicle vehicle The vehicle you wish to reset the explosion time from.
---@return boolean Returns true if the vehicle explosion time has been reset, false if it failed to reset the explosion time.
---@markup { MTA:SA Shared }
function resetVehicleExplosionTime(theVehicle) end

---Resets the vehicle idle time
---@param theVehicle vehicle The vehicle you wish to reset the idle time from.
---@return boolean Returns true if the vehicle idle time has been reset, false if it failed to reset the idle time.
---@markup { MTA:SA Shared }
function resetVehicleIdleTime(theVehicle) end

---This function respawns a vehicle according to its set respawn position, set by setVehicleRespawnPosition or the position and rotation it was created on. To spawn a vehicle to a specific location just once, spawnVehicle can be used.
---@param theVehicle vehicle The vehicle you wish to respawn
---@return boolean Returns true if the vehicle respawned successfully, false if the passed argument does not exist or is not a vehicle.
---@markup { MTA:SA Shared }
function respawnVehicle(theVehicle) end

---This function changes the state of the helicopter blades collisions on the specified vehicle.
---@param theVehicle vehicle The helicopter that will have the blades collisions set.
---@param collisions boolean The state of the helicopter blades collisions.
---@return boolean Returns true if the collisions are set for the specified vehicle, false if the collisions can't be set for the specified vehicle, if the vehicle is not a helicopter or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function setHeliBladeCollisionsEnabled(theVehicle, collisions) end

---This function is used to change the handling data of all vehicles of a specified model.
---@param modelId integer The vehicle model you wish to set the handling of.
---@param property string The property you wish to set the handling of the vehicle to, or nil if you want to reset the all the handling properties.
---@param value var The value of the models's handling property you wish to set, or nil if you want to reset the handling property to its default value.
---@return boolean Returns true if the handling was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setModelHandling(modelId, property, value) end

---This function will set a train or tram as derailable. This is, if it can derail when it goes above the maximum speed.
---@param derailableVehicle vehicle The vehicle that you wish to set derailable.
---@param derailable boolean whether the train or tram is derailable. True as derailable, False as non-derailable.
---@return boolean Returns true if the state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setTrainDerailable(derailableVehicle, derailable) end

---This function will set a train or tram as derailed.
---@param vehicleToDerail vehicle The vehicle that you wish to derail.
---@param derailed boolean whether the train is derailed.
---@return boolean Returns true if the state was successfully set
---@markup { MTA:SA Shared }
function setTrainDerailed(vehicleToDerail, derailed) end

---Sets the direction in which a train or tram drives over the rails (clockwise or counterclockwise).
---@param train vehicle the train whose direction to change.
---@param clockwise boolean if true , will make the train go clockwise. If false , makes it go counterclockwise.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setTrainDirection(train, clockwise) end

---Sets the position the train is currently on the track
---@param train vehicle the train of which to set the track
---@param position number the position along the track (0 - 18107 a complete way round)
---@return boolean Returns true if the train position was set, false otherwise.
---@markup { MTA:SA Shared }
function setTrainPosition(train, position) end

---Sets the on\-track speed of a train.
---@param train vehicle the train whose speed to change.
---@param speed number the new on-track speed of the train. A positive value will make it go clockwise, a negative value counter clockwise.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setTrainSpeed(train, speed) end

---This function is used for adjusting the movable parts of a model, for example hydra jets or dump truck tray. This function only works on vehicles with adjustable properties.
---@param theVehicle element The vehicle you wish to change the adjustable property of.
---@param value integer A value from 0 between ?. (Set the adjustable value between 0 and N. 0 is the default value. It is possible to force the setting beyond default maximum, for example setting above 5000 on the dump truck (normal max 2500) will cause the tray to be fully vertical.)
---@return boolean Returns true if the adjustable property was set, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleAdjustableProperty(theVehicle, value) end

---This function will set the color of a vehicle using either a RGB format, or the standard San Andreas color IDs. Vehicles can have up to 3 colors, most of the vehicles have 2 colors only.
---@param veh vehicle MISSINGPARAMDESC
---@param r1 integer MISSINGPARAMDESC
---@param g1 integer MISSINGPARAMDESC
---@param b1 integer MISSINGPARAMDESC
---@param r2 integer MISSINGPARAMDESC
---@param g2 integer MISSINGPARAMDESC
---@param b2 integer MISSINGPARAMDESC
---@param r3 integer MISSINGPARAMDESC
---@param g3 integer MISSINGPARAMDESC
---@param b3 integer MISSINGPARAMDESC
---@param r4 integer MISSINGPARAMDESC
---@param g4 integer MISSINGPARAMDESC
---@param b4 integer MISSINGPARAMDESC
---@return boolean Returns true if vehicle's color was set, false if an invalid vehicle or invalid colors were specified.
---@markup { MTA:SA Shared }
function setVehicleColor(veh, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4) end

---This function sets the component position of a vehicle.
---@param theVehicle vehicle The vehicle you wish to set component position.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param posX number The new x position of this component.
---@param posY number The new y position of this component.
---@param posZ number The new z position of this component.
---@param base string? A string representing what the supplied position ( posX , posY , posZ ) is relative to. It can be one of the following values: parent : The position is relative to the parent component. root (default if not specified): The position is relative to the root component. world : The position is a world position, relative to the world's center of coordinates.
---@return boolean Returns true if component position was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleComponentPosition(theVehicle, theComponent, posX, posY, posZ, base) end

---This function sets the component rotation of a vehicle.
---@param theVehicle vehicle The vehicle you wish to set component rotation of.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param rotX number The component's rotation around the x axis in degrees.
---@param rotY number The component's rotation around the y axis in degrees.
---@param rotZ number The component's rotation around the z axis in degrees.
---@param base string? A string representing what the supplied rotation ( rotX , rotY , rotZ ) is relative to. It can be one of the following values: parent: The rotation is relative to the parent component. root: The rotation is relative to the root component. world: The rotation is a world rotation, relative to the world's coordinates axes.
---@return boolean Returns true if the component rotation was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleComponentRotation(theVehicle, theComponent, rotX, rotY, rotZ, base) end

---This function sets the component scale of a vehicle.
---@param theVehicle vehicle The vehicle you wish to set component scale.
---@param theComponent string A vehicle component (this is the frame name from the model file of the component you wish to modify)
---@param scaleX number The new x scale of this component.
---@param scaleY number The new y scale of this component.
---@param scaleZ number The new z scale of this component.
---@param base string? A string representing what the supplied scale ( scaleX , scaleY , scaleZ ) is relative to. It can be one of the following values: parent : The scale is relative to the parent component. root : The scale is relative to the root component. world : The scale is a world scale, relative to the world's center of coordinates.
---@return boolean Returns true if component scale was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleComponentScale(theVehicle, theComponent, scaleX, scaleY, scaleZ, base) end

---This function sets component visibility for vehicle.
---@param theVehicle vehicle The vehicle you wish to set component visibility of.
---@param theComponent string A vehicle component (this is the component's frame name (also called 'dummy') from the vehicle model's DFF file of which you want to manipulate components)
---@param visible boolean a bool which determines if the component should be visible
---@return boolean Returns a bool indicating if the visiblity was changed successfully.
---@markup { MTA:SA Shared }
function setVehicleComponentVisible(theVehicle, theComponent, visible) end

---This functions makes a vehicle damage proof, so it won't take damage from bullets, hits, explosions or fire. A damage proof's vehicle health can still be changed via script.
---@param theVehicle vehicle The vehicle you wish to make damage proof.
---@param damageProof boolean true is damage proof, false is damageable.
---@return boolean Returns true if the vehicle was set damage proof succesfully, false if the arguments are invalid or it failed.
---@markup { MTA:SA Shared }
function setVehicleDamageProof(theVehicle, damageProof) end

---This function sets how much a vehicle's door is open. Doors include the boot/trunk and the bonnet of the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param door integer MISSINGPARAMDESC
---@param ratio number MISSINGPARAMDESC
---@param time integer? MISSINGPARAMDESC
---@return boolean Returns true if the door open ratio was successfully set, false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function setVehicleDoorOpenRatio(theVehicle, door, ratio, time) end

---This function sets the state of the specified door on a vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param door integer MISSINGPARAMDESC
---@param state integer MISSINGPARAMDESC
---@return boolean Returns true if the door state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleDoorState(theVehicle, door, state) end

---This function makes a vehicle's doors undamageable, so they won't fall off when they're hit. Note that the vehicle has to be locked using setVehicleLocked for this setting to have any effect.
---@param theVehicle vehicle The vehicle of which you wish to set the car door damageability.
---@param state boolean A boolean denoting whether the vehicle's doors are undamageable ( true ) or damageable ( false ).
---@return boolean Returns true if the damageability state was successfully changed, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setVehicleDoorsUndamageable(theVehicle, state) end

---This function sets the position of the dummy for the given vehicle.
---@param theVehicle vehicle The vehicle you want to set the dummy position for.
---@param dummy string The dummy whose position you want to set.
---@param x number
---@param y number MISSINGPARAMDESC
---@param z number MISSINGPARAMDESC
---@return boolean Returns true if the dummy position has been successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleDummyPosition(theVehicle, dummy, x, y, z) end

---This function turns a vehicle's engine on or off. Note that the engine will always be turned on when someone enters the driver seat, unless you override that behaviour with scripts.
---@param theVehicle vehicle The vehicle you wish to change the engine state of.
---@param engineState boolean A boolean value representing whether the engine will be turned on ( true ) or off ( false ).
---@return boolean Returns true if the vehicle's engine state was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleEngineState(theVehicle, engineState) end

---This function changes the 'explodable state' of a vehicle's fuel tank, which toggles the ability to blow the vehicle up by shooting the tank. This function will have no effect on vehicles with tanks that cannot be shot in single player.
---@param theVehicle vehicle The vehicle you wish to change the fuel tank explodable state of.
---@param explodable boolean A boolean value representing whether or not the fuel tank will be explodable.
---@return boolean Returns true if the vehicle's fuel tank explodable state was successfully changed, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleFuelTankExplodable(theVehicle, explodable) end

---Sets the gravity vector of a vehicle. The vehicle will fall in this direction, and the camera of any occupants will also be rotated to match it. Can be used for e.g. driving on walls or upside down on ceilings.
---@param theVehicle vehicle the vehicle of which to change the gravity.
---@param x number MISSINGPARAMDESC
---@param y number MISSINGPARAMDESC
---@param z number MISSINGPARAMDESC
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleGravity(theVehicle, x, y, z) end

---This function is used to change the handling data of a vehicle.
---@param theVehicle element The vehicle you wish to set the handling of.
---@param property string The property you wish to set the handling of the vehicle to.
---@param value var MISSINGPARAMDESC
---@return boolean Returns true if the handling was set successfully, false otherwise. See below a list of valid properties and their required values:
---@markup { MTA:SA Shared }
function setVehicleHandling(theVehicle, property, value) end

---This function will set the headlight color of a vehicle. valid Red Green and Blue arguments range from 0\-255
---@param theVehicle vehicle The vehicle that you wish to set the headlight color of.
---@param red integer An integer indicating the amount of red for the vehicle's headlights
---@param green integer An integer indicating the amount of green for the vehicle's headlights
---@param blue integer An integer indicating the amount of blue for the vehicle's headlights
---@return boolean Returns true if vehicle's headlight color was set, false if an invalid vehicle or invalid color ranges were specified for red,green or blue.
---@markup { MTA:SA Shared }
function setVehicleHeadLightColor(theVehicle, red, green, blue) end

---This function sets the time delay (in milliseconds) the vehicle will remain at its position while empty.
---@param theVehicle vehicle The vehicle you wish to change the respawn delay of.
---@param timeDelay integer The number of milliseconds the vehicle will be allowed to remain unused until it respawns.
---@return boolean Returns true if the vehicle was found and edited.
---@markup { MTA:SA Shared }
function setVehicleIdleRespawnDelay(theVehicle, timeDelay) end

---This function is used to set the landing gear state of certain vehicles.
---@param theVehicle vehicle The vehicle of which you wish to set the landing gear state.
---@param gearState boolean A bool representing the state of the landing gear. true represents a collapsed landing gear, while false represents a disabled landing gear.
---@return boolean Returns true if the landing gear was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleLandingGearDown(theVehicle, gearState) end

---This function sets the state of the light on the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param light integer MISSINGPARAMDESC
---@param state integer MISSINGPARAMDESC
---@return boolean Returns true if the light state was set successfully, false if invalid arguments were passed to the function.
---@markup { MTA:SA Shared }
function setVehicleLightState(theVehicle, light, state) end

---This function can be used to set the vehicle's doors to be locked or unlocked. Locking a vehicle restricts access to the vehicle.
---@param theVehicle vehicle The vehicle which you wish to change the lock status of
---@param locked boolean Boolean for the status you wish to set. Set true to lock, false to unlock
---@return boolean Returns true if the operation was successful, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleLocked(theVehicle, locked) end

---This function sets the position of the dummies contained in a vehicle model. Use setVehicleComponentPosition to adjust the vehicle component positions.
---@param modelID integer The model ID which you want to apply the change to
---@param dummy string The dummy whose position you want to change
---@param x number MISSINGPARAMDESC
---@param y number MISSINGPARAMDESC
---@param z number MISSINGPARAMDESC
---@return boolean Returns true if everything went fine, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleModelDummyPosition(modelID, dummy, x, y, z) end

---This function sets the position of the exhaust fumes the vehicle model emits. Use setVehicleComponentPosition to adjust the exhaust position.
---@param modelID integer The model ID which you want to apply the change to
---@param posX number The desired position
---@param posY number MISSINGPARAMDESC
---@param posZ number MISSINGPARAMDESC
---@return boolean Returns true if everything went fine, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleModelExhaustFumesPosition(modelID, posX, posY, posZ) end

---This function sets the size of a group of wheels for a vehicle model. The wheel size mainly determines their width, collision box (used to check if a bullet hits a tire, for example) and the ground clearance of vehicles with that model (i.e., the minimum distance from the center of the car geometry to the ground). It also changes the visual scale and rotation of the wheels, if not all the wheel groups have equal size. The visual scaling is applied before the per\-vehicle wheel scale.
---@param vehicleModel integer The vehicle model ID.
---@param wheelGroup string The group of wheels of the vehicle model that will have its size set by this function. The following values are supported: frontaxle : Represents the wheels in the front axle. The default value for this group is read by GTA from the WheelScaleFront field of the vehicles.ide data file. rearaxle : Represents the wheels in the rear axle. The default value for this group is read by GTA from the WheelScaleRear field of the vehicles.ide data file. allwheels : Convenience group that contains the other wheel groups: frontaxle and rear_axle .
---@param wheelSize number The wheel size value to set. Default GTA values for automobiles usually are around 0.7. It must be greater than 0.
---@return boolean Returns true if the size for the specified wheel group and vehicle model has been set successfully, or an error if some parameter is invalid.
---@markup { MTA:SA Shared }
function setVehicleModelWheelSize(vehicleModel, wheelGroup, wheelSize) end

---This function activates or deactivates the nitro on the specified vehicle, like if a player pressed the button for activating nitro.
---@param theVehicle vehicle
---@param state boolean
---@return boolean Returns true if the nitro activation state was modified successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleNitroActivated(theVehicle, state) end

---This function sets how many times a player can activate the nitro on a specified vehicle.
---@param theVehicle vehicle the vehicle which you want to modify how many times a player can use its nitro.
---@param count integer how many times should the player be able to use the nitro of this vehicle (from 0-100 times; 0 means that it can't be used and 101 means that it can be used infinite times).
---@return boolean Returns true if the nitro count was set successfully to the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleNitroCount(theVehicle, count) end

---This function sets the nitro level of the vehicle.
---@param theVehicle vehicle
---@param level number
---@return boolean Returns true if the nitro level was set successfully to the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleNitroLevel(theVehicle, level) end

---This function changes the light overriding setting on a vehicle.
---@param theVehicle vehicle The vehicle you wish to change the override lights setting of.
---@param value integer A whole number representing the state of the lights: 0 : No override, lights are set to default. 1 : Lights are forced off. 2 : Lights are forced on.
---@return boolean Returns true if the vehicle's lights setting was changed. Otherwise false .
---@markup { MTA:SA Shared }
function setVehicleOverrideLights(theVehicle, value) end

---This function changes the paintjob on the specified vehicle.    See paintjob for list of supported vehicles. To remove a paintjob from a vehicle, apply paintjob number 3 to it.
---@param theVehicle vehicle The vehicle you wish to change the paintjob of.
---@param value integer A whole number representing the new paintjob id. Ranges from 0 up to 3.
---@return boolean Returns true if the vehicle's paintjob was changed. Otherwise false .
---@markup { MTA:SA Shared }
function setVehiclePaintjob(theVehicle, value) end

---This function allows you to change the state of one of the six panels vehicle's can have. When executed on the server\-side resources, the damage will be synched for all players, whereas the change is only client\-side if the function is used in a client resource.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param panelID integer MISSINGPARAMDESC
---@param state integer MISSINGPARAMDESC
---@param spawnFlyingComponent boolean? MISSINGPARAMDESC
---@param breakGlass boolean? MISSINGPARAMDESC
---@return boolean Returns true if the panel state has been updated, false otherwise
---@markup { MTA:SA Shared }
function setVehiclePanelState(theVehicle, panelID, state, spawnFlyingComponent, breakGlass) end

---This function can be used to set the numberplate text of a vehicle. All non ascii characters will be replaced by spaces.
---@param theVehicle element the vehicle whose numberplate you want to change.
---@param numberplate string a string that will go on the number plate of the vehicle (max 8 characters).
---@return boolean Returns true if the numberplate was changed successfully, or false if invalid arguments were passed
---@markup { MTA:SA Shared }
function setVehiclePlateText(theVehicle, numberplate) end

---This function sets the time delay (in milliseconds) the vehicle will remain wrecked before respawning.
---@param theVehicle vehicle The vehicle you wish to change the respawn delay of.
---@param timeDelay integer The amount of milliseconds to delay.
---@return boolean Returns true if the vehicle was found and edited.
---@markup { MTA:SA Shared }
function setVehicleRespawnDelay(theVehicle, timeDelay) end

---This function sets the position (and rotation) the vehicle will respawn to.
---@param theVehicle vehicle The vehicle you wish to change the respawn position of.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param rx number A floating point number representing the rotation about the X axis in Degrees.
---@param ry number A floating point number representing the rotation about the Y axis in Degrees.
---@param rz number A floating point number representing the rotation about the Z axis in Degrees.
---@return boolean Returns true if the vehicle was found and edited, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleRespawnPosition(theVehicle, x, y, z, rx, ry, rz) end

---This function sets the rotation the vehicle will respawn to.
---@param theVehicle vehicle The vehicle you wish to change the respawn position of.
---@param rx number A float representing the rotation about the X axis in degrees.
---@param ry number A float representing the rotation about the Y axis in degrees.
---@param rz number A float representing the rotation about the Z axis in degrees.
---@return boolean Returns true if the vehicle respawn rotation was set successfully, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleRespawnRotation(theVehicle, rx, ry, rz) end

---Sets the rotor speed of a helicopter or plane. This function now applies to both helicopters and planes.
---@param theVehicle vehicle the vehicle (helicopter or plane) to adjust the rotor of.
---@param speed number the new rotor speed. Usual values are 0 if the vehicle is stationary, or 0.2 if the rotor is fully spun up. Higher values than normal will not affect the vehicle's handling. Negative values are allowed and will make the rotor spin in the opposite direction (for helicopters, this pushes it down).
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleRotorSpeed(theVehicle, speed) end

---Turns the rotor on/off for an plane or helicopter. A vehicle with the rotor turned off cannot hover in the air.
---@param theVehicle vehicle The vehicle (helicopter or plane) whose rotor you want to toggle.
---@param state boolean The rotor state, which determines whether it should be on ( true ) or off ( false ).
---@param stopRotor boolean? Specifies whether the rotor should be stopped after being turned off. If false, the rotor will continue spinning at a constant speed (it won't slow down or accelerate). It will also not be able to lift off the ground. You can also use setVehicleRotorSpeed to manage the rotor speed.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleRotorState(theVehicle, state, stopRotor) end

---This function changes the properties of a vehicles siren point.
---@param theVehicle vehicle The vehicle to modify
---@param sirenPoint integer The siren point to modify
---@param posX number The x position of this siren point from the center of the vehicle
---@param posY number The y position of this siren point from the center of the vehicle
---@param posZ number The z position of this siren point from the center of the vehicle
---@param red number The amount of red from 0 to 255
---@param green number The amount of green from 0 to 255
---@param blue number The amount of blue from 0 to 255
---@param alpha number? The alpha of the siren from 0 to 255
---@param minAlpha number? The minimum alpha of the light during day time
---@return boolean Returns true if the siren point was successfully changed on the vehicle, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleSirens(theVehicle, sirenPoint, posX, posY, posZ, red, green, blue, alpha, minAlpha) end

---This function changes the state of the sirens on the specified vehicle.
---@param theVehicle vehicle The vehicle that will have the sirens set
---@param sirensOn boolean The state to set the sirens to
---@return boolean Returns true if the sirens are set for the specified vehicle, false if the sirens can't be set for the specified vehicle, if the vehicle doesn't have sirens or if invalid arguments are specified.
---@markup { MTA:SA Shared }
function setVehicleSirensOn(theVehicle, sirensOn) end

---This function used to set planes smoke trail enabled or disabled.
---@param veh vehicle The vehicle that you want to set the smoke trail.
---@param enable boolean A boolean if set to true it will enabled the smoke trail.
---@return setVehicleSmokeTrailEnabled If successful returns true , false otherwise.
---@markup { MTA:SA Shared }
function setVehicleSmokeTrailEnabled(veh, enable) end

---This function will set the taxi light on in a taxi (vehicle ID's 420 and 438\)
---@param taxi vehicle The vehicle element of the taxi that you wish to turn the light on.
---@param LightState boolean whether the light is on. True for on, False for off.
---@return boolean Returns true if the state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleTaxiLightOn(taxi, LightState) end

---This function sets the position of a vehicle's turret, if it has one. This can be used to influence the turret's rotation, so it doesn't follow the camera. Vehicles with turrets include firetrucks and tanks.
---@param turretVehicle vehicle The vehicle whose turret position you want to retrieve. This should be a vehicle with a turret.
---@param positionX number The horizontal position of the turret. In radians
---@param positionY number The vertical position of the turret. In radians
---@return boolean Returns a true if a valid vehicle element and valid positions were passed, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleTurretPosition(turretVehicle, positionX, positionY) end

---This function sets the variant of a specified vehicle. In GTA: San Andreas some vehicles are different; for example the labelling on trucks or the contents of a pick\-up truck and the varying types of a motor bike. For the default variant list see: Vehicle variants.
---@param theVehicle vehicle The vehicle that you want to set the variant.
---@param variant1 integer An integer for the first variant. See Vehicle variants .
---@param variant2 integer An integer for the second variant. See Vehicle variants .
---@return boolean Returns true if the vehicle variants were successfully set, false otherwise (the specified vehicle doesn't exist or the specified variants are invalid).
---@markup { MTA:SA Shared }
function setVehicleVariant(theVehicle, variant1, variant2) end

---This function sets the scale of all the wheels of a vehicle. The wheel scale multiplies the visible height and length (but not width) of all the wheels in a vehicle, without affecting their collisions or the handling, similarly to setVehicleComponentScale. The wheel scale is applied after the model wheel size.
---@param theVehicle vehicle The vehicle whose wheel scale you wish to modify.
---@param wheelScale number The wheel scale value to set.
---@return boolean Returns true if the wheel scale has been set successfully, or an error if some parameter is invalid.
---@markup { MTA:SA Shared }
function setVehicleWheelScale(theVehicle, wheelScale) end

---This function sets the state of wheels on the vehicle.
---@param theVehicle vehicle MISSINGPARAMDESC
---@param frontLeft integer MISSINGPARAMDESC
---@param rearLeft integer? MISSINGPARAMDESC
---@param frontRight integer? MISSINGPARAMDESC
---@param rearRight integer? MISSINGPARAMDESC
---@return boolean Returns a boolean value true or false that tells you if it was successful or not.
---@markup { MTA:SA Shared }
function setVehicleWheelStates(theVehicle, frontLeft, rearLeft, frontRight, rearRight) end

---This function is used to manipulate the wheel rotation of a vehicle. Cars, Bikes (including BMX) and Trailers are supported.
---@param theVehicle vehicle the vehicle whose wheel rotation is to be set.
---@param rotation number the new wheel rotation value.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setVehicleWheelsRotation(theVehicle, rotation) end

---This function sets the vehicle window state.
---@param theVehicle vehicle The vehicle that you wish to change the window state.
---@param window integer An integer representing window. 0: motorbike shield 1: rear window 2: right front window 3: right back window 4: left front (driver) window 5: left back window 6: windshield
---@param open boolean Boolean which represent window open state.
---@return boolean Command which allow player to open window which near sits.
---@markup { MTA:SA Shared }
function setVehicleWindowOpen(theVehicle, window, open) end

---Spawns a vehicle at any given position and rotation
---@param theVehicle vehicle The vehicle you wish to spawn
---@param x number The x position you wish to spawn the vehicle at
---@param y number The x position you wish to spawn the vehicle at
---@param z number The x position you wish to spawn the vehicle at
---@param rx number The x rotation you wish to spawn the vehicle at
---@param ry number The y rotation you wish to spawn the vehicle at
---@param rz number The z rotation you wish to spawn the vehicle at
---@return boolean Returns true if the vehicle spawned successfully, false if the passed argument does not exist or is not a vehicle.
---@markup { MTA:SA Shared }
function spawnVehicle(theVehicle, x, y, z, rx, ry, rz) end

---This function creates a dynamic (motion\-dependent) falling vehicle component.
---@param theVehicle vehicle The vehicle whose component is to be created.
---@param nodeIndex number Specifies the component to be created (ranging from 1 to 24 ). Depending on the vehicle, these can be different components such as wheels, fenders, bicycle handlebars, helicopter propellers, train carriages, and many more. Check Nodes list .
---@param collisionType number Specifies the type of collision for the component, by default it is selected based on the nodeIndex. 0: COLBUMPER 1: COLWHEEL 2: COLDOOR 3: COLBONNET 4: COLBOOT 5: COLPANEL
---@param removalTime number The time in milliseconds after which the created component will be removed (it must be removed as it is a temporary object). If not specified, the default time depends on the number of created components.
---@return boolean Returns true if the component was created, false otherwise.
---@markup { MTA:SA Shared }
function spawnVehicleFlyingComponent(theVehicle, nodeIndex, collisionType, removalTime) end

---This function toggles whether or not the vehicle will be respawned after blown or idle.
---@param theVehicle vehicle The vehicle you wish to toggle the respawning of.
---@param Respawn boolean A boolean determining if the vehicle will respawn or not.
---@return boolean Returns true if the vehicle was found and edited.
---@markup { MTA:SA Shared }
function toggleVehicleRespawn(theVehicle, Respawn) end

-- Water

---Creates an area of water.
---@param x1 number MISSINGPARAMDESC
---@param y1 number MISSINGPARAMDESC
---@param z1 number MISSINGPARAMDESC
---@param x2 number MISSINGPARAMDESC
---@param y2 number MISSINGPARAMDESC
---@param z2 number MISSINGPARAMDESC
---@param x3 number MISSINGPARAMDESC
---@param y3 number MISSINGPARAMDESC
---@param z3 number MISSINGPARAMDESC
---@param x4 number MISSINGPARAMDESC
---@param y4 number MISSINGPARAMDESC
---@param z4 number MISSINGPARAMDESC
---@param bShallow boolean? gives the water a shallow water effect.
---@return water Returns a water element if successful, false otherwise. The water element can be repositioned with setElementPosition and destroyed with destroyElement .
---@markup { MTA:SA Shared }
function createWater(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, bShallow) end

---This function returns the water color of the GTA world.
---@return integer | integer | integer | integer Returns 4 ints , indicating the color of the water. (RGBA)
---@markup { MTA:SA Shared }
function getWaterColor() end

---This function allows you to retrieve the water level from a certain location. The water level is 0 in most places though it can vary (e.g. it's higher near the dam).
---@param posX number MISSINGPARAMDESC
---@param posY number MISSINGPARAMDESC
---@param posZ number MISSINGPARAMDESC
---@param ignoreDistanceToWaterThreshold boolean? If set to false, this function returns false, if the difference between water level (without waves) and posZ is greater than 3.0
---@return number Returns an integer of the water level if the localPlayer /position is near the water (-3 to 20 on the Z coordinate) else false if there's no water near the localPlayer /position.
---@markup { MTA:SA Shared }
function getWaterLevel(posX, posY, posZ, ignoreDistanceToWaterThreshold) end

---Gets the world position of a vertex (i.e. corner) of a water area. Each water area is either a triangle or quad (rectangle) so each has 3 or 4 corners.
---@param theWater water the water element to get the vertex of
---@param vertexIndex integer the index of the vertex whose position to get. Values range from 1 to 4 for a water quad, or 1 to 3 for a triangle.
---@return int int float Returns the x, y and z coordinates of the specified vertex if successful, false otherwise.
---@markup { MTA:SA Shared }
function getWaterVertexPosition(theWater, vertexIndex) end

---This function returns the current wave height.
---@return number Returns the height as a float , false otherwise.
---@markup { MTA:SA Shared }
function getWaveHeight() end

---This function determines whether water is drawn last in the rendering order.
---@return boolean Returns true if water is drawn last in the rendering order, false otherwise.
---@markup { MTA:SA Shared }
function isWaterDrawnLast() end

---This function reset the water color of the GTA world to default.
---@return boolean Returns true if water color was reset correctly, false otherwise.
---@markup { MTA:SA Shared }
function resetWaterColor() end

---This function resets the water of the GTA world back to its default level. Water elements are not affected.
---@return boolean Returns true if water level was reset correctly, false otherwise.
---@markup { MTA:SA Shared }
function resetWaterLevel() end

---This function changes the water color of the GTA world.
---@param red integer The red value of the water, from 0 to 255.
---@param green integer The green value of the water, from 0 to 255.
---@param blue integer The blue value of the water, from 0 to 255.
---@param alpha integer? The alpha (visibility) value of the water, from 0 to 255. Defaults to 200 if not declared.
---@return boolean Returns true if water color was set correctly, false if invalid values were passed.
---@markup { MTA:SA Shared }
function setWaterColor(red, green, blue, alpha) end

---This function changes the water rendering order.
---@param bEnabled boolean A boolean value determining whether water should be drawn last.
---@return boolean Returns true if the rendering order was changed successfully, false otherwise.
---@markup { MTA:SA Shared }
function setWaterDrawnLast(bEnabled) end

---Sets the height of some or all the water in the game world.
---@param theWater water the water element to change.
---@param level number the new Z coordinate of the water surface. All water in the game world is set to this height.
---@return boolean Returns true if successful, false in case of failure.
---@markup { MTA:SA Shared }
function setWaterLevel(theWater, level) end

---Sets the world position of a corner point of a water area.
---@param theWater water the water element of which to change a vertex.
---@param vertexIndex integer the index of the vertex to move. Values range from 1 to 4 for water quads, and 1 to 3 for triangles.
---@param x integer the X coordinate to set for the vertex.
---@param y integer the Y coordinate to set for the vertex.
---@param z number the Z coordinate to set for the vertex.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setWaterVertexPosition(theWater, vertexIndex, x, y, z) end

---This function sets the wave height to the desired value, the default is 0\.
---@param height number A float between 0 and 100.
---@return boolean Returns a boolean value true or false that tells you if it was successful or not.
---@markup { MTA:SA Shared }
function setWaveHeight(height) end

-- Weapon

---This function gets the original weapon property of the specified weapons specified weapon type.
---@param weaponID/string weaponName integer MISSINGPARAMDESC
---@param weaponSkill string MISSINGPARAMDESC
---@param property string MISSINGPARAMDESC
---@return integer On success:
---@markup { MTA:SA Shared }
function getOriginalWeaponProperty(weaponID/string weaponName, weaponSkill, property) end

---This function allows you to identify the weapon slot that a weapon belongs to.
---@param weaponid integer Weapon to find the weapon slot of.
---@return integer Returns an integer representing the given weapon ID's associated weapon slot, false if the ID was invalid.
---@markup { MTA:SA Shared }
function getSlotFromWeapon(weaponid) end

---This function will obtain the ID of a particular weapon from its name.
---@param name string A string containing the name of the weapon. Names can be: (Case is ignored)
---@return integer Returns an int if the name matches that of a weapon, false otherwise.
---@markup { MTA:SA Shared }
function getWeaponIDFromName(name) end

---This function allows you to retrieve the name of a weapon from an ID.
---@param id integer The ID you wish to retrieve the name of
---@return string Returns a string of the name of the weapon or death type, false otherwise. Names will be like these: (Ignoring case)
---@markup { MTA:SA Shared }
function getWeaponNameFromID(id) end

---This function gets a weapon property of the specified custom weapon (clientside only) or specified player\-held weapon (both client and server).
---@param weaponID/string weaponName integer MISSINGPARAMDESC
---@param weaponSkill string MISSINGPARAMDESC
---@param property string MISSINGPARAMDESC
---@return integer On success:
---@markup { MTA:SA Shared }
function getWeaponProperty(weaponID/string weaponName, weaponSkill, property) end

---giveWeapon gives a specified weapon to a certain player or ped. There is an optional argument to specify ammunition. For example, a melee weapon doesn't need an ammo argument.
---@param thePlayer ped A player or ped object referencing the specified player (or ped )
---@param weapon integer A whole number integer that refers to a Weapon ID.
---@param ammo integer? A whole number integer serving as the ammo amount for the given weapon.  For weapons that do not require ammo, such as melee, this should be at least 1.
---@param setAsCurrent boolean? A boolean value determining whether or not the weapon will be set as the players current.
---@return boolean Returns true if weapon was successfully acquired, false otherwise.
---@markup { MTA:SA Shared }
function giveWeapon(thePlayer, weapon, ammo, setAsCurrent) end

---This function checks whether GTA weapon rendering is enabled for ped and player.
---@return boolean Returns true if weapon rendering is enabled, otherwise returns false .
---@markup { MTA:SA Shared }
function isWeaponRenderEnabled() end

---Sets the ammo to a certain amount for a specified weapon (if they already have it), regardless of current ammo.
---@param thePlayer player A player object referencing the specified player
---@param weapon integer A whole number integer that refers to a weapon ID.
---@param totalAmmo integer A whole number integer serving as the total ammo amount for the given weapon (including ammo in clip).
---@param ammoInClip integer? The amount of ammo to set in the player's clip.  This will be taken from the main ammo.  If left unspecified or set to 0, the current clip will remain.
---@return boolean Returns a boolean value true or false that tells you if it was successful or not.
---@markup { MTA:SA Shared }
function setWeaponAmmo(thePlayer, weapon, totalAmmo, ammoInClip) end

---This function sets the weapon property of the specified weapons specified weapon type. See lower down the page for documentation related to weapon creation.
---@param weaponID/string weaponName integer MISSINGPARAMDESC
---@param weaponSkill string MISSINGPARAMDESC
---@param property string MISSINGPARAMDESC
---@param theValue int/float MISSINGPARAMDESC
---@return boolean On success:
---@markup { MTA:SA Shared }
function setWeaponProperty(weaponID/string weaponName, weaponSkill, property, theValue) end

---This function allows you to completely disable/enable GTA weapon rendering for ped and player. It is particularly useful for creating custom weapon systems, where singular weapon ID could have many different models/variations, or to simply get rid of one frame delay when switching weapons.
---@param enabled boolean Whether weapon render should be enabled.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function setWeaponRenderEnabled(enabled) end

---This function removes every weapons from a specified ped, rendering it unarmed.
---@param thePed ped A ped element referencing the specified ped
---@return boolean Returns true if the function succeeded, false otherwise.
---@markup { MTA:SA Shared }
function takeAllWeapons(thePed) end

---This function removes a specified weapon or ammo from a certain player's inventory.
---@param thePlayer player A player object referencing the specified player.
---@param weaponId integer An integer that refers to a weapon that you wish to remove.
---@param ammo integer If used, this amount of ammo will be taken instead and the weapon will not be removed.
---@return boolean Returns a true if the weapon/ammo was removed successfully, false otherwise.
---@markup { MTA:SA Shared }
function takeWeapon(thePlayer, weaponId, ammo) end

-- Weapon_creation

---Creates a custom weapon that can fire bullets. Do not confuse this with player held weapons.
---@param theType string The weapon type which can be:
---@param x number MISSINGPARAMDESC
---@param y number MISSINGPARAMDESC
---@param z number MISSINGPARAMDESC
---@return weapon Returns a custom weapon element, which represents a weapon floating at that position.
---@markup { MTA:SA Shared }
function createWeapon(theType, x, y, z) end

---Fires one shot from a custom weapon.
---@param theWeapon weapon The weapon to be fired.
---@return boolean Returns true if the shot weapon is valid and therefore the shot was fired, false otherwise.
---@markup { MTA:SA Shared }
function fireWeapon(theWeapon) end

---This function gets the total ammo a custom weapon has.
---@param theWeapon weapon The weapon to get the ammo of.
---@return integer Returns an integer containing how many ammo left has the weapon. Returns false if an error occured.
---@markup { MTA:SA Shared }
function getWeaponAmmo(theWeapon) end

---This function gets the amount of ammo left in a custom weapon's magazine/clip.
---@param theWeapon weapon the weapon to get the clip ammo of.
---@return integer Returns the amount of ammo in the custom weapon 's clip, false if an error occured.
---@markup { MTA:SA Shared }
function getWeaponClipAmmo(theWeapon) end

---This gets the firing rate to be used when a custom weapon opens fire.
---@param theWeapon weapon The weapon to modify the firing rate of.
---@return integer Returns an integer with the firing rate of the custom weapon, false otherwise.
---@markup { MTA:SA Shared }
function getWeaponFiringRate(theWeapon) end

---This function gets the flags of a custom weapon.
---@param theWeapon weapon the weapon to get the flag of.
---@param theFlag string the weapon flag to get: disablemodel : makes the weapon and muzzle effect invisible or not. flags : returns the flags used to get where the gun shoots at. These flags are (by order): checkBuildings : allows the shoot to be blocked by GTA's internally placed buildings, i.e. the world map. checkCarTires : allows the shoot to be blocked by vehicle tires. checkDummies : allows the shoot to be blocked by GTA's internal dummies. These are not used in the current MTA version so this argument can be set to false . checkObjects : allows the shoot to be blocked by objects . checkPeds : allows the shoot to be blocked by peds and players . checkVehicles : allows the shoot to be blocked by vehicles . checkSeeThroughStuff : allows the shoot to be blocked by translucent game objects, e.g. glass. checkShootThroughStuff : allows the shoot to be blocked by things that can be shot through. instantreload : if enabled, the weapon reloads instantly rather than waiting the reload time until shooting again. shootifoutofrange : if enabled, the weapon still fires its target beyond the weapon range distance. shootifblocked : if enabled, the weapon still fires its target even if it's blocked by something.
---@return boolean Returns the true or false on success ( flags flag returns 8 values) if the flag is enabled or not. Returns false if the weapon element isn't valid or an error occured.
---@markup { MTA:SA Shared }
function getWeaponFlags(theWeapon, theFlag) end

---This function gets the state of a custom weapon.
---@param theWeapon weapon the weapon to get the state of.
---@return string This example creates a gun where the local player is and informs any player about its state.
---@markup { MTA:SA Shared }
function getWeaponState(theWeapon) end

---This functions gets the target of a custom weapon.
---@param theWeapon weapon The weapon to get the target of.
---@return nil/element/float This example gets the weapon target when the player hit the colshape and outputs it to the chatbox.
---@markup { MTA:SA Shared }
function getWeaponTarget(theWeapon) end

---This function resets the firing rate of a custom weapon to the default one.
---@param theWeapon weapon the weapon to reset the firing rate of.
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function resetWeaponFiringRate(theWeapon) end

---This function sets the ammo left in a custom weapon's magazine/clip.
---@param theWeapon weapon The weapon to set the clip ammo of.
---@param clipAmmo integer The amount of ammo in the clip.
---@return boolean This function returns true if the arguments are valid and the weapon clip ammo could be changed; false otherwise.
---@markup { MTA:SA Shared }
function setWeaponClipAmmo(theWeapon, clipAmmo) end

---This function sets the firing rate to be used when a custom weapon is in firing state.
---@param theWeapon weapon The weapon to modify the firing rate of.
---@param firingRate integer The weapon firing rate. It seems to be a kind of frecuency value, so the lower the quicker the custom weapon will shoot.
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function setWeaponFiringRate(theWeapon, firingRate) end

---This function sets a custom weapon flags, used to change how it behaves or finds a possible target to shoot.
---@param theWeapon weapon the weapon element to set the flag of.
---@param theFlag string the weapon flag to change (all of them can be true or false ): disablemodel : makes the weapon and muzzle effect invisible or not. flags : configures the flags used to get where the gun shoots at. They are based on processLineOfSight 's. You have to specify all the eight flags for the function to succeed. These flags are (by order): checkBuildings : allows the shoot to be blocked by GTA's internally placed buildings, i.e. the world map. checkCarTires : allows the shoot to be blocked by vehicle tires. checkDummies : allows the shoot to be blocked by GTA's internal dummies. These are not used in the current MTA version so this argument can be set to false . checkObjects : allows the shoot to be blocked by objects . checkPeds : allows the shoot to be blocked by peds and players . checkVehicles : allows the shoot to be blocked by vehicles . checkSeeThroughStuff : allows the shoot to be blocked by translucent game objects, e.g. glass. checkShootThroughStuff : allows the shoot to be blocked by things that can be shot through. instantreload : if enabled, the weapon will reload instantly rather than waiting the reload time until shooting again. shootifoutofrange : if enabled, the weapon will still fire its target beyond the weapon range distance. shootifblocked : if enabled, the weapon will still fire its target even if it's blocked by something.
---@param enable boolean whether to enable or disable the specified flag.
---@return boolean Returns true if all arguments are valid and the flags where changed; false otherwise.
---@markup { MTA:SA Shared }
function setWeaponFlags(theWeapon, theFlag, enable) end

---This function sets a custom weapon's state.
---@param theWeapon weapon the weapon you wish to set the state of.
---@param theState string the state you wish to set: reloading : makes the weapon reload. firing : makes the weapon constantly fire its target (unless any shooting blocking flags are set) according to its assigned firing rate. ready : makes the weapon stop reloading or firing.
---@return boolean Returns true on success, false otherwise.
---@markup { MTA:SA Shared }
function setWeaponState(theWeapon, theState) end

---This function sets the target of a custom weapon. There are 3 different targeting modes, which are explained below.
---@markup { MTA:SA Client }
function setWeaponTarget() end

-- World

---Gets whether the traffic lights are currently locked or not. If the lights are locked, it means they won't change unless you do setTrafficLightState.
---@return boolean Returns true the traffic lights are currently locked, false otherwise.
---@markup { MTA:SA Shared }
function areTrafficLightsLocked() end

---Creates a SWAT rope like that of the rope in single player used by SWAT Teams abseiling from the Police Maverick.
---@param fx number MISSINGPARAMDESC
---@param fy number MISSINGPARAMDESC
---@param fZ number MISSINGPARAMDESC
---@param duration integer the amount in miliseconds the rope will be there before falling to the ground.
---@return boolean
---@markup { MTA:SA Shared }
function createSWATRope(fx, fy, fZ, duration) end

---This function gets the maximum height at which aircraft can fly without their engines turning off.
---@return number Returns a float containing the max aircraft height.
---@markup { MTA:SA Shared }
function getAircraftMaxHeight() end

---This function returns the maximum velocity at which aircrafts could fly. Using this function server\-side will return the server\-side value, not necessarily the same that is set client\-side.
---@return number Returns a float being the max velocity that is currently set, depending on which side it is used.
---@markup { MTA:SA Shared }
function getAircraftMaxVelocity() end

---This function will tell you if the birds are enabled or disabled.
---@return boolean Returns true if the birds are enabled or false if the birds are disabled.
---@markup { MTA:SA Shared }
function getBirdsEnabled() end

---This function will tell you if clouds are enabled or disabled.
---@return boolean Returns true if the clouds are enabled or false if clouds are disabled.
---@markup { MTA:SA Shared }
function getCloudsEnabled() end

---This function is used to get the values of color filtering.
---@param isOriginal boolean A bool indicates if the return values of color filter are GTASA original or changed by setColorFilter . If this is set to false , the return values would be the color filter that is currently being used.
---@return integer | integer | integer | integer | integer | integer | integer | integer Returns 8 integers , of which the first 4 indicate the color (R,G,B,A) of color filter A, and the last 4 indicate the color (R,G,B,A) of  color filter B.
---@markup { MTA:SA Shared }
function getColorFilter(isOriginal) end

---This function gets visibility of corona reflections.
---@return integer One of the following integers will be returned:
---@markup { MTA:SA Shared }
function getCoronaReflectionsEnabled() end

---This function will tell you what is the current render distance.
---@return number Returns a float with the current render distance, false if the operation could not be completed.
---@markup { MTA:SA Shared }
function getFarClipDistance() end

---This function will tell you what is the current fog render distance.
---@return number Returns a float with the current fog render distance, false if the operation could not be completed.
---@markup { MTA:SA Shared }
function getFogDistance() end

---This function gets the current game speed value.
---@return number Returns a float representing the speed of the game.
---@markup { MTA:SA Shared }
function getGameSpeed() end

---This function outputs the bounding box of a garage.
---@param garageID integer The garage ID that represents the garage door that is being checked.
---@return number | number | number | number Returns four float s indicating the bounding box of the garage. Western X position, Eastern X position, Southern Y position, Northern Y position,, false when invalid garageID was provided.
---@markup { MTA:SA Shared }
function getGarageBoundingBox(garageID) end

---This function outputs X, Y and Z position of given garage.
---@param garageID integer The garage ID that represents the garage door that is being checked.
---@return number | number | number Returns three float s indicating the position of the garage, x , y and z respectively, false when garageID was invalid.
---@markup { MTA:SA Shared }
function getGaragePosition(garageID) end

---This function outputs the size of garage.
---@param garageID integer The garage ID that represents the garage door that is being checked.
---@return number | number | number Returns three float s indicating the size of the garage, false if an invalid garageID has been provided.
---@markup { MTA:SA Shared }
function getGarageSize(garageID) end

---This function returns the current gravity level for the context in which it is called (server or client).
---@return number Returns a float with the current server or client (depending on where you call the function) gravity level.
---@markup { MTA:SA Shared }
function getGravity() end

---This function gets the Z level of the highest ground below a point.
---@param x number A floating point number representing the X world coordinate of the point.
---@param y number A floating point number representing the Y world coordinate of the point.
---@param z number A floating point number representing the Z world coordinate of the point.
---@return number Returns a float with the highest ground-level Z coord if parameters are valid, 0 if the point you tried to test is outside the loaded world map, false otherwise.
---@markup { MTA:SA Shared }
function getGroundPosition(x, y, z) end

---This function will return the current heat haze effect settings.
---@return integer | integer | integer | integer | integer | integer | integer | integer | boolean Returns 9 values, which are the same used as arguments in SetHeatHaze :
---@markup { MTA:SA Shared }
function getHeatHaze() end

---This function will tell you if interior furniture are enabled or disabled in a specified room ID.
---@param roomID integer MISSINGPARAMDESC
---@return boolean Returns true if interior furniture is enabled or false if interior furniture is disabled.
---@markup { MTA:SA Shared }
function getInteriorFurnitureEnabled(roomID) end

---This function checks to see if the music played by default in clubs is disabled or not.
---@return boolean Returns true if music is playing, returns false if music is not playing.
---@markup { MTA:SA Shared }
function getInteriorSoundsEnabled() end

---This function gets the maximum height at which your jetpack can fly without failing to go higher.
---@return number Returns a float containing the max jetpack height.
---@markup { MTA:SA Shared }
function getJetpackMaxHeight() end

---This function checks if a weapon is usable while on a Jetpack.
---@param weapon string The weapon that's being checked if it's usable on a Jetpack.
---@return boolean Returns true if the weapon is enabled, else false if the weapon isn't or invalid arguments are passed.
---@markup { MTA:SA Shared }
function getJetpackWeaponEnabled(weapon) end

---Tells you how long an ingame minute takes in real\-world milliseconds. The default GTA value is 1000\.
---@return integer Returns the number of real-world milliseconds that go in an ingame minute.
---@markup { MTA:SA Shared }
function getMinuteDuration() end

---This function returns the moon size.
---@return integer Returns a integer being the moon size that is currently set, depending on which side it is used.
---@markup { MTA:SA Shared }
function getMoonSize() end

---This function gets the distance from the camera at which the world starts rendering. For more information about this please refer to setNearClipDistance.
---@return number This function returns a float containing the actual near clip distance.
---@markup { MTA:SA Shared }
function getNearClipDistance() end

---This function is used to get "occlusions enabled" state.
---@return boolean Returns true if occlusions are enabled, or false otherwise.
---@markup { MTA:SA Shared }
function getOcclusionsEnabled() end

---This function gets the peds LOD distance.
---@return number This function returns a float containing the peds LOD distance.
---@markup { MTA:SA Shared }
function getPedsLODDistance() end

---This function is used to get the current rain level.
---@return number Returns the rain level as a number.
---@markup { MTA:SA Shared }
function getRainLevel() end

---This function gets the Z level of the lowest roof above a point. It is required that the point is near enough to the local player so that it's within the area where collision data is loaded.
---@param x number A float representing the X world coordinate of the point.
---@param y number A float representing the Y world coordinate of the point.
---@param z number A float representing the Z world coordinate of the point.
---@return number Returns a float with the lowest roof-level Z coord if parameters are valid, false if the point you tried to test is outside the loaded world map.
---@markup { MTA:SA Shared }
function getRoofPosition(x, y, z) end

---This function gets the screen position of a point in the world. This is useful for attaching 2D gui elements to parts of the world (e.g. players) or detecting if a point is on the screen (though it does not check if it is actually visible, you should use processLineOfSight for that).
---@param x number A float value indicating the x position in the world.
---@param y number A float value indicating the y position in the world.
---@param z number A float value indicating the z position in the world.
---@param edgeTolerance number? A float value indicating the distance the position can be off screen before the function returns false. Note: it's clamped down on both axies to the size of screen at the given axis*10
---@param relative boolean? A boolean value that indicates if edgeTolerance is in pixels [false], or relative to the screen size [true].
---@return number | number | number Returns two x , y floats indicating the screen position and float distance between screen and given position if successful, false otherwise.
---@markup { MTA:SA Shared }
function getScreenFromWorldPosition(x, y, z, edgeTolerance, relative) end

---This function will return the current sky color.
---@return integer | integer | integer | integer | integer | integer Returns 6 ints , of which the first 3 represent the sky's "top" color, (in RGB) and the last 3 represent the bottom colors.
---@markup { MTA:SA Shared }
function getSkyGradient() end

---This function is used to get the color of the sun.
---@return integer | integer | integer | integer | integer | integer Returns the color of the sun as six numbers, false if its default.
---@markup { MTA:SA Shared }
function getSunColor() end

---This function is used to get the size of the sun.
---@return number Returns the size of the sun as a number, false if the size of the sun is at its default.
---@markup { MTA:SA Shared }
function getSunSize() end

---This function is used to get the current time in the game. If you want to get the real server time, use getRealTime.
---@return integer | integer Returns two ints that represent hours and minutes.
---@markup { MTA:SA Shared }
function getTime() end

---Gets the current traffic light state. This state controls the traffic light colors. For instance, state 1 will cause the north and south traffic lights to be amber, and the ones left and east will turn red.
---@return integer Returns the current state of the traffic lights.
---@markup { MTA:SA Shared }
function getTrafficLightState() end

---Returns the distance of vehicles LOD.
---@return number | number This example shows the lod distance of vehicles
---@markup { MTA:SA Shared }
function getVehiclesLODDistance() end

---This function returns the current Weather ID.
---@return integer | integer Returns two integers indicating the weather type that is currently active. The first integer says what weather is currently considered to be active. The second integer is the weather id that is being blended into if any, otherwise it is nil .
---@markup { MTA:SA Shared }
function getWeather() end

---This function gets the wind velocity in San Andreas.
---@return integer | integer | integer This example returns the wind velocity to a player if they use the command 'getwindvelocity'.
---@markup { MTA:SA Shared }
function getWindVelocity() end

---This function allows you to retrieve the world position corresponding to a 2D position on the screen, at a certain depth.
---@param x number A float value indicating the x position on the screen, in pixels.
---@param y number A float value indicating the y position on the screen, in pixels.
---@param depth number A float value indicating the distance from the camera of the point whose coordinates we are retrieving, in units.
---@return number | number | number Returns three x , y , z floats indicating the world position if successful, false otherwise.
---@markup { MTA:SA Shared }
function getWorldFromScreenPosition(x, y, depth) end

---This function is used to get the values of time cycle and weather related properties.
---@param property string The property you wish to retrieve.
---@return mixed Returns the value of property represented by either 1 or 3 numbers (RGB, FLOAT, INT) if successful, false otherwise.
---@markup { MTA:SA Shared }
function getWorldProperty(property) end

---This function allows you to retrieve the zone name of a certain location.
---@param x number The X axis position
---@param y number The Y axis position
---@param z number The Z axis position
---@param citiesonly boolean? An optional argument to choose if you want to return one of the following city names: Tierra Robada Bone County Las Venturas San Fierro Red County Whetstone Flint County Los Santos
---@return string Returns the string of the zone name.
---@markup { MTA:SA Shared }
function getZoneName(x, y, z, citiesonly) end

---This function allows you to check if some background sound effects are enabled.
---@param theType string The type of ambient sound to test. Can be either "gunfire" or "general".
---@return boolean Returns true if the ambient sound is enabled, false if it is disabled or invalid values were passed.
---@markup { MTA:SA Shared }
function isAmbientSoundEnabled(theType) end

---This function checks whether or not a specific garage door is open.
---@param garageID integer The garage ID that represents the garage door that is being checked.
---@return boolean Returns true if the garage is open, false if it is closed or an invalid garage ID was given.
---@markup { MTA:SA Shared }
function isGarageOpen(garageID) end

---This function checks if there are obstacles between two points of the game world, optionally ignoring certain kinds of elements. Use processLineOfSight if you want more information about what the ray hits.
---@param startX number The first point's world X coordinate.
---@param startY number The first point's world Y coordinate.
---@param startZ number The first point's world Z coordinate.
---@param endX number The second point's world X coordinate.
---@param endY number The second point's world Y coordinate.
---@param endZ number The second point's world Z coordinate.
---@param checkBuildings boolean? Allow the line of sight to be blocked by GTA's internally placed buildings, i.e. the world map.
---@param checkVehicles boolean? Allow the line of sight to be blocked by vehicles .
---@param checkPeds boolean? Allow the line of sight to be blocked by peds, i.e. players .
---@param checkObjects boolean? Allow the line of sight to be blocked by objects .
---@param checkDummies boolean? Allow the line of sight to be blocked by GTA's internal dummies.  These are not used in the current MTA version so this argument can be set to false .
---@param seeThroughStuff boolean? Allow the line of sight to pass through collision materials that have this flag enabled (By default material IDs 52, 55 and 66 which are some fences). This flag originally allows some objects to be walked on but you can shoot throug them.
---@param ignoreSomeObjectsForCamera boolean? Allow the line of sight to pass through objects that have (K) property enabled in "object.dat" data file. (i.e. Most dynamic objects like boxes or barrels)
---@param ignoredElement element? Allow the line of sight to pass through a certain specified element.
---@return boolean Returns true if the line between the specified points is clear, false if there's an obstacle or if invalid parameters are passed.
---@markup { MTA:SA Shared }
function isLineOfSightClear(startX, startY, startZ, endX, endY, endZ, checkBuildings, checkVehicles, checkPeds, checkObjects, checkDummies, seeThroughStuff, ignoreSomeObjectsForCamera, ignoredElement) end

---This function allows you to check whether time has been frozen using setTimeFrozen.
---@return boolean Returns true if time is frozen, false otherwise.
---@markup { MTA:SA Shared }
function isTimeFrozen() end

---This function is used to check whether the shadow enabled or not.
---@return boolean Returns true if enabled, false otherwise.
---@markup { MTA:SA Shared }
function isVolumetricShadowsEnabled() end

---This function allows you to check if certain world sound effects have not been disabled by setWorldSoundEnabled
---@param group integer MISSINGPARAMDESC
---@param index integer? MISSINGPARAMDESC
---@return boolean Returns true if the world sounds are enabled, false if they are disabled or invalid values were passed.
---@markup { MTA:SA Shared }
function isWorldSoundEnabled(group, index) end

---Checks if a special world property (cheat) is enabled or not.
---@param propname string the name of the property to retrieve. Possible values are listed on SetWorldSpecialPropertyEnabled .
---@return boolean Returns true if the property is enabled, false if it is disabled or the specified property name is invalid.
---@markup { MTA:SA Shared }
function isWorldSpecialPropertyEnabled(propname) end

---Does a raycast against an element's renderable mesh model \[not the collision model!]. The same functionality is already present in processLineOfSight, but the latter is a little buggy due to the fact that the collision model is always simplified, and not exactly the same as the mesh, which leads to situations where no hit is detected, even though the visible mesh is hittable \[or vice versa]. Also, when one is interested in a specific element the overhead is a lot smaller \[as we can skip all the collision detection done by the before\-mentioned function].
---@param toTest element MISSINGPARAMDESC
---@param startX number MISSINGPARAMDESC
---@param startY number MISSINGPARAMDESC
---@param startZ number MISSINGPARAMDESC
---@param endX number MISSINGPARAMDESC
---@param endY number MISSINGPARAMDESC
---@param endZ number MISSINGPARAMDESC
---@return boolean | number | number | string | string | number | number | number
---@markup { MTA:SA Shared }
function processLineAgainstMesh(toTest, startX, startY, startZ, endX, endY, endZ) end

---This function casts a ray between two points in the world, and tells you information about the point that was hit, if any. The two positions must be within the local player's draw distance as the collision data is not loaded outside this area, and the call will just fail as if the ray didn't hit.
---@param startX number The start x position
---@param startY number The start y position
---@param startZ number The start z position
---@param endX number The end x position
---@param endY number The end y position
---@param endZ number The end z position
---@param checkBuildings boolean? Allow the line of sight to be blocked by GTA's internally placed buildings, i.e. the world map.
---@param checkVehicles boolean? Allow the line of sight to be blocked by vehicles .
---@param checkPlayers boolean? Allow the line of sight to be blocked by players .
---@param checkObjects boolean? Allow the line of sight to be blocked by objects .
---@param checkDummies boolean? Allow the line of sight to be blocked by GTA's internal dummies.  These are not used in the current MTA version so this argument can be set to false .
---@param seeThroughStuff boolean? Allow the line of sight pass through collision materials that have this flag enabled (By default material IDs 52, 55 and 66 which are some fences that you can shoot throug but still walk on them).
---@param ignoreSomeObjectsForCamera boolean? Allow the line of sight to pass through objects that have (K) property enabled in "object.dat" data file. (i.e. Most dynamic objects like boxes or barrels)
---@param shootThroughStuff boolean? Allow the line of sight to pass through collision materials that have this flag enabled (By default material IDs 28, 29, 31, 32, 33, 74, 75, 76, 77, 78, 79, 96, 97, 98, 99, 100 which are exclusively sand / beach or underwater objects).
---@param ignoredElement element? Allow the line of sight to pass through a certain specified element. This is usually set to the object you are tracing from so it does not interfere with the results.
---@param includeWorldModelInformation boolean? MISSINGPARAMDESC
---@param bIncludeCarTyres boolean? MISSINGPARAMDESC
---@param bIncludeExtraMateriaInfo boolean? MISSINGPARAMDESC
---@return bool               -- hit
float float float  -- hitX | hitY | hitZ
element            -- hitElement
float float float  -- normalX | normalY | normalZ
int                -- material
float              -- lighting
int                -- piece
int                -- worldModelID
float float float  -- worldModelPositionX | Y | Z
float float float  -- worldModelRotationX | Y | Z
int                -- worldLODModelID
float float        -- uvX | uvY
string             -- textureName | string             -- frameName | float float float  -- modelHitX | modelHitY | modelHitZ The other values are only filled if there is a collision, they contain nil otherwise
---@markup { MTA:SA Shared }
function processLineOfSight(startX, startY, startZ, endX, endY, endZ, checkBuildings, checkVehicles, checkPlayers, checkObjects, checkDummies, seeThroughStuff, ignoreSomeObjectsForCamera, shootThroughStuff, ignoredElement, includeWorldModelInformation, bIncludeCarTyres, bIncludeExtraMateriaInfo) end

---This function removes the entire game world and also clears the dummies pool.
---@return nil This function does not return any value.
---@markup { MTA:SA Shared }
function removeGameWorld() end

---This function is used to remove a world object. Use restoreWorldModel to reverse this action.
---@param modelID integer A whole integer specifying the GTASA object model ID.
---@param radius number A floating point number representing the radius that will be eliminated.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param interior integer? The interior ID to apply the removal to. Some objects in interior 13 show in all interiors so if you want to remove everything in interior 0 also remove everything in interior 13. A value of -1 here will affect all interiors.
---@return boolean Returns true if the world object was removed, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function removeWorldModel(modelID, radius, x, y, z, interior) end

---This function is used to reset the background sounds to the default setting.
---@return boolean Returns true if the ambient sounds were reset, false otherwise.
---@markup { MTA:SA Shared }
function resetAmbientSounds() end

---Resets the motion blur level on the client's screen to default value (36\).
---@return boolean Returns true if the blur level was reset successfully, false otherwise.
---@markup { MTA:SA Shared }
function resetBlurLevel() end

---This function is used to reset the color filtering to its default values.
---@return boolean Returns true if the color filtering was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetColorFilter() end

---This function resets visibility of corona reflections. Default value depends on client setting. If client has enabled corona rain reflections in video options, value will be reset to 1, otherwise to 0. You can check value of this option using dxGetStatus (SettingCoronaReflections).
---@return boolean Returns true .
---@markup { MTA:SA Shared }
function resetCoronaReflectionsEnabled() end

---This function resets the far clip distance to its default state.
---@return boolean Returns true if operation was successful, false otherwise.
---@markup { MTA:SA Shared }
function resetFarClipDistance() end

---This function resets the fog render distance to its default state.
---@return boolean Returns true if operation was successful, false otherwise.
---@markup { MTA:SA Shared }
function resetFogDistance() end

---This function restores the default heat haze.
---@return boolean Returns true if the heat haze was reset correctly, false otherwise.
---@markup { MTA:SA Shared }
function resetHeatHaze() end

---This function is used to reset the size of the moon to its normal size.
---@return boolean Returns true if the size of the moon was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetMoonSize() end

---This function resets near clip distance set by setNearClipDistance.
---@return boolean This example will reset near clip distance.
---@markup { MTA:SA Shared }
function resetNearClipDistance() end

---Resets the distance of peds LOD to default. Default values depends on client setting. If client has enabled high detail peds in video options, value will be reset to 500 \- otherwise to 60\.
---@return boolean Returns true if the peds LOD distance was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetPedsLODDistance() end

---This function resets the rain level of the current weather to its default.
---@return boolean Returns true if the rain level was reset.
---@markup { MTA:SA Shared }
function resetRainLevel() end

---This function allows restoring of a changed sky gradient as a result of setSkyGradient.
---@return boolean Returns true if sky color was reset correctly, false otherwise.
---@markup { MTA:SA Shared }
function resetSkyGradient() end

---This function is used to reset the color of the sun to its normal color.
---@return boolean Returns true if the color of the sun was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetSunColor() end

---This function is used to reset the size of the sun to its normal size.
---@return boolean Returns true if the size of the sun was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetSunSize() end

---This function unfreezes time frozen using setTimeFrozen. This is equivalent to using setTimeFrozen to false.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function resetTimeFrozen() end

---Resets the distance of vehicles LOD to default. Default values depends on client setting. If client has enabled high detail vehicles in video options, value will be reset to (500, 500\) \- otherwise to (70, 150\). You can check value of this option using dxGetStatus (SettingHighDetailVehicles).
---@return boolean Returns true if the vehicles LOD distance was reset, false otherwise.
---@markup { MTA:SA Shared }
function resetVehiclesLODDistance() end

---This function is used to reset the volumetric shadows to the game video setting.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function resetVolumetricShadows() end

---This function resets the wind velocity in San Andreas to its default state.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function resetWindVelocity() end

---Regardless of the value of the arguments, the following properties are reset:
---@param resetSpecialProperties boolean? Restores all special world properties changed by setWorldSpecialPropertyEnabled to default.
---@param resetWorldProperties boolean? Reset all world properties changed by setWorldProperty .
---@param resetWeatherProperties boolean? Reset all weather properties like heat haze, rain level, sun color etc.
---@param resetLODs boolean? Reset vehicles and peds lod distance.
---@param resetSounds boolean? Restore interior sounds, world sounds and ambient sounds.
---@param resetGlitches boolean? MISSINGPARAMDESC
---@param resetJetpackWeapons boolean? MISSINGPARAMDESC
---@return nil This function returns nothing ( nil ).
---@markup { MTA:SA Shared }
function resetWorldProperties(resetSpecialProperties, resetWorldProperties, resetWeatherProperties, resetLODs, resetSounds, resetGlitches, resetJetpackWeapons) end

---This function is used to reset the values of time cycle and weather related properties.
---@param property string The property you wish to retrieve.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function resetWorldProperty(property) end

---This function is used to reset the world sounds to the default setting.
---@return boolean Returns true if the world sounds were reset, false otherwise.
---@markup { MTA:SA Shared }
function resetWorldSounds() end

---This function allows restoring of all world objects, which were removed with removeWorldModel.
---@return boolean Returns true if the world objects were restored, false otherwise.
---@markup { MTA:SA Shared }
function restoreAllWorldModels() end

---This function restores the entire game world.
---@return nil This function does not return any value.
---@markup { MTA:SA Shared }
function restoreGameWorld() end

---This function restoring a removed world object, reversing the effect of removeWorldModel.
---@param modelID integer A whole integer specifying the GTASA object model ID.
---@param radius number A floating point number representing the radius that will be eliminated.
---@param x number A floating point number representing the X coordinate on the map.
---@param y number A floating point number representing the Y coordinate on the map.
---@param z number A floating point number representing the Z coordinate on the map.
---@param iInterior integer? MISSINGPARAMDESC
---@return boolean Returns true if the world object was restored, false otherwise.
---@markup { MTA:SA Shared }
function restoreWorldModel(modelID, radius, x, y, z, iInterior) end

---This function changes the maximum flying height of aircraft.
---@param Height number
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setAircraftMaxHeight(Height) end

---This function sets the maximum velocity at which aircrafts could fly. Using this function server\-side will overwrite the value that was previously set client\-side.
---@param velocity number The max velocity, can be 0 or any positive value. Default is 1.5 .
---@return boolean Returns true if the max velocity was set correctly, false otherwise.
---@markup { MTA:SA Shared }
function setAircraftMaxVelocity(velocity) end

---This function allows you to disable some background sound effects. See also: setWorldSoundEnabled.
---@param theType string The type of ambient sound to toggle. Can be either "gunfire" or "general".
---@param enable boolean MISSINGPARAMDESC
---@return boolean Returns true if the ambient sound was set correctly, false if invalid values were passed.
---@markup { MTA:SA Shared }
function setAmbientSoundEnabled(theType, enable) end

---This function allows you to disable the flying birds.
---@param enable boolean MISSINGPARAMDESC
---@return boolean Returns true if the birds state was changed succesfully, false if an invalid argument was specified.
---@markup { MTA:SA Shared }
function setBirdsEnabled(enable) end

---This function will enable or disable clouds. This is useful for race maps which are placed high up as clouds can cause low FPS.
---@param enabled boolean A boolean value determining if clouds should be shown. Use true to show clouds and false to hide them.
---@return boolean Returns true if the cloud state was changed succesfully, false if an invalid argument was specified.
---@markup { MTA:SA Shared }
function setCloudsEnabled(enabled) end

---This function is used to override the default color filtering values.
---@param aRed integer The amount of red (0-255).
---@param aGreen integer The amount of green (0-255).
---@param aBlue integer The amount of blue (0-255).
---@param aAlpha integer The amount of alpha (0-255).
---@param bRed integer The amount of red (0-255).
---@param bGreen integer The amount of green (0-255).
---@param bBlue integer The amount of blue (0-255).
---@param bAlpha integer The amount of alpha (0-255).
---@return boolean Returns true if the color filter was set, false otherwise.
---@markup { MTA:SA Shared }
function setColorFilter(aRed, aGreen, aBlue, aAlpha, bRed, bGreen, bBlue, bAlpha) end

---This function sets visibility of corona reflections.
---@param enabled integer 0 : disabled 1 : enabled (will be visible during rain) 2 : force enabled (will be visible even if there is no rain)
---@return boolean Returns true if passed arguments are correct, false otherwise.
---@markup { MTA:SA Shared }
function setCoronaReflectionsEnabled(enabled) end

---This function is used to set the distance of render. Areas beyond the specified distance will not be rendered.
---@param distance number A float specifying the distance of render. Setting this less than 5 will cause problems to the client.
---@return boolean Returns true if the distance was set correctly, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setFarClipDistance(distance) end

---This function changes the distance at which fog appears. Keep in mind that this function doesn't change the distance of render.
---@param distance number MISSINGPARAMDESC
---@return boolean Returns true if the distance changed successfully, false if bad arguments were passed.
---@markup { MTA:SA Shared }
function setFogDistance(distance) end

---This function sets the game speed to the given value.
---@param value number The float value of the game speed (Range 0 - 10)
---@return boolean Returns true if the gamespeed was set successfully, false otherwise. The normal game speed is '1'.
---@markup { MTA:SA Shared }
function setGameSpeed(value) end

---This function opens or closes the specified garage door in the world.
---@param garageID integer The garage ID that represents the garage door being opened or closed.
---@param open boolean MISSINGPARAMDESC
---@return boolean Returns true if successful, false if an invalid garage id was given.
---@markup { MTA:SA Shared }
function setGarageOpen(garageID, open) end

---This function sets a level of the overlay grain effect. The game will draw it on top of other grain effects. It can be used to imitate an effect of radiation or electromagnetic disturbances, for example.
---@param level integer The amount of grain (0-255).
---@return boolean Returns true if the grain level was set, false otherwise.
---@markup { MTA:SA Shared }
function setGrainLevel(level) end

---This function is used to adjust an intensity of the grain effect in different situations. It separately modulates an intensity of effect for infrared goggles, night vision goggles, rain and screen overlay.
---@param modifierName string MISSINGPARAMDESC
---@param multiplier number MISSINGPARAMDESC
---@return boolean Returns true if the grain multiplier was set, false otherwise.
---@markup { MTA:SA Shared }
function setGrainMultiplier(modifierName, multiplier) end

---This function sets the server's gravity level.
---@param level number The level of gravity (default is 0.008 ).
---@return boolean Returns true if gravity was changed, false otherwise.
---@markup { MTA:SA Shared }
function setGravity(level) end

---This function changes the heat haze effect.
---@param intensity integer The intensity of the effect, from 0 to 255.
---@param randomShift integer? Sets a random jitter, from 0 to 255.
---@param speedMin integer? The slowest effect speed, from 0 to 1000.
---@param speedMax integer? The fastest effect speed, from 0 to 1000.
---@param scanSizeX integer? The X size in pixels of the chunk grabbed from the screen, from -1000 to 1000.
---@param scanSizeY integer? The Y size in pixels of the chunk grabbed from the screen, from -1000 to 1000.
---@param renderSizeX integer? The X size in pixels the chunk will be when rendered back to the screen, from 0 to 1000.
---@param renderSizeY integer? The Y size in pixels the chunk will be when rendered back to the screen, from 0 to 1000.
---@param bShowInside boolean? Set to true to enable the heat haze effect when inside a building.
---@return boolean Returns true if the heat haze effect was set correctly, false if invalid values were passed.
---@markup { MTA:SA Shared }
function setHeatHaze(intensity, randomShift, speedMin, speedMax, scanSizeX, scanSizeY, renderSizeX, renderSizeY, bShowInside) end

---This function toggles furniture generation in interiors with the specified room ID.
---@param roomID integer The room type which you want disable or enable the furniture in: 0 : shop 1 : office 2 : lounge 3 : bedroom 4 : kitchen
---@param enabled boolean A bool representing whether the interior furniture is enabled or disabled.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setInteriorFurnitureEnabled(roomID, enabled) end

---This function disables or enables the ambient sounds played by GTA in most interiors, like restaurants, casinos, clubs, houses, etc.
---@param enabled boolean MISSINGPARAMDESC
---@return boolean If a boolean was passed to the function, it always succeeds and returns true .
---@markup { MTA:SA Shared }
function setInteriorSoundsEnabled(enabled) end

---This function changes the maximum flying height of jetpack.
---@param Height number The max height starting at approximately -20.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setJetpackMaxHeight(Height) end

---This function sets a weapon usable while using the Jetpack.
---@param weaponID/string weaponName integer MISSINGPARAMDESC
---@param enabled boolean MISSINGPARAMDESC
---@return boolean Returns true if successful, or false if invalid arguments are passed.
---@markup { MTA:SA Shared }
function setJetpackWeaponEnabled(weaponID/string weaponName, enabled) end

---Sets the real\-world duration of an ingame minute. The GTA default is 1000\.
---@param milliseconds integer the new duration of an ingame minute, accepted values 0 - 2147483647.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setMinuteDuration(milliseconds) end

---This function sets the moon size. Using this function server\-side will overwrite the value that was previously set client\-side.
---@param size integer The size, can be 0 or any positive value. Default is 3 .
---@return boolean Returns true if the moon size was set correctly, false otherwise.
---@markup { MTA:SA Shared }
function setMoonSize(size) end

---This function sets the distance from the camera at which the world starts rendering. Do not use this function unless you have a specific reason to do so, as any values can cause artifacts and flickering problems. It can be used in many ways, including: reducing Z\-fighting, creating more sophisticated first person views, allowing the camera to fly closer to the ground without passing through it, etcetera.
---@param distance number the new near clip distance. It must be between 0.1 and 20 for the function to do any effect. Default value is 0.3 .
---@return boolean This function returns true if the argument is valid. Returns false otherwise.
---@markup { MTA:SA Shared }
function setNearClipDistance(distance) end

---This function is used to enable or disable occlusions. Occlusions are used by GTA to enhance performance by hiding objects that are (normally) obscured by certain large buildings. However when removeWorldModel is used they may also have the undesired effect of making parts of the map disappear. Disabling occlusions will fix that.
---@param enabled boolean A bool specifying if GTA occlusions should be enabled
---@return boolean Returns true if the setting was set correctly, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function setOcclusionsEnabled(enabled) end

---This function sets the peds LOD distance.
---@param distance number the new peds LOD distance. This value is clamped to 0 – 500 . (Default for highdetailpeds on is 500 , when off, it is 60 ).
---@return boolean This function returns true if the argument is valid. Returns false otherwise.
---@markup { MTA:SA Shared }
function setPedsLODDistance(distance) end

---This function sets the rain level to any weather available in GTA. Use resetRainLevel to undo the changes.
---@param level number A floating point number representing the rain level. 1 represents the maximum rain level usually available in GTA, but higher values are accepted. Note: The level value is clamped between 0.0 and 10.0 to avoid gameplay issues.
---@return boolean Returns true if the rain level was set, false otherwise.
---@markup { MTA:SA Shared }
function setRainLevel(level) end

---This function changes the sky color to a two\-color gradient.
---@param topRed integer? The red value of the upper part of the sky, from 0 to 255.
---@param topGreen integer? The green value of the upper part of the sky, from 0 to 255.
---@param topBlue integer? The blue value of the upper part of the sky, from 0 to 255.
---@param bottomRed integer? The red value of the lower part of the sky, from 0 to 255.
---@param bottomGreen integer? The green value of the lower part of the sky, from 0 to 255.
---@param bottomBlue integer? The blue value of the lower part of the sky, from 0 to 255.
---@return boolean Returns true if sky color was set correctly, false if invalid values were passed.
---@markup { MTA:SA Shared }
function setSkyGradient(topRed, topGreen, topBlue, bottomRed, bottomGreen, bottomBlue) end

---This function is used to set the color of the sun.
---@param aRed integer The amount of red (0-255) you want the sun to be.
---@param aGreen integer The amount of green (0-255) you want the sun to be.
---@param aBlue integer The amount of blue (0-255) you want the sun to be.
---@param bRed integer The amount of red (0-255) you want the sun to be.
---@param bGreen integer The amount of green (0-255) you want the sun to be.
---@param bBlue integer The amount of blue (0-255) you want the sun to be.
---@return boolean Returns true if the color of the sun was set, false otherwise.
---@markup { MTA:SA Shared }
function setSunColor(aRed, aGreen, aBlue, bRed, bGreen, bBlue) end

---This function is used to set the size of the sun.
---@param Size integer The size you want the sun to be in the sky.
---@return boolean Returns true if the size of the sun was set, false otherwise.
---@markup { MTA:SA Shared }
function setSunSize(Size) end

---This function sets the current GTA time to the given time.
---@param hour integer The hour of the new time (range 0-23).
---@param minute integer The minute of the new time (range 0-59).
---@return boolean Returns true if the new time was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setTime(hour, minute) end

---This function will freeze the game time. It will affect the sky as well prevent it from changes.
---@param state boolean if set to true it will freeze the time, false otherwise.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function setTimeFrozen(state) end

---Sets the current traffic light state. This state controls the traffic light colors. For instance, state 1 will cause the north and south traffic lights to be amber, and the ones left and east will turn red.
---@param state integer If an integer is provided, the state you wish to use (possible values: 0-9). Else, one of the following strings: auto : Sets the traffic lights default behavior (switches the colors automatically). disabled : Turns traffic lights off.
---@return boolean Returns true if the state was successfully set, false otherwise.
---@markup { MTA:SA Shared }
function setTrafficLightState(state) end

---Toggles whether you want the traffic lights to be locked. If the lights are locked, it means they won't change unless you do setTrafficLightState.
---@param toggle boolean A bool indicating whether you want the traffic lights to change automatically, or not
---@return boolean Returns true if the successful, false otherwise.
---@markup { MTA:SA Shared }
function setTrafficLightsLocked(toggle) end

---Sets the distance of vehicles LOD.
---@param vehiclesDistance number general distance used for most vehicles, this value is clamped to 0 – 500
---@param trainsAndPlanesDistance number? distance used for trains and planes, this value is clamped to 0 – 500
---@return boolean This function returns true if arguments are valid. Returns false otherwise.
---@markup { MTA:SA Shared }
function setVehiclesLODDistance(vehiclesDistance, trainsAndPlanesDistance) end

---This function used to enable or disable volumetric shadows.
---@param state boolean if set true it will enable the volumetric shadows, false otherwise.
---@return boolean Always returns true .
---@markup { MTA:SA Shared }
function setVolumetricShadowsEnabled(state) end

---This function sets the current weather to the given valid value. To change the weather gradually, see setWeatherBlended.
---@param weatherID integer The ID of new weather . Valid values are 0 to 255 inclusive.
---@return boolean Returns true if the weather was set succesfully, false if an invalid weatherID was specified.
---@markup { MTA:SA Shared }
function setWeather(weatherID) end

---This function will change the current weather to another in a smooth manner, over the period of 1\-2 in\-game hours (unlike setWeather, which sets a new weather instantly). To ensure this transition performs as expected, you should not call this function until getWeather indicates that no transition is already being done.
---@param weatherID integer The ID of the weather state you wish to set. Valid values are 0 to 255 inclusive.
---@return boolean Returns true if successful, false if an invalid weatherID is passed.
---@markup { MTA:SA Shared }
function setWeatherBlended(weatherID) end

---This function changes the wind velocity. The wind shakes the vegetation and makes particles fly in a direction. The intensity and direction of the effect deppends of the wind velocity in each axis.
---@param velocityX number The velocity of the wind along the x axis.
---@param velocityY number The velocity of the wind along the y axis.
---@param velocityZ number The velocity of the wind along the z axis.
---@return boolean Returns true if successful, false if bad arguments were passed.
---@markup { MTA:SA Shared }
function setWindVelocity(velocityX, velocityY, velocityZ) end

---The downside of overriding is the need to implement custom blending (to change weather properties over time creating night / day cycle).
---@param property string The property you wish to override.
---@param value var MISSINGPARAMDESC
---@param value var MISSINGPARAMDESC
---@param value var MISSINGPARAMDESC
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setWorldProperty(property, value, value, value) end

---This function allows you to disable world sounds. A world sound is a sound effect which has not been caused by playSound or playSound3D.
---@param group integer An integer representing the world sound group .
---@param index integer? An integer representing an individual sound within the group
---@param enable boolean Set to false to disable, true to enable.
---@param immediate boolean? MISSINGPARAMDESC
---@return boolean Returns true if the world sound was correctly enabled/disabled, false if invalid values were passed.
---@markup { MTA:SA Shared }
function setWorldSoundEnabled(group, index, enable, immediate) end

---Enables or disables a special world property.
---@param propname string the name of the property to set. Possible values are: hovercars - equivalent of the JBGVNB cheat, and allows cars to drive on water. (default: false) aircars - equivalent of the RIPAZHA cheat, and allows cars to fly. (default: false) extrabunny - equivalent of the CJPHONEHOME or JHJOECW cheat, and allows you to bunny hop on bicycles much higher. (default: false) extrajump - equivalent of the KANGAROO cheat, and allows you to jump on foot much higher. (default: false) randomfoliage - toggle randomly generated foliage on the GTA:SA map (default: true) snipermoon - toggle the GTA:SA easter egg, which increases the size of the moon every time you shoot it with a sniper rifle (default: false) extraairresistance - toggle the vehicle speed limit on cross-country roads (default: true) underworldwarp - toggle warp of peds and vehicles when fall under map (default: true) vehiclesunglare - toggle the vehicle sun glare effect (default: false) coronaztest - disable big sun lensflare effect (default: true) ADDED/UPDATED IN VERSION 1.6.0 r21919 : watercreatures - toggle randomly generated underwater creatures (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22195 : burnflippedcars - toggle the vehicle to burn when upside down (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22199 : fireballdestruct - toggle the aircraft model destruction on explosion ( preview ) (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22430 : roadsignstext - toggle the drawing of text on road signs. (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22485 : extendedwatercannons - Increases the default limit of water cannons used at the same time from 3 to 30. (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22596 : tunnelweatherblend - toggle the weather blending effect when the player is in the tunnel. (default: true) ADDED/UPDATED IN VERSION 1.6.0 r22815 : ignorefirestate - Allows aiming when the player is on fire and entering burning vehicles. (default: false) ADDED/UPDATED IN VERSION 1.6.0 r22909 : flyingcomponents - This property determines whether the detached components such as doors, bumpers, etc., should respawn after a vehicle is recreated (change model or variant) or streamed in. (default: true) ADDED/UPDATED IN VERSION 1.6.0 r23223 : vehicleburnexplosions - This property toggles creation of additional explosions ( type 2 - rocket ) when plane or helicopter is burning. (default: true) ADDED/UPDATED IN VERSION 1.6.0 r23237 : vehicleengineautostart - This property toggles automatic vehicle engine state behavior. (default: true) If you set it to false then vehicle engine will not start on driver enter and will not stop on driver exit. To control the engine you need to use setVehicleEngineState . Helicopter rotors will spin only if the engine is on (with or without driver inside). This flag also affects bikes
---@param enable boolean whether or not to enable the property.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function setWorldSpecialPropertyEnabled(propname, enable) end

---This function checks to see if a line between two points collides with the water. This is similar to processLineOfSight, but only collides with water. Waves are not taken into account when testing the line.
---@param startX number MISSINGPARAMDESC
---@param startY number MISSINGPARAMDESC
---@param startZ number MISSINGPARAMDESC
---@param endX number MISSINGPARAMDESC
---@param endY number MISSINGPARAMDESC
---@param endZ number MISSINGPARAMDESC
---@return bool float float float Returns true and the position of the intersection point of the line and the water surface if there is a collision, or false if there is no collision.
---@markup { MTA:SA Shared }
function testLineAgainstWater(startX, startY, startZ, endX, endY, endZ) end

---The function checks whether there is an object within the given radius and returns information about it. The function works similarly to processLineOfSight, but instead of a straight line, it operates based on the specified radius, forming a sphere.
---@param vehicle unknown MISSINGPARAMDESC
---@param ped unknown MISSINGPARAMDESC
---@param etc. object MISSINGPARAMDESC
---@return bool               -- hit
element            -- hitElement
float float float  -- worldModelPositionX | Y | Z
float float float  -- worldModelRotationX | Y | Z
int                -- worldModelID
int                -- worldLODModelID
string             -- entity The modelID , lodID , worldModelPositionX,Y,Z , worldModelRotationX,Y,Z and entityType parameters are returned even if hitElement is nil .
---@markup { MTA:SA Shared }
function testSphereAgainstWorld(vehicle, ped, etc.) end

-- XML

---This function copies all contents of a certain node in a XML document to a new document file, so the copied node becomes the new file's root node. The new file will not be saved to file system until xmlSaveFile is called.
---@param nodeToCopy xmlnode The xmlnode that is to be copied to a new document.
---@param newFilePath string the path of the file that is to be created, in the following format: `":resourceName/path"`. `'resourceName'` is the name of the resource the file is in, and `'path'` is the path from the root directory of the resource to the file. If the file is to be in the current resource, only the file path is necessary, e.g. `"newfile.xml"`. For example, to create a file named `'newfile.xml'` with myNode as the root node in the resource `'ctf'`, it can be done from another resource this way: `xmlCopyFile(myNode, ":ctf/newfile.xml")`. If the file is to be in the current resource, only the file path is necessary, e.g. `xmlCopyFile(myNode, "newfile.xml")`.
---@return xmlnode|false Returns the xmlnode of the copy if the node was successfully copied, false if invalid arguments were passed.
---@markup { MTA:SA Shared }
function xmlCopyFile(nodeToCopy, newFilePath) end

---This function creates a new child node under an XML node.
---@param parentNode xmlnode The xmlnode you want to create a new child node under.
---@param tagName string The type of the child node that will be created.
---@return xmlnode|false Returns the created xmlnode if successful, false otherwise.
---@markup { MTA:SA Shared/Client }
function xmlCreateChild(parentNode, tagName) end

---This function creates a new XML document, which can later be saved to a file by using xmlSaveFile. This function will overwrite the file specified if it already exists.
---@param filePath string The Filepath of the file in the following format: ":resourceName/path". resourceName is the name of the resource the file will be in, and path is the path from the root directory of the resource to the file. For example, if you want to create a file named new.xml in the resource ctf, it can be created from another resource this way xmlCreateFile(":ctf/new.xml", "newroot"). If the file is in the current resource, only the file path is necessary, e.g. xmlCreateFile("new.xml", "newroot"). Note that if a different resource than default is being accessed, the caller resource needs access to general.ModifyOtherObjects in the ACL.
---@param rootNodeName string The name of the root node in the XML document.
---@return xmlnode|false Returns the root xmlnode object of the new XML file if successful, or false otherwise.
---@markup { MTA:SA Shared/Client }
function xmlCreateFile(filePath, rootNodeName) end

---This function destroys a XML node from the XML node tree.
---@param theXMLNode xmlnode The xmlnode you want to destroy.
---@return boolean Returns true if the xml node was successfully destroyed, false otherwise.
---@markup { MTA:SA Shared/Server }
function xmlDestroyNode(theXMLNode) end

---This function returns a named child node of an XML node.
---@param parentNode xmlnode This is an xmlnode that you want to find the child node under.
---@param tagName string This is the name of the child node you wish to find (case-sensitive).
---@param index integer This is the 0-based index of the node you wish to find. For example, to find the 5th subnode with a particular name, you would use 4 as the index value. To find the first occurence, use 0.
---@return xmlnode|false Returns an xmlnode if the node was found, false otherwise.
---@markup { MTA:SA Shared }
function xmlFindChild(parentNode, tagName, index) end

---This function provides an alternative way to load XML files to getResourceConfig. This function loads an XML file and returns the node by specifying a specific file path, while getResourceConfig allows for loading an XML file from a resource.
---@param filePath string The Filepath of the file in the following format: ":resourceName/path". resourceName is the name of the resource the file will be in, and path is the path from the root directory of the resource to the file. For example, if you want to create a file named new.xml in the resource ctf, it can be created from another resource this way xmlCreateFile(":ctf/new.xml", "newroot"). If the file is in the current resource, only the file path is necessary, e.g. xmlCreateFile("new.xml", "newroot"). Note that if a different resource than default is being accessed, the caller resource needs access to general.ModifyOtherObjects in the ACL.
---@param readOnly boolean? By default, the XML file is opened with reading and writing access. You can specify true for this parameter if you only need reading access.
---@return xmlnode|false Returns the root xmlnode object of an xml file if successful, or false otherwise.
---@markup { MTA:SA Shared }
function xmlLoadFile(filePath, readOnly) end

---This function creates an xmlnode from a string input.
---@param xmlString string A string containing XML data.
---@return xmlnode|false Returns the root xmlnode object of an xml string if successful, or false otherwise (invalid XML string).
---@markup { MTA:SA Shared }
function xmlLoadString(xmlString) end

---This function is used to return an attribute of a node in a configuration file.
---@param node xmlnode The xmlnode from which you wish to return the attribute.
---@param name string The name of the attribute.
---@return string|false Returns the attribute in string form or false, if the attribute is not defined.
---@markup { MTA:SA Shared }
function xmlNodeGetAttribute(node, name) end

---Returns all the attributes of a specific XML node.
---@param node xmlnode The xmlnode to get the attributes of.
---@return table|false If successful, returns a table with as keys the names of the attributes and as values the corresponding attribute values. If the node has no attributes, returns an empty table. In case of failure, returns false.
---@markup { MTA:SA Shared }
function xmlNodeGetAttributes(node) end

---This function returns all children of a particular XML node, or a particular child node.
---@param parentNode xmlnode This is an xmlnode that you want to find the child node under.
---@param index integer? If you only want to retrieve one particular child node, specify its (0-based) index here. For example if you only want the first node, specify 0; the fifth node has index 4, etc.
---@return table|xmlnode|false If index isn't specified, returns a table containing all child nodes. If index is specified, returns the corresponding child node if it exists. If no nodes are found, it returns an empty table. Returns false in case of failure.
---@markup { MTA:SA Shared/Server }
function xmlNodeGetChildren(parentNode, index) end

---Gets the tag name of the specified XML node.
---@param node xmlnode The xmlnode to get the tag name of.
---@return string|false Returns the tag name of the node if successful, false otherwise.
---@markup { MTA:SA Shared }
function xmlNodeGetName(node) end

---Returns the parent node of an xmlnode.
---@param node xmlnode The node of which you want to know the parent.
---@return xmlnode|false Returns the parent node of the specified node if successful. Returns false if the specified node is the root node or an invalid node was passed.
---@markup { MTA:SA Shared }
function xmlNodeGetParent(node) end

---This function is made to be able to read tag values in XML files (eg. anything).
---@param node xmlnode The xmlnode of which you need to know the value.
---@return string|false Returns the value of the node as a string if it was received successfully, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function xmlNodeGetValue(node) end

---This function is used to edit an attribute of a node in a configuration file.
---@param node xmlnode The xmlnode of which you wish to edit an attribute.
---@param name string The name of the attribute.
---@param value string|number|nil The value which you wish to change the attribute to. (Note - nil will delete the attribute).
---@return boolean Returns true if the attribute was set successfully, false if the node and/or attribute do not exist, or if they're faulty.
---@markup { MTA:SA Shared/Server }
function xmlNodeSetAttribute(node, name, value) end

---Sets the tag name of the specified XML node.
---@param node xmlnode The xmlnode to change the tag name of.
---@param name string The name of the attribute.
---@return boolean Returns true if successful, false otherwise.
---@markup { MTA:SA Shared }
function xmlNodeSetName(node, name) end

---This function is made to be able to assign values to tags in XML files (eg. anything).
---@param node xmlnode The xmlnode you want to set the value of.
---@param value string The string value you want the node to have.
---@param setCDATA boolean? A boolean indicating if you want the value to be enclosed inside CDATA tags.
---@return boolean Returns true if value was successfully set, false otherwise.
---@markup { MTA:SA Shared/Server/Client }
function xmlNodeSetValue(node, value, setCDATA) end

---This function saves a loaded XML file.
---@param rootNode xmlnode The root xmlnode of the loaded XML file.
---@return boolean Returns true if save was successful, false if the XML file does not exist.
---@markup { MTA:SA Shared/Client }
function xmlSaveFile(rootNode) end

---Unloads an XML document from memory.
---@param rootNode xmlnode The root of the XML document to unload.
---@return boolean Returns true if the document was unloaded successfully, false otherwise.
---@markup { MTA:SA Shared }
function xmlUnloadFile(rootNode) end


public OnGameModeInit() {
	ConnectMySQL();
	
    SetGameModeText(""SERVER_MODE"");
	SendRconCommand("hostname "HOST_NAME"");

	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);

	LoadObjects();
	return 1;
}

public OnGameModeExit() {
	mysql_close();
	return 1;
}

public OnPlayerText(playerid, text[]) {
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
	return 1;
}

public OnPlayerEnterCheckpoint(playerid) {
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid) {
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid) {
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid) {
	return 1;
}

public OnRconCommand(cmd[]) {
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success) {
	return 1;
}

public OnObjectMoved(objectid) {
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid) {
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid) {
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid) {
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid) {
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid) {
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source) {
	return 1;
}
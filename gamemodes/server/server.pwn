
public OnGameModeInit() {
	ConnectMySQL();
	
    SetGameModeText(""SERVER_MODE"");
	SendRconCommand("hostname "HOST_NAME"");

	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);

	LoadObjects();
	LoadTextDraws();
	return 1;
}

public OnGameModeExit() {
	mysql_close();
	return 1;
}

public OnPlayerText(playerid, text[]) {
	if (pLogin[playerid] != true) return SCM(playerid, C_GRAY, !"Писать в чат можно только авторизовавшись.");
	new string[128];
	if(!strcmp(text, ")", true)) {
	    format(string, sizeof(string), "%s улыбается", GetPlayer(playerid, pName));
	    ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	    return 0;
	}
	if(!strcmp(text, "))", true)) {
	    format(string, sizeof(string), "%s смеётся", GetPlayer(playerid, pName));
	    ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	    return 0;
	}
	if(!strcmp(text, "(", true)) {
	    format(string, sizeof(string), "%s расстроился", GetPlayer(playerid, pName));
	    ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	    return 0;
	}
	if(!strcmp(text, "((", true)) {
	    format(string, sizeof(string), "%s сильно расстроился", GetPlayer(playerid, pName));
	    ProxDetector(30.0, playerid, string, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF, 0xDD90FFFF);
	    return 0;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
	    ApplyAnimation(playerid, "PED", "IDLE_chat", 4, 0, 1, 1, 1, 1);
	 	SetTimerEx("animchat", 4000, 0, "i", playerid);
	}
	format(string, sizeof(string), " - %s (%s)[%d]", text, GetPlayer(playerid, pName), playerid);
	ProxDetector(30.0, playerid, string, 0xFFFFFFFF, 0xFFFFFFFF, 0xF5F5F5FF, 0xE6E6E6FF,0xB8B8B8FF);
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
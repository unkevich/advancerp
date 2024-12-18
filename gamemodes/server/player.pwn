
public OnPlayerRequestClass(playerid, classid) {
	return 1;
}

public OnPlayerConnect(playerid) {
	SCM(playerid, C_WHITE, !"Добро пожаловать на сервер "SERVER_NAME"!");

	GetPlayerName(playerid, GetPlayer(playerid, pName), MAX_PLAYER_NAME);
	TimerConnectServerPlayer[playerid] = SetTimerEx("PlayerConnectToServer", 300, false, "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {
	return 1;
}

public OnPlayerSpawn(playerid) {
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason) {
	return 1;
}

public OnPlayerRequestSpawn(playerid) {
	return 1;
}

public OnPlayerUpdate(playerid) {
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid) {
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
	// проверка на админа
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) { // если с авто
		SetVehiclePos(GetPlayerVehicleID(playerid), fX, fY, fZ);
        PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), 0);
	} else { // если без авто
		SetPlayerPos(playerid, fX, fY, fZ);
	}
	SetPlayerVirtualWorld(playerid, 0);
    SetPlayerInterior(playerid, 0);
	return 1;
}
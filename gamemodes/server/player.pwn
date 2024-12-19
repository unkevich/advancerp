
public OnPlayerRequestClass(playerid, classid) {
	SCM(playerid, C_BLUE, !"ƒобро пожаловать на "SERVER_NAME"!");
	SetPlayerCameraPos(playerid, 1677.4501,-1493.8395,123.0782);
    SetPlayerCameraLookAt(playerid, 1527.5341,-1778.5883,71.1633);
	return 1;
}

public OnPlayerConnect(playerid) {
	TextDrawShowForPlayer(playerid, logo_td);
	LoadPlayerTextDraws(playerid);

	GetPlayerName(playerid, GetPlayer(playerid, pName), MAX_PLAYER_NAME);
	TimerConnectServerPlayer[playerid] = SetTimerEx("PlayerConnectToServer", 300, false, "i", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {
	return 1;
}

public OnPlayerSpawn(playerid) {
	if (RegSkin[playerid] == 1) {
		RegSkin[playerid] = 0;
		SetPlayerCameraPos(playerid, 231.9259,112.7934,1010.6741);
 	    SetPlayerCameraLookAt(playerid, 234.1026,118.1498,1010.2118);
 	    SetPlayerInterior(playerid, 10);
 	    SetPlayerVirtualWorld(playerid, 10);
	  	SetPlayerPos(playerid, 234.1026,118.1498,1010.2118);
	  	SetPlayerFacingAngle(playerid, 146.0);
 	    TextDrawShowForPlayer(playerid, arrowleft[playerid]);
		TextDrawShowForPlayer(playerid, arrowright[playerid]);
		TextDrawShowForPlayer(playerid, prevclick[playerid]);
		TextDrawShowForPlayer(playerid, nextclick[playerid]);
		TextDrawShowForPlayer(playerid, select[playerid]);
		SelectTextDraw(playerid, 0xFFFFFFFF);
		switch(GetPlayer(playerid, pSex)) {
		    case 1: {
			    SetPlayerSkin(playerid, 78);
				SelectSkin[playerid] = 78;
			}
		    case 2: {
			    SetPlayerSkin(playerid, 10);
				SelectSkin[playerid] = 10;
			}
		}
	} if (RegStatus[playerid] == 1) {
		TextDrawHideForPlayer(playerid, arrowleft[playerid]);
		TextDrawHideForPlayer(playerid, arrowright[playerid]);
		TextDrawHideForPlayer(playerid, prevclick[playerid]);
		TextDrawHideForPlayer(playerid, nextclick[playerid]);
		TextDrawHideForPlayer(playerid, select[playerid]);
		SetPlayerVirtualWorld(playerid, 0);
 	    SetPlayerInterior(playerid, 0);
 	    SetPlayerPos(playerid, 1759.8994,-1900.3701,13.5635);
 	    CancelSelectTextDraw(playerid);
 	    SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
 	    TogglePlayerControllable(playerid, 1);
		RegStatus[playerid] = 0;
	} if (RegSkin[playerid] != 0 && RegStatus[playerid] == 0) {
		SetPlayerPos(playerid, 1759.8994,-1900.3701,13.5635);
 	    SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
   		SetPlayerVirtualWorld(playerid, 0);
 	    SetPlayerInterior(playerid, 0);
	} if (RegSkin[playerid] == 0 && RegStatus[playerid] == 0) {
		SetPlayerScore(playerid, GetPlayer(playerid, pLevel));
		GivePlayerMoney(playerid, GetPlayer(playerid, pMoney));
		switch (GetPlayer(playerid, pLevel)) {
			case 1..3: {
				switch(random(2)) {
				 	case 0: {
				 	    SetPlayerPos(playerid, 1759.8994,-1900.3701,13.5635);
				 	    SetPlayerFacingAngle(playerid, 270.0);
				 	}
				 	case 1: {
					    SetPlayerPos(playerid, 1202.0745,-1756.1912,13.5863);
					    SetPlayerFacingAngle(playerid, 75.0);
					}
 	            }
 	            SetCameraBehindPlayer(playerid);
 	            SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
		   		SetPlayerVirtualWorld(playerid, 0);
		 	    SetPlayerInterior(playerid, 0);
			} case 4..7: {
	            SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
		   		SetPlayerVirtualWorld(playerid, 0);
		 	    SetPlayerInterior(playerid, 0);
		 	    SetPlayerPos(playerid, -1969.3912,159.3873,27.6875);
		 	    SetPlayerFacingAngle(playerid, 180.0);
		 	    SetCameraBehindPlayer(playerid);
	        } default: {
	            SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
		   		SetPlayerVirtualWorld(playerid, 0);
		 	    SetPlayerInterior(playerid, 0);
		 	    SetPlayerPos(playerid, 2848.6375,1291.1294,11.3906);
		 	    SetPlayerFacingAngle(playerid, 90.0);
		 	    SetCameraBehindPlayer(playerid);
	        }
		}
	}
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

public OnPlayerClickTextDraw(playerid, Text:clickedid) {
	if(clickedid == arrowleft[playerid]) { // лево
		switch(GetPlayer(playerid, pSex)) {
			case 1: {
				switch(SelectSkin[playerid]) {
					case 78: {
                        SetPlayerSkin(playerid, 79);
						SelectSkin[playerid] = 79;
					}
					case 160: {
					    SetPlayerSkin(playerid, 78);
						SelectSkin[playerid] = 78;
					}
					case 230: {
					    SetPlayerSkin(playerid, 160);
						SelectSkin[playerid] = 160;
					}
					case 213: {
					    SetPlayerSkin(playerid, 230);
						SelectSkin[playerid] = 230;
					}
					case 212: {
					    SetPlayerSkin(playerid, 213);
						SelectSkin[playerid] = 213;
					}
					case 200: {
					    SetPlayerSkin(playerid, 212);
						SelectSkin[playerid] = 212;
					}
					case 137: {
					    SetPlayerSkin(playerid, 200);
						SelectSkin[playerid] = 200;
					}
					case 136: {
					    SetPlayerSkin(playerid, 137);
						SelectSkin[playerid] = 137;
					}
					case 135: {
					    SetPlayerSkin(playerid, 136);
						SelectSkin[playerid] = 136;
					}
					case 134: {
     					SetPlayerSkin(playerid, 135);
						SelectSkin[playerid] = 135;
					}
					case 132: {
					    SetPlayerSkin(playerid, 134);
						SelectSkin[playerid] = 134;
					}
					case 79: {
					    SetPlayerSkin(playerid, 132);
						SelectSkin[playerid] = 132;
					}
				}
			} case 2: {
				switch(SelectSkin[playerid]) {
					case 10: {
					    SetPlayerSkin(playerid, 13);
						SelectSkin[playerid] = 13;
                    }
                    case 218: {
                        SetPlayerSkin(playerid, 10);
						SelectSkin[playerid] = 10;
                    }
                    case 198: {
                        SetPlayerSkin(playerid, 218);
						SelectSkin[playerid] = 218;
                    }
                    case 197: {
                        SetPlayerSkin(playerid, 198);
						SelectSkin[playerid] = 198;
                    }
                    case 196: {
                        SetPlayerSkin(playerid, 197);
						SelectSkin[playerid] = 197;
					}
					case 157: {
					    SetPlayerSkin(playerid, 196);
						SelectSkin[playerid] = 196;
					}
					case 151: {
                        SetPlayerSkin(playerid, 157);
						SelectSkin[playerid] = 157;
					}
					case 130: {
                        SetPlayerSkin(playerid, 151);
						SelectSkin[playerid] = 151;
					}
					case 129: {
					    SetPlayerSkin(playerid, 130);
						SelectSkin[playerid] = 130;
					}
					case 77: {
					    SetPlayerSkin(playerid, 129);
						SelectSkin[playerid] = 129;
					}
					case 54: {
					    SetPlayerSkin(playerid, 54);
						SelectSkin[playerid] = 54;
					}
					case 39: {
					    SetPlayerSkin(playerid, 54);
						SelectSkin[playerid] = 54;
					}
					case 31: {
					    SetPlayerSkin(playerid, 39);
						SelectSkin[playerid] = 39;
					}
					case 13: {
					    SetPlayerSkin(playerid, 31);
						SelectSkin[playerid] = 31;
					}
				}
			}
		}
	} if(clickedid == arrowright[playerid]) { // право
		switch(GetPlayer(playerid, pSex)) {
			case 1: {
				switch(SelectSkin[playerid]) {
					case 78: {
			            SetPlayerSkin(playerid, 160);
						SelectSkin[playerid] = 160;
					}
					case 160: {
          				SetPlayerSkin(playerid, 230);
						SelectSkin[playerid] = 230;
	 				}
	  				case 230: {
	  				    SetPlayerSkin(playerid, 213);
						SelectSkin[playerid] = 213;
	  				}
					case 213: {
					    SetPlayerSkin(playerid, 212);
						SelectSkin[playerid] = 212;
					}
					case 212: {
					    SetPlayerSkin(playerid, 200);
						SelectSkin[playerid] = 200;
					}
					case 200: {
					    SetPlayerSkin(playerid, 137);
						SelectSkin[playerid] = 137;
					}
					case 137: {
					    SetPlayerSkin(playerid, 136);
						SelectSkin[playerid] = 136;
					}
					case 136: {
                        SetPlayerSkin(playerid, 135);
						SelectSkin[playerid] = 1351;
					}
					case 135: {
					    SetPlayerSkin(playerid, 134);
						SelectSkin[playerid] = 134;
					}
					case 134: {
					    SetPlayerSkin(playerid, 132);
						SelectSkin[playerid] = 132;
					}
					case 132: {
					    SetPlayerSkin(playerid, 79);
						SelectSkin[playerid] = 79;
					}
					case 79: {
                        SetPlayerSkin(playerid, 78);
						SelectSkin[playerid] = 78;
					}
				}
			} case 2: {
				switch(SelectSkin[playerid]) {
					case 10: {
					    SetPlayerSkin(playerid, 218);
						SelectSkin[playerid] = 218;
					}
					case 218: {
					    SetPlayerSkin(playerid, 198);
						SelectSkin[playerid] = 198;
					}
					case 198: {
					    SetPlayerSkin(playerid, 197);
						SelectSkin[playerid] = 197;
					}
					case 197: {
					    SetPlayerSkin(playerid, 196);
						SelectSkin[playerid] = 196;
					}
					case 196: {
					    SetPlayerSkin(playerid, 157);
						SelectSkin[playerid] = 157;
					}
					case 157: {
					    SetPlayerSkin(playerid, 151);
						SelectSkin[playerid] = 151;
					}
					case 151: {
					    SetPlayerSkin(playerid, 130);
						SelectSkin[playerid] = 130;
					}
					case 130: {
					    SetPlayerSkin(playerid, 129);
						SelectSkin[playerid] = 129;
					}
					case 129: {
					    SetPlayerSkin(playerid, 77);
						SelectSkin[playerid] = 77;
					}
					case 77: {
					    SetPlayerSkin(playerid, 54);
						SelectSkin[playerid] = 54;
					}
					case 54: {
					    SetPlayerSkin(playerid, 39);
						SelectSkin[playerid] = 39;
					}
					case 39: {
					    SetPlayerSkin(playerid, 31);
						SelectSkin[playerid] = 31;
					}
					case 31: {
					    SetPlayerSkin(playerid, 13);
						SelectSkin[playerid] = 13;
					}
					case 13: {
					    SetPlayerSkin(playerid, 10);
						SelectSkin[playerid] = 10;
					}
				}
			}
		}
	} if(clickedid == select[playerid]) {
	    GetPlayer(playerid, pSkin) = SelectSkin[playerid];
	    SetPlayerSkin(playerid, GetPlayer(playerid, pSkin));
	    SelectTextDraw(playerid, 0xFFFFFFFF);
	    RegStatus[playerid] = 1;

		new Year, Month, Day;
		getdate(Year, Month, Day);
		new date[13];
		format(date, sizeof(date), "%02d.%02d.%d", Day, Month, Year);
		new ip[16];
		GetPlayerIp(playerid, ip, sizeof(ip));

		new queryAdd[151+(-2+MAX_PLAYER_NAME)+(-2+65)+(-2+11)+(-2+64)+(-2+2)+(-2+8)+(-2+14)+(-2+17)];
		format(queryAdd, sizeof(queryAdd), "INSERT INTO `accounts` (`name`, `password`, `salt`, `email`, `sex`, `skin`, `regdata`, `regip`) VALUES ('%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s')", GetPlayer(playerid, pName), GetPlayer(playerid, pPassword), GetPlayer(playerid, pSalt), GetPlayer(playerid, pEmail), GetPlayer(playerid, pSex), GetPlayer(playerid, pSkin), date, ip);
		mysql_query(dbHandle, queryAdd);

		new query[66+(-2+MAX_PLAYER_NAME)+(-2+65)];
		format(query, sizeof(query), "SELECT * FROM `accounts` WHERE `name` = '%s' AND `password` = '%s'", GetPlayer(playerid, pName), GetPlayer(playerid, pPassword));
		return mysql_tquery(dbHandle, query, "PlayerLogin", "i", playerid);
	}
	return 1;
}
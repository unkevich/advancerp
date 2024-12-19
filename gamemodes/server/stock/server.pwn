
stock ConnectMySQL() {
    dbHandle = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_BASE);
	switch(mysql_errno()) {
	    case 0: print("Успешно подключение к базе данных!");
	    default: printf("Не удалось подключиться к базе данных! Номер ошибки %d", mysql_errno(dbHandle));
	}
	mysql_log(ERROR | WARNING);
	mysql_set_charset("cp1251");
}

stock ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5) {
	new Float:posx;new Float:posy;new Float:posz;new Float:oldposx;new Float:oldposy;new Float:oldposz;new Float:tempposx;new Float:tempposy;new Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	foreach(new i: Player) {
		if(IsPlayerConnected(i)) {
		    if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)) {
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if(((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16))) SCM(i, col1, string);
				else if(((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8))) SCM(i, col2, string);
				else if(((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4))) SCM(i, col3, string);
				else if(((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2))) SCM(i, col4, string);
				else if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) SCM(i, col5, string);
			}
		}
	}
	return 1;
}

stock LoadObjects() {
}

stock LoadTextDraws() {
	#include "/server/textdraw/logo.inc"
}

stock LoadPlayerTextDraws(playerid) {
	#include "/server/textdraw/skin.inc"
}

publics PlayerConnectToServer(playerid) {
    TogglePlayerSpectating(playerid, 1);
    WrongPassword[playerid] = 3;
    KillTimer(TimerConnectServerPlayer[playerid]);

    new query[61+(-2+MAX_PLAYER_NAME)];
    mysql_format(dbHandle, query, sizeof(query), "SELECT `password`, `salt` FROM `accounts` WHERE `name` = '%s'", GetPlayer(playerid, pName));
    return mysql_tquery(dbHandle, query, "PlayerFindToBaseConnect", "i", playerid);
}

publics PlayerFindToBaseConnect(playerid) {
    new rows;
    cache_get_row_count(rows);
    if (!rows) {
        return SCM(playerid, C_WHITE, !"Регистрация");
    } else {
        return SCM(playerid, C_WHITE, !"Авторизация");
    }
}
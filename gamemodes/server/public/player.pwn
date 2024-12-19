
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
        return Dialog_Show(playerid, Dialog:Dlg_RegisterPass);
    } else {
        cache_get_value_name(0, "password", GetPlayer(playerid, pPassword), 65);
        cache_get_value_name(0, "salt", GetPlayer(playerid, pSalt), 11);
        return Dialog_Show(playerid, Dialog:Dlg_LoginPlayer);
    }
}

publics PlayerLogin(playerid) {
    new rows;
    cache_get_row_count(rows);
    if (rows) {
        cache_get_value_name_int(0, "id", GetPlayer(playerid, pID));
        cache_get_value_name(0, "email", GetPlayer(playerid, pEmail), 64);
        cache_get_value_name_int(0, "sex", GetPlayer(playerid, pSex));
        cache_get_value_name_int(0, "skin", GetPlayer(playerid, pSkin));
        cache_get_value_name(0, "regdata", GetPlayer(playerid, pRegData), 13);
        cache_get_value_name(0, "regip", GetPlayer(playerid, pRegIP), 16);
        cache_get_value_name_int(0, "level", GetPlayer(playerid, pLevel));
        cache_get_value_name_int(0, "exp", GetPlayer(playerid, pExp));
        cache_get_value_name_int(0, "money", GetPlayer(playerid, pMoney));
        cache_get_value_name_int(0, "admin", GetPlayer(playerid, pAdmin));

        switch (GetPlayer(playerid, pAdmin)) {
            case 1: SCM(playerid, C_YELLOW, !"Вы успешно вошли как администратор первого уровня");
            case 2: SCM(playerid, C_YELLOW, !"Вы успешно вошли как администратор второго уровня");
            case 3: SCM(playerid, C_YELLOW, !"Вы успешно вошли как администратор третьего уровня");
            case 4: SCM(playerid, C_YELLOW, !"Вы успешно вошли как администратор четвёртого уровня");
            case 5: SCM(playerid, C_YELLOW, !"Вы успешно вошли как главный администратор");
            case 6: SCM(playerid, C_YELLOW, !"Вы успешно вошли как разработчик");
        }

        TogglePlayerSpectating(playerid, 0);
        pLogin[playerid] = true;
        SetSpawnInfo(playerid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SetPlayerVirtualWorld(playerid, 0);
        SetPlayerInterior(playerid, 0);
        SpawnPlayer(playerid);
    }
    return 0;
}

publics NewKick(playerid) {
    SCM(playerid, C_RED, !"Введите /q (/quit) чтобы выйти");
    Kick(playerid);
    return 1;
}
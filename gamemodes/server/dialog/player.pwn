
// ========================= [ Register ] =========================

DialogR:Dlg_RegisterPass() {
    if (!response) return NewKick(playerid);
    if (!strlen(inputtext)) return Dialog_Show(playerid, Dialog:Dlg_RegisterErrorPass);
    new regex:rg_passwordcheck = regex_new("^[a-zа-яA-ZА-Я0-9]{6,15}$");
    if(!regex_check(inputtext, rg_passwordcheck)) { regex_delete(rg_passwordcheck); return Dialog_Show(playerid, Dialog:Dlg_RegisterErrorPass); }

    regex_delete(rg_passwordcheck);
    new salt[11];
    for (new i; i < 10; i++) salt[i] = random(79) + 47;
    salt[10] = 0;
    SHA256_PassHash(inputtext, salt, GetPlayer(playerid, pPassword), 65);
    strmid(GetPlayer(playerid, pSalt), salt, 0, 11, 11);
    return Dialog_Show(playerid, Dialog:Dlg_RegisterEmail);
}

DialogR:Dlg_RegisterErrorPass() {
    if (response) Dialog_Show(playerid, Dialog:Dlg_RegisterPass);
}

DialogR:Dlg_RegisterEmail() {
    if (!response) return NewKick(playerid);
    if (!strlen(inputtext)) return Dialog_Show(playerid, Dialog:Dlg_RegisterErrorEmail);
    new regex:rg_emailcheck = regex_new("^[a-zA-Z0-9.-_]{1,43}@[a-zA-Z]{1,12}.[a-zA-Z]{1,8}$");
    if(!regex_check(inputtext, rg_emailcheck)) { regex_delete(rg_emailcheck); return Dialog_Show(playerid, Dialog:Dlg_RegisterErrorEmail); }

    regex_delete(rg_emailcheck);
    strmid(GetPlayer(playerid, pEmail), inputtext, 0, strlen(inputtext), 64);
    return Dialog_Show(playerid, Dialog:Dlg_RegisterReferal);
}

DialogR:Dlg_RegisterErrorEmail() {
    if (response) Dialog_Show(playerid, Dialog:Dlg_RegisterEmail);
}

DialogR:Dlg_RegisterReferal() {
    if (response) {
        // в разработке
        return Dialog_Show(playerid, Dialog:Dlg_RegisterPromo);
    } else { // пропустить
        return Dialog_Show(playerid, Dialog:Dlg_RegisterPromo);
    }
}

DialogR:Dlg_RegisterErrorReferal() {
    if (response) return Dialog_Show(playerid, Dialog:Dlg_RegisterReferal);
    else return Dialog_Show(playerid, Dialog:Dlg_RegisterPromo); // пропустить
}

DialogR:Dlg_RegisterPromo() {
    if (response) {
        // в разработке
        return Dialog_Show(playerid, Dialog:Dlg_RegisterInfo);
    } else { // пропустить
        return Dialog_Show(playerid, Dialog:Dlg_RegisterInfo);
    }
}

DialogR:Dlg_RegisterErrorPromo() {
    if (response) return Dialog_Show(playerid, Dialog:Dlg_RegisterPromo);
    else return Dialog_Show(playerid, Dialog:Dlg_RegisterInfo); // пропустить
}

DialogR:Dlg_RegisterInfo() {
    if (response) return Dialog_Show(playerid, Dialog:Dlg_RegisterSex); // новичок
    else return Dialog_Show(playerid, Dialog:Dlg_RegisterSex); // уже играл
}

DialogR:Dlg_RegisterSex() {
    GetPlayer(playerid, pSex) = (response) ? (1) : (2); // 1 - мужской, 2 - женский
    // показ камеры выбора скина
    SCM(playerid, C_WHITE, !"Регистрация завершена!");
    SCM(playerid, 0x69cb00FF, !"Теперь выберите внешность Вашего персонажа");
    SCM(playerid, C_GRAY, !"Подсказка: Используйте {6b9a00}СТРЕЛКИ{cecfd1} и кнопку {03ceb1}PLAY{cecfd1} для выбора");
    SCM(playerid, C_GRAY, !"Подсказка: Вы также можете использовать команды {04cc69}/next, /prev{cecfd1} и {04cc69}/select{cecfd1} (в разработке))");

    TogglePlayerControllable(playerid, 0);
    RegSkin[playerid] = 1;
    SpawnPlayer(playerid);
}

// ======================= [ Autorization ] =======================

DialogR:Dlg_LoginPlayer() {
    if (!response) return NewKick(playerid);
    new checkpass[65];
    SHA256_PassHash(inputtext, GetPlayer(playerid, pSalt), checkpass, 65);
    if (strcmp(GetPlayer(playerid, pPassword), checkpass, false, 64) == 0) {
        new query[66+MAX_PLAYER_NAME-2+65-2];
        format(query, sizeof(query), "SELECT * FROM `accounts` WHERE `name` = '%s' AND `password` = '%s'", GetPlayer(playerid, pName), GetPlayer(playerid, pPassword));
        return mysql_tquery(dbHandle, query, "PlayerLogin", "i", playerid);
    } else {
        WrongPassword[playerid] -= 1;
        if (WrongPassword[playerid] > 0) {}
        if (WrongPassword[playerid] == 0) return NewKick(playerid);
        return Dialog_Show(playerid, Dialog:Dlg_LoginPlayer);
    }
}

// ======================== [ Menu player ] =======================
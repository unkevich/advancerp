
// ========================= [ Register ] =========================

DialogCreate:Dlg_RegisterPass(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterPass, DSI, !"{89c2d6}Регистрация", 
        !"{ffffff}Добро пожаловать на сервер "SERVER_NAME"\n\
        Чтобы начать игру вам необходимо пройти регистрацию\n\n\
        Введите пароль для Вашего аккаунта\n\
        Он будет запрашиваться каждый раз, когда вы заходите на сервер\n\n\
        \t{7cca26}Примечания:\n\
        \t- Пароль может состоять из русских и латинских символов\n\
        \t- Пароль чувствителен к регистру\n\
        \t- Длина пароля от 6-ти до 15-ти символов",
    !"Далее", "");
}

DialogCreate:Dlg_RegisterErrorPass(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorPass, DSM, !"{ff9710}Ошибка", 
        !"{ffffff}Длина пароля должна быть от 6 до 15 символов\n\
        Рекомендуется использовать русские и латинские буквы, а так же любые знаки",
    !"Повтор", "");
}

DialogCreate:Dlg_RegisterEmail(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterEmail, DSI, !"{89c2d6}Email", 
        !"{ffffff}Введите адрес Вашей электронной почты\n\
        Используя его, вы сможете восстановить доступ к аккаунту\n\
        в случае взлома или если забудете пароль.\n\n\
        На email мы вышлем ссылку. В течении 14 дней Вы сможете\n\
        перейти по ней для подтверждения почты.\n\n\
        Убедитесь в правильности ввода и нажмите \"Далее\"",
    !"Далее", "");
}

DialogCreate:Dlg_RegisterErrorEmail(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorEmail, DSM, !"{ff9710}Ошибка", 
        !"{ffffff}Адрес электронной почты введён неверно",
    !"Повтор", "");
}

DialogCreate:Dlg_RegisterReferal(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterReferal, DSI, !"{89c2d6}Ник пригласившего игрока", 
        !"{ffffff}Такого игрока не существует.\nЕсли Вы не знаете других игроков нажмите кнопку «Пропустить».",
    !"Далее", !"Пропустить");
}

DialogCreate:Dlg_RegisterErrorReferal(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorReferal, DSM, !"{ff5d11}Ошибка", 
        !"{ffffff}Такого аккаунта не существует.\n\nЕсли Вы не знаете что сюда ввести,\nнажмите кнопку «Пропустить».",
    !"Повтор", "");
}

DialogCreate:Dlg_RegisterPromo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterPromo, DSI, !"{ffca00}Промокод", 
        !"{ffffff}Если у Вас есть {a299ea}промокод{ffffff}, полученный от\n\
        блогера, ютубера, другого игрока, или по\n\
        специальной акции, введите его в поле ниже:",
    !"Далее", !"Пропустить");
}

DialogCreate:Dlg_RegisterErrorPromo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorPromo, DSM, !"{ff5d11}Ошибка", 
        !"{ffffff}Такого промокода не существует.\n\nЕсли Вы не знаете что сюда ввести,\nнажмите кнопку «Пропустить».",
    !"Повтор", "");
}

DialogCreate:Dlg_RegisterInfo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterInfo, DSM, !"{89c2d6}"SERVER_NAME"", 
        !"{ffffff}Вы впервые играете в GTA San Andreas Multiplayer (SAMP)?\n\
        Мы покажем дополнительные подсказки для вас.",
    !"Новичок", !"Уже играл");
}

DialogCreate:Dlg_RegisterSex(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterSex, DSM, !"{89c2d6}Пол", 
        !"{ffffff}Выберите пол вашего персонажа",
    !"Мужской", !"Женский");
}

// ======================= [ Autorization ] =======================

DialogCreate:Dlg_LoginPlayer(playerid) {
    new dialog[256];
    if (WrongPassword[playerid] != 3) {
        format(dialog, sizeof(dialog), "{ffffff}Добро пожаловать на сервер "SERVER_NAME"\nВаш ник зарегистрирован\n\nЛогин: {54bc1d}%s{ffffff}\n{fa6707}Неверный пароль! Осталось попыток: %d", GetPlayer(playerid, pName), WrongPassword[playerid]);
    } else {
        format(dialog, sizeof(dialog), "{ffffff}Добро пожаловать на сервер "SERVER_NAME"\nВаш ник зарегистрирован\n\nЛогин: {54bc1d}%s{ffffff}\nВведите пароль:", GetPlayer(playerid, pName));
    }
    
    return Dialog_Open(playerid, Dialog:Dlg_LoginPlayer, DSP, !"{89c2d6}Авторизация", dialog, !"Войти", !"Отмена");
}

// ======================== [ Menu player ] =======================
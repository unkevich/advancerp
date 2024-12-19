
// ========================= [ Register ] =========================

DialogCreate:Dlg_RegisterPass(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterPass, DSI, !"{89c2d6}�����������", 
        !"{ffffff}����� ���������� �� ������ "SERVER_NAME"\n\
        ����� ������ ���� ��� ���������� ������ �����������\n\n\
        ������� ������ ��� ������ ��������\n\
        �� ����� ������������� ������ ���, ����� �� �������� �� ������\n\n\
        \t{7cca26}����������:\n\
        \t- ������ ����� �������� �� ������� � ��������� ��������\n\
        \t- ������ ������������ � ��������\n\
        \t- ����� ������ �� 6-�� �� 15-�� ��������",
    !"�����", "");
}

DialogCreate:Dlg_RegisterErrorPass(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorPass, DSM, !"{ff9710}������", 
        !"{ffffff}����� ������ ������ ���� �� 6 �� 15 ��������\n\
        ������������� ������������ ������� � ��������� �����, � ��� �� ����� �����",
    !"������", "");
}

DialogCreate:Dlg_RegisterEmail(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterEmail, DSI, !"{89c2d6}Email", 
        !"{ffffff}������� ����� ����� ����������� �����\n\
        ��������� ���, �� ������� ������������ ������ � ��������\n\
        � ������ ������ ��� ���� �������� ������.\n\n\
        �� email �� ������ ������. � ������� 14 ���� �� �������\n\
        ������� �� ��� ��� ������������� �����.\n\n\
        ��������� � ������������ ����� � ������� \"�����\"",
    !"�����", "");
}

DialogCreate:Dlg_RegisterErrorEmail(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorEmail, DSM, !"{ff9710}������", 
        !"{ffffff}����� ����������� ����� ����� �������",
    !"������", "");
}

DialogCreate:Dlg_RegisterReferal(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterReferal, DSI, !"{89c2d6}��� ������������� ������", 
        !"{ffffff}������ ������ �� ����������.\n���� �� �� ������ ������ ������� ������� ������ ������������.",
    !"�����", !"����������");
}

DialogCreate:Dlg_RegisterErrorReferal(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorReferal, DSM, !"{ff5d11}������", 
        !"{ffffff}������ �������� �� ����������.\n\n���� �� �� ������ ��� ���� ������,\n������� ������ ������������.",
    !"������", "");
}

DialogCreate:Dlg_RegisterPromo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterPromo, DSI, !"{ffca00}��������", 
        !"{ffffff}���� � ��� ���� {a299ea}��������{ffffff}, ���������� ��\n\
        �������, �������, ������� ������, ��� ��\n\
        ����������� �����, ������� ��� � ���� ����:",
    !"�����", !"����������");
}

DialogCreate:Dlg_RegisterErrorPromo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterErrorPromo, DSM, !"{ff5d11}������", 
        !"{ffffff}������ ��������� �� ����������.\n\n���� �� �� ������ ��� ���� ������,\n������� ������ ������������.",
    !"������", "");
}

DialogCreate:Dlg_RegisterInfo(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterInfo, DSM, !"{89c2d6}"SERVER_NAME"", 
        !"{ffffff}�� ������� ������� � GTA San Andreas Multiplayer (SAMP)?\n\
        �� ������� �������������� ��������� ��� ���.",
    !"�������", !"��� �����");
}

DialogCreate:Dlg_RegisterSex(playerid) {
    return Dialog_Open(playerid, Dialog:Dlg_RegisterSex, DSM, !"{89c2d6}���", 
        !"{ffffff}�������� ��� ������ ���������",
    !"�������", !"�������");
}

// ======================= [ Autorization ] =======================

DialogCreate:Dlg_LoginPlayer(playerid) {
    new dialog[256];
    if (WrongPassword[playerid] != 3) {
        format(dialog, sizeof(dialog), "{ffffff}����� ���������� �� ������ "SERVER_NAME"\n��� ��� ���������������\n\n�����: {54bc1d}%s{ffffff}\n{fa6707}�������� ������! �������� �������: %d", GetPlayer(playerid, pName), WrongPassword[playerid]);
    } else {
        format(dialog, sizeof(dialog), "{ffffff}����� ���������� �� ������ "SERVER_NAME"\n��� ��� ���������������\n\n�����: {54bc1d}%s{ffffff}\n������� ������:", GetPlayer(playerid, pName));
    }
    
    return Dialog_Open(playerid, Dialog:Dlg_LoginPlayer, DSP, !"{89c2d6}�����������", dialog, !"�����", !"������");
}

// ======================== [ Menu player ] =======================
/*
    Автор мода: unkevich
    ВК: https://vk.com/id448735507
    Версия: 0.0.1
*/

main(){}

#include <a_samp>
#include <fix>
#include <a_mysql>
#include <streamer>
#include <Pawn.CMD>
#include <sscanf2>
#include <foreach>
#include <Pawn.Regex>
#include <TOTP>
#include <geolocation>
#include <crashdetect>
#include <mdialog>
#include <ftime>

#define HOST_NAME               "Advance RolePlay | Test Server"
#define SERVER_MODE             "Advance RP Russian"
#define SERVER_NAME             "Advance RolePlay"
#define SERVER_NUMBER           "Test"
#define SERVER_DISPLAY_NAME     "advance-rp.ru"

#define MYSQL_HOST	            "localhost"
#define MYSQL_USER	            "root"
#define MYSQL_PASS	            "root"
#define MYSQL_BASE	            "advance_test"

#define GetPlayer(%0,%1)        PlayerInfo[%0][%1]
#define publics%0(%1)           forward%0(%1); public%0(%1)
#define DialogR:%0()            DialogResponse:%0(playerid, response, listitem, inputtext[])

#define SPD                     ShowPlayerDialog
#define SCM                     SendClientMessage
#define SCMTA                   SendClientMessageToAll

#define DSM                     DIALOG_STYLE_MSGBOX
#define DSL                     DIALOG_STYLE_LIST
#define DSI                     DIALOG_STYLE_INPUT
#define DSP                     DIALOG_STYLE_PASSWORD
#define DSTL                    DIALOG_STYLE_TABLIST
#define DSTLH                   DIALOG_STYLE_TABLIST_HEADERS

#define C_WHITE                 0xFFFFFFFF

new MySQL:dbHandle;

enum PI {
    pID,
    pName[MAX_PLAYER_NAME],
    pPassword[65],
    pSalt[11],
}
new PlayerInfo[MAX_PLAYERS][PI];
new TimerConnectServerPlayer[MAX_PLAYERS];
new WrongPassword[MAX_PLAYERS];

#include "/server/server.pwn"
#include "/server/player.pwn"
#include "/server/vehicle.pwn"
#include "/server/pickup.pwn"

#include "/server/public/server.pwn"
#include "/server/public/player.pwn"

#include "/server/stock/server.pwn"
#include "/server/stock/player.pwn"

#include "/server/dialog/admin.pwn"
#include "/server/dialog/player.pwn"
#include "/server/dialog/server.pwn"
#include "/server/dialog/create.pwn"

#include "/server/command/player.pwn"
#include "/server/command/admin.pwn"


stock ConnectMySQL() {
    dbHandle = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_BASE);
	switch(mysql_errno()) {
	    case 0: print("Успешно подключение к базе данных!");
	    default: printf("Не удалось подключиться к базе данных! Номер ошибки %d", mysql_errno(dbHandle));
	}
	mysql_log(ERROR | WARNING);
	mysql_set_charset("cp1251");
}

stock LoadObjects() {
}

stock LoadTextDraws() {
}
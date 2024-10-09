function Log(name, content){
	local log = file(name, "a+")
	local datas = format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec) + " " + format("%02d:%02d", getTime().hour, getTime().min);
		log.write(format("(%s) %s", datas, content) + "\n");
		log.close();
}
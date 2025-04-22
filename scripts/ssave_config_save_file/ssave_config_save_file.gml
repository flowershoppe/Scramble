function ssave_config_save_file() : SSave("save") constructor 
{
	add_value("losses", SSAVE_TYPE.REAL, 0);
	add_value("wins", SSAVE_TYPE.REAL, 0);
	add_value("attempts", SSAVE_TYPE.REAL, 0);
	add_value("volumeMain", SSAVE_TYPE.REAL, 1);
	add_value("volumeSE", SSAVE_TYPE.REAL, 1);
	add_value("volumeMS", SSAVE_TYPE.REAL, 1);
	add_value("window_width", SSAVE_TYPE.REAL, 960);
	add_value("window_height", SSAVE_TYPE.REAL, 540);	
}
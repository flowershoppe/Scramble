if(oMatchManager.no_vowels and alarm_get(0) <= 0)
{
	exchange_flash = !exchange_flash;
	alarm_set(0, 30);
}
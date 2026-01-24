if(oMatchManager.no_vowels and alarm_get(0) <= 0)
{
	exchange_flash = true;
	alarm_set(0, 30);
}
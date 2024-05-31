var word = get_string("Enter a word:", "");
if (global.dictionary.check(word)) {
	show_message("\"" + word + "\" is a valid English word.");
} else {
	show_message("\"" + word + "\" is not a valid English word.");
}
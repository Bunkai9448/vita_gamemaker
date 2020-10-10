/// OPEN INI FILE FOR LANG

// inside the ini file:     [section] (key) = value

var search = argument0; // text to look for

switch (global.lang){   // what language should the text be
    case 1:  var language = "SPANISH" ; break;
    case 2:  var language = "JAPANESE"; break;    
    default: var language = "ENGLISH" ; 
}

// open an ini file for loading
ini_open('language.ini');

// get text from ini file and store it in a var to use it after, inside the game
var findText  = ini_read_string(language,search,"Text not found"); 

ini_close();

findText = string_replace_all(findText,"*","#");

return findText;



# Release notes for TN Views

## Version 9.5 2025-06-17
- The Installer and the TN-Views-manager.cmd have been updated to only install and update the chosen views.
- The \u02FD, '˽' character is used to represent the \u202F narrow no-break space character in the TNND and the TNDD tag-errors view.
- Common checks C06.1, C06.2 and C06.3 have changed to ignore right single and double punctuation and any intervening characters.
- New common checks C07.1 closing quotation strings. Checks that there is a \u202F between right single and right double quotes.
- New common checks C07.2 closing quotation strings. Checks that there is a \u202F between right double and right single quotes.
- New common checks C07.3 for opening quotation strings. Checks that there is a \u202F between left double and left single quotes.
- New common checks C07.4 for opening quotation strings. Checks that there is a \u202F between left single and left double quotes.
- Check N32 checks the character before it. Allowed characters are: space,  “, ‘,(, \u202F. 
- Check N29.2 modified to check if it has a \u202F character ore ellipsis after it.
- Added C08.1 to C08.13 to check various incorrect use of ellipsis and serial periods that should be ellipsis. Examples found in XXD 108.


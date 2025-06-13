# Release notes for TN Views

## Version 9.5 2025-06-12
- The \u02FD, '˽' character is used to represent the \u202F narrow no-break space character in the TNND and the TNDD tag-errors view.
- Common checks C06.1, C06.2 and C06.3 have changed to ignore right single and double punctuation and any intervening characters.
- New common checks C07.1 closing quotation strings. Checks that there is a \u202F between right single and right double quotes.
- New common checks C07.3 for opening quotation strings. Checks that there is a \u202F between left double and left single quotes.
- Check N32 does not check the space before if it is preceded by a \ros*.
- Check N29.2 modified to check if it has a \u202F character after it.
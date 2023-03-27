Opt("WinTitleMatchMode", 2)
While WinExists( $CmdLine[1] )
	WinActivate( $CmdLine[1] )
	WinClose ( $CmdLine[1] )
	Sleep( 200 )
	while WinExists( 'Save Edits' )
		Send( "{enter}" )
		Sleep( 100 )
	WEnd
WEnd


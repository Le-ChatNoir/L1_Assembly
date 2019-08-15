		DATA
X:		DC.L	$aabbccdd
Y:		DC.B	5
TAB:	DS.B	10
		
		CODE
		MOVE.B	X,D0
		MOVE.L	X,D1
		MOVE.B	Y,D2
BCLE:	ADD.L	#1,D1
		SUB.B	#1,D2
		BNE		BCLE
		RTS
		DATA
X:		DC.L	0
TAB:	DS.L	6
I:		DC.L	0
N:		DC.L	6
		
		CODE
		LEA		TAB,A1
		MOVE.L	X,D0
		MOVE.L	I,D1
		MOVE.L	N,D2
WHILE:	CMP.L	D2,D1
		BGT		FIN
		ADD.L	D1,D0
		MOVE.L	D0,(A1)+
		ADD.L	#1,D1
		BRA		WHILE
FIN:	RTS
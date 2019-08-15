		DATA
TAB:	DS.L	5
char:	DC.L	c
taille:	DC.L	5
		
		CODE
		LEA		TAB,A1
		MOVE.L	taille,D1
		MOVE.B	char,D2
		MOVE.L	#0, D0
		MOVE.L	#1, D3
WHILE:	CMP.L	D1,D3
		BGE		FIN
		CMP.L	(A1)+,D2
		BEQ		FINVAL
		ADD.L	#1,D3
		BRA		WHILE
FIN:	RTS
FINVAL:	MOVE.L	#1,D0
		RTS
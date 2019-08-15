		DATA
TAB:	DS.L	5
nbr:	DC.L	7
taille:	DC.L	5
		
		CODE
		LEA		TAB,A1
		MOVE.L	taille,D1
		MOVE.B	nbr,D2
		MOVE.L	#4,(A1)+
		MOVE.L	#0,(A1)+
		MOVE.L	#5,(A1)+
		MOVE.L	#7,(A1)+
		MOVE.L	#0,D0
		MOVE.L	#1,D3
WHILE:	CMP.L	D1,D3
		BGE		FIN
		CMP.L	(A1)+,D2
		BEQ		FINVAL
		ADD.L	#1,D3
		BRA		WHILE
FIN:	RTS
FINVAL:	MOVE.L	#1,D0
		RTS
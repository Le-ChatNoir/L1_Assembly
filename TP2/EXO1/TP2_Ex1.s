		DATA
TAB:	DS.L	5
		
		CODE
;Initialiser
		LEA		TAB,A0
		MOVE.L	A0,A1
		MOVE.L	#7,(A1)+
		MOVE.L	#9,(A1)+
		MOVE.L	#2,(A1)+
		MOVE.L	#8,(A1)+
		MOVE.L	#1,D0
		MOVE.L	A1,A0

;Empiler

		MOVE.L	#0,D0
		MOVE.L	#5,D1
FOR:	CMP.L	D0,D1
		BGE		NEXT
		MOVE.L	A0,-(A7)
		ADD.L	#4,A0
		ADD.L	#1,D0
		BRA		FOR
		MOVE.L	A1,A0

;Depiler

NEXT:	MOVE.L	#0,D0
FOR2:	CMP.L	D0,D2
		BGE		FIN
		MOVE.L	(A7)+,(A0)
		ADD.L	#4,A0
		ADD.L	#1,D0
		BRA		FOR2
FIN:	RTS
		DATA
X:		DC.L	3

		CODE
		MOVE.L	X,D0
		CMP.L	#1,D0
		BLE		FIN
		CMP.L	#4,D0
		BGE		FIN
		MOVE.L	#4,D1
FIN:	RTS
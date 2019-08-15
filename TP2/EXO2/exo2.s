		DATA
CH1:	DC.B	"CHIEN"
CH2:	DC.B	"CHAT"
		CODE
		
		LEA 	CH1,A0
		LEA 	CH2,A1
		MOVE.L	#0,D0
		MOVE.L	#0,D1
		
		
		
CHERCH:	MOVE.L	A0,-(A7)		;Question D
		MOVE.L	A1,-(A7)
		MOVE.L	8(A7),A0
		MOVE.L	4(A7),A1
		MOVE.L	A0,-(A7)
		MOVE.L	#0,D0
		JSR		LONGUE
		ADD.L	#4,A7
		MOVE.L	D0,D1
		MOVE.L	A1,-(A7)
		JSR		LONGUE
		ADD.L	#4,A7
		MOVE.L	D0,D2
		MOVE.L	8(A7),A0
		MOVE.L	4(A7),A1
WHILE3:	CMP.B	#0,(A1)
		BEQ		END
		MOVE.B	(A0),D4
		MOVE.B	(A1)+,D5
		CMP.B	D4,D5
		BNE		WHILE3
		ADD.L	#1,A0
		ADD.L	#1,D3
WHILE4:	CMP.B	#0,(A1)
		BEQ		END
		CMP.B	D1,D3
		BEQ		GOODEND
		MOVE.B	(A0)+,D4
		MOVE.B	(A1)+,D5
		CMP.B	D4,D5
		BNE		END
		ADD.L	#1,D3
		BRA		WHILE4
GOODEND:MOVE.L	#2,D7
		BRA		END
		ADD.L	#4,A7
		ADD.L	#4,A7
		BRA		END		

		

		
CONCAT:	MOVE.L	8(A7),A0
		MOVE.L	4(A7),A1
		MOVE.L	A0,-(A7)
		JSR		LONGUE
		MOVE.L	(A7),A0
		ADD.L	#4,A7
		
		ADD.L	D0,A1
		MOVE.L	A0,-(A7)
		MOVE.L	A1,-(A7)
		JSR		COPIE
		ADD.L	#4,A7
		MOVE.L	(A7),A0
		ADD.L	#4,A7
		BRA		END
		
COPIE:	MOVE.L	8(A7),A0	;Question B
		MOVE.L	4(A7),A1
		MOVE.L	A0,-(A7)
		JSR 	LONGUE
		MOVE.L	D0,D1
		ADD.L	#4,A7
		MOVE.L	A1,-(A7)
		JSR		LONGUE
		MOVE.L	D0,D2
		ADD.L	#4,A7
		CMP.L	D1,D2
		BLE		END
WHILE2:	CMP.B	#0,(A0)
		BEQ		END
		MOVE.B	(A0)+,(A1)+
		ADD.L	#1,D0
		BRA		WHILE2
				
				
				
LONGUE:	MOVE.L	4(A7),A0	;Question A
		MOVE.L	#0,D0	
WHILE:	CMP.B	#0,(A0)+
		BEQ		END
		ADD.L	#1,D0
		BRA		WHILE
		
		
		
END:	RTS

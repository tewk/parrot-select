typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
#define	CALL	257
#define	GOTO	258
#define	ARG	259
#define	RET	260
#define	PRINT	261
#define	IF	262
#define	UNLESS	263
#define	NEW	264
#define	END	265
#define	SAVEALL	266
#define	RESTOREALL	267
#define	SUB	268
#define	NAMESPACE	269
#define	CLASS	270
#define	ENDCLASS	271
#define	SYM	272
#define	LOCAL	273
#define	PARAM	274
#define	PUSH	275
#define	POP	276
#define	INC	277
#define	DEC	278
#define	SHIFT_LEFT	279
#define	SHIFT_RIGHT	280
#define	INTV	281
#define	FLOATV	282
#define	STRINGV	283
#define	DEFINED	284
#define	LOG_XOR	285
#define	RELOP_EQ	286
#define	RELOP_NE	287
#define	RELOP_GT	288
#define	RELOP_GTE	289
#define	RELOP_LT	290
#define	RELOP_LTE	291
#define	GLOBAL	292
#define	ADDR	293
#define	CLONE	294
#define	RESULT	295
#define	RETURN	296
#define	POW	297
#define	COMMA	298
#define	LABEL	299
#define	EMIT	300
#define	EOM	301
#define	IREG	302
#define	NREG	303
#define	SREG	304
#define	PREG	305
#define	IDENTIFIER	306
#define	STRINGC	307
#define	INTC	308
#define	FLOATC	309
#define	REG	310
#define	MACRO	311
#define	PARROT_OP	312
#define	VAR	313


extern YYSTYPE yylval;

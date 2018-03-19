## 查看汇编代码

```
➜  defer-exec-and-update-return-value-before-return git:(master) ✗ go tool objdump -s "main\.test" example
TEXT main.test(SB) /Users/anderson/Code/lang-experiments/golang/defer-exec-and-update-return-value-before-return/example.go
  example.go:3		0x104c310		65488b0c25a0080000	MOVQ GS:0x8a0, CX			
  example.go:3		0x104c319		483b6110		CMPQ 0x10(CX), SP			
  example.go:3		0x104c31d		7668			JBE 0x104c387				
  example.go:3		0x104c31f		4883ec20		SUBQ $0x20, SP				
  example.go:3		0x104c323		48896c2418		MOVQ BP, 0x18(SP)			
  example.go:3		0x104c328		488d6c2418		LEAQ 0x18(SP), BP			
  example.go:3		0x104c32d		48c744242800000000	MOVQ $0x0, 0x28(SP)			
  example.go:7		0x104c336		488d442428		LEAQ 0x28(SP), AX			
  example.go:7		0x104c33b		4889442410		MOVQ AX, 0x10(SP)			
  example.go:4		0x104c340		c7042408000000		MOVL $0x8, 0(SP)			
  example.go:4		0x104c347		488d05ea050200		LEAQ go.func.*+70(SB), AX		
  example.go:4		0x104c34e		4889442408		MOVQ AX, 0x8(SP)			
  example.go:4		0x104c353		e80840fdff		CALL runtime.deferproc(SB)		
  example.go:4		0x104c358		85c0			TESTL AX, AX				
  example.go:4		0x104c35a		751b			JNE 0x104c377				
  example.go:4		0x104c35c		eb00			JMP 0x104c35e				
  example.go:10		0x104c35e		48c744242864000000	MOVQ $0x64, 0x28(SP)			
  example.go:10		0x104c367		90			NOPL					
  example.go:10		0x104c368		e8d348fdff		CALL runtime.deferreturn(SB)		
  example.go:10		0x104c36d		488b6c2418		MOVQ 0x18(SP), BP			
  example.go:10		0x104c372		4883c420		ADDQ $0x20, SP				
  example.go:10		0x104c376		c3			RET					
  example.go:4		0x104c377		90			NOPL					
  example.go:4		0x104c378		e8c348fdff		CALL runtime.deferreturn(SB)		
  example.go:4		0x104c37d		488b6c2418		MOVQ 0x18(SP), BP			
  example.go:4		0x104c382		4883c420		ADDQ $0x20, SP				
  example.go:4		0x104c386		c3			RET					
  example.go:3		0x104c387		e8b486ffff		CALL runtime.morestack_noctxt(SB)	
  example.go:3		0x104c38c		eb82			JMP main.test(SB)			
  :-1			0x104c38e		cc			INT $0x3				
  :-1			0x104c38f		cc			INT $0x3				

TEXT main.test.func1(SB) /Users/anderson/Code/lang-experiments/golang/defer-exec-and-update-return-value-before-return/example.go
  example.go:4		0x104c410		65488b0c25a0080000	MOVQ GS:0x8a0, CX			
  example.go:4		0x104c419		483b6110		CMPQ 0x10(CX), SP			
  example.go:4		0x104c41d		7674			JBE 0x104c493				
  example.go:4		0x104c41f		4883ec28		SUBQ $0x28, SP				
  example.go:4		0x104c423		48896c2420		MOVQ BP, 0x20(SP)			
  example.go:4		0x104c428		488d6c2420		LEAQ 0x20(SP), BP			
  example.go:5		0x104c42d		488b442430		MOVQ 0x30(SP), AX			
  example.go:5		0x104c432		488b00			MOVQ 0(AX), AX				
  example.go:5		0x104c435		4889442410		MOVQ AX, 0x10(SP)			
  example.go:5		0x104c43a		e8015dfdff		CALL runtime.printlock(SB)		
  example.go:5		0x104c43f		488d0544c60100		LEAQ go.string.*+954(SB), AX		
  example.go:5		0x104c446		48890424		MOVQ AX, 0(SP)				
  example.go:5		0x104c44a		48c744240808000000	MOVQ $0x8, 0x8(SP)			
  example.go:5		0x104c453		e82866fdff		CALL runtime.printstring(SB)		
  example.go:5		0x104c458		488b442410		MOVQ 0x10(SP), AX			
  example.go:5		0x104c45d		48890424		MOVQ AX, 0(SP)				
  example.go:5		0x104c461		e85a64fdff		CALL runtime.printint(SB)		
  example.go:5		0x104c466		e8655ffdff		CALL runtime.printnl(SB)		
  example.go:5		0x104c46b		e8505dfdff		CALL runtime.printunlock(SB)		
  example.go:6		0x104c470		488b442430		MOVQ 0x30(SP), AX			
  example.go:6		0x104c475		488b00			MOVQ 0(AX), AX				
  example.go:6		0x104c478		4889442418		MOVQ AX, 0x18(SP)			
  example.go:6		0x104c47d		488b4c2430		MOVQ 0x30(SP), CX			
  example.go:6		0x104c482		4883c064		ADDQ $0x64, AX				
  example.go:6		0x104c486		488901			MOVQ AX, 0(CX)				
  example.go:7		0x104c489		488b6c2420		MOVQ 0x20(SP), BP			
  example.go:7		0x104c48e		4883c428		ADDQ $0x28, SP				
  example.go:7		0x104c492		c3			RET					
  example.go:4		0x104c493		e8a885ffff		CALL runtime.morestack_noctxt(SB)	
  example.go:4		0x104c498		e973ffffff		JMP main.test.func1(SB)			
  :-1			0x104c49d		cc			INT $0x3				
  :-1			0x104c49e		cc			INT $0x3				
  :-1			0x104c49f		cc			INT $0x3

```
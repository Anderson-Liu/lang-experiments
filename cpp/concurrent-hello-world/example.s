	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	__Z5hellov
	.p2align	4, 0x90
__Z5hellov:                             ## @_Z5hellov
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	%rax, -8(%rbp)          ## 8-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.weak_definition	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.p2align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE6lengthEPKc
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## BB#0:
	pushq	%rbp
Lcfi6:
	.cfi_def_cfa_offset 16
Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	leaq	__Z5hellov(%rip), %rsi
	leaq	-8(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__16threadC1IPFvvEEET_
Ltmp0:
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__16thread4joinEv
Ltmp1:
	jmp	LBB2_1
LBB2_1:
	leaq	-8(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
LBB2_2:
Ltmp2:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
Ltmp3:
	leaq	-8(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
Ltmp4:
	jmp	LBB2_3
LBB2_3:
	jmp	LBB2_4
LBB2_4:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
LBB2_5:
Ltmp5:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	73                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset0 = Lfunc_begin0-Lfunc_begin0       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp0-Lfunc_begin0              ##   Call between Lfunc_begin0 and Ltmp0
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp0-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp1-Ltmp0                     ##   Call between Ltmp0 and Ltmp1
	.long	Lset3
Lset4 = Ltmp2-Lfunc_begin0              ##     jumps to Ltmp2
	.long	Lset4
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp1-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp3-Ltmp1                     ##   Call between Ltmp1 and Ltmp3
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset7 = Ltmp3-Lfunc_begin0              ## >> Call Site 4 <<
	.long	Lset7
Lset8 = Ltmp4-Ltmp3                     ##   Call between Ltmp3 and Ltmp4
	.long	Lset8
Lset9 = Ltmp5-Lfunc_begin0              ##     jumps to Ltmp5
	.long	Lset9
	.byte	1                       ##   On action: 1
Lset10 = Ltmp4-Lfunc_begin0             ## >> Call Site 5 <<
	.long	Lset10
Lset11 = Lfunc_end0-Ltmp4               ##   Call between Ltmp4 and Lfunc_end0
	.long	Lset11
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16threadC1IPFvvEEET_
	.weak_def_can_be_hidden	__ZNSt3__16threadC1IPFvvEEET_
	.p2align	4, 0x90
__ZNSt3__16threadC1IPFvvEEET_:          ## @_ZNSt3__16threadC1IPFvvEEET_
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi9:
	.cfi_def_cfa_offset 16
Lcfi10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi11:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__16threadC2IPFvvEEET_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	___clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## BB#0:
	pushq	%rax
	callq	___cxa_begin_catch
	movq	%rax, (%rsp)            ## 8-byte Spill
	callq	__ZSt9terminatev

	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_definition	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## BB#0:
	pushq	%rbp
Lcfi12:
	.cfi_def_cfa_offset 16
Lcfi13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi14:
	.cfi_def_cfa_register %rbp
	subq	$416, %rsp              ## imm = 0x1A0
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-200(%rbp), %rsi
Ltmp6:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp7:
	jmp	LBB5_1
LBB5_1:
	leaq	-232(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -265(%rbp)         ## 1-byte Spill
## BB#2:
	movb	-265(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB5_3
	jmp	LBB5_26
LBB5_3:
	leaq	-256(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	%rax, -176(%rbp)
	movq	%rcx, -184(%rbp)
	movq	-176(%rbp), %rax
	movq	-184(%rbp), %rcx
	movq	%rax, -144(%rbp)
	movq	%rcx, -152(%rbp)
	movq	-144(%rbp), %rax
	movq	-152(%rbp), %rcx
	movq	(%rcx), %rdx
	movq	-24(%rdx), %rdx
	addq	%rdx, %rcx
	movq	%rcx, -136(%rbp)
	movq	-136(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-128(%rbp), %rcx
	movq	40(%rcx), %rcx
	movq	%rcx, (%rax)
	movq	-208(%rbp), %rsi
	movq	-200(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	8(%rax), %edi
	movq	%rsi, -280(%rbp)        ## 8-byte Spill
	movl	%edi, -284(%rbp)        ## 4-byte Spill
## BB#4:
	movl	-284(%rbp), %eax        ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %eax
	jne	LBB5_6
## BB#5:
	movq	-208(%rbp), %rax
	addq	-216(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	jmp	LBB5_7
LBB5_6:
	movq	-208(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
LBB5_7:
	movq	-296(%rbp), %rax        ## 8-byte Reload
	movq	-208(%rbp), %rcx
	addq	-216(%rbp), %rcx
	movq	-200(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
	movq	-200(%rbp), %rsi
	movq	(%rsi), %rdi
	movq	-24(%rdi), %rdi
	addq	%rdi, %rsi
	movq	%rsi, -72(%rbp)
	movq	-72(%rbp), %rsi
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	movq	%rcx, -312(%rbp)        ## 8-byte Spill
	movq	%rdx, -320(%rbp)        ## 8-byte Spill
	movq	%rsi, -328(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movq	-328(%rbp), %rcx        ## 8-byte Reload
	movl	144(%rcx), %esi
	movl	%eax, %edi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB5_8
	jmp	LBB5_16
LBB5_8:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
	movb	$32, -33(%rbp)
	movq	-32(%rbp), %rsi
Ltmp8:
	leaq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp9:
	jmp	LBB5_9
LBB5_9:
	leaq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
Ltmp10:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp11:
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB5_10
LBB5_10:
	movb	-33(%rbp), %al
	movq	-336(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	56(%rsi), %rsi
	movsbl	-9(%rbp), %edi
Ltmp12:
	movl	%edi, -340(%rbp)        ## 4-byte Spill
	movq	%rdx, %rdi
	movl	-340(%rbp), %r8d        ## 4-byte Reload
	movq	%rsi, -352(%rbp)        ## 8-byte Spill
	movl	%r8d, %esi
	movq	-352(%rbp), %rdx        ## 8-byte Reload
	callq	*%rdx
Ltmp13:
	movb	%al, -353(%rbp)         ## 1-byte Spill
	jmp	LBB5_14
LBB5_11:
Ltmp14:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp15:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp16:
	jmp	LBB5_12
LBB5_12:
	movq	-56(%rbp), %rax
	movl	-60(%rbp), %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB5_24
LBB5_13:
Ltmp17:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -376(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB5_14:
Ltmp18:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp19:
	jmp	LBB5_15
LBB5_15:
	movb	-353(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %ecx
	movq	-328(%rbp), %rdx        ## 8-byte Reload
	movl	%ecx, 144(%rdx)
LBB5_16:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movl	144(%rax), %ecx
	movb	%cl, %dl
	movb	%dl, -377(%rbp)         ## 1-byte Spill
## BB#17:
	movq	-256(%rbp), %rdi
Ltmp20:
	movb	-377(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-280(%rbp), %rsi        ## 8-byte Reload
	movq	-304(%rbp), %rdx        ## 8-byte Reload
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movq	-320(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp21:
	movq	%rax, -392(%rbp)        ## 8-byte Spill
	jmp	LBB5_18
LBB5_18:
	leaq	-264(%rbp), %rax
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -264(%rbp)
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB5_25
## BB#19:
	movq	-200(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, -112(%rbp)
	movl	$5, -116(%rbp)
	movq	-112(%rbp), %rax
	movl	-116(%rbp), %edx
	movq	%rax, -96(%rbp)
	movl	%edx, -100(%rbp)
	movq	-96(%rbp), %rax
	movl	32(%rax), %edx
	movl	-100(%rbp), %esi
	orl	%esi, %edx
Ltmp22:
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZNSt3__18ios_base5clearEj
Ltmp23:
	jmp	LBB5_20
LBB5_20:
	jmp	LBB5_21
LBB5_21:
	jmp	LBB5_25
LBB5_22:
Ltmp29:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
	jmp	LBB5_29
LBB5_23:
Ltmp24:
	movl	%edx, %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB5_24
LBB5_24:
	movl	-372(%rbp), %eax        ## 4-byte Reload
	movq	-368(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -240(%rbp)
	movl	%eax, -244(%rbp)
Ltmp25:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp26:
	jmp	LBB5_28
LBB5_25:
	jmp	LBB5_26
LBB5_26:
Ltmp27:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp28:
	jmp	LBB5_27
LBB5_27:
	jmp	LBB5_31
LBB5_28:
	jmp	LBB5_29
LBB5_29:
	movq	-240(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-200(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp30:
	movq	%rax, -400(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp31:
	jmp	LBB5_30
LBB5_30:
	callq	___cxa_end_catch
LBB5_31:
	movq	-200(%rbp), %rax
	addq	$416, %rsp              ## imm = 0x1A0
	popq	%rbp
	retq
LBB5_32:
Ltmp32:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
Ltmp33:
	callq	___cxa_end_catch
Ltmp34:
	jmp	LBB5_33
LBB5_33:
	jmp	LBB5_34
LBB5_34:
	movq	-240(%rbp), %rdi
	callq	__Unwind_Resume
LBB5_35:
Ltmp35:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -404(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\253\201"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\234\001"              ## Call site table length
Lset12 = Ltmp6-Lfunc_begin1             ## >> Call Site 1 <<
	.long	Lset12
Lset13 = Ltmp7-Ltmp6                    ##   Call between Ltmp6 and Ltmp7
	.long	Lset13
Lset14 = Ltmp29-Lfunc_begin1            ##     jumps to Ltmp29
	.long	Lset14
	.byte	5                       ##   On action: 3
Lset15 = Ltmp8-Lfunc_begin1             ## >> Call Site 2 <<
	.long	Lset15
Lset16 = Ltmp9-Ltmp8                    ##   Call between Ltmp8 and Ltmp9
	.long	Lset16
Lset17 = Ltmp24-Lfunc_begin1            ##     jumps to Ltmp24
	.long	Lset17
	.byte	5                       ##   On action: 3
Lset18 = Ltmp10-Lfunc_begin1            ## >> Call Site 3 <<
	.long	Lset18
Lset19 = Ltmp13-Ltmp10                  ##   Call between Ltmp10 and Ltmp13
	.long	Lset19
Lset20 = Ltmp14-Lfunc_begin1            ##     jumps to Ltmp14
	.long	Lset20
	.byte	3                       ##   On action: 2
Lset21 = Ltmp15-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset21
Lset22 = Ltmp16-Ltmp15                  ##   Call between Ltmp15 and Ltmp16
	.long	Lset22
Lset23 = Ltmp17-Lfunc_begin1            ##     jumps to Ltmp17
	.long	Lset23
	.byte	7                       ##   On action: 4
Lset24 = Ltmp18-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset24
Lset25 = Ltmp23-Ltmp18                  ##   Call between Ltmp18 and Ltmp23
	.long	Lset25
Lset26 = Ltmp24-Lfunc_begin1            ##     jumps to Ltmp24
	.long	Lset26
	.byte	5                       ##   On action: 3
Lset27 = Ltmp25-Lfunc_begin1            ## >> Call Site 6 <<
	.long	Lset27
Lset28 = Ltmp26-Ltmp25                  ##   Call between Ltmp25 and Ltmp26
	.long	Lset28
Lset29 = Ltmp35-Lfunc_begin1            ##     jumps to Ltmp35
	.long	Lset29
	.byte	5                       ##   On action: 3
Lset30 = Ltmp27-Lfunc_begin1            ## >> Call Site 7 <<
	.long	Lset30
Lset31 = Ltmp28-Ltmp27                  ##   Call between Ltmp27 and Ltmp28
	.long	Lset31
Lset32 = Ltmp29-Lfunc_begin1            ##     jumps to Ltmp29
	.long	Lset32
	.byte	5                       ##   On action: 3
Lset33 = Ltmp28-Lfunc_begin1            ## >> Call Site 8 <<
	.long	Lset33
Lset34 = Ltmp30-Ltmp28                  ##   Call between Ltmp28 and Ltmp30
	.long	Lset34
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset35 = Ltmp30-Lfunc_begin1            ## >> Call Site 9 <<
	.long	Lset35
Lset36 = Ltmp31-Ltmp30                  ##   Call between Ltmp30 and Ltmp31
	.long	Lset36
Lset37 = Ltmp32-Lfunc_begin1            ##     jumps to Ltmp32
	.long	Lset37
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp31-Lfunc_begin1            ## >> Call Site 10 <<
	.long	Lset38
Lset39 = Ltmp33-Ltmp31                  ##   Call between Ltmp31 and Ltmp33
	.long	Lset39
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset40 = Ltmp33-Lfunc_begin1            ## >> Call Site 11 <<
	.long	Lset40
Lset41 = Ltmp34-Ltmp33                  ##   Call between Ltmp33 and Ltmp34
	.long	Lset41
Lset42 = Ltmp35-Lfunc_begin1            ##     jumps to Ltmp35
	.long	Lset42
	.byte	5                       ##   On action: 3
Lset43 = Ltmp34-Lfunc_begin1            ## >> Call Site 12 <<
	.long	Lset43
Lset44 = Lfunc_end1-Ltmp34              ##   Call between Ltmp34 and Lfunc_end1
	.long	Lset44
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 1
	.byte	125                     ##   Continue to action 1
	.byte	1                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 4 <<
                                        ##   Catch TypeInfo 1
	.byte	125                     ##   Continue to action 3
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__111char_traitsIcE6lengthEPKc
	.weak_definition	__ZNSt3__111char_traitsIcE6lengthEPKc
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE6lengthEPKc:  ## @_ZNSt3__111char_traitsIcE6lengthEPKc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi15:
	.cfi_def_cfa_offset 16
Lcfi16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi17:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_definition	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## BB#0:
	pushq	%rbp
Lcfi18:
	.cfi_def_cfa_offset 16
Lcfi19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi20:
	.cfi_def_cfa_register %rbp
	subq	$720, %rsp              ## imm = 0x2D0
	movb	%r9b, %al
	leaq	-552(%rbp), %r10
	leaq	-488(%rbp), %r11
	movq	%rdi, -504(%rbp)
	movq	%rsi, -512(%rbp)
	movq	%rdx, -520(%rbp)
	movq	%rcx, -528(%rbp)
	movq	%r8, -536(%rbp)
	movb	%al, -537(%rbp)
	movq	-504(%rbp), %rcx
	movq	%r11, -472(%rbp)
	movq	$-1, -480(%rbp)
	movq	-472(%rbp), %rdx
	movq	-480(%rbp), %rsi
	movq	%rdx, -456(%rbp)
	movq	%rsi, -464(%rbp)
	movq	-456(%rbp), %rdx
	movq	$0, (%rdx)
	movq	-488(%rbp), %rdx
	movq	%rdx, -552(%rbp)
	movq	%r10, -448(%rbp)
	cmpq	$0, %rcx
	jne	LBB7_2
## BB#1:
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_2:
	movq	-528(%rbp), %rax
	movq	-512(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -560(%rbp)
	movq	-536(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -568(%rbp)
	movq	-568(%rbp), %rax
	cmpq	-560(%rbp), %rax
	jle	LBB7_4
## BB#3:
	movq	-560(%rbp), %rax
	movq	-568(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -568(%rbp)
	jmp	LBB7_5
LBB7_4:
	movq	$0, -568(%rbp)
LBB7_5:
	movq	-520(%rbp), %rax
	movq	-512(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB7_9
## BB#6:
	movq	-504(%rbp), %rax
	movq	-512(%rbp), %rcx
	movq	-576(%rbp), %rdx
	movq	%rax, -248(%rbp)
	movq	%rcx, -256(%rbp)
	movq	%rdx, -264(%rbp)
	movq	-248(%rbp), %rax
	movq	(%rax), %rcx
	movq	96(%rcx), %rcx
	movq	-256(%rbp), %rsi
	movq	-264(%rbp), %rdx
	movq	%rax, %rdi
	callq	*%rcx
	cmpq	-576(%rbp), %rax
	je	LBB7_8
## BB#7:
	leaq	-584(%rbp), %rax
	leaq	-240(%rbp), %rcx
	movq	%rcx, -224(%rbp)
	movq	$-1, -232(%rbp)
	movq	-224(%rbp), %rcx
	movq	-232(%rbp), %rdx
	movq	%rcx, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-208(%rbp), %rcx
	movq	$0, (%rcx)
	movq	-240(%rbp), %rcx
	movq	%rcx, -584(%rbp)
	movq	%rax, -8(%rbp)
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_8:
	jmp	LBB7_9
LBB7_9:
	cmpq	$0, -568(%rbp)
	jle	LBB7_24
## BB#10:
	xorl	%esi, %esi
	movl	$24, %eax
	movl	%eax, %edx
	leaq	-608(%rbp), %rcx
	movq	-568(%rbp), %rdi
	movb	-537(%rbp), %r8b
	movq	%rcx, -72(%rbp)
	movq	%rdi, -80(%rbp)
	movb	%r8b, -81(%rbp)
	movq	-72(%rbp), %rcx
	movq	-80(%rbp), %rdi
	movb	-81(%rbp), %r8b
	movq	%rcx, -48(%rbp)
	movq	%rdi, -56(%rbp)
	movb	%r8b, -57(%rbp)
	movq	-48(%rbp), %rcx
	movq	%rcx, -40(%rbp)
	movq	-40(%rbp), %rdi
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	%rdi, %r9
	movq	%r9, -16(%rbp)
	movq	%rcx, -656(%rbp)        ## 8-byte Spill
	callq	_memset
	movq	-56(%rbp), %rsi
	movq	-656(%rbp), %rdi        ## 8-byte Reload
	movsbl	-57(%rbp), %edx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	leaq	-608(%rbp), %rcx
	movq	-504(%rbp), %rsi
	movq	%rcx, -200(%rbp)
	movq	-200(%rbp), %rcx
	movq	%rcx, -192(%rbp)
	movq	-192(%rbp), %rcx
	movq	%rcx, -184(%rbp)
	movq	-184(%rbp), %rdi
	movq	%rdi, -176(%rbp)
	movq	-176(%rbp), %rdi
	movq	%rdi, -168(%rbp)
	movq	-168(%rbp), %rdi
	movzbl	(%rdi), %eax
	andl	$1, %eax
	cmpl	$0, %eax
	movq	%rsi, -664(%rbp)        ## 8-byte Spill
	movq	%rcx, -672(%rbp)        ## 8-byte Spill
	je	LBB7_12
## BB#11:
	movq	-672(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rcx
	movq	%rcx, -112(%rbp)
	movq	-112(%rbp), %rcx
	movq	%rcx, -104(%rbp)
	movq	-104(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	%rcx, -680(%rbp)        ## 8-byte Spill
	jmp	LBB7_13
LBB7_12:
	movq	-672(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rcx
	movq	%rcx, -152(%rbp)
	movq	-152(%rbp), %rcx
	movq	%rcx, -144(%rbp)
	movq	-144(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -136(%rbp)
	movq	-136(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-128(%rbp), %rcx
	movq	%rcx, -680(%rbp)        ## 8-byte Spill
LBB7_13:
	movq	-680(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	-568(%rbp), %rcx
	movq	-664(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -272(%rbp)
	movq	%rax, -280(%rbp)
	movq	%rcx, -288(%rbp)
	movq	-272(%rbp), %rax
	movq	(%rax), %rcx
	movq	96(%rcx), %rcx
	movq	-280(%rbp), %rsi
	movq	-288(%rbp), %rdx
Ltmp36:
	movq	%rax, %rdi
	callq	*%rcx
Ltmp37:
	movq	%rax, -688(%rbp)        ## 8-byte Spill
	jmp	LBB7_14
LBB7_14:
	jmp	LBB7_15
LBB7_15:
	movq	-688(%rbp), %rax        ## 8-byte Reload
	cmpq	-568(%rbp), %rax
	je	LBB7_20
## BB#16:
	leaq	-328(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	$-1, -320(%rbp)
	movq	-312(%rbp), %rax
	movq	-320(%rbp), %rcx
	movq	%rax, -296(%rbp)
	movq	%rcx, -304(%rbp)
	movq	-296(%rbp), %rax
	movq	$0, (%rax)
	movq	-328(%rbp), %rax
	movq	%rax, -696(%rbp)        ## 8-byte Spill
## BB#17:
	leaq	-632(%rbp), %rax
	movq	-696(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -632(%rbp)
	movq	%rax, -336(%rbp)
## BB#18:
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	movl	$1, -636(%rbp)
	jmp	LBB7_21
LBB7_19:
Ltmp38:
	movl	%edx, %ecx
	movq	%rax, -616(%rbp)
	movl	%ecx, -620(%rbp)
Ltmp39:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp40:
	jmp	LBB7_23
LBB7_20:
	movl	$0, -636(%rbp)
LBB7_21:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-636(%rbp), %eax
	testl	%eax, %eax
	movl	%eax, -700(%rbp)        ## 4-byte Spill
	je	LBB7_22
	jmp	LBB7_33
LBB7_33:
	movl	-700(%rbp), %eax        ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -704(%rbp)        ## 4-byte Spill
	je	LBB7_29
	jmp	LBB7_32
LBB7_22:
	jmp	LBB7_24
LBB7_23:
	jmp	LBB7_30
LBB7_24:
	movq	-528(%rbp), %rax
	movq	-520(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB7_28
## BB#25:
	movq	-504(%rbp), %rax
	movq	-520(%rbp), %rcx
	movq	-576(%rbp), %rdx
	movq	%rax, -352(%rbp)
	movq	%rcx, -360(%rbp)
	movq	%rdx, -368(%rbp)
	movq	-352(%rbp), %rax
	movq	(%rax), %rcx
	movq	96(%rcx), %rcx
	movq	-360(%rbp), %rsi
	movq	-368(%rbp), %rdx
	movq	%rax, %rdi
	callq	*%rcx
	cmpq	-576(%rbp), %rax
	je	LBB7_27
## BB#26:
	leaq	-648(%rbp), %rax
	leaq	-408(%rbp), %rcx
	movq	%rcx, -392(%rbp)
	movq	$-1, -400(%rbp)
	movq	-392(%rbp), %rcx
	movq	-400(%rbp), %rdx
	movq	%rcx, -376(%rbp)
	movq	%rdx, -384(%rbp)
	movq	-376(%rbp), %rcx
	movq	$0, (%rcx)
	movq	-408(%rbp), %rcx
	movq	%rcx, -648(%rbp)
	movq	%rax, -416(%rbp)
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_27:
	jmp	LBB7_28
LBB7_28:
	movq	-536(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	$0, -432(%rbp)
	movq	-424(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, -440(%rbp)
	movq	-432(%rbp), %rcx
	movq	%rcx, 24(%rax)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
LBB7_29:
	movq	-496(%rbp), %rax
	addq	$720, %rsp              ## imm = 0x2D0
	popq	%rbp
	retq
LBB7_30:
	movq	-616(%rbp), %rdi
	callq	__Unwind_Resume
LBB7_31:
Ltmp41:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -708(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB7_32:
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\274"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset45 = Lfunc_begin2-Lfunc_begin2      ## >> Call Site 1 <<
	.long	Lset45
Lset46 = Ltmp36-Lfunc_begin2            ##   Call between Lfunc_begin2 and Ltmp36
	.long	Lset46
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset47 = Ltmp36-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset47
Lset48 = Ltmp37-Ltmp36                  ##   Call between Ltmp36 and Ltmp37
	.long	Lset48
Lset49 = Ltmp38-Lfunc_begin2            ##     jumps to Ltmp38
	.long	Lset49
	.byte	0                       ##   On action: cleanup
Lset50 = Ltmp39-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset50
Lset51 = Ltmp40-Ltmp39                  ##   Call between Ltmp39 and Ltmp40
	.long	Lset51
Lset52 = Ltmp41-Lfunc_begin2            ##     jumps to Ltmp41
	.long	Lset52
	.byte	1                       ##   On action: 1
Lset53 = Ltmp40-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset53
Lset54 = Lfunc_end2-Ltmp40              ##   Call between Ltmp40 and Lfunc_end2
	.long	Lset54
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.weak_definition	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE11eq_int_typeEii: ## @_ZNSt3__111char_traitsIcE11eq_int_typeEii
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi21:
	.cfi_def_cfa_offset 16
Lcfi22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi23:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	cmpl	-8(%rbp), %esi
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__111char_traitsIcE3eofEv
	.weak_definition	__ZNSt3__111char_traitsIcE3eofEv
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE3eofEv:       ## @_ZNSt3__111char_traitsIcE3eofEv
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi24:
	.cfi_def_cfa_offset 16
Lcfi25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi26:
	.cfi_def_cfa_register %rbp
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__16threadC2IPFvvEEET_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IPFvvEEET_
	.p2align	4, 0x90
__ZNSt3__16threadC2IPFvvEEET_:          ## @_ZNSt3__16threadC2IPFvvEEET_
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## BB#0:
	pushq	%rbp
Lcfi27:
	.cfi_def_cfa_offset 16
Lcfi28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi29:
	.cfi_def_cfa_register %rbp
	subq	$576, %rsp              ## imm = 0x240
	movq	%rdi, -472(%rbp)
	movq	%rsi, -480(%rbp)
	movq	-472(%rbp), %rsi
	movl	$16, %eax
	movl	%eax, %edi
	movq	%rsi, -512(%rbp)        ## 8-byte Spill
	callq	__Znwm
	movq	%rax, %rsi
	movq	%rax, %rdi
Ltmp42:
	leaq	-480(%rbp), %rcx
	movq	%rdi, -520(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -528(%rbp)        ## 8-byte Spill
	movq	%rcx, %rsi
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEEC1ERS2_
Ltmp43:
	jmp	LBB10_1
LBB10_1:
	leaq	-488(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	-520(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -464(%rbp)
	movq	-456(%rbp), %rdx
	movq	-464(%rbp), %rsi
	movq	%rdx, -424(%rbp)
	movq	%rsi, -432(%rbp)
	movq	-424(%rbp), %rdx
	leaq	-432(%rbp), %rsi
	movq	%rsi, -416(%rbp)
	movq	-416(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	%rdx, -400(%rbp)
	movq	%rsi, -408(%rbp)
	movq	-400(%rbp), %rdx
	movq	-408(%rbp), %rsi
	movq	%rdx, -384(%rbp)
	movq	%rsi, -392(%rbp)
	movq	-384(%rbp), %rdx
	leaq	-392(%rbp), %rsi
	movq	%rsi, -376(%rbp)
	movq	-376(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	%rdx, -360(%rbp)
	movq	%rsi, -368(%rbp)
	movq	-360(%rbp), %rdx
	movq	%rdx, -352(%rbp)
	leaq	-368(%rbp), %rsi
	movq	%rsi, -344(%rbp)
	movq	-344(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	%rsi, (%rdx)
	movq	%rax, -336(%rbp)
	movq	-336(%rbp), %rax
	movq	%rax, -328(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -320(%rbp)
	movq	-320(%rbp), %rax
	movq	(%rax), %rax
	movq	-512(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -176(%rbp)
	movq	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_@GOTPCREL(%rip), %rsi
	movq	%rsi, -184(%rbp)
	movq	%rax, -192(%rbp)
	movq	-176(%rbp), %rdi
	movq	-184(%rbp), %rdx
	movq	-192(%rbp), %rcx
Ltmp45:
	xorl	%r8d, %r8d
	movl	%r8d, %esi
	callq	_pthread_create
Ltmp46:
	movl	%eax, -532(%rbp)        ## 4-byte Spill
	jmp	LBB10_2
LBB10_2:
	jmp	LBB10_3
LBB10_3:
	movl	-532(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -504(%rbp)
	cmpl	$0, -504(%rbp)
	jne	LBB10_13
## BB#4:
	leaq	-488(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rcx
	movq	%rcx, -144(%rbp)
	movq	-144(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -168(%rbp)
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	$0, (%rax)
	jmp	LBB10_15
LBB10_5:
Ltmp44:
	movl	%edx, %ecx
	movq	%rax, -496(%rbp)
	movl	%ecx, -500(%rbp)
	movq	-528(%rbp), %rdi        ## 8-byte Reload
	callq	__ZdlPv
	jmp	LBB10_23
LBB10_6:
Ltmp49:
	leaq	-488(%rbp), %rcx
	movl	%edx, %esi
	movq	%rax, -496(%rbp)
	movl	%esi, -500(%rbp)
	movq	%rcx, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rcx
	movq	%rcx, -72(%rbp)
	movq	-72(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -104(%rbp)
	movq	-96(%rbp), %rcx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rcx, (%rdx)
	cmpq	$0, -104(%rbp)
	movq	%rax, -544(%rbp)        ## 8-byte Spill
	je	LBB10_12
## BB#7:
	movq	-544(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	-8(%rbp), %rcx
	movq	-104(%rbp), %rdx
	movq	%rcx, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-48(%rbp), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -552(%rbp)        ## 8-byte Spill
	je	LBB10_11
## BB#8:
Ltmp50:
	movq	-552(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
Ltmp51:
	jmp	LBB10_9
LBB10_9:
	movq	-552(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	jmp	LBB10_11
LBB10_10:
Ltmp52:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movq	-552(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	movq	-56(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB10_11:
	jmp	LBB10_12
LBB10_12:
	jmp	LBB10_22
LBB10_13:
	movl	-504(%rbp), %edi
Ltmp47:
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp48:
	jmp	LBB10_14
LBB10_14:
LBB10_15:
	leaq	-488(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	movq	%rax, -304(%rbp)
	movq	-304(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	$0, -288(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rcx
	movq	%rcx, -264(%rbp)
	movq	-264(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -296(%rbp)
	movq	-288(%rbp), %rcx
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rdx
	movq	%rdx, -216(%rbp)
	movq	-216(%rbp), %rdx
	movq	%rcx, (%rdx)
	cmpq	$0, -296(%rbp)
	movq	%rax, -560(%rbp)        ## 8-byte Spill
	je	LBB10_21
## BB#16:
	movq	-560(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rcx
	movq	%rcx, -200(%rbp)
	movq	-200(%rbp), %rcx
	movq	-296(%rbp), %rdx
	movq	%rcx, -232(%rbp)
	movq	%rdx, -240(%rbp)
	movq	-240(%rbp), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -568(%rbp)        ## 8-byte Spill
	je	LBB10_20
## BB#17:
Ltmp53:
	movq	-568(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
Ltmp54:
	jmp	LBB10_18
LBB10_18:
	movq	-568(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	jmp	LBB10_20
LBB10_19:
Ltmp55:
	movl	%edx, %ecx
	movq	%rax, -248(%rbp)
	movl	%ecx, -252(%rbp)
	movq	-568(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	movq	-248(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB10_20:
	jmp	LBB10_21
LBB10_21:
	addq	$576, %rsp              ## imm = 0x240
	popq	%rbp
	retq
LBB10_22:
	jmp	LBB10_23
LBB10_23:
	movq	-496(%rbp), %rdi
	callq	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table10:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\366\200\200"          ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	104                     ## Call site table length
Lset55 = Lfunc_begin3-Lfunc_begin3      ## >> Call Site 1 <<
	.long	Lset55
Lset56 = Ltmp42-Lfunc_begin3            ##   Call between Lfunc_begin3 and Ltmp42
	.long	Lset56
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset57 = Ltmp42-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset57
Lset58 = Ltmp43-Ltmp42                  ##   Call between Ltmp42 and Ltmp43
	.long	Lset58
Lset59 = Ltmp44-Lfunc_begin3            ##     jumps to Ltmp44
	.long	Lset59
	.byte	0                       ##   On action: cleanup
Lset60 = Ltmp45-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset60
Lset61 = Ltmp46-Ltmp45                  ##   Call between Ltmp45 and Ltmp46
	.long	Lset61
Lset62 = Ltmp49-Lfunc_begin3            ##     jumps to Ltmp49
	.long	Lset62
	.byte	0                       ##   On action: cleanup
Lset63 = Ltmp50-Lfunc_begin3            ## >> Call Site 4 <<
	.long	Lset63
Lset64 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset64
Lset65 = Ltmp52-Lfunc_begin3            ##     jumps to Ltmp52
	.long	Lset65
	.byte	7                       ##   On action: 4
Lset66 = Ltmp51-Lfunc_begin3            ## >> Call Site 5 <<
	.long	Lset66
Lset67 = Ltmp47-Ltmp51                  ##   Call between Ltmp51 and Ltmp47
	.long	Lset67
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset68 = Ltmp47-Lfunc_begin3            ## >> Call Site 6 <<
	.long	Lset68
Lset69 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset69
Lset70 = Ltmp49-Lfunc_begin3            ##     jumps to Ltmp49
	.long	Lset70
	.byte	0                       ##   On action: cleanup
Lset71 = Ltmp53-Lfunc_begin3            ## >> Call Site 7 <<
	.long	Lset71
Lset72 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset72
Lset73 = Ltmp55-Lfunc_begin3            ##     jumps to Ltmp55
	.long	Lset73
	.byte	3                       ##   On action: 2
Lset74 = Ltmp54-Lfunc_begin3            ## >> Call Site 8 <<
	.long	Lset74
Lset75 = Lfunc_end3-Ltmp54              ##   Call between Ltmp54 and Lfunc_end3
	.long	Lset75
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	127                     ## >> Action Record 2 <<
                                        ##   Filter TypeInfo -1
	.byte	125                     ##   Continue to action 1
	.byte	1                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 1
	.byte	123                     ##   Continue to action 1
	.byte	127                     ## >> Action Record 4 <<
                                        ##   Filter TypeInfo -1
	.byte	125                     ##   Continue to action 3
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__120__thread_invoke_pairIPFvvEEC1ERS2_
	.weak_def_can_be_hidden	__ZNSt3__120__thread_invoke_pairIPFvvEEC1ERS2_
	.p2align	4, 0x90
__ZNSt3__120__thread_invoke_pairIPFvvEEC1ERS2_: ## @_ZNSt3__120__thread_invoke_pairIPFvvEEC1ERS2_
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi30:
	.cfi_def_cfa_offset 16
Lcfi31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi32:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEEC2ERS2_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
	.weak_definition	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
	.p2align	4, 0x90
__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_: ## @_ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## BB#0:
	pushq	%rbp
Lcfi33:
	.cfi_def_cfa_offset 16
Lcfi34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi35:
	.cfi_def_cfa_register %rbp
	subq	$608, %rsp              ## imm = 0x260
	movq	%rdi, -520(%rbp)
	movq	-520(%rbp), %rdi
	leaq	-528(%rbp), %rax
	movq	%rax, -504(%rbp)
	movq	%rdi, -512(%rbp)
	movq	-504(%rbp), %rax
	movq	-512(%rbp), %rdi
	movq	%rax, -472(%rbp)
	movq	%rdi, -480(%rbp)
	movq	-472(%rbp), %rax
	leaq	-480(%rbp), %rdi
	movq	%rdi, -464(%rbp)
	movq	-464(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rax, -448(%rbp)
	movq	%rdi, -456(%rbp)
	movq	-448(%rbp), %rax
	movq	-456(%rbp), %rdi
	movq	%rax, -432(%rbp)
	movq	%rdi, -440(%rbp)
	movq	-432(%rbp), %rax
	leaq	-440(%rbp), %rdi
	movq	%rdi, -424(%rbp)
	movq	-424(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rax, -408(%rbp)
	movq	%rdi, -416(%rbp)
	movq	-408(%rbp), %rax
	movq	%rax, -400(%rbp)
	leaq	-416(%rbp), %rdi
	movq	%rdi, -392(%rbp)
	movq	-392(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, (%rax)
Ltmp56:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp57:
	movq	%rax, -560(%rbp)        ## 8-byte Spill
	jmp	LBB12_1
LBB12_1:
	leaq	-528(%rbp), %rax
	movq	%rax, -384(%rbp)
	movq	-384(%rbp), %rax
	movq	%rax, -376(%rbp)
	movq	-376(%rbp), %rax
	movq	%rax, -368(%rbp)
	movq	-368(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rcx
	movq	%rcx, -216(%rbp)
	movq	-216(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -240(%rbp)
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rax
	movq	$0, (%rax)
	movq	-240(%rbp), %rsi
Ltmp58:
	movq	-560(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__121__thread_specific_ptrINS_15__thread_structEE11set_pointerEPS1_
Ltmp59:
	jmp	LBB12_2
LBB12_2:
	leaq	-528(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
Ltmp60:
	callq	*%rax
Ltmp61:
	jmp	LBB12_3
LBB12_3:
	leaq	-168(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	$-1, -160(%rbp)
	movq	-152(%rbp), %rax
	movq	-160(%rbp), %rcx
	movq	%rax, -136(%rbp)
	movq	%rcx, -144(%rbp)
	movq	-136(%rbp), %rax
	movq	$0, (%rax)
	movq	-168(%rbp), %rax
	movq	%rax, -568(%rbp)        ## 8-byte Spill
## BB#4:
	leaq	-552(%rbp), %rax
	movq	-568(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -552(%rbp)
	movq	%rax, -128(%rbp)
## BB#5:
	leaq	-528(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rcx
	movq	%rcx, -72(%rbp)
	movq	-72(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -104(%rbp)
	movq	-96(%rbp), %rcx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rcx, (%rdx)
	cmpq	$0, -104(%rbp)
	movq	%rax, -576(%rbp)        ## 8-byte Spill
	je	LBB12_11
## BB#6:
	movq	-576(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	-8(%rbp), %rcx
	movq	-104(%rbp), %rdx
	movq	%rcx, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-48(%rbp), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -584(%rbp)        ## 8-byte Spill
	je	LBB12_10
## BB#7:
Ltmp66:
	movq	-584(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
Ltmp67:
	jmp	LBB12_8
LBB12_8:
	movq	-584(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	jmp	LBB12_10
LBB12_9:
Ltmp68:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movq	-584(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	movq	-56(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB12_10:
	jmp	LBB12_11
LBB12_11:
	xorl	%eax, %eax
                                        ## kill: %RAX<def> %EAX<kill>
	addq	$608, %rsp              ## imm = 0x260
	popq	%rbp
	retq
LBB12_12:
Ltmp62:
	leaq	-528(%rbp), %rcx
	movl	%edx, %esi
	movq	%rax, -536(%rbp)
	movl	%esi, -540(%rbp)
	movq	%rcx, -360(%rbp)
	movq	-360(%rbp), %rax
	movq	%rax, -352(%rbp)
	movq	-352(%rbp), %rax
	movq	%rax, -328(%rbp)
	movq	$0, -336(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -320(%rbp)
	movq	-320(%rbp), %rcx
	movq	%rcx, -312(%rbp)
	movq	-312(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -344(%rbp)
	movq	-336(%rbp), %rcx
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rdx
	movq	%rdx, -264(%rbp)
	movq	-264(%rbp), %rdx
	movq	%rcx, (%rdx)
	cmpq	$0, -344(%rbp)
	movq	%rax, -592(%rbp)        ## 8-byte Spill
	je	LBB12_18
## BB#13:
	movq	-592(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rcx
	movq	%rcx, -248(%rbp)
	movq	-248(%rbp), %rcx
	movq	-344(%rbp), %rdx
	movq	%rcx, -280(%rbp)
	movq	%rdx, -288(%rbp)
	movq	-288(%rbp), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -600(%rbp)        ## 8-byte Spill
	je	LBB12_17
## BB#14:
Ltmp63:
	movq	-600(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
Ltmp64:
	jmp	LBB12_15
LBB12_15:
	movq	-600(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	jmp	LBB12_17
LBB12_16:
Ltmp65:
	movl	%edx, %ecx
	movq	%rax, -296(%rbp)
	movl	%ecx, -300(%rbp)
	movq	-600(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	movq	-296(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB12_17:
	jmp	LBB12_18
LBB12_18:
	jmp	LBB12_19
LBB12_19:
	jmp	LBB12_20
LBB12_20:
	movq	-536(%rbp), %rdi
	callq	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table12:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\317\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset76 = Ltmp56-Lfunc_begin4            ## >> Call Site 1 <<
	.long	Lset76
Lset77 = Ltmp61-Ltmp56                  ##   Call between Ltmp56 and Ltmp61
	.long	Lset77
Lset78 = Ltmp62-Lfunc_begin4            ##     jumps to Ltmp62
	.long	Lset78
	.byte	0                       ##   On action: cleanup
Lset79 = Ltmp66-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset79
Lset80 = Ltmp67-Ltmp66                  ##   Call between Ltmp66 and Ltmp67
	.long	Lset80
Lset81 = Ltmp68-Lfunc_begin4            ##     jumps to Ltmp68
	.long	Lset81
	.byte	3                       ##   On action: 2
Lset82 = Ltmp67-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset82
Lset83 = Ltmp63-Ltmp67                  ##   Call between Ltmp67 and Ltmp63
	.long	Lset83
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset84 = Ltmp63-Lfunc_begin4            ## >> Call Site 4 <<
	.long	Lset84
Lset85 = Ltmp64-Ltmp63                  ##   Call between Ltmp63 and Ltmp64
	.long	Lset85
Lset86 = Ltmp65-Lfunc_begin4            ##     jumps to Ltmp65
	.long	Lset86
	.byte	7                       ##   On action: 4
Lset87 = Ltmp64-Lfunc_begin4            ## >> Call Site 5 <<
	.long	Lset87
Lset88 = Lfunc_end4-Ltmp64              ##   Call between Ltmp64 and Lfunc_end4
	.long	Lset88
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	127                     ## >> Action Record 2 <<
                                        ##   Filter TypeInfo -1
	.byte	125                     ##   Continue to action 1
	.byte	1                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 1
	.byte	123                     ##   Continue to action 1
	.byte	127                     ## >> Action Record 4 <<
                                        ##   Filter TypeInfo -1
	.byte	125                     ##   Continue to action 3
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__120__thread_invoke_pairIPFvvEEC2ERS2_
	.weak_def_can_be_hidden	__ZNSt3__120__thread_invoke_pairIPFvvEEC2ERS2_
	.p2align	4, 0x90
__ZNSt3__120__thread_invoke_pairIPFvvEEC2ERS2_: ## @_ZNSt3__120__thread_invoke_pairIPFvvEEC2ERS2_
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## BB#0:
	pushq	%rbp
Lcfi36:
	.cfi_def_cfa_offset 16
Lcfi37:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi38:
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	-136(%rbp), %rsi
	movq	%rsi, %rdi
	movl	$8, %eax
	movl	%eax, %ecx
	movq	%rdi, -168(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rsi, -176(%rbp)        ## 8-byte Spill
	callq	__Znwm
	movq	%rax, %rcx
	movq	%rax, %rsi
Ltmp69:
	movq	%rax, %rdi
	movq	%rsi, -184(%rbp)        ## 8-byte Spill
	movq	%rcx, -192(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp70:
	jmp	LBB13_1
LBB13_1:
	leaq	-32(%rbp), %rax
	leaq	-56(%rbp), %rcx
	leaq	-96(%rbp), %rdx
	movq	-176(%rbp), %rsi        ## 8-byte Reload
	movq	%rsi, -120(%rbp)
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	movq	%rdi, -128(%rbp)
	movq	-120(%rbp), %r8
	movq	-128(%rbp), %r9
	movq	%r8, -88(%rbp)
	movq	%r9, -96(%rbp)
	movq	-88(%rbp), %r8
	movq	%rdx, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%r8, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-64(%rbp), %rdx
	movq	-72(%rbp), %r8
	movq	%rdx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	-48(%rbp), %rdx
	movq	%rcx, -40(%rbp)
	movq	-40(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, %rdx
	movq	%rdx, -16(%rbp)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	-144(%rbp), %rax
	movq	(%rax), %rax
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movq	%rax, 8(%rcx)
	addq	$192, %rsp
	popq	%rbp
	retq
LBB13_2:
Ltmp71:
	movl	%edx, %ecx
	movq	%rax, -152(%rbp)
	movl	%ecx, -156(%rbp)
	movq	-192(%rbp), %rdi        ## 8-byte Reload
	callq	__ZdlPv
## BB#3:
	movq	-152(%rbp), %rdi
	callq	__Unwind_Resume
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset89 = Lfunc_begin5-Lfunc_begin5      ## >> Call Site 1 <<
	.long	Lset89
Lset90 = Ltmp69-Lfunc_begin5            ##   Call between Lfunc_begin5 and Ltmp69
	.long	Lset90
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset91 = Ltmp69-Lfunc_begin5            ## >> Call Site 2 <<
	.long	Lset91
Lset92 = Ltmp70-Ltmp69                  ##   Call between Ltmp69 and Ltmp70
	.long	Lset92
Lset93 = Ltmp71-Lfunc_begin5            ##     jumps to Ltmp71
	.long	Lset93
	.byte	0                       ##   On action: cleanup
Lset94 = Ltmp70-Lfunc_begin5            ## >> Call Site 3 <<
	.long	Lset94
Lset95 = Lfunc_end5-Ltmp70              ##   Call between Ltmp70 and Lfunc_end5
	.long	Lset95
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__121__thread_specific_ptrINS_15__thread_structEE11set_pointerEPS1_
	.weak_definition	__ZNSt3__121__thread_specific_ptrINS_15__thread_structEE11set_pointerEPS1_
	.p2align	4, 0x90
__ZNSt3__121__thread_specific_ptrINS_15__thread_structEE11set_pointerEPS1_: ## @_ZNSt3__121__thread_specific_ptrINS_15__thread_structEE11set_pointerEPS1_
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi39:
	.cfi_def_cfa_offset 16
Lcfi40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi41:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	-32(%rbp), %rdi
	movq	%rsi, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_pthread_setspecific
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
	.p2align	4, 0x90
__ZNSt3__120__thread_invoke_pairIPFvvEED1Ev: ## @_ZNSt3__120__thread_invoke_pairIPFvvEED1Ev
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi42:
	.cfi_def_cfa_offset 16
Lcfi43:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi44:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__120__thread_invoke_pairIPFvvEED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__120__thread_invoke_pairIPFvvEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__120__thread_invoke_pairIPFvvEED2Ev
	.p2align	4, 0x90
__ZNSt3__120__thread_invoke_pairIPFvvEED2Ev: ## @_ZNSt3__120__thread_invoke_pairIPFvvEED2Ev
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## BB#0:
	pushq	%rbp
Lcfi45:
	.cfi_def_cfa_offset 16
Lcfi46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi47:
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movq	%rdi, -128(%rbp)
	movq	-128(%rbp), %rdi
	movq	%rdi, -120(%rbp)
	movq	-120(%rbp), %rdi
	movq	%rdi, -112(%rbp)
	movq	-112(%rbp), %rdi
	movq	%rdi, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	-88(%rbp), %rdi
	movq	%rdi, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	movq	-96(%rbp), %rax
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rcx
	movq	%rcx, -24(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	cmpq	$0, -104(%rbp)
	movq	%rdi, -136(%rbp)        ## 8-byte Spill
	je	LBB16_6
## BB#1:
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	-8(%rbp), %rcx
	movq	-104(%rbp), %rdx
	movq	%rcx, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-48(%rbp), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -144(%rbp)        ## 8-byte Spill
	je	LBB16_5
## BB#2:
Ltmp72:
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__115__thread_structD1Ev
Ltmp73:
	jmp	LBB16_3
LBB16_3:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	jmp	LBB16_5
LBB16_4:
Ltmp74:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	movq	-56(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB16_5:
	jmp	LBB16_6
LBB16_6:
	addq	$144, %rsp
	popq	%rbp
	retq
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table16:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\240"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	26                      ## Call site table length
Lset96 = Ltmp72-Lfunc_begin6            ## >> Call Site 1 <<
	.long	Lset96
Lset97 = Ltmp73-Ltmp72                  ##   Call between Ltmp72 and Ltmp73
	.long	Lset97
Lset98 = Ltmp74-Lfunc_begin6            ##     jumps to Ltmp74
	.long	Lset98
	.byte	3                       ##   On action: 2
Lset99 = Ltmp73-Lfunc_begin6            ## >> Call Site 2 <<
	.long	Lset99
Lset100 = Lfunc_end6-Ltmp73             ##   Call between Ltmp73 and Lfunc_end6
	.long	Lset100
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	127                     ## >> Action Record 2 <<
                                        ##   Filter TypeInfo -1
	.byte	125                     ##   Continue to action 1
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello Concurrent world!\n"

L_.str.1:                               ## @.str.1
	.asciz	"thread constructor failed"


.subsections_via_symbols

	.file	"pro1.cpp"
	.text
	.p2align 4
	.def	_ZL6printfPKcz;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL6printfPKcz
_ZL6printfPKcz:
.LFB1448:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	88(%rsp), %rsi
	movq	%rcx, %rbx
	movq	%rdx, 88(%rsp)
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	movq	%rsi, 40(%rsp)
	movl	$1, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	__mingw_vfprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Warning: failed to set process affinity on Windows\12\0"
	.text
	.p2align 4
	.def	_ZL7fprintfP6_iobufPKcz.constprop.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL7fprintfP6_iobufPKcz.constprop.0
_ZL7fprintfP6_iobufPKcz.constprop.0:
.LFB12578:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	.LC0(%rip), %rdx
	movq	%r8, 80(%rsp)
	leaq	80(%rsp), %r8
	movq	%r9, 88(%rsp)
	movq	%r8, 40(%rsp)
	call	__mingw_vfprintf
	addq	$56, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "cannot create std::vector larger than max_size()\0"
	.text
	.align 2
	.p2align 4
	.def	_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0
_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0:
.LFB12579:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%r8, %rsi
	movq	%r8, %rdi
	movq	16(%rbx), %rax
	subq	%rdx, %rsi
	subq	%rcx, %rax
	cmpq	%rsi, %rax
	jnb	.L5
	movabsq	$9223372036854775800, %rax
	cmpq	%rsi, %rax
	jb	.L22
	movq	%rsi, %rcx
	movq	%rdx, 72(%rsp)
	call	_Znwy
	cmpq	$8, %rsi
	movq	72(%rsp), %rdx
	movq	%rax, %rdi
	jle	.L7
	movq	%rsi, %r8
	movq	%rax, %rcx
	call	memcpy
.L8:
	movq	(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L9
	movq	16(%rbx), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L9:
	addq	%rdi, %rsi
	vmovq	%rdi, %xmm1
	vpinsrq	$1, %rsi, %xmm1, %xmm0
	movq	%rsi, 16(%rbx)
	vmovdqu	%xmm0, (%rbx)
.L21:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L5:
	movq	8(%rbx), %r9
	movq	%r9, %r8
	subq	%rcx, %r8
	cmpq	%rsi, %r8
	jnb	.L23
	leaq	(%rdx,%r8), %rsi
	cmpq	$8, %r8
	jle	.L14
	call	memmove
	movq	8(%rbx), %r9
.L15:
	subq	%rsi, %rdi
	cmpq	$8, %rdi
	jle	.L16
	movq	%r9, %rcx
	movq	%rdi, %r8
	movq	%rsi, %rdx
	call	memmove
	movq	%rax, %r9
.L17:
	addq	%rdi, %r9
	movq	%r9, 8(%rbx)
	jmp	.L21
.L23:
	cmpq	$8, %rsi
	jle	.L12
	movq	%rsi, %r8
	call	memmove
	movq	%rax, %rcx
.L13:
	addq	%rsi, %rcx
	cmpq	8(%rbx), %rcx
	je	.L21
	movq	%rcx, 8(%rbx)
	jmp	.L21
.L22:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L14:
	jne	.L15
	movq	(%rdx), %rax
	movq	%rax, (%rcx)
	jmp	.L15
.L16:
	jne	.L17
	movq	(%rsi), %rax
	movq	%rax, (%r9)
	jmp	.L17
.L12:
	jne	.L13
	movq	(%rdx), %rax
	movq	%rax, (%rcx)
	jmp	.L13
.L7:
	movq	(%rdx), %rax
	movq	%rax, (%rdi)
	jmp	.L8
	.seh_endproc
	.p2align 4
	.def	__tcf_3;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_3
__tcf_3:
.LFB12563:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	8+g_csv(%rip), %rcx
	leaq	64(%rax), %rdx
	addq	$24, %rax
	movq	%rdx, 200+g_csv(%rip)
	movq	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rdx
	vmovq	%rax, %xmm1
	addq	$16, %rdx
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovdqa	%xmm0, g_csv(%rip)
.LEHB0:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE0:
.L26:
	leaq	80+g_csv(%rip), %rcx
	call	_ZNSt12__basic_fileIcED1Ev
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	64+g_csv(%rip), %rcx
	addq	$16, %rax
	movq	%rax, 8+g_csv(%rip)
	call	_ZNSt6localeD1Ev
	movq	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	8(%rax), %rdx
	movq	16(%rax), %rcx
	leaq	g_csv(%rip), %rax
	movq	%rdx, g_csv(%rip)
	movq	-24(%rdx), %rdx
	movq	%rcx, (%rax,%rdx)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	leaq	200+g_csv(%rip), %rcx
	addq	$16, %rax
	movq	%rax, 200+g_csv(%rip)
	addq	$40, %rsp
	jmp	_ZNSt8ios_baseD2Ev
.L27:
	movq	%rax, %rcx
	vzeroupper
	call	__cxa_begin_catch
	call	__cxa_end_catch
	jmp	.L26
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA12563:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT12563-.LLSDATTD12563
.LLSDATTD12563:
	.byte	0x1
	.uleb128 .LLSDACSE12563-.LLSDACSB12563
.LLSDACSB12563:
	.uleb128 .LEHB0-.LFB12563
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L27-.LFB12563
	.uleb128 0x1
.LLSDACSE12563:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT12563:
	.text
	.seh_endproc
	.p2align 4
	.def	__tcf_1;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_1
__tcf_1:
.LFB12561:
	.seh_endprologue
	movq	_Z14g_memory_levelB5cxx11(%rip), %rcx
	leaq	16+_Z14g_memory_levelB5cxx11(%rip), %rax
	cmpq	%rax, %rcx
	je	.L30
	movq	16+_Z14g_memory_levelB5cxx11(%rip), %rax
	leaq	1(%rax), %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L30:
	ret
	.seh_endproc
	.p2align 4
	.def	__tcf_2;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_2
__tcf_2:
.LFB12562:
	.seh_endprologue
	movq	_Z9g_cmdlineB5cxx11(%rip), %rcx
	leaq	16+_Z9g_cmdlineB5cxx11(%rip), %rax
	cmpq	%rax, %rcx
	je	.L33
	movq	16+_Z9g_cmdlineB5cxx11(%rip), %rax
	leaq	1(%rax), %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L33:
	ret
	.seh_endproc
	.p2align 4
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB12560:
	.seh_endprologue
	movq	_Z6g_typeB5cxx11(%rip), %rcx
	leaq	16+_Z6g_typeB5cxx11(%rip), %rax
	cmpq	%rax, %rcx
	je	.L36
	movq	16+_Z6g_typeB5cxx11(%rip), %rax
	leaq	1(%rax), %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L36:
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNSt6vectorIySaIyEEaSEOS1_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIySaIyEEaSEOS1_.isra.0
_ZNSt6vectorIySaIyEEaSEOS1_.isra.0:
.LFB12585:
	.seh_endprologue
	vmovdqu	(%rdx), %xmm1
	movq	(%rcx), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movq	16(%rcx), %r8
	vmovdqu	%xmm1, (%rcx)
	movq	16(%rdx), %r9
	movq	%r9, 16(%rcx)
	vmovdqu	%xmm0, (%rdx)
	movq	$0, 16(%rdx)
	testq	%rax, %rax
	je	.L39
	movq	%r8, %rdx
	movq	%rax, %rcx
	subq	%rax, %rdx
	jmp	_ZdlPvy
.L39:
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "basic_string: construction from null is not valid\0"
	.text
	.align 2
	.p2align 4
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0:
.LFB12588:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	16(%rcx), %rbp
	movq	%rcx, %rbx
	movq	%rdx, %rdi
	movq	%rbp, (%rcx)
	testq	%rdx, %rdx
	je	.L49
	movq	%rdx, %rcx
	call	strlen
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	cmpq	$15, %rax
	ja	.L50
	cmpq	$1, %rax
	jne	.L44
	movzbl	(%rdi), %eax
	movb	%al, 16(%rbx)
.L45:
	movq	40(%rsp), %rax
	movq	(%rbx), %rdx
	movq	%rax, 8(%rbx)
	movb	$0, (%rdx,%rax)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L44:
	testq	%rax, %rax
	je	.L45
	jmp	.L43
.L50:
	leaq	40(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rbp
	movq	%rax, (%rbx)
	movq	40(%rsp), %rax
	movq	%rax, 16(%rbx)
.L43:
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	memcpy
	jmp	.L45
.L49:
	leaq	.LC2(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.p2align 4
	.globl	_Z19make_gather_indicesyi
	.def	_Z19make_gather_indicesyi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z19make_gather_indicesyi
_Z19make_gather_indicesyi:
.LFB11224:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rdx, %rax
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %edi
	shrq	$60, %rax
	jne	.L61
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rcx)
	vmovdqu	%xmm0, (%rcx)
	testq	%rdx, %rdx
	je	.L62
	leaq	0(,%rdx,8), %r13
	movq	%r13, %rcx
	call	_Znwy
	leaq	(%rax,%r13), %r12
	movq	%rax, %rbx
	movq	%rax, 0(%rbp)
	movq	%r12, 16(%rbp)
	movq	$0, (%rax)
	leaq	8(%rax), %rcx
	cmpq	$1, %rsi
	je	.L55
	cmpq	%r12, %rcx
	je	.L60
	leaq	-8(%r13), %r8
	xorl	%edx, %edx
	call	memset
.L60:
	movq	%r12, 8(%rbp)
.L57:
	movslq	%edi, %r8
	movq	%rbx, %rcx
	xorl	%r9d, %r9d
	.p2align 4
	.p2align 3
.L58:
	movq	%r9, %rax
	xorl	%edx, %edx
	addq	$8, %rcx
	addq	%r8, %r9
	divq	%rsi
	movq	%rdx, -8(%rcx)
	cmpq	%rcx, %r12
	jne	.L58
	movq	%rbp, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L62:
	movq	%rbp, %rax
	movq	$0, 16(%rcx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L55:
	movq	%rcx, 8(%rbp)
	jmp	.L57
.L61:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.p2align 4
	.globl	_Z11get_sweep_Nv
	.def	_Z11get_sweep_Nv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11get_sweep_Nv
_Z11get_sweep_Nv:
.LFB11243:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	.seh_endprologue
	vmovdqa	.LC3(%rip), %ymm0
	movq	%rcx, %rbx
	movq	$33554432, 96(%rsp)
	movq	$0, 16(%rcx)
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqa	.LC4(%rip), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rcx)
	movl	$72, %ecx
	vzeroupper
.LEHB1:
	call	_Znwy
.LEHE1:
	vmovdqu	32(%rsp), %ymm1
	vmovdqu	64(%rsp), %ymm2
	leaq	72(%rax), %rdx
	movq	%rax, (%rbx)
	movq	96(%rsp), %rcx
	movq	%rdx, 16(%rbx)
	movq	%rdx, 8(%rbx)
	movq	%rcx, 64(%rax)
	vmovdqu	%ymm1, (%rax)
	vmovdqu	%ymm2, 32(%rax)
	movq	%rbx, %rax
	vzeroupper
	addq	$120, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L66:
	movq	(%rbx), %rcx
	movq	16(%rbx), %rdx
	movq	%rax, %rsi
	subq	%rcx, %rdx
	testq	%rcx, %rcx
	je	.L72
	vzeroupper
	call	_ZdlPvy
.L65:
	movq	%rsi, %rcx
.LEHB2:
	call	_Unwind_Resume
.LEHE2:
.L72:
	vzeroupper
	jmp	.L65
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA11243:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11243-.LLSDACSB11243
.LLSDACSB11243:
	.uleb128 .LEHB1-.LFB11243
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L66-.LFB11243
	.uleb128 0
	.uleb128 .LEHB2-.LFB11243
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE11243:
	.text
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_
	.def	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_
_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_:
.LFB11281:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	__imp__errno(%rip), %rsi
	movq	%r8, %rbx
	movq	%rcx, %rbp
	movq	%rdx, %r13
	movq	%r9, %rdi
.LEHB3:
	call	*%rsi
	movl	(%rax), %r12d
	call	*%rsi
.LEHE3:
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movl	144(%rsp), %r8d
	movl	$0, (%rax)
.LEHB4:
	call	*%rbp
	movl	%eax, %ebp
	cmpq	%rbx, 40(%rsp)
	je	.L84
	call	*%rsi
.LEHE4:
	cmpl	$34, (%rax)
	je	.L85
	testq	%rdi, %rdi
	je	.L76
	movq	40(%rsp), %rax
	subq	%rbx, %rax
	movq	%rax, (%rdi)
.L76:
	call	*%rsi
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L86
	movl	%ebp, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L86:
	call	*%rsi
	movl	%r12d, (%rax)
	movl	%ebp, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L85:
	movq	%r13, %rcx
.LEHB5:
	call	_ZSt20__throw_out_of_rangePKc
.L84:
	movq	%r13, %rcx
	call	_ZSt24__throw_invalid_argumentPKc
.LEHE5:
.L80:
	vzeroupper
	movq	%rax, %rbx
	call	*%rsi
	cmpl	$0, (%rax)
	jne	.L79
	call	*%rsi
	movl	%r12d, (%rax)
.L79:
	movq	%rbx, %rcx
.LEHB6:
	call	_Unwind_Resume
	nop
.LEHE6:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA11281:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11281-.LLSDACSB11281
.LLSDACSB11281:
	.uleb128 .LEHB3-.LFB11281
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB11281
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L80-.LFB11281
	.uleb128 0
	.uleb128 .LEHB5-.LFB11281
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L80-.LFB11281
	.uleb128 0
	.uleb128 .LEHB6-.LFB11281
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSE11281:
	.section	.text$_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt6vectorIySaIyEED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIySaIyEED1Ev
	.def	_ZNSt6vectorIySaIyEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIySaIyEED1Ev
_ZNSt6vectorIySaIyEED1Ev:
.LFB11635:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L89
	movq	16(%rcx), %rdx
	movq	%rax, %rcx
	subq	%rax, %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L89:
	ret
	.seh_endproc
	.section	.text$_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	.def	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_:
.LFB11662:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %rdi
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	movq	%rdx, %rbx
	call	strlen
	movq	%rax, %rdx
	xorl	%eax, %eax
	cmpq	%rdx, %rdi
	je	.L95
.L90:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4
	.p2align 3
.L95:
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L90
	movq	(%rsi), %rcx
	movq	%rdi, %r8
	movq	%rbx, %rdx
	call	memcmp
	testl	%eax, %eax
	sete	%al
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section	.text$_ZNSt6vectorIfSaIfEED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIfSaIfEED1Ev
	.def	_ZNSt6vectorIfSaIfEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIfSaIfEED1Ev
_ZNSt6vectorIfSaIfEED1Ev:
.LFB11966:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L98
	movq	16(%rcx), %rdx
	movq	%rax, %rcx
	subq	%rax, %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L98:
	ret
	.seh_endproc
	.section	.text$_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	.def	_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE:
.LFB11983:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$16, %rsp
	.seh_stackalloc	16
	vmovaps	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	.seh_endprologue
	movq	72(%rsp), %r10
	vmovss	64(%rsp), %xmm1
	movq	%rdx, %rax
	movl	80(%rsp), %edx
	testl	%edx, %edx
	jne	.L100
	cmpq	$2, %r10
	jbe	.L106
	leaq	-3(%r10), %rdx
	cmpq	$2, %rdx
	jbe	.L102
	movq	%rcx, %r8
	subq	%rax, %r8
	cmpq	$32, %r8
	ja	.L149
.L102:
	leaq	-8(,%r10,4), %r8
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L110:
	vmulss	4(%rax,%rdx), %xmm3, %xmm0
	vfmadd231ss	(%rax,%rdx), %xmm2, %xmm0
	vfmadd231ss	8(%rax,%rdx), %xmm1, %xmm0
	vmovss	%xmm0, 4(%rcx,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %r8
	jne	.L110
.L106:
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L100:
	cmpl	$1, %edx
	je	.L150
	cmpl	$2, %edx
	jne	.L106
	cmpq	$0, 96(%rsp)
	je	.L106
	cmpq	$2, %r10
	jbe	.L106
	movq	96(%rsp), %rbx
	movq	(%rbx), %r8
	leaq	8(%r8), %rdx
	leaq	-8(%r8,%r10,8), %r9
	.p2align 4
	.p2align 3
.L120:
	movq	(%rdx), %r8
	testq	%r8, %r8
	je	.L119
	leaq	1(%r8), %r11
	cmpq	%r10, %r11
	jnb	.L119
	vmulss	4(%rax,%r8,4), %xmm1, %xmm0
	vfmadd231ss	-4(%rax,%r8,4), %xmm2, %xmm0
	vfmadd231ss	(%rax,%r8,4), %xmm3, %xmm0
	vmovss	%xmm0, (%rcx,%r8,4)
.L119:
	addq	$8, %rdx
	cmpq	%r9, %rdx
	jne	.L120
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L150:
	cmpq	$2, %r10
	jbe	.L106
	cmpl	$1, 88(%rsp)
	jne	.L151
	leaq	-2(%r10), %r11
	movl	$1, %r8d
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L118:
	leaq	1(%r8), %r9
	cmpq	%r10, %r9
	jnb	.L117
	vmulss	(%rax,%r8,4), %xmm3, %xmm0
	vfmadd231ss	-4(%rax,%r8,4), %xmm2, %xmm0
	vfmadd231ss	4(%rax,%r8,4), %xmm1, %xmm0
	vmovss	%xmm0, (%rcx,%r8,4)
.L117:
	incq	%rdx
	movq	%r9, %r8
	cmpq	%r11, %rdx
	jne	.L118
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L149:
	leaq	-2(%r10), %r9
	cmpq	$6, %rdx
	jbe	.L103
	movq	%r9, %r8
	vbroadcastss	%xmm2, %ymm6
	vbroadcastss	%xmm3, %ymm5
	vbroadcastss	%xmm1, %ymm4
	shrq	$3, %r8
	xorl	%edx, %edx
	salq	$5, %r8
	.p2align 4
	.p2align 3
.L104:
	vmulps	4(%rax,%rdx), %ymm5, %ymm0
	vfmadd231ps	(%rax,%rdx), %ymm6, %ymm0
	vfmadd231ps	8(%rax,%rdx), %ymm4, %ymm0
	vmovups	%ymm0, 4(%rcx,%rdx)
	addq	$32, %rdx
	cmpq	%r8, %rdx
	jne	.L104
	movq	%r9, %rdx
	andq	$-8, %rdx
	andl	$7, %r9d
	leaq	2(%rdx), %r11
	leaq	1(%rdx), %rbx
	je	.L146
	movq	%r10, %r9
	subq	%rdx, %r9
	leaq	-2(%r9), %r8
	subq	$3, %r9
	cmpq	$2, %r9
	jbe	.L147
	vzeroupper
.L121:
	vshufps	$0, %xmm1, %xmm1, %xmm5
	vmulps	8(%rax,%rdx,4), %xmm5, %xmm5
	vshufps	$0, %xmm3, %xmm3, %xmm4
	vshufps	$0, %xmm2, %xmm2, %xmm0
	vfmadd132ps	4(%rax,%rdx,4), %xmm5, %xmm4
	vfmadd132ps	(%rax,%rdx,4), %xmm4, %xmm0
	vmovups	%xmm0, 4(%rcx,%rdx,4)
	movq	%r8, %rdx
	andq	$-4, %rdx
	addq	%rdx, %r11
	addq	%rdx, %rbx
	andl	$3, %r8d
	je	.L106
.L108:
	leaq	0(,%r11,4), %rdx
	leaq	1(%r11), %r9
	leaq	(%rax,%rdx), %r8
	vmulss	(%r8), %xmm1, %xmm0
	vfmadd231ss	(%rax,%rbx,4), %xmm3, %xmm0
	vfmadd231ss	-4(%rax,%rbx,4), %xmm2, %xmm0
	vmovss	%xmm0, (%rcx,%rbx,4)
	cmpq	%r10, %r9
	jnb	.L106
	leaq	4(%rax,%rdx), %rbx
	addq	$2, %r11
	vmulss	(%rbx), %xmm1, %xmm0
	vfmadd231ss	-4(%rax,%rdx), %xmm2, %xmm0
	vfmadd231ss	(%r8), %xmm3, %xmm0
	vmovss	%xmm0, (%rcx,%rdx)
	cmpq	%r10, %r11
	jnb	.L106
	vmulss	8(%rax,%rdx), %xmm1, %xmm1
	vfmadd231ss	(%rbx), %xmm3, %xmm1
	vfmadd231ss	(%r8), %xmm2, %xmm1
	vmovss	%xmm1, 4(%rcx,%rdx)
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
.L151:
	movslq	88(%rsp), %rdx
	leaq	-2(%r10), %r11
	xorl	%r9d, %r9d
	movq	%rdx, %r8
	.p2align 4
	.p2align 3
.L114:
	testq	%r8, %r8
	je	.L115
	leaq	1(%r8), %rbx
	cmpq	%r10, %rbx
	jnb	.L115
	vmulss	(%rax,%r8,4), %xmm3, %xmm0
	vfmadd231ss	-4(%rax,%r8,4), %xmm2, %xmm0
	vfmadd231ss	4(%rax,%r8,4), %xmm1, %xmm0
	vmovss	%xmm0, (%rcx,%r8,4)
.L115:
	incq	%r9
	addq	%rdx, %r8
	cmpq	%r11, %r9
	jne	.L114
	jmp	.L106
.L146:
	vzeroupper
	jmp	.L106
.L103:
	movq	%r9, %r8
	xorl	%edx, %edx
	movl	$1, %ebx
	movl	$2, %r11d
	jmp	.L121
.L147:
	vzeroupper
	jmp	.L108
	.seh_endproc
	.section	.text$_ZNSt6vectorIdSaIdEED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIdSaIdEED1Ev
	.def	_ZNSt6vectorIdSaIdEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIdSaIdEED1Ev
_ZNSt6vectorIdSaIdEED1Ev:
.LFB11997:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L154
	movq	16(%rcx), %rdx
	movq	%rax, %rcx
	subq	%rax, %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L154:
	ret
	.seh_endproc
	.section	.text$_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	.def	_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE:
.LFB12005:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$16, %rsp
	.seh_stackalloc	16
	vmovaps	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	.seh_endprologue
	movq	72(%rsp), %r10
	vmovsd	64(%rsp), %xmm1
	movq	%rdx, %rax
	movl	80(%rsp), %edx
	testl	%edx, %edx
	jne	.L156
	cmpq	$2, %r10
	jbe	.L162
	cmpq	$3, %r10
	je	.L158
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpq	$32, %rdx
	ja	.L211
.L158:
	leaq	-16(,%r10,8), %r8
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L166:
	vmulsd	8(%rax,%rdx), %xmm3, %xmm0
	vfmadd231sd	(%rax,%rdx), %xmm2, %xmm0
	vfmadd231sd	16(%rax,%rdx), %xmm1, %xmm0
	vmovsd	%xmm0, 8(%rcx,%rdx)
	addq	$8, %rdx
	cmpq	%rdx, %r8
	jne	.L166
.L162:
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L156:
	cmpl	$1, %edx
	je	.L212
	cmpl	$2, %edx
	jne	.L162
	cmpq	$0, 96(%rsp)
	je	.L162
	cmpq	$2, %r10
	jbe	.L162
	movq	96(%rsp), %rbx
	movq	(%rbx), %r8
	leaq	8(%r8), %rdx
	leaq	-8(%r8,%r10,8), %r9
	.p2align 4
	.p2align 3
.L176:
	movq	(%rdx), %r8
	testq	%r8, %r8
	je	.L175
	leaq	1(%r8), %r11
	cmpq	%r10, %r11
	jnb	.L175
	vmulsd	8(%rax,%r8,8), %xmm1, %xmm0
	vfmadd231sd	-8(%rax,%r8,8), %xmm2, %xmm0
	vfmadd231sd	(%rax,%r8,8), %xmm3, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
.L175:
	addq	$8, %rdx
	cmpq	%rdx, %r9
	jne	.L176
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L212:
	cmpq	$2, %r10
	jbe	.L162
	cmpl	$1, 88(%rsp)
	jne	.L213
	leaq	-2(%r10), %r11
	movl	$1, %r8d
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L174:
	leaq	1(%r8), %r9
	cmpq	%r10, %r9
	jnb	.L173
	vmulsd	(%rax,%r8,8), %xmm3, %xmm0
	vfmadd231sd	-8(%rax,%r8,8), %xmm2, %xmm0
	vfmadd231sd	8(%rax,%r8,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
.L173:
	incq	%rdx
	movq	%r9, %r8
	cmpq	%r11, %rdx
	jne	.L174
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
	.p2align 4
	.p2align 3
.L211:
	leaq	-3(%r10), %rdx
	leaq	-2(%r10), %r8
	cmpq	$2, %rdx
	jbe	.L159
	movq	%r8, %r9
	vbroadcastsd	%xmm2, %ymm6
	vbroadcastsd	%xmm3, %ymm5
	vbroadcastsd	%xmm1, %ymm4
	shrq	$2, %r9
	xorl	%edx, %edx
	salq	$5, %r9
	.p2align 4
	.p2align 3
.L160:
	vmulpd	8(%rax,%rdx), %ymm5, %ymm0
	vfmadd231pd	(%rax,%rdx), %ymm6, %ymm0
	vfmadd231pd	16(%rax,%rdx), %ymm4, %ymm0
	vmovupd	%ymm0, 8(%rcx,%rdx)
	addq	$32, %rdx
	cmpq	%r9, %rdx
	jne	.L160
	testb	$3, %r8b
	je	.L208
	andq	$-4, %r8
	subq	%r8, %r10
	leaq	2(%r8), %r9
	leaq	1(%r8), %rdx
	leaq	-2(%r10), %r11
	cmpq	$3, %r10
	je	.L209
	vzeroupper
.L177:
	vmovddup	%xmm1, %xmm5
	vmulpd	16(%rax,%r8,8), %xmm5, %xmm5
	vmovddup	%xmm3, %xmm4
	vmovddup	%xmm2, %xmm0
	vfmadd132pd	8(%rax,%r8,8), %xmm5, %xmm4
	vfmadd132pd	(%rax,%r8,8), %xmm4, %xmm0
	vmovupd	%xmm0, 8(%rcx,%r8,8)
	testb	$1, %r11b
	je	.L162
	andq	$-2, %r11
	addq	%r11, %r9
	addq	%r11, %rdx
.L164:
	vmulsd	(%rax,%r9,8), %xmm1, %xmm1
	vfmadd132sd	(%rax,%rdx,8), %xmm1, %xmm3
	vfmadd132sd	-8(%rax,%rdx,8), %xmm3, %xmm2
	vmovsd	%xmm2, (%rcx,%rdx,8)
	vmovaps	(%rsp), %xmm6
	addq	$16, %rsp
	popq	%rbx
	ret
.L208:
	vzeroupper
	jmp	.L162
.L213:
	movslq	88(%rsp), %rdx
	leaq	-2(%r10), %r11
	xorl	%r9d, %r9d
	movq	%rdx, %r8
	.p2align 4
	.p2align 3
.L170:
	testq	%r8, %r8
	je	.L171
	leaq	1(%r8), %rbx
	cmpq	%r10, %rbx
	jnb	.L171
	vmulsd	(%rax,%r8,8), %xmm3, %xmm0
	vfmadd231sd	-8(%rax,%r8,8), %xmm2, %xmm0
	vfmadd231sd	8(%rax,%r8,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%rcx,%r8,8)
.L171:
	incq	%r9
	addq	%rdx, %r8
	cmpq	%r9, %r11
	jne	.L170
	jmp	.L162
.L159:
	movq	%r8, %r11
	movl	$1, %edx
	xorl	%r8d, %r8d
	movl	$2, %r9d
	jmp	.L177
.L209:
	vzeroupper
	jmp	.L164
	.seh_endproc
	.section	.text$_ZNSt6vectorIiSaIiEED1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorIiSaIiEED1Ev
	.def	_ZNSt6vectorIiSaIiEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorIiSaIiEED1Ev
_ZNSt6vectorIiSaIiEED1Ev:
.LFB12019:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L216
	movq	16(%rcx), %rdx
	movq	%rax, %rcx
	subq	%rax, %rdx
	jmp	_ZdlPvy
	.p2align 4
	.p2align 3
.L216:
	ret
	.seh_endproc
	.section	.text$_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	.def	_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE:
.LFB12027:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	movl	88(%rsp), %r11d
	movq	%rdx, %rax
	movl	104(%rsp), %edx
	movq	%rcx, %r10
	movq	96(%rsp), %rcx
	testl	%edx, %edx
	jne	.L218
	cmpq	$2, %rcx
	jbe	.L224
	leaq	-3(%rcx), %rdx
	cmpq	$2, %rdx
	jbe	.L220
	movq	%r10, %rbx
	subq	%rax, %rbx
	cmpq	$32, %rbx
	ja	.L267
.L220:
	leaq	-8(,%rcx,4), %rsi
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L228:
	movl	4(%rax,%rdx), %ecx
	movl	(%rax,%rdx), %ebx
	imull	%r9d, %ecx
	imull	%r8d, %ebx
	addl	%ebx, %ecx
	movl	8(%rax,%rdx), %ebx
	imull	%r11d, %ebx
	addl	%ebx, %ecx
	movl	%ecx, 4(%r10,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %rsi
	jne	.L228
.L224:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L218:
	cmpl	$1, %edx
	je	.L268
	cmpl	$2, %edx
	jne	.L224
	cmpq	$0, 120(%rsp)
	je	.L224
	cmpq	$2, %rcx
	jbe	.L224
	movq	120(%rsp), %rdi
	movq	(%rdi), %rbx
	leaq	8(%rbx), %rdx
	leaq	-8(%rbx,%rcx,8), %rdi
	.p2align 4
	.p2align 3
.L238:
	movq	(%rdx), %rbx
	testq	%rbx, %rbx
	je	.L237
	leaq	1(%rbx), %rsi
	cmpq	%rcx, %rsi
	jnb	.L237
	movl	-4(%rax,%rbx,4), %esi
	movl	(%rax,%rbx,4), %ebp
	imull	%r8d, %esi
	imull	%r9d, %ebp
	addl	%ebp, %esi
	movl	4(%rax,%rbx,4), %ebp
	imull	%r11d, %ebp
	addl	%ebp, %esi
	movl	%esi, (%r10,%rbx,4)
.L237:
	addq	$8, %rdx
	cmpq	%rdi, %rdx
	jne	.L238
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L268:
	cmpq	$2, %rcx
	jbe	.L224
	cmpl	$1, 112(%rsp)
	jne	.L269
	leaq	-2(%rcx), %rbp
	movl	$1, %ebx
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L236:
	leaq	1(%rbx), %rsi
	cmpq	%rcx, %rsi
	jnb	.L235
	movl	(%rax,%rbx,4), %edi
	movl	-4(%rax,%rbx,4), %r12d
	imull	%r9d, %edi
	imull	%r8d, %r12d
	addl	%r12d, %edi
	movl	4(%rax,%rbx,4), %r12d
	imull	%r11d, %r12d
	addl	%r12d, %edi
	movl	%edi, (%r10,%rbx,4)
.L235:
	incq	%rdx
	movq	%rsi, %rbx
	cmpq	%rbp, %rdx
	jne	.L236
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.p2align 3
.L267:
	leaq	-2(%rcx), %rsi
	cmpq	$6, %rdx
	jbe	.L221
	movq	%rsi, %rbx
	vmovd	%r8d, %xmm4
	vmovd	%r9d, %xmm3
	vmovd	%r11d, %xmm2
	shrq	$3, %rbx
	vpbroadcastd	%xmm4, %ymm4
	vpbroadcastd	%xmm3, %ymm3
	vpbroadcastd	%xmm2, %ymm2
	salq	$5, %rbx
	xorl	%edx, %edx
	.p2align 4
	.p2align 3
.L222:
	vpmulld	4(%rax,%rdx), %ymm3, %ymm1
	vpmulld	(%rax,%rdx), %ymm4, %ymm0
	vpaddd	%ymm1, %ymm0, %ymm0
	vpmulld	8(%rax,%rdx), %ymm2, %ymm1
	vpaddd	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 4(%r10,%rdx)
	addq	$32, %rdx
	cmpq	%rbx, %rdx
	jne	.L222
	movq	%rsi, %rdx
	andq	$-8, %rdx
	andl	$7, %esi
	leaq	2(%rdx), %rdi
	leaq	1(%rdx), %rbp
	je	.L264
	movq	%rcx, %rsi
	subq	%rdx, %rsi
	leaq	-2(%rsi), %rbx
	subq	$3, %rsi
	cmpq	$2, %rsi
	jbe	.L265
	vzeroupper
.L239:
	vmovd	%r8d, %xmm5
	vmovd	%r11d, %xmm2
	vpshufd	$0, %xmm5, %xmm0
	vmovd	%r9d, %xmm5
	vpmulld	(%rax,%rdx,4), %xmm0, %xmm0
	vpshufd	$0, %xmm5, %xmm1
	vpmulld	4(%rax,%rdx,4), %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpshufd	$0, %xmm2, %xmm1
	vpmulld	8(%rax,%rdx,4), %xmm1, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovdqu	%xmm0, 4(%r10,%rdx,4)
	movq	%rbx, %rdx
	andq	$-4, %rdx
	addq	%rdx, %rdi
	addq	%rdx, %rbp
	andl	$3, %ebx
	je	.L224
.L226:
	movl	-4(%rax,%rbp,4), %ebx
	movl	(%rax,%rbp,4), %r12d
	leaq	0(,%rdi,4), %rdx
	leaq	(%rax,%rdx), %rsi
	imull	%r9d, %r12d
	imull	%r8d, %ebx
	addl	%r12d, %ebx
	movl	(%rsi), %r12d
	imull	%r11d, %r12d
	addl	%r12d, %ebx
	movl	%ebx, (%r10,%rbp,4)
	leaq	1(%rdi), %rbx
	cmpq	%rcx, %rbx
	jnb	.L224
	movl	-4(%rax,%rdx), %ebx
	movl	(%rsi), %r13d
	leaq	4(%rax,%rdx), %r12
	addq	$2, %rdi
	imull	%r9d, %r13d
	imull	%r8d, %ebx
	addl	%r13d, %ebx
	movl	(%r12), %r13d
	imull	%r11d, %r13d
	addl	%r13d, %ebx
	movl	%ebx, (%r10,%rdx)
	cmpq	%rcx, %rdi
	jnb	.L224
	imull	(%rsi), %r8d
	imull	(%r12), %r9d
	imull	8(%rax,%rdx), %r11d
	addl	%r9d, %r8d
	leal	(%r8,%r11), %eax
	movl	%eax, 4(%r10,%rdx)
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L269:
	movslq	112(%rsp), %rdx
	leaq	-2(%rcx), %rbp
	xorl	%esi, %esi
	movq	%rdx, %rbx
	.p2align 4
	.p2align 3
.L232:
	testq	%rbx, %rbx
	je	.L233
	leaq	1(%rbx), %rdi
	cmpq	%rcx, %rdi
	jnb	.L233
	movl	-4(%rax,%rbx,4), %edi
	movl	(%rax,%rbx,4), %r12d
	imull	%r8d, %edi
	imull	%r9d, %r12d
	addl	%r12d, %edi
	movl	4(%rax,%rbx,4), %r12d
	imull	%r11d, %r12d
	addl	%r12d, %edi
	movl	%edi, (%r10,%rbx,4)
.L233:
	incq	%rsi
	addq	%rdx, %rbx
	cmpq	%rbp, %rsi
	jne	.L232
	jmp	.L224
.L264:
	vzeroupper
	jmp	.L224
.L221:
	movq	%rsi, %rbx
	xorl	%edx, %edx
	movl	$1, %ebp
	movl	$2, %edi
	jmp	.L239
.L265:
	vzeroupper
	jmp	.L226
	.seh_endproc
	.section	.text$_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	.def	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv:
.LFB12533:
	subq	$88, %rsp
	.seh_stackalloc	88
	vmovaps	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	vmovaps	%xmm7, 16(%rsp)
	.seh_savexmm	%xmm7, 16
	vmovaps	%xmm8, 32(%rsp)
	.seh_savexmm	%xmm8, 32
	vmovaps	%xmm9, 48(%rsp)
	.seh_savexmm	%xmm9, 48
	vmovaps	%xmm10, 64(%rsp)
	.seh_savexmm	%xmm10, 64
	.seh_endprologue
	vpxor	%xmm6, %xmm6, %xmm6
	movq	%rcx, %rdx
	leaq	896(%rcx), %r8
	movq	%rcx, %rax
	movl	$-2147483648, %ecx
	vmovd	%ecx, %xmm5
	movl	$2147483647, %ecx
	vmovd	%ecx, %xmm4
	movl	$1, %ecx
	vpbroadcastd	%xmm5, %ymm5
	vmovd	%ecx, %xmm3
	movl	$-1727483681, %ecx
	vpbroadcastd	%xmm4, %ymm4
	vmovd	%ecx, %xmm2
	vpbroadcastd	%xmm3, %ymm3
	vpbroadcastd	%xmm2, %ymm2
	.p2align 4
	.p2align 3
.L271:
	vpand	4(%rax), %ymm4, %ymm1
	vpand	(%rax), %ymm5, %ymm0
	addq	$32, %rax
	vpor	%ymm1, %ymm0, %ymm0
	vpsrld	$1, %ymm0, %ymm1
	vpxor	1556(%rax), %ymm1, %ymm1
	vpand	%ymm3, %ymm0, %ymm0
	vpsubd	%ymm0, %ymm6, %ymm0
	vpand	%ymm2, %ymm0, %ymm0
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, -32(%rax)
	cmpq	%r8, %rax
	jne	.L271
	movl	900(%rdx), %eax
	movl	896(%rdx), %ecx
	movl	$-2147483648, %r9d
	movl	$2147483647, %r10d
	vmovd	%r9d, %xmm2
	movl	$1, %r11d
	movl	$-1727483681, %r9d
	vmovd	%r10d, %xmm8
	vmovd	%r11d, %xmm10
	vmovd	%r9d, %xmm9
	vpbroadcastd	%xmm2, %ymm7
	vpbroadcastd	%xmm8, %ymm6
	vpbroadcastd	%xmm10, %ymm5
	vpxor	%xmm4, %xmm4, %xmm4
	vpbroadcastd	%xmm9, %ymm3
	movl	%eax, %r8d
	andl	$-2147483648, %ecx
	andl	$-2147483648, %eax
	andl	$2147483647, %r8d
	orl	%r8d, %ecx
	movl	%ecx, %r8d
	andl	$1, %ecx
	shrl	%r8d
	xorl	2484(%rdx), %r8d
	negl	%ecx
	andl	$-1727483681, %ecx
	xorl	%r8d, %ecx
	movl	%ecx, 896(%rdx)
	movl	904(%rdx), %ecx
	movl	%ecx, %r8d
	andl	$-2147483648, %ecx
	andl	$2147483647, %r8d
	orl	%r8d, %eax
	movl	%eax, %r8d
	andl	$1, %eax
	shrl	%r8d
	xorl	2488(%rdx), %r8d
	negl	%eax
	andl	$-1727483681, %eax
	xorl	%r8d, %eax
	movl	%eax, 900(%rdx)
	movl	908(%rdx), %eax
	andl	$2147483647, %eax
	orl	%eax, %ecx
	andl	$1, %eax
	shrl	%ecx
	xorl	2492(%rdx), %ecx
	negl	%eax
	andl	$-1727483681, %eax
	xorl	%ecx, %eax
	leaq	2476(%rdx), %rcx
	movl	%eax, 904(%rdx)
	leaq	908(%rdx), %rax
	.p2align 4
	.p2align 3
.L272:
	vpand	4(%rax), %ymm6, %ymm1
	addq	$32, %rax
	vpand	-32(%rax), %ymm7, %ymm0
	vpor	%ymm1, %ymm0, %ymm0
	vpsrld	$1, %ymm0, %ymm1
	vpxor	-940(%rax), %ymm1, %ymm1
	vpand	%ymm5, %ymm0, %ymm0
	vpsubd	%ymm0, %ymm4, %ymm0
	vpand	%ymm3, %ymm0, %ymm0
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, -32(%rax)
	cmpq	%rax, %rcx
	jne	.L272
	vpshufd	$0, %xmm2, %xmm0
	vpshufd	$0, %xmm8, %xmm8
	vpand	2476(%rdx), %xmm0, %xmm0
	vpand	2480(%rdx), %xmm8, %xmm8
	movl	2492(%rdx), %eax
	movl	(%rdx), %ecx
	vpshufd	$0, %xmm10, %xmm10
	movq	$0, 2496(%rdx)
	vpxor	%xmm2, %xmm2, %xmm2
	vpshufd	$0, %xmm9, %xmm9
	andl	$2147483647, %ecx
	andl	$-2147483648, %eax
	orl	%ecx, %eax
	movl	%eax, %ecx
	andl	$1, %eax
	vpor	%xmm8, %xmm0, %xmm0
	shrl	%ecx
	xorl	1584(%rdx), %ecx
	negl	%eax
	vpsrld	$1, %xmm0, %xmm1
	vpxor	1568(%rdx), %xmm1, %xmm1
	vpand	%xmm10, %xmm0, %xmm0
	andl	$-1727483681, %eax
	vpsubd	%xmm0, %xmm2, %xmm0
	vpand	%xmm9, %xmm0, %xmm0
	xorl	%ecx, %eax
	movl	%eax, 2492(%rdx)
	vpxor	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, 2476(%rdx)
	vzeroupper
	vmovaps	(%rsp), %xmm6
	vmovaps	16(%rsp), %xmm7
	vmovaps	32(%rsp), %xmm8
	vmovaps	48(%rsp), %xmm9
	vmovaps	64(%rsp), %xmm10
	addq	$88, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "unit-stride\0"
.LC16:
	.ascii "gather\0"
.LC17:
	.ascii "strided\0"
.LC18:
	.ascii "sweep\0"
.LC19:
	.ascii "l1small\0"
.LC20:
	.ascii "l1large\0"
.LC21:
	.ascii "Array size N = %zu\12\0"
	.align 8
.LC24:
	.ascii "Timing kernel %s over %d runs...\12\0"
.LC28:
	.ascii ",\0"
.LC29:
	.ascii "\12\0"
	.text
	.p2align 4
	.def	_Z8run_demoIiEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z8run_demoIiEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0
_Z8run_demoIiEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0:
.LFB12605:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$3016, %rsp
	.seh_stackalloc	3016
	vmovaps	%xmm6, 2864(%rsp)
	.seh_savexmm	%xmm6, 2864
	vmovaps	%xmm7, 2880(%rsp)
	.seh_savexmm	%xmm7, 2880
	vmovaps	%xmm8, 2896(%rsp)
	.seh_savexmm	%xmm8, 2896
	vmovaps	%xmm9, 2912(%rsp)
	.seh_savexmm	%xmm9, 2912
	vmovaps	%xmm10, 2928(%rsp)
	.seh_savexmm	%xmm10, 2928
	vmovaps	%xmm11, 2944(%rsp)
	.seh_savexmm	%xmm11, 2944
	vmovaps	%xmm12, 2960(%rsp)
	.seh_savexmm	%xmm12, 2960
	vmovaps	%xmm13, 2976(%rsp)
	.seh_savexmm	%xmm13, 2976
	vmovaps	%xmm14, 2992(%rsp)
	.seh_savexmm	%xmm14, 2992
	.seh_endprologue
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	.LC18(%rip), %rdx
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rcx
	vmovdqa	%xmm0, 160(%rsp)
	movq	$0, 176(%rsp)
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L276
	leaq	352(%rsp), %r14
	leaq	160(%rsp), %rax
	movq	%r14, %rcx
	movq	%rax, 152(%rsp)
.LEHB7:
	call	_Z11get_sweep_Nv
	leaq	160(%rsp), %rax
	movq	%r14, %rdx
	movq	%rax, %rcx
	movq	%rax, 152(%rsp)
	call	_ZNSt6vectorIySaIyEEaSEOS1_.isra.0
	movq	%r14, %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
.L277:
	movq	168(%rsp), %rax
	movq	160(%rsp), %rdi
	vxorps	%xmm7, %xmm7, %xmm7
	leaq	.LC28(%rip), %rbx
	vmovss	.LC22(%rip), %xmm9
	movq	%rax, 144(%rsp)
	movq	%rdi, 136(%rsp)
	cmpq	%rax, %rdi
	je	.L378
.L379:
	cmpb	$0, g_tail(%rip)
	movq	136(%rsp), %rax
	movq	(%rax), %rbp
	je	.L282
	addq	$3, %rbp
.L282:
	movq	%rbp, %rdx
	leaq	.LC21(%rip), %rcx
	call	_ZL6printfPKcz
	movq	%rbp, %rax
	shrq	$61, %rax
	jne	.L529
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 200(%rsp)
	testq	%rbp, %rbp
	je	.L284
	leaq	0(,%rbp,4), %r12
	movq	%r12, %rcx
	call	_Znwy
.LEHE7:
	leaq	(%rax,%r12), %rsi
	movq	%rax, 88(%rsp)
	movq	%rax, 192(%rsp)
	movl	$0, (%rax)
	leaq	4(%rax), %rdi
	movq	%rbp, %rax
	movq	%rsi, 208(%rsp)
	decq	%rax
	movq	%rax, 96(%rsp)
	je	.L285
	cmpq	%rsi, %rdi
	je	.L289
	leaq	-4(%r12), %r8
	xorl	%edx, %edx
	movq	%rdi, %rcx
	call	memset
.L289:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, 200(%rsp)
	vmovdqu	%xmm0, 232(%rsp)
.L287:
	movq	%r12, %rcx
.LEHB8:
	call	_Znwy
.LEHE8:
	cmpq	$0, 96(%rsp)
	leaq	(%rax,%r12), %r15
	movq	%rax, %r13
	movq	%rax, 224(%rsp)
	movq	%r15, 240(%rsp)
	movl	$0, (%rax)
	leaq	4(%rax), %rsi
	je	.L290
	cmpq	%r15, %rsi
	je	.L293
	leaq	-4(%r12), %r8
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	memset
.L293:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r15, 232(%rsp)
	vmovdqu	%xmm0, 264(%rsp)
.L292:
	movq	%r12, %rcx
.LEHB9:
	call	_Znwy
.LEHE9:
	cmpq	$0, 96(%rsp)
	leaq	(%rax,%r12), %r10
	movq	%rax, %r9
	movq	%rax, 256(%rsp)
	movq	%r10, 272(%rsp)
	movl	$0, (%rax)
	leaq	4(%rax), %r15
	je	.L394
	cmpq	%r15, %r10
	je	.L288
	leaq	-4(%r12), %r8
	xorl	%edx, %edx
	movq	%r15, %rcx
	movq	%r10, 96(%rsp)
	movq	%rax, 104(%rsp)
	call	memset
	movq	96(%rsp), %r10
	movq	104(%rsp), %r9
.L288:
	cmpb	$0, g_aligned(%rip)
	movl	$42, %eax
	movq	%r10, 264(%rsp)
	movl	$42, 352(%rsp)
	movl	$1, %ecx
	movl	%eax, %edx
	cmovne	88(%rsp), %rdi
	cmovne	%r13, %rsi
	cmovne	%r9, %r15
	.p2align 4
	.p2align 3
.L296:
	movl	%edx, %eax
	shrl	$30, %eax
	xorl	%edx, %eax
	imull	$1812433253, %eax, %eax
	leal	(%rax,%rcx), %edx
	movl	%edx, (%r14,%rcx,4)
	incq	%rcx
	cmpq	$624, %rcx
	jne	.L296
	movq	$624, 2848(%rsp)
	xorl	%r12d, %r12d
	testq	%rbp, %rbp
	jne	.L297
	jmp	.L314
	.p2align 4
	.p2align 3
.L304:
	movl	352(%rsp,%rcx,4), %eax
	leaq	1(%rcx), %r8
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L396
	vcvttss2sil	%xmm1, %eax
.L302:
	movl	%eax, (%rdi,%r12,4)
	cmpq	$623, %r8
	ja	.L530
.L305:
	movl	352(%rsp,%r8,4), %eax
	leaq	1(%r8), %rdx
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$7, %ecx
	andl	$-1658038656, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$15, %ecx
	andl	$-272236544, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$18, %ecx
	xorl	%ecx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L397
	vcvttss2sil	%xmm1, %eax
.L308:
	movl	%eax, (%rsi,%r12,4)
	cmpq	$623, %rdx
	ja	.L531
.L309:
	movl	352(%rsp,%rdx,4), %eax
	leaq	1(%rdx), %rcx
	movq	%rcx, 2848(%rsp)
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L312
	vcvttss2sil	%xmm1, %eax
	movl	%eax, (%r15,%r12,4)
	incq	%r12
	cmpq	%r12, %rbp
	je	.L314
.L297:
	cmpq	$623, %rcx
	jbe	.L304
	movq	%r14, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %rcx
	jmp	.L304
	.p2align 4
	.p2align 3
.L531:
	movq	%r14, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %rdx
	jmp	.L309
	.p2align 4
	.p2align 3
.L530:
	movq	%r14, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %r8
	jmp	.L305
.L312:
	movl	$0, (%r15,%r12,4)
	incq	%r12
	cmpq	%r12, %rbp
	jne	.L297
.L314:
	cmpl	$2, g_access_pattern(%rip)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 304(%rsp)
	vmovdqa	%xmm0, 288(%rsp)
	je	.L532
.L299:
	movq	$0, 88(%rsp)
.L315:
	leaq	336(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1347961171, 336(%rsp)
	movq	%rax, %rdx
	movq	%rax, 120(%rsp)
	movq	%rax, 320(%rsp)
	movb	$89, 340(%rsp)
	movq	$5, 328(%rsp)
	movb	$0, 341(%rsp)
.LEHB10:
	call	_ZL6printfPKcz
	vmovsd	.LC25(%rip), %xmm6
	leaq	0(,%rbp,8), %rax
	vmovsd	.LC26(%rip), %xmm8
	vcvtsi2sdq	%rbp, %xmm7, %xmm10
	vmovsd	.LC14(%rip), %xmm12
	movq	%rax, 128(%rsp)
	leaq	-1(%rbp), %rax
	xorl	%r13d, %r13d
	movq	%rax, 96(%rsp)
	movq	%rbp, %rax
	shrq	$3, %rax
	salq	$5, %rax
	movq	%rax, 104(%rsp)
	movq	%rbp, %rax
	andq	$-8, %rax
	movq	%rax, 112(%rsp)
	vmulsd	%xmm6, %xmm10, %xmm11
	.p2align 4
	.p2align 3
.L332:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L316
	testq	%rbp, %rbp
	je	.L322
	xorl	%eax, %eax
	cmpq	$6, 96(%rsp)
	jbe	.L319
	movq	104(%rsp), %rdx
	.p2align 4
	.p2align 3
.L320:
	vmovdqu	(%rdi,%rax), %ymm3
	vpslld	$1, %ymm3, %ymm0
	vpaddd	%ymm3, %ymm0, %ymm0
	vpaddd	(%rsi,%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L320
	testb	$7, %bpl
	je	.L524
	movq	112(%rsp), %rax
	vzeroupper
.L319:
	movq	%rbp, %rdx
	subq	%rax, %rdx
	leaq	-1(%rdx), %rcx
	cmpq	$2, %rcx
	jbe	.L324
	leaq	0(,%rax,4), %r8
	vmovdqu	(%rdi,%r8), %xmm1
	leaq	(%rsi,%r8), %rcx
	vpslld	$1, %xmm1, %xmm0
	vpaddd	%xmm1, %xmm0, %xmm0
	vpaddd	(%rcx), %xmm0, %xmm0
	vmovdqu	%xmm0, (%rcx)
	movq	%rdx, %rcx
	andq	$-4, %rcx
	addq	%rcx, %rax
	andl	$3, %edx
	je	.L322
.L324:
	leaq	0(,%rax,4), %rdx
	movl	(%rdi,%rdx), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ecx, (%rsi,%rdx)
	leaq	1(%rax), %rcx
	cmpq	%rbp, %rcx
	jnb	.L322
	movl	4(%rdi,%rdx), %ecx
	addq	$2, %rax
	leal	(%rcx,%rcx,2), %ecx
	addl	%ecx, 4(%rsi,%rdx)
	cmpq	%rbp, %rax
	jnb	.L322
	movl	8(%rdi,%rdx), %eax
	leal	(%rax,%rax,2), %eax
	addl	%eax, 8(%rsi,%rdx)
.L322:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	328(%rsp), %r8
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm13
	vmulsd	%xmm8, %xmm13, %xmm13
	vcmpeq_ussd	%xmm0, %xmm13, %xmm0
	vblendvpd	%xmm0, %xmm12, %xmm13, %xmm13
	vdivsd	%xmm13, %xmm11, %xmm14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm13, %xmm13, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm14, %xmm14, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	_Z6g_typeB5cxx11(%rip), %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L331
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rax
	cmovne	%rax, %rdx
.L331:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE10:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L332
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L333
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L333:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$20292, 336(%rsp)
	movb	$84, 338(%rsp)
	movq	$3, 328(%rsp)
	movb	$0, 339(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB11:
	call	_ZL6printfPKcz
	vmovsd	.LC14(%rip), %xmm12
	vmulsd	%xmm6, %xmm10, %xmm11
	xorl	%r13d, %r13d
	.p2align 4
	.p2align 3
.L349:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rcx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L334
	testq	%rbp, %rbp
	je	.L335
	cmpq	$6, 96(%rsp)
	jbe	.L403
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	vpxor	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L337:
	vmovdqu	(%rsi,%rax), %ymm4
	vpmulld	(%rdi,%rax), %ymm4, %ymm0
	addq	$32, %rax
	vpaddd	%ymm0, %ymm1, %ymm1
	cmpq	%rdx, %rax
	jne	.L337
	vextracti128	$0x1, %ymm1, %xmm0
	vpaddd	%xmm1, %xmm0, %xmm1
	vpsrldq	$8, %xmm1, %xmm0
	vpaddd	%xmm0, %xmm1, %xmm0
	vpsrldq	$4, %xmm0, %xmm2
	vpaddd	%xmm2, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	testb	$7, %bpl
	je	.L525
	movq	112(%rsp), %rdx
	vzeroupper
.L336:
	movq	%rbp, %rcx
	subq	%rdx, %rcx
	leaq	-1(%rcx), %r8
	cmpq	$2, %r8
	jbe	.L340
	vmovdqu	(%rdi,%rdx,4), %xmm2
	movq	%rcx, %r8
	vpmulld	(%rsi,%rdx,4), %xmm2, %xmm0
	andq	$-4, %r8
	addq	%r8, %rdx
	andl	$3, %ecx
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$8, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpaddd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	je	.L335
.L340:
	leaq	0(,%rdx,4), %rcx
	movl	(%rsi,%rcx), %r8d
	imull	(%rdi,%rcx), %r8d
	addl	%r8d, %eax
	leaq	1(%rdx), %r8
	cmpq	%rbp, %r8
	jnb	.L335
	movl	4(%rdi,%rcx), %r8d
	imull	4(%rsi,%rcx), %r8d
	addq	$2, %rdx
	addl	%r8d, %eax
	cmpq	%rbp, %rdx
	jnb	.L335
	movl	8(%rdi,%rcx), %edx
	imull	8(%rsi,%rcx), %edx
	addl	%edx, %eax
.L335:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	328(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm12, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm11, %xmm13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm13, %xmm13, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L348
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L348:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE11:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L349
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L350
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L350:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$21837, 336(%rsp)
	movb	$76, 338(%rsp)
	movq	$3, 328(%rsp)
	movb	$0, 339(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB12:
	call	_ZL6printfPKcz
	vmovsd	.LC14(%rip), %xmm12
	vmulsd	%xmm8, %xmm10, %xmm11
	xorl	%r13d, %r13d
	.p2align 4
	.p2align 3
.L367:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L351
	testq	%rbp, %rbp
	je	.L357
	xorl	%eax, %eax
	cmpq	$6, 96(%rsp)
	jbe	.L354
	movq	104(%rsp), %rdx
	.p2align 4
	.p2align 3
.L355:
	vmovdqu	(%rsi,%rax), %ymm5
	vpmulld	(%rdi,%rax), %ymm5, %ymm0
	vmovdqu	%ymm0, (%r15,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L355
	testb	$7, %bpl
	je	.L526
	movq	112(%rsp), %rax
	vzeroupper
.L354:
	movq	%rbp, %rcx
	subq	%rax, %rcx
	leaq	-1(%rcx), %rdx
	cmpq	$2, %rdx
	jbe	.L359
	leaq	0(,%rax,4), %rdx
	vmovdqu	(%rsi,%rdx), %xmm2
	vpmulld	(%rdi,%rdx), %xmm2, %xmm0
	vmovdqu	%xmm0, (%r15,%rdx)
	movq	%rcx, %rdx
	andq	$-4, %rdx
	addq	%rdx, %rax
	andl	$3, %ecx
	je	.L357
.L359:
	leaq	0(,%rax,4), %rdx
	movl	(%rdi,%rdx), %ecx
	imull	(%rsi,%rdx), %ecx
	movl	%ecx, (%r15,%rdx)
	leaq	1(%rax), %rcx
	cmpq	%rbp, %rcx
	jnb	.L357
	movl	4(%rdi,%rdx), %r8d
	imull	4(%rsi,%rdx), %r8d
	addq	$2, %rax
	movl	%r8d, 4(%r15,%rdx)
	cmpq	%rbp, %rax
	jnb	.L357
	movl	8(%rsi,%rdx), %eax
	imull	8(%rdi,%rdx), %eax
	movl	%eax, 8(%r15,%rdx)
.L357:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	328(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm12, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm11, %xmm13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm13, %xmm13, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L366
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L366:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE12:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L367
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L368
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L368:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1313166419, 336(%rsp)
	movq	$7, 328(%rsp)
	movl	$1279869774, 339(%rsp)
	movb	$0, 343(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB13:
	call	_ZL6printfPKcz
	vmulsd	.LC30(%rip), %xmm10, %xmm10
	vmovsd	.LC14(%rip), %xmm11
	xorl	%r13d, %r13d
	leaq	.LC15(%rip), %r15
	.p2align 4
	.p2align 3
.L371:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movl	$1, %r8d
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r12
	movq	88(%rsp), %rax
	movl	$2, %r9d
	movq	%rbp, 40(%rsp)
	movl	$3, 32(%rsp)
	movq	%rax, 64(%rsp)
	movl	g_stride(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	g_access_pattern(%rip), %eax
	movl	%eax, 48(%rsp)
	call	_Z14stencil_scalarIiEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	328(%rsp), %r8
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm11, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm10, %xmm12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm12, %xmm12, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	movq	%r15, %rdx
	testl	%eax, %eax
	je	.L370
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L370:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE13:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L371
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L372
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L372:
	movq	288(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L373
	movq	304(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L373:
	movq	256(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L374
	movq	272(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L374:
	movq	224(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L375
	movq	240(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L375:
	movq	192(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L376
	movq	208(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
	addq	$8, 136(%rsp)
	movq	136(%rsp), %rax
	cmpq	%rax, 144(%rsp)
	jne	.L379
.L378:
	movq	152(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	nop
	vmovaps	2864(%rsp), %xmm6
	vmovaps	2880(%rsp), %xmm7
	vmovaps	2896(%rsp), %xmm8
	vmovaps	2912(%rsp), %xmm9
	vmovaps	2928(%rsp), %xmm10
	vmovaps	2944(%rsp), %xmm11
	vmovaps	2960(%rsp), %xmm12
	vmovaps	2976(%rsp), %xmm13
	vmovaps	2992(%rsp), %xmm14
	addq	$3016, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4
	.p2align 3
.L351:
	cmpl	$1, %eax
	je	.L533
	cmpl	$2, %eax
	jne	.L357
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L357
	testq	%rbp, %rbp
	je	.L357
	movq	(%rax), %rdx
	movq	128(%rsp), %rax
	leaq	(%rax,%rdx), %r8
	.p2align 4
	.p2align 3
.L365:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$2, %rax
	movl	(%rdi,%rax), %ecx
	imull	(%rsi,%rax), %ecx
	movl	%ecx, (%r15,%rax)
	cmpq	%rdx, %r8
	jne	.L365
	jmp	.L357
	.p2align 4
	.p2align 3
.L334:
	cmpl	$1, %eax
	je	.L534
	cmpl	$2, %eax
	jne	.L407
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L407
	testq	%rbp, %rbp
	je	.L407
	movq	(%rax), %rdx
	movq	128(%rsp), %rax
	leaq	(%rax,%rdx), %r9
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L346:
	movq	(%rdx), %r8
	addq	$8, %rdx
	movl	(%rdi,%r8,4), %ecx
	imull	(%rsi,%r8,4), %ecx
	addl	%ecx, %eax
	cmpq	%rdx, %r9
	jne	.L346
	jmp	.L335
	.p2align 4
	.p2align 3
.L316:
	cmpl	$1, %eax
	je	.L535
	cmpl	$2, %eax
	jne	.L322
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L322
	testq	%rbp, %rbp
	je	.L322
	movq	(%rax), %rdx
	movq	128(%rsp), %rax
	leaq	(%rax,%rdx), %r8
	.p2align 4
	.p2align 3
.L330:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$2, %rax
	movl	(%rdi,%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ecx, (%rsi,%rax)
	cmpq	%r8, %rdx
	jne	.L330
	jmp	.L322
	.p2align 4
	.p2align 3
.L407:
	xorl	%eax, %eax
	jmp	.L335
	.p2align 4
	.p2align 3
.L533:
	testq	%rbp, %rbp
	je	.L357
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L363
	.p2align 4
	.p2align 3
.L362:
	movl	(%rsi,%rax,4), %edx
	imull	(%rdi,%rax,4), %edx
	movl	%edx, (%r15,%rax,4)
	incq	%rax
	cmpq	%rbp, %rax
	jb	.L362
	jmp	.L357
	.p2align 4
	.p2align 3
.L363:
	movl	(%rdi,%rax,4), %ecx
	imull	(%rsi,%rax,4), %ecx
	movl	%ecx, (%r15,%rax,4)
	addq	%rdx, %rax
	cmpq	%rbp, %rax
	jb	.L363
	jmp	.L357
	.p2align 4
	.p2align 3
.L534:
	testq	%rbp, %rbp
	je	.L407
	xorl	%edx, %edx
	xorl	%eax, %eax
	cmpl	$1, %ecx
	jne	.L344
	.p2align 4
	.p2align 3
.L343:
	movl	(%rsi,%rdx,4), %ecx
	imull	(%rdi,%rdx,4), %ecx
	incq	%rdx
	addl	%ecx, %eax
	cmpq	%rbp, %rdx
	jb	.L343
	jmp	.L335
	.p2align 4
	.p2align 3
.L344:
	movl	(%rdi,%rdx,4), %r8d
	imull	(%rsi,%rdx,4), %r8d
	addq	%rcx, %rdx
	addl	%r8d, %eax
	cmpq	%rbp, %rdx
	jb	.L344
	jmp	.L335
	.p2align 4
	.p2align 3
.L535:
	testq	%rbp, %rbp
	je	.L322
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L328
	.p2align 4
	.p2align 3
.L327:
	movl	(%rdi,%rax,4), %edx
	leal	(%rdx,%rdx,2), %edx
	addl	%edx, (%rsi,%rax,4)
	incq	%rax
	cmpq	%rbp, %rax
	jb	.L327
	jmp	.L322
	.p2align 4
	.p2align 3
.L328:
	movl	(%rdi,%rax,4), %ecx
	leal	(%rcx,%rcx,2), %ecx
	addl	%ecx, (%rsi,%rax,4)
	addq	%rdx, %rax
	cmpq	%rbp, %rax
	jb	.L328
	jmp	.L322
.L396:
	xorl	%eax, %eax
	jmp	.L302
.L397:
	xorl	%eax, %eax
	jmp	.L308
.L284:
	movq	$0, 208(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	movq	$0, 240(%rsp)
	movl	$4, %r15d
	vmovdqa	%xmm0, 224(%rsp)
	movq	$0, 256(%rsp)
	movq	$0, 272(%rsp)
	movl	$4, %esi
	movl	$4, %edi
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	movq	$0, 88(%rsp)
	xorl	%r10d, %r10d
	jmp	.L288
.L376:
	addq	$8, 136(%rsp)
	movq	136(%rsp), %rax
	cmpq	%rax, 144(%rsp)
	jne	.L379
	jmp	.L378
.L526:
	vzeroupper
	jmp	.L357
.L524:
	vzeroupper
	jmp	.L322
.L525:
	vzeroupper
	jmp	.L335
.L403:
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%edx, %edx
	jmp	.L336
.L532:
	movl	g_stride(%rip), %r8d
	leaq	320(%rsp), %rcx
	movq	%rbp, %rdx
.LEHB14:
	call	_Z19make_gather_indicesyi
.LEHE14:
	vmovdqa	320(%rsp), %xmm2
	cmpl	$2, g_access_pattern(%rip)
	movq	336(%rsp), %rax
	movq	%rax, 304(%rsp)
	vmovdqa	%xmm2, 288(%rsp)
	jne	.L299
	leaq	288(%rsp), %rax
	movq	%rax, 88(%rsp)
	jmp	.L315
.L285:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rdi, 200(%rsp)
	vmovdqu	%xmm0, 232(%rsp)
	jmp	.L287
.L290:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, 232(%rsp)
	vmovdqu	%xmm0, 264(%rsp)
	jmp	.L292
.L394:
	movq	%r15, %r10
	jmp	.L288
.L276:
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %rax
	cmpq	$7, %rax
	je	.L536
	cmpq	$2, %rax
	je	.L537
	cmpq	$4, %rax
	jne	.L392
	movq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movl	$64, %edx
	cmpl	$1835102820, (%rax)
	movl	$1073741824, %eax
	cmovne	%rdx, %rax
	jmp	.L279
.L536:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rbx
	leaq	.LC19(%rip), %rdx
	movl	$7, %r8d
	movq	%rbx, %rcx
	call	memcmp
	movl	%eax, %edx
	movl	$32768, %eax
	testl	%edx, %edx
	je	.L279
	movl	$7, %r8d
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rcx
	call	memcmp
	cmpl	$1, %eax
	sbbq	%rax, %rax
	andl	$196544, %eax
	addq	$64, %rax
.L279:
	shrq	$3, %rax
	leaq	352(%rsp), %r14
	leaq	360(%rsp), %r8
	movq	%rax, 352(%rsp)
	leaq	160(%rsp), %rax
	movq	%r14, %rdx
	movq	%rax, %rcx
	movq	%rax, 152(%rsp)
.LEHB15:
	call	_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0
	jmp	.L277
.L537:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rdx
	movl	$524288, %eax
	cmpw	$12908, (%rdx)
	je	.L279
	cmpw	$13164, (%rdx)
	movl	$8388608, %eax
	movl	$64, %edx
	cmovne	%rdx, %rax
	jmp	.L279
.L529:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE15:
.L392:
	movl	$64, %eax
	jmp	.L279
.L423:
.L528:
	leaq	320(%rsp), %rcx
	movq	%rax, %rbx
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L381:
	leaq	288(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	leaq	256(%rsp), %rcx
	call	_ZNSt6vectorIiSaIiEED1Ev
.L385:
	leaq	224(%rsp), %rcx
	call	_ZNSt6vectorIiSaIiEED1Ev
.L386:
	leaq	192(%rsp), %rcx
	call	_ZNSt6vectorIiSaIiEED1Ev
.L387:
	movq	152(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	movq	%rbx, %rcx
.LEHB16:
	call	_Unwind_Resume
.LEHE16:
.L424:
	jmp	.L528
.L422:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L381
.L421:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L385
.L425:
	jmp	.L528
.L419:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L387
.L420:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L386
.L426:
	jmp	.L528
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA12605:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12605-.LLSDACSB12605
.LLSDACSB12605:
	.uleb128 .LEHB7-.LFB12605
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L419-.LFB12605
	.uleb128 0
	.uleb128 .LEHB8-.LFB12605
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L420-.LFB12605
	.uleb128 0
	.uleb128 .LEHB9-.LFB12605
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L421-.LFB12605
	.uleb128 0
	.uleb128 .LEHB10-.LFB12605
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L426-.LFB12605
	.uleb128 0
	.uleb128 .LEHB11-.LFB12605
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L425-.LFB12605
	.uleb128 0
	.uleb128 .LEHB12-.LFB12605
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L424-.LFB12605
	.uleb128 0
	.uleb128 .LEHB13-.LFB12605
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L423-.LFB12605
	.uleb128 0
	.uleb128 .LEHB14-.LFB12605
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L422-.LFB12605
	.uleb128 0
	.uleb128 .LEHB15-.LFB12605
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L419-.LFB12605
	.uleb128 0
	.uleb128 .LEHB16-.LFB12605
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
.LLSDACSE12605:
	.text
	.seh_endproc
	.p2align 4
	.def	_Z8run_demoIdEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z8run_demoIdEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0
_Z8run_demoIdEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0:
.LFB12616:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$3032, %rsp
	.seh_stackalloc	3032
	vmovaps	%xmm6, 2864(%rsp)
	.seh_savexmm	%xmm6, 2864
	vmovaps	%xmm7, 2880(%rsp)
	.seh_savexmm	%xmm7, 2880
	vmovaps	%xmm8, 2896(%rsp)
	.seh_savexmm	%xmm8, 2896
	vmovaps	%xmm9, 2912(%rsp)
	.seh_savexmm	%xmm9, 2912
	vmovaps	%xmm10, 2928(%rsp)
	.seh_savexmm	%xmm10, 2928
	vmovaps	%xmm11, 2944(%rsp)
	.seh_savexmm	%xmm11, 2944
	vmovaps	%xmm12, 2960(%rsp)
	.seh_savexmm	%xmm12, 2960
	vmovaps	%xmm13, 2976(%rsp)
	.seh_savexmm	%xmm13, 2976
	vmovaps	%xmm14, 2992(%rsp)
	.seh_savexmm	%xmm14, 2992
	vmovaps	%xmm15, 3008(%rsp)
	.seh_savexmm	%xmm15, 3008
	.seh_endprologue
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	.LC18(%rip), %rdx
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rcx
	vmovdqa	%xmm0, 160(%rsp)
	movq	$0, 176(%rsp)
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L539
	leaq	352(%rsp), %rbp
	leaq	160(%rsp), %rax
	movq	%rbp, %rcx
	movq	%rax, 152(%rsp)
.LEHB17:
	call	_Z11get_sweep_Nv
	leaq	160(%rsp), %rax
	movq	%rbp, %rdx
	movq	%rax, %rcx
	movq	%rax, 152(%rsp)
	call	_ZNSt6vectorIySaIyEEaSEOS1_.isra.0
	movq	%rbp, %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
.L540:
	movq	168(%rsp), %rax
	movq	160(%rsp), %rdi
	movq	%rax, 144(%rsp)
	movq	%rdi, 128(%rsp)
	cmpq	%rax, %rdi
	je	.L644
	vxorps	%xmm7, %xmm7, %xmm7
	vmovss	.LC22(%rip), %xmm9
	vmovsd	.LC33(%rip), %xmm12
.L645:
	cmpb	$0, g_tail(%rip)
	movq	128(%rsp), %rax
	movq	(%rax), %rdi
	je	.L545
	addq	$3, %rdi
.L545:
	movq	%rdi, %rdx
	leaq	.LC21(%rip), %rcx
	call	_ZL6printfPKcz
	movq	%rdi, %rax
	shrq	$60, %rax
	jne	.L807
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 200(%rsp)
	testq	%rdi, %rdi
	je	.L547
	leaq	0(,%rdi,8), %r14
	movq	%r14, %rcx
	call	_Znwy
.LEHE17:
	leaq	(%rax,%r14), %rbx
	movq	%rax, %r12
	movq	%rax, 192(%rsp)
	movq	$0x000000000, (%rax)
	leaq	8(%rax), %rsi
	movq	%rdi, %rax
	movq	%rbx, 208(%rsp)
	decq	%rax
	movq	%rax, 88(%rsp)
	je	.L548
	cmpq	%rbx, %rsi
	je	.L552
	leaq	-8(%r14), %r8
	xorl	%edx, %edx
	movq	%rsi, %rcx
	call	memset
.L552:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, 200(%rsp)
	vmovdqu	%xmm0, 232(%rsp)
.L550:
	movq	%r14, %rcx
.LEHB18:
	call	_Znwy
.LEHE18:
	cmpq	$0, 88(%rsp)
	leaq	(%rax,%r14), %r15
	movq	%rax, %r13
	movq	%rax, 224(%rsp)
	movq	%r15, 240(%rsp)
	movq	$0x000000000, (%rax)
	leaq	8(%rax), %rbx
	je	.L553
	cmpq	%r15, %rbx
	je	.L556
	leaq	-8(%r14), %r8
	xorl	%edx, %edx
	movq	%rbx, %rcx
	call	memset
.L556:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r15, 232(%rsp)
	vmovdqu	%xmm0, 264(%rsp)
.L555:
	movq	%r14, %rcx
.LEHB19:
	call	_Znwy
.LEHE19:
	cmpq	$0, 88(%rsp)
	leaq	(%rax,%r14), %r10
	movq	%rax, %r9
	movq	%rax, 256(%rsp)
	movq	%r10, 272(%rsp)
	movq	$0x000000000, (%rax)
	leaq	8(%rax), %r15
	je	.L660
	cmpq	%r15, %r10
	je	.L551
	leaq	-8(%r14), %r8
	xorl	%edx, %edx
	movq	%r15, %rcx
	movq	%r10, 88(%rsp)
	movq	%rax, 96(%rsp)
	call	memset
	movq	88(%rsp), %r10
	movq	96(%rsp), %r9
.L551:
	cmpb	$0, g_aligned(%rip)
	movl	$42, %eax
	movq	%r10, 264(%rsp)
	movl	$42, 352(%rsp)
	movl	$1, %ecx
	movl	%eax, %edx
	cmovne	%r13, %rbx
	cmovne	%r12, %rsi
	cmovne	%r9, %r15
	.p2align 4
	.p2align 3
.L559:
	movl	%edx, %eax
	shrl	$30, %eax
	xorl	%edx, %eax
	imull	$1812433253, %eax, %eax
	leal	(%rax,%rcx), %edx
	movl	%edx, 0(%rbp,%rcx,4)
	incq	%rcx
	cmpq	$624, %rcx
	jne	.L559
	movq	$624, 2848(%rsp)
	xorl	%r12d, %r12d
	testq	%rdi, %rdi
	jne	.L560
	jmp	.L577
	.p2align 4
	.p2align 3
.L567:
	movl	352(%rsp,%rcx,4), %eax
	leaq	1(%rcx), %r8
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L662
	vcvtss2sd	%xmm1, %xmm1, %xmm1
.L565:
	vmovsd	%xmm1, (%rsi,%r12,8)
	cmpq	$623, %r8
	ja	.L808
.L568:
	movl	352(%rsp,%r8,4), %eax
	leaq	1(%r8), %rdx
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$7, %ecx
	andl	$-1658038656, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$15, %ecx
	andl	$-272236544, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$18, %ecx
	xorl	%ecx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L663
	vcvtss2sd	%xmm1, %xmm1, %xmm1
.L571:
	vmovsd	%xmm1, (%rbx,%r12,8)
	cmpq	$623, %rdx
	ja	.L809
.L572:
	movl	352(%rsp,%rdx,4), %eax
	leaq	1(%rdx), %rcx
	movq	%rcx, 2848(%rsp)
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L575
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, (%r15,%r12,8)
	incq	%r12
	cmpq	%r12, %rdi
	je	.L577
.L560:
	cmpq	$623, %rcx
	jbe	.L567
	movq	%rbp, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %rcx
	jmp	.L567
	.p2align 4
	.p2align 3
.L809:
	movq	%rbp, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %rdx
	jmp	.L572
	.p2align 4
	.p2align 3
.L808:
	movq	%rbp, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	2848(%rsp), %r8
	jmp	.L568
.L575:
	movq	.LC31(%rip), %rax
	movq	%rax, (%r15,%r12,8)
	incq	%r12
	cmpq	%r12, %rdi
	jne	.L560
.L577:
	cmpl	$2, g_access_pattern(%rip)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 304(%rsp)
	vmovdqa	%xmm0, 288(%rsp)
	je	.L810
.L562:
	movq	$0, 88(%rsp)
.L578:
	leaq	336(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1347961171, 336(%rsp)
	movq	%rax, %rdx
	movq	%rax, 120(%rsp)
	movq	%rax, 320(%rsp)
	movb	$89, 340(%rsp)
	movq	$5, 328(%rsp)
	movb	$0, 341(%rsp)
.LEHB20:
	call	_ZL6printfPKcz
	vmovsd	.LC25(%rip), %xmm6
	leaq	0(,%rdi,8), %rax
	vmovsd	.LC26(%rip), %xmm8
	vcvtsi2sdq	%rdi, %xmm7, %xmm10
	vmovsd	.LC33(%rip), %xmm13
	movq	%rax, 136(%rsp)
	leaq	-1(%rdi), %rax
	xorl	%r14d, %r14d
	movq	%rax, 96(%rsp)
	movq	%rdi, %rax
	shrq	$2, %rax
	salq	$5, %rax
	movq	%rax, 104(%rsp)
	movq	%rdi, %rax
	andq	$-4, %rax
	movq	%rax, 112(%rsp)
	vmulsd	%xmm6, %xmm10, %xmm14
	.p2align 4
	.p2align 3
.L595:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L579
	testq	%rdi, %rdi
	je	.L585
	xorl	%eax, %eax
	cmpq	$2, 96(%rsp)
	jbe	.L582
	vbroadcastsd	.LC33(%rip), %ymm1
	movq	104(%rsp), %rdx
	.p2align 4
	.p2align 3
.L583:
	vmovupd	(%rsi,%rax), %ymm0
	vfmadd213pd	(%rbx,%rax), %ymm1, %ymm0
	vmovupd	%ymm0, (%rbx,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L583
	testb	$3, %dil
	je	.L801
	movq	112(%rsp), %rax
	vzeroupper
.L582:
	movq	%rdi, %rdx
	subq	%rax, %rdx
	cmpq	$1, %rdx
	je	.L587
	leaq	0(,%rax,8), %r8
	vmovddup	.LC33(%rip), %xmm0
	leaq	(%rbx,%r8), %rcx
	vmovupd	(%rcx), %xmm4
	vfmadd132pd	(%rsi,%r8), %xmm4, %xmm0
	vmovupd	%xmm0, (%rcx)
	testb	$1, %dl
	je	.L585
	andq	$-2, %rdx
	addq	%rdx, %rax
.L587:
	salq	$3, %rax
	leaq	(%rbx,%rax), %rdx
	vmovsd	(%rsi,%rax), %xmm0
	vfmadd213sd	(%rdx), %xmm13, %xmm0
	vmovsd	%xmm0, (%rdx)
.L585:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vmovsd	.LC14(%rip), %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	328(%rsp), %r8
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm11
	vmulsd	%xmm8, %xmm11, %xmm11
	vcmpeq_ussd	%xmm0, %xmm11, %xmm0
	vblendvpd	%xmm0, %xmm1, %xmm11, %xmm11
	vdivsd	%xmm11, %xmm14, %xmm15
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	.LC28(%rip), %r12
	movl	$1, %r8d
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r14d, %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm11, %xmm11, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm15, %xmm15, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	_Z6g_typeB5cxx11(%rip), %rdx
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L594
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rax
	cmovne	%rax, %rdx
.L594:
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE20:
	incl	%r14d
	cmpl	$10, %r14d
	jne	.L595
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L596
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L596:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$20292, 336(%rsp)
	movb	$84, 338(%rsp)
	movq	$3, 328(%rsp)
	movb	$0, 339(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB21:
	call	_ZL6printfPKcz
	vmovsd	.LC14(%rip), %xmm11
	vmulsd	%xmm6, %xmm10, %xmm6
	xorl	%r14d, %r14d
	.p2align 4
	.p2align 3
.L615:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r13
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L597
	testq	%rdi, %rdi
	je	.L674
	cmpq	$2, 96(%rsp)
	jbe	.L670
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L600:
	vmovupd	(%rbx,%rax), %ymm4
	vmulpd	(%rsi,%rax), %ymm4, %ymm0
	addq	$32, %rax
	vaddpd	%ymm0, %ymm1, %ymm1
	cmpq	%rax, %rdx
	jne	.L600
	vextractf128	$0x1, %ymm1, %xmm3
	vaddpd	%xmm1, %xmm3, %xmm2
	vaddpd	%xmm3, %xmm1, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	testb	$3, %dil
	je	.L803
	movq	112(%rsp), %rax
	vzeroupper
.L599:
	movq	%rdi, %rdx
	subq	%rax, %rdx
	cmpq	$1, %rdx
	je	.L603
	vmovupd	(%rsi,%rax,8), %xmm5
	vfmadd231pd	(%rbx,%rax,8), %xmm5, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	testb	$1, %dl
	je	.L598
	andq	$-2, %rdx
	addq	%rdx, %rax
.L603:
	vmovsd	(%rsi,%rax,8), %xmm3
	vfmadd231sd	(%rbx,%rax,8), %xmm3, %xmm0
.L598:
	vmovq	%xmm0, %rax
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	328(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r13, %rax
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm13
	vmulsd	%xmm8, %xmm13, %xmm13
	vcmpeq_ussd	%xmm0, %xmm13, %xmm0
	vblendvpd	%xmm0, %xmm11, %xmm13, %xmm13
	vdivsd	%xmm13, %xmm6, %xmm14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r14d, %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm13, %xmm13, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm14, %xmm14, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L614
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L614:
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE21:
	incl	%r14d
	cmpl	$10, %r14d
	jne	.L615
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L616
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L616:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$21837, 336(%rsp)
	movb	$76, 338(%rsp)
	movq	$3, 328(%rsp)
	movb	$0, 339(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB22:
	call	_ZL6printfPKcz
	vmovsd	.LC14(%rip), %xmm13
	vmulsd	%xmm8, %xmm10, %xmm11
	xorl	%r14d, %r14d
	.p2align 4
	.p2align 3
.L633:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r13
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L617
	testq	%rdi, %rdi
	je	.L623
	xorl	%eax, %eax
	cmpq	$2, 96(%rsp)
	jbe	.L620
	movq	104(%rsp), %rdx
	.p2align 4
	.p2align 3
.L621:
	vmovupd	(%rbx,%rax), %ymm5
	vmulpd	(%rsi,%rax), %ymm5, %ymm0
	vmovupd	%ymm0, (%r15,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L621
	testb	$3, %dil
	je	.L804
	movq	112(%rsp), %rax
	vzeroupper
.L620:
	movq	%rdi, %rdx
	subq	%rax, %rdx
	cmpq	$1, %rdx
	je	.L625
	leaq	0(,%rax,8), %rcx
	vmovupd	(%rbx,%rcx), %xmm2
	vmulpd	(%rsi,%rcx), %xmm2, %xmm0
	vmovupd	%xmm0, (%r15,%rcx)
	testb	$1, %dl
	je	.L623
	andq	$-2, %rdx
	addq	%rdx, %rax
.L625:
	salq	$3, %rax
	vmovsd	(%rbx,%rax), %xmm0
	vmulsd	(%rsi,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax)
.L623:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	328(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r13, %rax
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm13, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm11, %xmm14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r14d, %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm14, %xmm14, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L632
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L632:
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE22:
	incl	%r14d
	cmpl	$10, %r14d
	jne	.L633
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L634
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L634:
	movq	120(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1313166419, 336(%rsp)
	movq	$7, 328(%rsp)
	movl	$1279869774, 339(%rsp)
	movb	$0, 343(%rsp)
	movq	%rax, %rdx
	movq	%rax, 320(%rsp)
.LEHB23:
	call	_ZL6printfPKcz
	vmulsd	.LC30(%rip), %xmm10, %xmm13
	vmovsd	.LC33(%rip), %xmm11
	xorl	%r14d, %r14d
	vmovsd	.LC36(%rip), %xmm14
	vmovsd	.LC14(%rip), %xmm15
	.p2align 4
	.p2align 3
.L637:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	movq	%rdi, 40(%rsp)
	movq	%rax, %r13
	movq	88(%rsp), %rax
	vmovsd	%xmm11, 32(%rsp)
	vmovsd	%xmm14, %xmm14, %xmm2
	movq	%rax, 64(%rsp)
	movl	g_stride(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	g_access_pattern(%rip), %eax
	movl	%eax, 48(%rsp)
	movq	.LC35(%rip), %rax
	vmovq	%rax, %xmm3
	call	_Z14stencil_scalarIdEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r13, %rax
	movq	328(%rsp), %r8
	movq	320(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm15, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm13, %xmm10
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r14d, %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm10, %xmm10, %xmm1
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L636
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L636:
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r13, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rax, %rcx
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r13, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE23:
	incl	%r14d
	cmpl	$10, %r14d
	jne	.L637
	movq	320(%rsp), %rcx
	movq	120(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L638
	movq	336(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L638:
	movq	288(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L639
	movq	304(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L639:
	movq	256(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L640
	movq	272(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L640:
	movq	224(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L641
	movq	240(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L641:
	movq	192(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L642
	movq	208(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
	addq	$8, 128(%rsp)
	movq	128(%rsp), %rax
	cmpq	%rax, 144(%rsp)
	jne	.L645
.L644:
	movq	152(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	nop
	vmovaps	2864(%rsp), %xmm6
	vmovaps	2880(%rsp), %xmm7
	vmovaps	2896(%rsp), %xmm8
	vmovaps	2912(%rsp), %xmm9
	vmovaps	2928(%rsp), %xmm10
	vmovaps	2944(%rsp), %xmm11
	vmovaps	2960(%rsp), %xmm12
	vmovaps	2976(%rsp), %xmm13
	vmovaps	2992(%rsp), %xmm14
	vmovaps	3008(%rsp), %xmm15
	addq	$3032, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4
	.p2align 3
.L617:
	cmpl	$1, %eax
	je	.L811
	cmpl	$2, %eax
	jne	.L623
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L623
	testq	%rdi, %rdi
	je	.L623
	movq	(%rax), %rdx
	movq	136(%rsp), %rax
	leaq	(%rdx,%rax), %rcx
	.p2align 4
	.p2align 3
.L631:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$3, %rax
	vmovsd	(%rsi,%rax), %xmm0
	vmulsd	(%rbx,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax)
	cmpq	%rcx, %rdx
	jne	.L631
	jmp	.L623
	.p2align 4
	.p2align 3
.L597:
	cmpl	$1, %eax
	je	.L812
	cmpl	$2, %eax
	jne	.L674
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L674
	testq	%rdi, %rdi
	je	.L674
	cmpq	$2, 96(%rsp)
	movq	(%rax), %rdx
	jbe	.L675
	movq	104(%rsp), %rcx
	movq	%rdx, %rax
	vxorpd	%xmm3, %xmm3, %xmm3
	leaq	(%rdx,%rcx), %r10
	.p2align 4
	.p2align 3
.L610:
	movq	16(%rax), %r11
	movq	(%rax), %rcx
	addq	$32, %rax
	movq	-24(%rax), %r9
	leaq	0(,%r11,8), %r8
	salq	$3, %rcx
	movq	-8(%rax), %r11
	vmovsd	(%rbx,%r8), %xmm1
	vmovsd	(%rbx,%rcx), %xmm0
	vmovsd	(%rsi,%r8), %xmm2
	vmovhpd	(%rbx,%r11,8), %xmm1, %xmm1
	vmovhpd	(%rbx,%r9,8), %xmm0, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmovsd	(%rsi,%rcx), %xmm1
	vmovhpd	(%rsi,%r11,8), %xmm2, %xmm2
	vmovhpd	(%rsi,%r9,8), %xmm1, %xmm1
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	cmpq	%rax, %r10
	jne	.L610
	vextractf128	$0x1, %ymm3, %xmm1
	vaddpd	%xmm3, %xmm1, %xmm1
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	testb	$3, %dil
	je	.L803
	movq	112(%rsp), %rax
	vzeroupper
.L609:
	leaq	0(,%rax,8), %rcx
	movq	(%rdx,%rcx), %r8
	vmovsd	(%rbx,%r8,8), %xmm4
	vfmadd231sd	(%rsi,%r8,8), %xmm4, %xmm0
	leaq	1(%rax), %r8
	cmpq	%rdi, %r8
	jnb	.L598
	movq	8(%rdx,%rcx), %r8
	addq	$2, %rax
	vmovsd	(%rsi,%r8,8), %xmm5
	vfmadd231sd	(%rbx,%r8,8), %xmm5, %xmm0
	cmpq	%rdi, %rax
	jnb	.L598
	movq	16(%rdx,%rcx), %rax
	vmovsd	(%rsi,%rax,8), %xmm5
	vfmadd231sd	(%rbx,%rax,8), %xmm5, %xmm0
	jmp	.L598
	.p2align 4
	.p2align 3
.L579:
	cmpl	$1, %eax
	je	.L813
	cmpl	$2, %eax
	jne	.L585
	movq	88(%rsp), %rax
	testq	%rax, %rax
	je	.L585
	testq	%rdi, %rdi
	je	.L585
	movq	(%rax), %rdx
	movq	136(%rsp), %rax
	leaq	(%rdx,%rax), %r8
	.p2align 4
	.p2align 3
.L593:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$3, %rax
	leaq	(%rbx,%rax), %rcx
	vmovsd	(%rsi,%rax), %xmm0
	vfmadd213sd	(%rcx), %xmm12, %xmm0
	vmovsd	%xmm0, (%rcx)
	cmpq	%rdx, %r8
	jne	.L593
	jmp	.L585
	.p2align 4
	.p2align 3
.L674:
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.L598
	.p2align 4
	.p2align 3
.L812:
	testq	%rdi, %rdi
	je	.L674
	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	jne	.L607
	.p2align 4
	.p2align 3
.L606:
	vmovsd	(%rbx,%rax,8), %xmm1
	vmulsd	(%rsi,%rax,8), %xmm1, %xmm1
	incq	%rax
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rdi, %rax
	jb	.L606
	jmp	.L598
	.p2align 4
	.p2align 3
.L607:
	vmovsd	(%rsi,%rax,8), %xmm1
	vmulsd	(%rbx,%rax,8), %xmm1, %xmm1
	addq	%rdx, %rax
	vaddsd	%xmm1, %xmm0, %xmm0
	cmpq	%rdi, %rax
	jb	.L607
	jmp	.L598
	.p2align 4
	.p2align 3
.L811:
	testq	%rdi, %rdi
	je	.L623
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L629
	.p2align 4
	.p2align 3
.L628:
	vmovsd	(%rbx,%rax,8), %xmm0
	vmulsd	(%rsi,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	incq	%rax
	cmpq	%rdi, %rax
	jb	.L628
	jmp	.L623
	.p2align 4
	.p2align 3
.L629:
	vmovsd	(%rsi,%rax,8), %xmm0
	vmulsd	(%rbx,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r15,%rax,8)
	addq	%rdx, %rax
	cmpq	%rdi, %rax
	jb	.L629
	jmp	.L623
	.p2align 4
	.p2align 3
.L813:
	testq	%rdi, %rdi
	je	.L585
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L814
	.p2align 4
	.p2align 3
.L590:
	vmovsd	(%rsi,%rax,8), %xmm0
	vfmadd213sd	(%rbx,%rax,8), %xmm13, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	incq	%rax
	cmpq	%rdi, %rax
	jb	.L590
	jmp	.L585
	.p2align 4
	.p2align 3
.L803:
	vzeroupper
	jmp	.L598
.L804:
	vzeroupper
	jmp	.L623
.L801:
	vzeroupper
	jmp	.L585
.L662:
	vmovsd	.LC31(%rip), %xmm1
	jmp	.L565
.L663:
	vmovsd	.LC31(%rip), %xmm1
	jmp	.L571
.L547:
	movq	$0, 208(%rsp)
	vmovdqa	%xmm0, 192(%rsp)
	movq	$0, 240(%rsp)
	movl	$8, %r15d
	vmovdqa	%xmm0, 224(%rsp)
	movq	$0, 256(%rsp)
	movq	$0, 272(%rsp)
	movl	$8, %ebx
	movl	$8, %esi
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	xorl	%r10d, %r10d
	jmp	.L551
.L642:
	addq	$8, 128(%rsp)
	movq	128(%rsp), %rax
	cmpq	%rax, 144(%rsp)
	jne	.L645
	jmp	.L644
.L670:
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L599
.L814:
	vmovsd	.LC33(%rip), %xmm11
	.p2align 4
	.p2align 3
.L591:
	vmovsd	(%rsi,%rax,8), %xmm0
	vfmadd213sd	(%rbx,%rax,8), %xmm11, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	addq	%rdx, %rax
	cmpq	%rdi, %rax
	jb	.L591
	jmp	.L585
.L810:
	movl	g_stride(%rip), %r8d
	leaq	320(%rsp), %rcx
	movq	%rdi, %rdx
.LEHB24:
	call	_Z19make_gather_indicesyi
.LEHE24:
	vmovdqa	320(%rsp), %xmm4
	cmpl	$2, g_access_pattern(%rip)
	movq	336(%rsp), %rax
	movq	%rax, 304(%rsp)
	vmovdqa	%xmm4, 288(%rsp)
	jne	.L562
	leaq	288(%rsp), %rax
	movq	%rax, 88(%rsp)
	jmp	.L578
.L548:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rsi, 200(%rsp)
	vmovdqu	%xmm0, 232(%rsp)
	jmp	.L550
.L553:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, 232(%rsp)
	vmovdqu	%xmm0, 264(%rsp)
	jmp	.L555
.L660:
	movq	%r15, %r10
	jmp	.L551
.L539:
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %rax
	cmpq	$7, %rax
	je	.L815
	cmpq	$2, %rax
	je	.L816
	cmpq	$4, %rax
	jne	.L658
	movq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movl	$128, %edx
	cmpl	$1835102820, (%rax)
	movl	$1073741824, %eax
	cmovne	%rdx, %rax
	jmp	.L542
.L675:
	vxorpd	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L609
.L815:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rbx
	leaq	.LC19(%rip), %rdx
	movl	$7, %r8d
	movq	%rbx, %rcx
	call	memcmp
	movl	%eax, %edx
	movl	$32768, %eax
	testl	%edx, %edx
	je	.L542
	movl	$7, %r8d
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rcx
	call	memcmp
	cmpl	$1, %eax
	sbbq	%rax, %rax
	andl	$196480, %eax
	subq	$-128, %rax
.L542:
	shrq	$4, %rax
	leaq	352(%rsp), %rbp
	leaq	360(%rsp), %r8
	movq	%rax, 352(%rsp)
	leaq	160(%rsp), %rax
	movq	%rbp, %rdx
	movq	%rax, %rcx
	movq	%rax, 152(%rsp)
.LEHB25:
	call	_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0
	jmp	.L540
.L816:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rdx
	movl	$524288, %eax
	cmpw	$12908, (%rdx)
	je	.L542
	cmpw	$13164, (%rdx)
	movl	$8388608, %eax
	movl	$128, %edx
	cmovne	%rdx, %rax
	jmp	.L542
.L807:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE25:
.L658:
	movl	$128, %eax
	jmp	.L542
.L690:
	movq	%rax, %rbx
	vzeroupper
.L647:
	leaq	288(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	leaq	256(%rsp), %rcx
	call	_ZNSt6vectorIdSaIdEED1Ev
.L651:
	leaq	224(%rsp), %rcx
	call	_ZNSt6vectorIdSaIdEED1Ev
.L652:
	leaq	192(%rsp), %rcx
	call	_ZNSt6vectorIdSaIdEED1Ev
.L653:
	movq	152(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	movq	%rbx, %rcx
.LEHB26:
	call	_Unwind_Resume
.LEHE26:
.L692:
.L806:
	leaq	320(%rsp), %rcx
	movq	%rax, %rbx
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L647
.L687:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L653
.L689:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L651
.L693:
	jmp	.L806
.L691:
	jmp	.L806
.L688:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L652
.L694:
	jmp	.L806
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA12616:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12616-.LLSDACSB12616
.LLSDACSB12616:
	.uleb128 .LEHB17-.LFB12616
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L687-.LFB12616
	.uleb128 0
	.uleb128 .LEHB18-.LFB12616
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L688-.LFB12616
	.uleb128 0
	.uleb128 .LEHB19-.LFB12616
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L689-.LFB12616
	.uleb128 0
	.uleb128 .LEHB20-.LFB12616
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L694-.LFB12616
	.uleb128 0
	.uleb128 .LEHB21-.LFB12616
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L693-.LFB12616
	.uleb128 0
	.uleb128 .LEHB22-.LFB12616
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L692-.LFB12616
	.uleb128 0
	.uleb128 .LEHB23-.LFB12616
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L691-.LFB12616
	.uleb128 0
	.uleb128 .LEHB24-.LFB12616
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L690-.LFB12616
	.uleb128 0
	.uleb128 .LEHB25-.LFB12616
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L687-.LFB12616
	.uleb128 0
	.uleb128 .LEHB26-.LFB12616
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
.LLSDACSE12616:
	.text
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC39:
	.ascii " \0"
.LC40:
	.ascii "-help\0"
.LC41:
	.ascii "--help\0"
	.align 8
.LC42:
	.ascii "  f32, f64, or i32 data types (required)\12\0"
.LC43:
	.ascii "f32\0"
	.align 8
.LC44:
	.ascii "  --aligned / --misaligned: memory alignment\12\0"
	.align 8
.LC45:
	.ascii "  --tail / --no-tail: add or remove tail elements\12\0"
	.align 8
.LC46:
	.ascii "  --unit-stride: contiguous access (default)\12\0"
	.align 8
.LC47:
	.ascii "  --stride=N: strided access, N=2,4,8,...\12\0"
	.align 8
.LC48:
	.ascii "  --gather=N: gather-like access pattern, stride N\12\0"
	.align 8
.LC49:
	.ascii "  l1 / l2 / l3 / dram / sweep target working-set size for cache or memory hierarchy\12\0"
.LC50:
	.ascii "f64\0"
.LC51:
	.ascii "i32\0"
.LC52:
	.ascii "--aligned\0"
.LC53:
	.ascii "--misaligned\0"
.LC54:
	.ascii "--tail\0"
.LC55:
	.ascii "--no-tail\0"
.LC56:
	.ascii "--unit-stride\0"
.LC57:
	.ascii "--stride=\0"
.LC58:
	.ascii "stoi\0"
.LC59:
	.ascii "--gather=\0"
.LC60:
	.ascii "l2\0"
.LC61:
	.ascii "l3\0"
.LC62:
	.ascii "dram\0"
.LC63:
	.ascii "basic_string::append\0"
.LC64:
	.ascii "_\0"
.LC65:
	.ascii ".csv\0"
	.align 8
.LC66:
	.ascii "kernel,run,elapsed_sec,gflops,array_size,type,aligned,tail,access,stride,memory_level\12\0"
.LC67:
	.ascii "float32\0"
.LC73:
	.ascii "float64\0"
.LC74:
	.ascii "int32\0"
.LC75:
	.ascii "results\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB11249:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$3496, %rsp
	.seh_stackalloc	3496
	vmovaps	%xmm6, 3328(%rsp)
	.seh_savexmm	%xmm6, 3328
	vmovaps	%xmm7, 3344(%rsp)
	.seh_savexmm	%xmm7, 3344
	vmovaps	%xmm8, 3360(%rsp)
	.seh_savexmm	%xmm8, 3360
	vmovaps	%xmm9, 3376(%rsp)
	.seh_savexmm	%xmm9, 3376
	vmovaps	%xmm10, 3392(%rsp)
	.seh_savexmm	%xmm10, 3392
	vmovaps	%xmm11, 3408(%rsp)
	.seh_savexmm	%xmm11, 3408
	vmovaps	%xmm12, 3424(%rsp)
	.seh_savexmm	%xmm12, 3424
	vmovaps	%xmm13, 3440(%rsp)
	.seh_savexmm	%xmm13, 3440
	vmovaps	%xmm14, 3456(%rsp)
	.seh_savexmm	%xmm14, 3456
	vmovaps	%xmm15, 3472(%rsp)
	.seh_savexmm	%xmm15, 3472
	.seh_endprologue
	movl	%ecx, 3568(%rsp)
	movq	%rdx, %r13
	call	__main
	leaq	432(%rsp), %rax
	movq	%rax, %rcx
	movq	%rax, 88(%rsp)
.LEHB27:
	call	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEC1Ev
.LEHE27:
	movl	3568(%rsp), %ebp
	testl	%ebp, %ebp
	jle	.L818
	movl	3568(%rsp), %eax
	movq	%r13, %rsi
	leaq	.LC39(%rip), %rbp
	movq	(%rsi), %rbx
	decl	%eax
	leaq	0(%r13,%rax,8), %rdi
	testq	%rbx, %rbx
	je	.L1175
	.p2align 4
	.p2align 3
.L819:
	movq	%rbx, %rcx
	call	strlen
	movq	88(%rsp), %rcx
	movq	%rbx, %rdx
	movq	%rax, %r8
.LEHB28:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L820:
	cmpq	%rsi, %rdi
	jne	.L1176
.L818:
	leaq	816(%rsp), %r15
	leaq	440(%rsp), %rdx
	movq	%r15, %rcx
	call	_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv
.LEHE28:
	movq	816(%rsp), %rdx
	leaq	832(%rsp), %rax
	vmovq	824(%rsp), %xmm0
	movq	_Z9g_cmdlineB5cxx11(%rip), %rcx
	cmpq	%rax, %rdx
	je	.L1177
	leaq	16+_Z9g_cmdlineB5cxx11(%rip), %r8
	vpinsrq	$1, 832(%rsp), %xmm0, %xmm0
	cmpq	%r8, %rcx
	je	.L1178
	movq	16+_Z9g_cmdlineB5cxx11(%rip), %r8
	movq	%rdx, _Z9g_cmdlineB5cxx11(%rip)
	vmovdqu	%xmm0, 8+_Z9g_cmdlineB5cxx11(%rip)
	testq	%rcx, %rcx
	je	.L829
	movq	%rcx, 816(%rsp)
	movq	%r8, 832(%rsp)
	movq	%rcx, %rax
.L828:
	movq	$0, 824(%rsp)
	movq	%r15, %rcx
	movb	$0, (%rax)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	cmpl	$1, 3568(%rsp)
	jle	.L830
	movl	3568(%rsp), %eax
	leaq	16(%r13), %rdi
	leaq	8(%r13), %rsi
	leaq	400(%rsp), %rbp
	movq	%rdi, 96(%rsp)
	leaq	_Z6g_typeB5cxx11(%rip), %r14
	subl	$2, %eax
	leaq	16(%r13,%rax,8), %r12
	leaq	416(%rsp), %rax
	movq	%rax, 80(%rsp)
	.p2align 4
	.p2align 3
.L870:
	movq	80(%rsp), %rax
	movq	(%rsi), %rdi
	movq	%rax, 400(%rsp)
	testq	%rdi, %rdi
	je	.L1179
	movq	%rdi, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	%rax, 816(%rsp)
	cmpq	$15, %rax
	ja	.L1180
	cmpq	$1, %rax
	je	.L1181
	testq	%rax, %rax
	jne	.L1182
.L836:
	movq	80(%rsp), %rdx
.L835:
	movq	%rax, 408(%rsp)
	movb	$0, (%rdx,%rax)
	movq	408(%rsp), %rax
	cmpq	$5, %rax
	je	.L1183
	cmpq	$6, %rax
	jne	.L842
	movq	400(%rsp), %rax
	cmpl	$1701326125, (%rax)
	je	.L1184
.L841:
	leaq	.LC52(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L1185
	movb	$1, g_aligned(%rip)
	.p2align 4
	.p2align 3
.L859:
	movq	400(%rsp), %rcx
	movq	80(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L867
	movq	416(%rsp), %rax
	addq	$8, %rsi
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	cmpq	%r12, %rsi
	jne	.L870
.L869:
	xorl	%ebx, %ebx
	leaq	336(%rsp), %rdi
	leaq	352(%rsp), %rax
	movb	$0, 352(%rsp)
	movq	%rbx, 344(%rsp)
	movq	8(%r13), %rbx
	movq	%rdi, 104(%rsp)
	movq	%rax, 336(%rsp)
	movq	%rbx, %rcx
	call	strlen
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	%rdi, %rcx
.LEHB29:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	cmpl	$2, 3568(%rsp)
	je	.L871
	movl	3568(%rsp), %eax
	movq	96(%rsp), %rbx
	movabsq	$4611686018427387903, %rsi
	leaq	.LC64(%rip), %rbp
	subl	$3, %eax
	leaq	24(%r13,%rax,8), %rdi
	.p2align 4
	.p2align 3
.L874:
	cmpq	%rsi, 344(%rsp)
	je	.L1186
	movq	104(%rsp), %rcx
	movl	$1, %r8d
	movq	%rbp, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
	movq	(%rbx), %r12
	movq	%r12, %rcx
	call	strlen
	movq	%rax, %r8
	movq	%rsi, %rax
	subq	344(%rsp), %rax
	cmpq	%r8, %rax
	jb	.L1187
	movq	104(%rsp), %rcx
	movq	%r12, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
	addq	$8, %rbx
	cmpq	%rdi, %rbx
	jne	.L874
.L871:
	movq	344(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L875
	xorl	%eax, %eax
.L1170:
	movq	336(%rsp), %r8
.L879:
	leaq	(%r8,%rax), %rdx
	cmpb	$32, (%rdx)
	je	.L1188
	incq	%rax
	cmpq	%rcx, %rax
	jb	.L879
.L878:
	movabsq	$4611686018427387903, %rax
	subq	%rcx, %rax
	cmpq	$3, %rax
	jbe	.L1189
.L875:
	movq	104(%rsp), %rcx
	movl	$4, %r8d
	leaq	.LC65(%rip), %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy
	movq	336(%rsp), %rdx
	movl	$16, %r8d
	leaq	8+g_csv(%rip), %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	movq	g_csv(%rip), %rdx
	leaq	g_csv(%rip), %rcx
	addq	-24(%rdx), %rcx
	testq	%rax, %rax
	je	.L1190
	xorl	%edx, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.L881:
	leaq	.LC66(%rip), %rdx
	leaq	g_csv(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	call	*__imp_GetCurrentProcess(%rip)
	movq	%rax, %rcx
	movl	$1, %edx
	call	*__imp_SetProcessAffinityMask(%rip)
	testl	%eax, %eax
	je	.L1191
.L882:
	leaq	.LC43(%rip), %rdx
	leaq	_Z6g_typeB5cxx11(%rip), %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L1192
	leaq	.LC50(%rip), %rdx
	leaq	_Z6g_typeB5cxx11(%rip), %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L1193
	leaq	.LC51(%rip), %rdx
	leaq	_Z6g_typeB5cxx11(%rip), %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L1194
.L977:
	leaq	g_csv(%rip), %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
.LEHE29:
	movq	104(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L851
	.p2align 4
	.p2align 3
.L842:
	cmpq	$3, %rax
	jne	.L841
	movq	400(%rsp), %rax
	cmpw	$13158, (%rax)
	je	.L1195
.L847:
	cmpw	$13926, (%rax)
	je	.L1196
.L852:
	cmpw	$13161, (%rax)
	jne	.L841
	cmpb	$50, 2(%rax)
	jne	.L841
	.p2align 4
	.p2align 3
.L849:
	movq	%rbp, %rdx
	movq	%r14, %rcx
.LEHB30:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
.LEHE30:
	jmp	.L859
	.p2align 4
	.p2align 3
.L1176:
	movq	88(%rsp), %rcx
	movl	$1, %r8d
	movq	%rbp, %rdx
.LEHB31:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	8(%rsi), %rbx
	addq	$8, %rsi
	testq	%rbx, %rbx
	jne	.L819
.L1175:
	movq	432(%rsp), %rax
	movq	88(%rsp), %rcx
	addq	-24(%rax), %rcx
	movl	32(%rcx), %edx
	orl	$1, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE31:
	jmp	.L820
	.p2align 4
	.p2align 3
.L1183:
	movq	400(%rsp), %rax
	cmpl	$1818585133, (%rax)
	jne	.L841
	cmpb	$112, 4(%rax)
	jne	.L841
.L840:
	leaq	.LC42(%rip), %rcx
.LEHB32:
	call	_ZL6printfPKcz
	leaq	.LC44(%rip), %rcx
	call	_ZL6printfPKcz
	leaq	.LC45(%rip), %rcx
	call	_ZL6printfPKcz
	leaq	.LC46(%rip), %rcx
	call	_ZL6printfPKcz
	leaq	.LC47(%rip), %rcx
	call	_ZL6printfPKcz
	leaq	.LC48(%rip), %rcx
	call	_ZL6printfPKcz
	leaq	.LC49(%rip), %rcx
	call	_ZL6printfPKcz
.LEHE32:
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L851:
	movq	88(%rsp), %rcx
	call	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	nop
	vmovaps	3328(%rsp), %xmm6
	xorl	%eax, %eax
	vmovaps	3344(%rsp), %xmm7
	vmovaps	3360(%rsp), %xmm8
	vmovaps	3376(%rsp), %xmm9
	vmovaps	3392(%rsp), %xmm10
	vmovaps	3408(%rsp), %xmm11
	vmovaps	3424(%rsp), %xmm12
	vmovaps	3440(%rsp), %xmm13
	vmovaps	3456(%rsp), %xmm14
	vmovaps	3472(%rsp), %xmm15
	addq	$3496, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4
	.p2align 3
.L1181:
	movzbl	(%rdi), %edx
	movb	%dl, 416(%rsp)
	jmp	.L836
	.p2align 4
	.p2align 3
.L1180:
	xorl	%r8d, %r8d
	movq	%r15, %rdx
	movq	%rbp, %rcx
.LEHB33:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
.LEHE33:
	movq	%rax, %rcx
	movq	%rax, 400(%rsp)
	movq	816(%rsp), %rax
	movq	%rax, 416(%rsp)
.L833:
	movq	%rdi, %rdx
	movq	%rbx, %r8
	call	memcpy
	movq	816(%rsp), %rax
	movq	400(%rsp), %rdx
	jmp	.L835
	.p2align 4
	.p2align 3
.L867:
	addq	$8, %rsi
	cmpq	%r12, %rsi
	jne	.L870
	jmp	.L869
	.p2align 4
	.p2align 3
.L1184:
	cmpw	$28780, 4(%rax)
	jne	.L841
	jmp	.L840
	.p2align 4
	.p2align 3
.L1195:
	cmpb	$50, 2(%rax)
	jne	.L847
	jmp	.L849
	.p2align 4
	.p2align 3
.L1182:
	movq	80(%rsp), %rcx
	jmp	.L833
	.p2align 4
	.p2align 3
.L1185:
	leaq	.LC53(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L860
	movb	$0, g_aligned(%rip)
	jmp	.L859
.L1196:
	cmpb	$52, 2(%rax)
	jne	.L852
	jmp	.L849
.L860:
	leaq	.LC54(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L1197
	leaq	.LC55(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L862
	movb	$0, g_tail(%rip)
	jmp	.L859
	.p2align 4
	.p2align 3
.L1188:
	movb	$95, (%rdx)
	movq	344(%rsp), %rcx
	incq	%rax
	cmpq	%rcx, %rax
	jb	.L1170
	jmp	.L878
.L1178:
	movq	%rdx, _Z9g_cmdlineB5cxx11(%rip)
	vmovdqu	%xmm0, 8+_Z9g_cmdlineB5cxx11(%rip)
.L829:
	movq	%rax, 816(%rsp)
	jmp	.L828
.L1197:
	movb	$1, g_tail(%rip)
	jmp	.L859
.L1193:
	leaq	.LC73(%rip), %rdx
	movq	%r15, %rcx
.LEHB34:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE34:
.LEHB35:
	call	_Z8run_demoIdEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0
.LEHE35:
.L1172:
	movq	%r15, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L977
.L1177:
	vmovq	%xmm0, %rax
	testq	%rax, %rax
	je	.L824
	decq	%rax
	je	.L1198
	vmovq	%xmm0, %r8
	call	memcpy
	vmovq	824(%rsp), %xmm0
	movq	_Z9g_cmdlineB5cxx11(%rip), %rcx
.L824:
	vmovq	%xmm0, %rax
	vmovq	%xmm0, 8+_Z9g_cmdlineB5cxx11(%rip)
	movb	$0, (%rcx,%rax)
	movq	816(%rsp), %rax
	jmp	.L828
.L830:
	leaq	336(%rsp), %rax
	movq	$7, 32(%rsp)
	leaq	.LC75(%rip), %r9
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	movq	%rax, 104(%rsp)
	leaq	352(%rsp), %rax
	xorl	%edx, %edx
	movq	%rax, 336(%rsp)
	xorl	%eax, %eax
	movb	$0, 352(%rsp)
	movq	%rax, 344(%rsp)
.LEHB36:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy
	jmp	.L871
.L1192:
	leaq	368(%rsp), %rax
	leaq	.LC67(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, 160(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE36:
	xorl	%r11d, %r11d
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	.LC18(%rip), %rdx
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rcx
	vmovdqa	%xmm0, 176(%rsp)
	movq	%r11, 192(%rsp)
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L884
	leaq	176(%rsp), %rax
	movq	%r15, %rcx
	movq	%rax, 168(%rsp)
.LEHB37:
	call	_Z11get_sweep_Nv
	leaq	176(%rsp), %rax
	movq	%r15, %rdx
	movq	%rax, %rcx
	movq	%rax, 168(%rsp)
	call	_ZNSt6vectorIySaIyEEaSEOS1_.isra.0
	movq	%r15, %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
.L885:
	movq	184(%rsp), %rax
	vmovss	.LC23(%rip), %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vmovss	.LC69(%rip), %xmm11
	movq	%rax, 152(%rsp)
	movq	176(%rsp), %rax
	movq	%rax, 144(%rsp)
.L889:
	movq	144(%rsp), %rdi
	cmpq	%rdi, 152(%rsp)
	je	.L1199
	cmpb	$0, g_tail(%rip)
	movq	144(%rsp), %rax
	movq	(%rax), %rbp
	je	.L890
	addq	$3, %rbp
.L890:
	movq	%rbp, %rdx
	leaq	.LC21(%rip), %rcx
	call	_ZL6printfPKcz
	movabsq	$2305843009213693951, %rax
	cmpq	%rbp, %rax
	jb	.L1200
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, 216(%rsp)
	testq	%rbp, %rbp
	je	.L892
	leaq	0(,%rbp,4), %rbx
	movq	%rbx, %rcx
	call	_Znwy
.LEHE37:
	vmovq	%rax, %xmm5
	leaq	(%rax,%rbx), %rsi
	movq	%rax, %rdi
	movl	$0x00000000, (%rax)
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movq	%rsi, 224(%rsp)
	leaq	4(%rax), %rcx
	vmovdqa	%xmm0, 208(%rsp)
	cmpq	$1, %rbp
	je	.L893
	cmpq	%rcx, %rsi
	je	.L894
	leaq	-4(%rbx), %r8
	xorl	%edx, %edx
	call	memset
.L894:
	movq	%rsi, %rcx
.L893:
	movq	%rcx, 216(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rcx
	vmovdqu	%xmm0, 248(%rsp)
.LEHB38:
	call	_Znwy
.LEHE38:
	vmovq	%rax, %xmm5
	leaq	(%rax,%rbx), %r12
	movq	%rax, %rsi
	movl	$0x00000000, (%rax)
	vpunpcklqdq	%xmm5, %xmm5, %xmm0
	movq	%r12, 256(%rsp)
	leaq	4(%rax), %rcx
	vmovdqa	%xmm0, 240(%rsp)
	cmpq	$1, %rbp
	je	.L895
	cmpq	%rcx, %r12
	je	.L896
	leaq	-4(%rbx), %r8
	xorl	%edx, %edx
	call	memset
.L896:
	movq	%r12, %rcx
.L895:
	movq	%rcx, 248(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rcx
	vmovdqu	%xmm0, 280(%rsp)
.LEHB39:
	call	_Znwy
.LEHE39:
	vmovq	%rax, %xmm3
	leaq	(%rax,%rbx), %r12
	movq	%rax, %r14
	movl	$0x00000000, (%rax)
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movq	%r12, 288(%rsp)
	leaq	4(%rax), %rcx
	vmovdqa	%xmm0, 272(%rsp)
	cmpq	$1, %rbp
	je	.L897
	cmpq	%rcx, %r12
	je	.L898
	leaq	-4(%rbx), %r8
	xorl	%edx, %edx
	call	memset
.L898:
	movq	%r12, %rcx
.L897:
	cmpb	$0, g_aligned(%rip)
	movq	%rcx, 280(%rsp)
	jne	.L899
	addq	$4, %rdi
	addq	$4, %rsi
	addq	$4, %r14
.L899:
	movl	$42, %eax
	movl	$42, 816(%rsp)
	movl	$1, %ecx
	movl	%eax, %edx
	.p2align 4
	.p2align 3
.L900:
	movl	%edx, %eax
	shrl	$30, %eax
	xorl	%edx, %eax
	imull	$1812433253, %eax, %eax
	leal	(%rax,%rcx), %edx
	movl	%edx, (%r15,%rcx,4)
	incq	%rcx
	cmpq	$624, %rcx
	jne	.L900
	movq	$624, 3312(%rsp)
	testq	%rbp, %rbp
	je	.L917
	vmovss	.LC22(%rip), %xmm9
	xorl	%ebx, %ebx
	vmovss	.LC37(%rip), %xmm6
	vmovss	.LC23(%rip), %xmm8
	jmp	.L901
	.p2align 4
	.p2align 3
.L904:
	movl	816(%rsp,%rcx,4), %eax
	leaq	1(%rcx), %r8
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	vcmpless	%xmm0, %xmm8, %xmm0
	vblendvps	%xmm0, %xmm6, %xmm1, %xmm1
	vmovss	%xmm1, (%rdi,%rbx,4)
	cmpq	$623, %r8
	ja	.L1201
.L908:
	movl	816(%rsp,%r8,4), %eax
	leaq	1(%r8), %rdx
	movl	%eax, %ecx
	shrl	$11, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$7, %ecx
	andl	$-1658038656, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	sall	$15, %ecx
	andl	$-272236544, %ecx
	xorl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$18, %ecx
	xorl	%ecx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	vcmpless	%xmm0, %xmm13, %xmm0
	vblendvps	%xmm0, %xmm6, %xmm1, %xmm1
	vmovss	%xmm1, (%rsi,%rbx,4)
	cmpq	$623, %rdx
	ja	.L1202
.L912:
	movl	816(%rsp,%rdx,4), %eax
	leaq	1(%rdx), %rcx
	movq	%rcx, 3312(%rsp)
	movl	%eax, %edx
	shrl	$11, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$7, %edx
	andl	$-1658038656, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	sall	$15, %edx
	andl	$-272236544, %edx
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$18, %edx
	xorl	%edx, %eax
	vcvtsi2ssq	%rax, %xmm7, %xmm0
	vcomiss	.LC23(%rip), %xmm0
	vmulss	%xmm9, %xmm0, %xmm1
	jnb	.L915
	vmovss	%xmm1, (%r14,%rbx,4)
	incq	%rbx
	cmpq	%rbx, %rbp
	je	.L917
.L901:
	cmpq	$623, %rcx
	jbe	.L904
	movq	%r15, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	3312(%rsp), %rcx
	jmp	.L904
	.p2align 4
	.p2align 3
.L1202:
	movq	%r15, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	3312(%rsp), %rdx
	jmp	.L912
	.p2align 4
	.p2align 3
.L1201:
	movq	%r15, %rcx
	call	_ZNSt23mersenne_twister_engineIjLy32ELy624ELy397ELy31ELj2567483615ELy11ELj4294967295ELy7ELj2636928640ELy15ELj4022730752ELy18ELj1812433253EE11_M_gen_randEv
	movq	3312(%rsp), %r8
	jmp	.L908
.L915:
	movl	$0x3f7fffff, (%r14,%rbx,4)
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.L901
.L917:
	xorl	%r10d, %r10d
	cmpl	$2, g_access_pattern(%rip)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 304(%rsp)
	movq	%r10, 320(%rsp)
	je	.L1203
.L903:
	xorl	%r9d, %r9d
	movq	%r9, 96(%rsp)
.L918:
	leaq	416(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1347961171, 416(%rsp)
	movq	%rax, %rdx
	movq	%rax, 80(%rsp)
	movq	%rax, 400(%rsp)
	movb	$89, 420(%rsp)
	movq	$5, 408(%rsp)
	movb	$0, 421(%rsp)
.LEHB40:
	call	_ZL6printfPKcz
	vcvtsi2sdq	%rbp, %xmm7, %xmm15
	vmulsd	.LC25(%rip), %xmm15, %xmm10
	leaq	0(,%rbp,8), %rax
	vmovsd	.LC26(%rip), %xmm8
	vmovss	.LC69(%rip), %xmm14
	vmovsd	.LC14(%rip), %xmm12
	movq	%rax, 136(%rsp)
	leaq	-1(%rbp), %rax
	movq	%rax, 112(%rsp)
	movq	%rbp, %rax
	xorl	%r13d, %r13d
	shrq	$3, %rax
	salq	$5, %rax
	movq	%rax, 120(%rsp)
	movq	%rbp, %rax
	andq	$-8, %rax
	movq	%rax, 128(%rsp)
	.p2align 4
	.p2align 3
.L934:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	%rax, %rbx
	movl	g_access_pattern(%rip), %eax
	movslq	g_stride(%rip), %rdx
	testl	%eax, %eax
	jne	.L919
	testq	%rbp, %rbp
	je	.L925
	xorl	%eax, %eax
	cmpq	$6, 112(%rsp)
	jbe	.L922
	vbroadcastss	.LC69(%rip), %ymm1
	movq	120(%rsp), %rdx
	.p2align 4
	.p2align 3
.L923:
	vmovups	(%rdi,%rax), %ymm0
	vfmadd213ps	(%rsi,%rax), %ymm1, %ymm0
	vmovups	%ymm0, (%rsi,%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L923
	testb	$7, %bpl
	je	.L1166
	movq	128(%rsp), %rax
	vzeroupper
.L922:
	movq	%rbp, %rdx
	subq	%rax, %rdx
	leaq	-1(%rdx), %rcx
	cmpq	$2, %rcx
	jbe	.L927
	leaq	0(,%rax,4), %r8
	vbroadcastss	.LC69(%rip), %xmm0
	leaq	(%rsi,%r8), %rcx
	vmovups	(%rcx), %xmm3
	vfmadd132ps	(%rdi,%r8), %xmm3, %xmm0
	vmovups	%xmm0, (%rcx)
	movq	%rdx, %rcx
	andq	$-4, %rcx
	addq	%rcx, %rax
	andl	$3, %edx
	je	.L925
.L927:
	leaq	0(,%rax,4), %rdx
	leaq	(%rsi,%rdx), %rcx
	vmovss	(%rdi,%rdx), %xmm0
	vfmadd213ss	(%rcx), %xmm14, %xmm0
	vmovss	%xmm0, (%rcx)
	leaq	1(%rax), %rcx
	cmpq	%rbp, %rcx
	jnb	.L925
	leaq	4(%rsi,%rdx), %rcx
	vmovss	4(%rdi,%rdx), %xmm0
	addq	$2, %rax
	vfmadd213ss	(%rcx), %xmm14, %xmm0
	vmovss	%xmm0, (%rcx)
	cmpq	%rbp, %rax
	jnb	.L925
	leaq	8(%rsi,%rdx), %rax
	vmovss	8(%rdi,%rdx), %xmm0
	vfmadd213ss	(%rax), %xmm14, %xmm0
	vmovss	%xmm0, (%rax)
.L925:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	408(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%rbx, %rax
	movq	400(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm6
	vmulsd	%xmm8, %xmm6, %xmm6
	vcmpeq_ussd	%xmm0, %xmm6, %xmm0
	vblendvpd	%xmm0, %xmm12, %xmm6, %xmm6
	vdivsd	%xmm6, %xmm10, %xmm9
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	.LC28(%rip), %rbx
	movl	$1, %r8d
	movq	%rax, %rcx
	movq	%rbx, %rdx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm6, %xmm6, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm9, %xmm9, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L933
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rax
	cmovne	%rax, %rdx
.L933:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE40:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L934
	movq	400(%rsp), %rcx
	movq	80(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L935
	movq	416(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L935:
	movq	80(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$20292, 416(%rsp)
	movb	$84, 418(%rsp)
	movq	$3, 408(%rsp)
	movb	$0, 419(%rsp)
	movq	%rax, %rdx
	movq	%rax, 400(%rsp)
.LEHB41:
	call	_ZL6printfPKcz
	vmulsd	.LC25(%rip), %xmm15, %xmm10
	vmovsd	.LC14(%rip), %xmm6
	xorl	%r13d, %r13d
	.p2align 4
	.p2align 3
.L949:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L936
	testq	%rbp, %rbp
	je	.L1013
	cmpq	$6, 112(%rsp)
	jbe	.L1009
	movq	120(%rsp), %rdx
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	.p2align 4
	.p2align 3
.L939:
	vmovups	(%rsi,%rax), %ymm4
	vmulps	(%rdi,%rax), %ymm4, %ymm0
	addq	$32, %rax
	vaddps	%ymm0, %ymm1, %ymm1
	cmpq	%rdx, %rax
	jne	.L939
	vextractf128	$0x1, %ymm1, %xmm2
	vaddps	%xmm1, %xmm2, %xmm0
	vaddps	%xmm1, %xmm2, %xmm2
	vmovhlps	%xmm0, %xmm0, %xmm3
	vaddps	%xmm0, %xmm3, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm0
	vaddps	%xmm3, %xmm0, %xmm0
	testb	$7, %bpl
	je	.L1167
	movq	128(%rsp), %rax
	vzeroupper
.L938:
	movq	%rbp, %rdx
	subq	%rax, %rdx
	leaq	-1(%rdx), %rcx
	cmpq	$2, %rcx
	jbe	.L941
	vmovups	(%rdi,%rax,4), %xmm0
	movq	%rdx, %rcx
	vfmadd132ps	(%rsi,%rax,4), %xmm2, %xmm0
	andq	$-4, %rcx
	addq	%rcx, %rax
	andl	$3, %edx
	vmovhlps	%xmm0, %xmm0, %xmm1
	vaddps	%xmm0, %xmm1, %xmm1
	vshufps	$85, %xmm1, %xmm1, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	je	.L937
.L941:
	vmovss	(%rsi,%rax,4), %xmm3
	leaq	1(%rax), %rcx
	leaq	0(,%rax,4), %rdx
	vfmadd231ss	(%rdi,%rax,4), %xmm3, %xmm0
	cmpq	%rbp, %rcx
	jnb	.L937
	vmovss	4(%rdi,%rdx), %xmm2
	addq	$2, %rax
	vfmadd231ss	4(%rsi,%rdx), %xmm2, %xmm0
	cmpq	%rbp, %rax
	jnb	.L937
	vmovss	8(%rsi,%rdx), %xmm4
	vfmadd231ss	8(%rdi,%rdx), %xmm4, %xmm0
.L937:
	vmovd	%xmm0, %eax
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	408(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	400(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm1
	vmulsd	%xmm8, %xmm1, %xmm9
	vcmpeq_ussd	%xmm0, %xmm9, %xmm0
	vblendvpd	%xmm0, %xmm6, %xmm9, %xmm9
	vdivsd	%xmm9, %xmm10, %xmm12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm9, %xmm9, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm12, %xmm12, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L948
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L948:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE41:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L949
	movq	400(%rsp), %rcx
	movq	80(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L950
	movq	416(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L950:
	movq	80(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movw	$21837, 416(%rsp)
	movb	$76, 418(%rsp)
	movq	$3, 408(%rsp)
	movb	$0, 419(%rsp)
	movq	%rax, %rdx
	movq	%rax, 400(%rsp)
.LEHB42:
	call	_ZL6printfPKcz
	vmovsd	.LC14(%rip), %xmm9
	vmulsd	%xmm8, %xmm15, %xmm6
	xorl	%r13d, %r13d
	.p2align 4
	.p2align 3
.L966:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movslq	g_stride(%rip), %rdx
	movq	%rax, %r12
	movl	g_access_pattern(%rip), %eax
	testl	%eax, %eax
	jne	.L951
	testq	%rbp, %rbp
	je	.L957
	xorl	%eax, %eax
	cmpq	$6, 112(%rsp)
	jbe	.L954
	movq	120(%rsp), %rdx
	.p2align 4
	.p2align 3
.L955:
	vmovups	(%rsi,%rax), %ymm5
	vmulps	(%rdi,%rax), %ymm5, %ymm0
	vmovups	%ymm0, (%r14,%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L955
	testb	$7, %bpl
	je	.L1168
	movq	128(%rsp), %rax
	vzeroupper
.L954:
	movq	%rbp, %rcx
	subq	%rax, %rcx
	leaq	-1(%rcx), %rdx
	cmpq	$2, %rdx
	jbe	.L959
	leaq	0(,%rax,4), %rdx
	vmovups	(%rsi,%rdx), %xmm2
	vmulps	(%rdi,%rdx), %xmm2, %xmm0
	vmovups	%xmm0, (%r14,%rdx)
	movq	%rcx, %rdx
	andq	$-4, %rdx
	addq	%rdx, %rax
	andl	$3, %ecx
	je	.L957
.L959:
	leaq	0(,%rax,4), %rdx
	leaq	1(%rax), %rcx
	vmovss	(%rsi,%rdx), %xmm0
	vmulss	(%rdi,%rdx), %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rdx)
	cmpq	%rbp, %rcx
	jnb	.L957
	vmovss	4(%rdi,%rdx), %xmm0
	addq	$2, %rax
	vmulss	4(%rsi,%rdx), %xmm0, %xmm0
	vmovss	%xmm0, 4(%r14,%rdx)
	cmpq	%rbp, %rax
	jnb	.L957
	vmovss	8(%rsi,%rdx), %xmm0
	vmulss	8(%rdi,%rdx), %xmm0, %xmm0
	vmovss	%xmm0, 8(%r14,%rdx)
.L957:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	408(%rsp), %r8
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	400(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm1
	vmulsd	%xmm8, %xmm1, %xmm10
	vcmpeq_ussd	%xmm0, %xmm10, %xmm0
	vblendvpd	%xmm0, %xmm9, %xmm10, %xmm10
	vdivsd	%xmm10, %xmm6, %xmm12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm10, %xmm10, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm12, %xmm12, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L965
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rax
	cmove	%rax, %rdx
.L965:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE42:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L966
	movq	400(%rsp), %rcx
	movq	80(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L967
	movq	416(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L967:
	movq	80(%rsp), %rax
	movl	$10, %r8d
	leaq	.LC24(%rip), %rcx
	movl	$1313166419, 416(%rsp)
	movq	$7, 408(%rsp)
	movl	$1279869774, 419(%rsp)
	movb	$0, 423(%rsp)
	movq	%rax, %rdx
	movq	%rax, 400(%rsp)
.LEHB43:
	call	_ZL6printfPKcz
	vmulsd	.LC30(%rip), %xmm15, %xmm15
	vmovss	.LC69(%rip), %xmm6
	xorl	%r13d, %r13d
	vmovss	.LC71(%rip), %xmm14
	vmovsd	.LC14(%rip), %xmm12
	.p2align 4
	.p2align 3
.L970:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vmovss	.LC72(%rip), %xmm2
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movq	%rax, %r12
	movq	96(%rsp), %rax
	vmovss	%xmm6, 32(%rsp)
	vmovaps	%xmm14, %xmm3
	movq	%rbp, 40(%rsp)
	movq	%rax, 64(%rsp)
	movl	g_stride(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	g_access_pattern(%rip), %eax
	movl	%eax, 48(%rsp)
	call	_Z14stencil_scalarIfEvPT_PKS0_S0_S0_S0_y13AccessPatterniPKSt6vectorIySaIyEE
	call	_ZNSt6chrono3_V212system_clock3nowEv
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	g_csv(%rip), %rcx
	subq	%r12, %rax
	movq	408(%rsp), %r8
	movq	400(%rsp), %rdx
	vcvtsi2sdq	%rax, %xmm7, %xmm9
	vmulsd	%xmm8, %xmm9, %xmm9
	vcmpeq_ussd	%xmm0, %xmm9, %xmm0
	vblendvpd	%xmm0, %xmm12, %xmm9, %xmm9
	vdivsd	%xmm9, %xmm15, %xmm10
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	%r13d, %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm9, %xmm9, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	vmovsd	%xmm10, %xmm10, %xmm1
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z6g_typeB5cxx11(%rip), %rax
	movq	8+_Z6g_typeB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_aligned(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movzbl	g_tail(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSo9_M_insertIbEERSoT_
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_access_pattern(%rip), %eax
	movl	$11, %r8d
	leaq	.LC15(%rip), %rdx
	testl	%eax, %eax
	je	.L969
	xorl	%r8d, %r8d
	cmpl	$1, %eax
	leaq	.LC17(%rip), %rdx
	sete	%r8b
	addq	$6, %r8
	cmpl	$1, %eax
	leaq	.LC16(%rip), %rax
	cmovne	%rax, %rdx
.L969:
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%r12, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	g_stride(%rip), %edx
	movq	%r12, %rcx
	call	_ZNSolsEi
	movl	$1, %r8d
	movq	%rbx, %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %r8
	movq	%r12, %rcx
	movq	(%rax), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rax, %rcx
	movl	$1, %r8d
	leaq	.LC29(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE43:
	incl	%r13d
	cmpl	$10, %r13d
	jne	.L970
	movq	400(%rsp), %rcx
	movq	80(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L971
	movq	416(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L971:
	movq	304(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L972
	movq	320(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L972:
	movq	272(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L973
	movq	288(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L973:
	movq	240(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L974
	movq	256(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L974:
	movq	208(%rsp), %rcx
	testq	%rcx, %rcx
	je	.L975
	movq	224(%rsp), %rdx
	subq	%rcx, %rdx
	call	_ZdlPvy
.L975:
	addq	$8, 144(%rsp)
	jmp	.L889
	.p2align 4
	.p2align 3
.L951:
	cmpl	$1, %eax
	je	.L1204
	cmpl	$2, %eax
	jne	.L957
	movq	96(%rsp), %rax
	testq	%rax, %rax
	je	.L957
	testq	%rbp, %rbp
	je	.L957
	movq	(%rax), %rdx
	movq	136(%rsp), %rax
	leaq	(%rdx,%rax), %rcx
	.p2align 4
	.p2align 3
.L964:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$2, %rax
	vmovss	(%rdi,%rax), %xmm0
	vmulss	(%rsi,%rax), %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rax)
	cmpq	%rcx, %rdx
	jne	.L964
	jmp	.L957
	.p2align 4
	.p2align 3
.L936:
	cmpl	$1, %eax
	je	.L1205
	cmpl	$2, %eax
	jne	.L1013
	movq	96(%rsp), %rax
	testq	%rax, %rax
	je	.L1013
	testq	%rbp, %rbp
	je	.L1013
	movq	(%rax), %rax
	movq	136(%rsp), %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	addq	%rax, %rcx
	.p2align 4
	.p2align 3
.L946:
	movq	(%rax), %rdx
	addq	$8, %rax
	vmovss	(%rdi,%rdx,4), %xmm1
	vmulss	(%rsi,%rdx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%rax, %rcx
	jne	.L946
	jmp	.L937
	.p2align 4
	.p2align 3
.L919:
	cmpl	$1, %eax
	je	.L1206
	cmpl	$2, %eax
	jne	.L925
	movq	96(%rsp), %rax
	testq	%rax, %rax
	je	.L925
	testq	%rbp, %rbp
	je	.L925
	movq	(%rax), %rdx
	movq	136(%rsp), %rax
	leaq	(%rax,%rdx), %r8
	.p2align 4
	.p2align 3
.L932:
	movq	(%rdx), %rax
	addq	$8, %rdx
	salq	$2, %rax
	leaq	(%rsi,%rax), %rcx
	vmovss	(%rdi,%rax), %xmm0
	vfmadd213ss	(%rcx), %xmm11, %xmm0
	vmovss	%xmm0, (%rcx)
	cmpq	%rdx, %r8
	jne	.L932
	jmp	.L925
	.p2align 4
	.p2align 3
.L1013:
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L937
.L1204:
	testq	%rbp, %rbp
	je	.L957
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L963
	.p2align 4
	.p2align 3
.L962:
	vmovss	(%rsi,%rax,4), %xmm0
	vmulss	(%rdi,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rax,4)
	incq	%rax
	cmpq	%rbp, %rax
	jb	.L962
	jmp	.L957
	.p2align 4
	.p2align 3
.L963:
	vmovss	(%rdi,%rax,4), %xmm0
	vmulss	(%rsi,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rax,4)
	addq	%rdx, %rax
	cmpq	%rbp, %rax
	jb	.L963
	jmp	.L957
.L1206:
	testq	%rbp, %rbp
	je	.L925
	vmovss	.LC69(%rip), %xmm6
	xorl	%eax, %eax
	cmpl	$1, %edx
	jne	.L931
	.p2align 4
	.p2align 3
.L930:
	vmovss	(%rdi,%rax,4), %xmm0
	vfmadd213ss	(%rsi,%rax,4), %xmm6, %xmm0
	vmovss	%xmm0, (%rsi,%rax,4)
	incq	%rax
	cmpq	%rbp, %rax
	jb	.L930
	jmp	.L925
	.p2align 4
	.p2align 3
.L931:
	vmovss	(%rdi,%rax,4), %xmm0
	vfmadd213ss	(%rsi,%rax,4), %xmm6, %xmm0
	vmovss	%xmm0, (%rsi,%rax,4)
	addq	%rdx, %rax
	cmpq	%rbp, %rax
	jb	.L931
	jmp	.L925
.L1205:
	testq	%rbp, %rbp
	je	.L1013
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	jne	.L945
	.p2align 4
	.p2align 3
.L944:
	vmovss	(%rsi,%rax,4), %xmm1
	vmulss	(%rdi,%rax,4), %xmm1, %xmm1
	incq	%rax
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%rbp, %rax
	jb	.L944
	jmp	.L937
	.p2align 4
	.p2align 3
.L945:
	vmovss	(%rdi,%rax,4), %xmm1
	vmulss	(%rsi,%rax,4), %xmm1, %xmm1
	addq	%rdx, %rax
	vaddss	%xmm1, %xmm0, %xmm0
	cmpq	%rbp, %rax
	jb	.L945
	jmp	.L937
.L892:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	vmovdqa	%xmm0, 208(%rsp)
	movq	%rcx, 256(%rsp)
	movq	%rdx, 224(%rsp)
	vmovdqa	%xmm0, 240(%rsp)
	xorl	%r14d, %r14d
	movq	%r8, 272(%rsp)
	movq	%r8, 288(%rsp)
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	jmp	.L897
.L1167:
	vzeroupper
	jmp	.L937
.L1168:
	vzeroupper
	jmp	.L957
.L1166:
	vzeroupper
	jmp	.L925
.L1009:
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	jmp	.L938
.L1191:
	movl	$2, %ecx
.LEHB44:
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	leaq	.LC0(%rip), %rdx
	call	_ZL7fprintfP6_iobufPKcz.constprop.0
	jmp	.L882
.L1190:
	movl	32(%rcx), %edx
	orl	$4, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE44:
	jmp	.L881
.L862:
	leaq	.LC56(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L863
	xorl	%edi, %edi
	movl	$1, g_stride(%rip)
	movl	%edi, g_access_pattern(%rip)
	jmp	.L859
.L1203:
	movl	g_stride(%rip), %r8d
	leaq	400(%rsp), %rcx
	movq	%rbp, %rdx
.LEHB45:
	call	_Z19make_gather_indicesyi
.LEHE45:
	vmovdqa	400(%rsp), %xmm5
	cmpl	$2, g_access_pattern(%rip)
	movq	416(%rsp), %rax
	movq	%rax, 320(%rsp)
	vmovdqa	%xmm5, 304(%rsp)
	jne	.L903
	leaq	304(%rsp), %rax
	movq	%rax, 96(%rsp)
	jmp	.L918
.L884:
	movq	8+_Z14g_memory_levelB5cxx11(%rip), %rax
	cmpq	$7, %rax
	je	.L1207
	cmpq	$2, %rax
	je	.L1208
	cmpq	$4, %rax
	jne	.L998
	movq	_Z14g_memory_levelB5cxx11(%rip), %rax
	movl	$64, %edx
	cmpl	$1835102820, (%rax)
	movl	$1073741824, %eax
	cmovne	%rdx, %rax
.L887:
	shrq	$3, %rax
	leaq	824(%rsp), %r8
	movq	%r15, %rdx
	movq	%rax, 816(%rsp)
	leaq	176(%rsp), %rax
	movq	%rax, %rcx
	movq	%rax, 168(%rsp)
.LEHB46:
	call	_ZNSt6vectorIySaIyEE13_M_assign_auxIPKyEEvT_S5_St20forward_iterator_tag.isra.0
.LEHE46:
	jmp	.L885
.L1199:
	movq	168(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	movq	160(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L977
.L1194:
	leaq	.LC74(%rip), %rdx
	movq	%r15, %rcx
.LEHB47:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE47:
.LEHB48:
	call	_Z8run_demoIiEvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.isra.0
.LEHE48:
	jmp	.L1172
.L1207:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rbx
	leaq	.LC19(%rip), %rdx
	movl	$7, %r8d
	movq	%rbx, %rcx
	call	memcmp
	movl	%eax, %edx
	movl	$32768, %eax
	testl	%edx, %edx
	je	.L887
	movl	$7, %r8d
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rcx
	call	memcmp
	cmpl	$1, %eax
	sbbq	%rax, %rax
	andl	$196544, %eax
	addq	$64, %rax
	jmp	.L887
.L863:
	xorl	%r8d, %r8d
	movl	$9, %r9d
	leaq	.LC57(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy
	testq	%rax, %rax
	jne	.L864
	orq	$-1, %r9
	movl	$9, %r8d
	movq	%rbp, %rdx
	movq	%r15, %rcx
	movl	$1, g_access_pattern(%rip)
.LEHB49:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEyy
.LEHE49:
	movq	816(%rsp), %r8
	movl	$10, 32(%rsp)
	xorl	%r9d, %r9d
	leaq	.LC58(%rip), %rdx
	movq	.refptr.strtol(%rip), %rcx
.LEHB50:
	call	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_
.LEHE50:
.L1169:
	movq	%r15, %rcx
	movl	%eax, g_stride(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L859
.L1198:
	movzbl	832(%rsp), %eax
	movb	%al, (%rcx)
	vmovq	824(%rsp), %xmm0
	movq	_Z9g_cmdlineB5cxx11(%rip), %rcx
	jmp	.L824
.L864:
	xorl	%r8d, %r8d
	movl	$9, %r9d
	leaq	.LC59(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy
	testq	%rax, %rax
	je	.L1209
	leaq	.LC19(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L866
	leaq	.LC20(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L866
	leaq	.LC60(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L866
	leaq	.LC61(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L866
	leaq	.LC62(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	jne	.L866
	leaq	.LC18(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_
	testb	%al, %al
	je	.L859
.L866:
	movq	%rbp, %rdx
	leaq	_Z14g_memory_levelB5cxx11(%rip), %rcx
.LEHB51:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
	jmp	.L859
.L1209:
	orq	$-1, %r9
	movl	$9, %r8d
	movq	%rbp, %rdx
	movq	%r15, %rcx
	movl	$2, g_access_pattern(%rip)
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEyy
.LEHE51:
	movq	816(%rsp), %r8
	movl	$10, 32(%rsp)
	xorl	%r9d, %r9d
	leaq	.LC58(%rip), %rdx
	movq	.refptr.strtol(%rip), %rcx
.LEHB52:
	call	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PyS9_
.LEHE52:
	jmp	.L1169
.L1208:
	movq	_Z14g_memory_levelB5cxx11(%rip), %rdx
	movl	$524288, %eax
	cmpw	$12908, (%rdx)
	je	.L887
	cmpw	$13164, (%rdx)
	movl	$8388608, %eax
	movl	$64, %edx
	cmovne	%rdx, %rax
	jmp	.L887
.L1179:
	leaq	.LC2(%rip), %rcx
.LEHB53:
	call	_ZSt19__throw_logic_errorPKc
.LEHE53:
.L998:
	movl	$64, %eax
	jmp	.L887
.L1189:
	leaq	.LC63(%rip), %rcx
.LEHB54:
	call	_ZSt20__throw_length_errorPKc
.L1187:
	leaq	.LC63(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1186:
	leaq	.LC63(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE54:
.L1200:
	leaq	.LC1(%rip), %rcx
.LEHB55:
	call	_ZSt20__throw_length_errorPKc
.LEHE55:
.L1032:
	movq	%rax, %rbx
	vzeroupper
.L985:
	movq	168(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	movq	160(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L986:
	movq	104(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L991:
	movq	88(%rsp), %rcx
	call	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rcx
.LEHB56:
	call	_Unwind_Resume
.LEHE56:
.L1035:
	movq	%rax, %rbx
	vzeroupper
.L979:
	leaq	304(%rsp), %rcx
	call	_ZNSt6vectorIySaIyEED1Ev
	leaq	272(%rsp), %rcx
	call	_ZNSt6vectorIfSaIfEED1Ev
.L983:
	leaq	240(%rsp), %rcx
	call	_ZNSt6vectorIfSaIfEED1Ev
.L984:
	leaq	208(%rsp), %rcx
	call	_ZNSt6vectorIfSaIfEED1Ev
	jmp	.L985
.L1030:
.L1174:
	movq	%r15, %rcx
	movq	%rax, %rbx
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L986
.L1037:
.L1171:
	leaq	400(%rsp), %rcx
	movq	%rax, %rbx
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L979
.L1034:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L983
.L1036:
	jmp	.L1171
.L1033:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L984
.L1039:
	jmp	.L1171
.L1038:
	jmp	.L1171
.L1025:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L991
.L1026:
	movq	%rax, %rbx
	vzeroupper
.L989:
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L991
.L1028:
.L1173:
	movq	%r15, %rcx
	movq	%rax, %rbx
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L989
.L1029:
	movq	%rax, %rbx
	vzeroupper
	jmp	.L986
.L1027:
	jmp	.L1173
.L1031:
	jmp	.L1174
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA11249:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11249-.LLSDACSB11249
.LLSDACSB11249:
	.uleb128 .LEHB27-.LFB11249
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB28-.LFB11249
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L1025-.LFB11249
	.uleb128 0
	.uleb128 .LEHB29-.LFB11249
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB30-.LFB11249
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L1026-.LFB11249
	.uleb128 0
	.uleb128 .LEHB31-.LFB11249
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L1025-.LFB11249
	.uleb128 0
	.uleb128 .LEHB32-.LFB11249
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L1026-.LFB11249
	.uleb128 0
	.uleb128 .LEHB33-.LFB11249
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L1025-.LFB11249
	.uleb128 0
	.uleb128 .LEHB34-.LFB11249
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB35-.LFB11249
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L1030-.LFB11249
	.uleb128 0
	.uleb128 .LEHB36-.LFB11249
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB37-.LFB11249
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L1032-.LFB11249
	.uleb128 0
	.uleb128 .LEHB38-.LFB11249
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L1033-.LFB11249
	.uleb128 0
	.uleb128 .LEHB39-.LFB11249
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L1034-.LFB11249
	.uleb128 0
	.uleb128 .LEHB40-.LFB11249
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L1036-.LFB11249
	.uleb128 0
	.uleb128 .LEHB41-.LFB11249
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L1037-.LFB11249
	.uleb128 0
	.uleb128 .LEHB42-.LFB11249
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L1038-.LFB11249
	.uleb128 0
	.uleb128 .LEHB43-.LFB11249
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L1039-.LFB11249
	.uleb128 0
	.uleb128 .LEHB44-.LFB11249
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB45-.LFB11249
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L1035-.LFB11249
	.uleb128 0
	.uleb128 .LEHB46-.LFB11249
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L1032-.LFB11249
	.uleb128 0
	.uleb128 .LEHB47-.LFB11249
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB48-.LFB11249
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L1031-.LFB11249
	.uleb128 0
	.uleb128 .LEHB49-.LFB11249
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L1026-.LFB11249
	.uleb128 0
	.uleb128 .LEHB50-.LFB11249
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L1027-.LFB11249
	.uleb128 0
	.uleb128 .LEHB51-.LFB11249
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L1026-.LFB11249
	.uleb128 0
	.uleb128 .LEHB52-.LFB11249
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L1028-.LFB11249
	.uleb128 0
	.uleb128 .LEHB53-.LFB11249
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L1025-.LFB11249
	.uleb128 0
	.uleb128 .LEHB54-.LFB11249
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L1029-.LFB11249
	.uleb128 0
	.uleb128 .LEHB55-.LFB11249
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L1032-.LFB11249
	.uleb128 0
	.uleb128 .LEHB56-.LFB11249
	.uleb128 .LEHE56-.LEHB56
	.uleb128 0
	.uleb128 0
.LLSDACSE11249:
	.section	.text.startup,"x"
	.seh_endproc
	.p2align 4
	.def	_GLOBAL__sub_I_g_aligned;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I_g_aligned
_GLOBAL__sub_I_g_aligned:
.LFB12568:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	16+_Z6g_typeB5cxx11(%rip), %rax
	leaq	__tcf_0(%rip), %rcx
	movq	$0, 8+_Z6g_typeB5cxx11(%rip)
	movb	$0, 16+_Z6g_typeB5cxx11(%rip)
	movq	%rax, _Z6g_typeB5cxx11(%rip)
	call	atexit
	leaq	16+_Z14g_memory_levelB5cxx11(%rip), %rax
	leaq	__tcf_1(%rip), %rcx
	movq	$0, 8+_Z14g_memory_levelB5cxx11(%rip)
	movq	%rax, _Z14g_memory_levelB5cxx11(%rip)
	movb	$0, 16+_Z14g_memory_levelB5cxx11(%rip)
	call	atexit
	leaq	16+_Z9g_cmdlineB5cxx11(%rip), %rax
	leaq	__tcf_2(%rip), %rcx
	movq	%rax, _Z9g_cmdlineB5cxx11(%rip)
	movq	$0, 8+_Z9g_cmdlineB5cxx11(%rip)
	movb	$0, 16+_Z9g_cmdlineB5cxx11(%rip)
	call	atexit
	leaq	g_csv(%rip), %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev
	leaq	__tcf_3(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I_g_aligned
	.globl	g_csv
	.bss
	.align 32
g_csv:
	.space 464
	.globl	_Z9g_cmdlineB5cxx11
	.align 32
_Z9g_cmdlineB5cxx11:
	.space 32
	.globl	_Z14g_memory_levelB5cxx11
	.align 32
_Z14g_memory_levelB5cxx11:
	.space 32
	.globl	_Z6g_typeB5cxx11
	.align 32
_Z6g_typeB5cxx11:
	.space 32
	.globl	g_stride
	.data
	.align 4
g_stride:
	.long	1
	.globl	g_access_pattern
	.bss
	.align 4
g_access_pattern:
	.space 4
	.globl	g_tail
g_tail:
	.space 1
	.globl	g_aligned
	.data
g_aligned:
	.byte	1
	.section .rdata,"dr"
	.align 32
.LC3:
	.quad	1024
	.quad	4096
	.quad	16384
	.quad	32768
	.align 32
.LC4:
	.quad	196608
	.quad	524288
	.quad	2097152
	.quad	8388608
	.align 8
.LC14:
	.long	-1717986918
	.long	1069128089
	.align 4
.LC22:
	.long	796917760
	.align 4
.LC23:
	.long	1333788672
	.align 8
.LC25:
	.long	-400107883
	.long	1042361867
	.align 8
.LC26:
	.long	-400107883
	.long	1041313291
	.align 8
.LC30:
	.long	-500134854
	.long	1043691918
	.align 8
.LC31:
	.long	-536870912
	.long	1072693247
	.align 8
.LC33:
	.long	0
	.long	1074266112
	.align 8
.LC35:
	.long	0
	.long	1073741824
	.align 8
.LC36:
	.long	0
	.long	1072693248
	.align 4
.LC37:
	.long	1065353215
	.align 4
.LC69:
	.long	1077936128
	.set	.LC71,.LC35+4
	.align 4
.LC72:
	.long	1065353216
	.ident	"GCC: (GNU) 13.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt12__basic_fileIcED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_baseD2Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy;	.scl	2;	.type	32;	.endef
	.def	_ZSt19__throw_logic_errorPKc;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_out_of_rangePKc;	.scl	2;	.type	32;	.endef
	.def	_ZSt24__throw_invalid_argumentPKc;	.scl	2;	.type	32;	.endef
	.def	memcmp;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIyEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIbEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEC1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEyyPKcy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5rfindEPKcyy;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEyy;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.strtol, "dr"
	.globl	.refptr.strtol
	.linkonce	discard
.refptr.strtol:
	.quad	strtol
	.section	.rdata$.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE:
	.quad	_ZTVSt9basic_iosIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE:
	.quad	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE:
	.quad	_ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE:
	.quad	_ZTVSt13basic_filebufIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE:
	.quad	_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE

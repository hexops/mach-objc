	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0
"-[MACHView canBecomeKeyView]":

	.cfi_startproc
	movl	$1, %eax
	retq
	.cfi_endproc

"-[MACHView acceptsFirstResponder]":

	.cfi_startproc
	movl	$1, %eax
	retq
	.cfi_endproc

"+[MACHView layerClass]":

	.cfi_startproc
	movq	_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView makeBackingLayer]":

	.cfi_startproc
	movq	_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.2(%rip), %rsi
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView initCommon]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.4(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	movl	$1, %edx
	callq	*%r15
	movq	_OBJC_SELECTOR_REFERENCES_.6(%rip), %rsi
	movl	$2, %edx
	movq	%rbx, %rdi
	callq	*%r15
	movq	_OBJC_SELECTOR_REFERENCES_.2(%rip), %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	*%r15
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	_OBJC_IVAR_$_MACHView._metalLayer(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	movq	_objc_release@GOTPCREL(%rip), %r12
	callq	*%r12
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	*%r15
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_OBJC_SELECTOR_REFERENCES_.8(%rip), %rsi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	*%r15
	movq	%r14, %rdi
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	jmpq	*%rax
	.cfi_endproc

"-[MACHView initWithFrame:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	32(%rsp), %rax
	movq	%rdi, (%rax)
	movq	l_OBJC_CLASSLIST_SUP_REFS_$_(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	_OBJC_SELECTOR_REFERENCES_.10(%rip), %rsi
	movq	136(%rsp), %rcx
	movq	%rcx, 24(%rsp)
	movq	128(%rsp), %rcx
	movq	%rcx, 16(%rsp)
	movq	112(%rsp), %rcx
	movq	120(%rsp), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movq	%rax, %rdi
	callq	_objc_msgSendSuper2
	movq	%rax, %rbx
	testq	%rax, %rax
	je	LBB5_2
	movq	_OBJC_SELECTOR_REFERENCES_.12(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	movq	%rbx, %rdi
	callq	*%r15
	movq	_OBJC_SELECTOR_REFERENCES_.14(%rip), %rdx
	leaq	48(%rsp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_objc_msgSend_stret
	movq	_OBJC_CLASSLIST_REFERENCES_$_.15(%rip), %rdi
	callq	_objc_alloc
	movq	_OBJC_SELECTOR_REFERENCES_.17(%rip), %rsi
	movq	24(%r14), %rcx
	movq	%rcx, 24(%rsp)
	movq	16(%r14), %rcx
	movq	%rcx, 16(%rsp)
	movq	(%r14), %rcx
	movq	8(%r14), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movl	$67, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	callq	*%r15
	movq	_OBJC_IVAR_$_MACHView.trackingArea(%rip), %r14
	movq	(%rbx,%r14), %rdi
	movq	%rax, (%rbx,%r14)
	callq	*_objc_release@GOTPCREL(%rip)
	movq	(%rbx,%r14), %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.19(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r15
LBB5_2:
	movq	%rbx, %rax
	addq	$80, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"-[MACHView didMoveToWindow]":

	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.21(%rip), %rsi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	*_objc_release@GOTPCREL(%rip)
	testq	%r14, %r14
	je	LBB6_1
	movq	_OBJC_SELECTOR_REFERENCES_.25(%rip), %rsi
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
LBB6_1:
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %r14
	movq	(%rbx,%r14), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.23(%rip), %rsi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	(%rbx,%r14), %rdi
	movq	$0, (%rbx,%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmpq	*_objc_release@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView viewDidMoveToWindow]":

	.cfi_startproc
	movq	_OBJC_SELECTOR_REFERENCES_.25(%rip), %rsi
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView movedToWindow]":

	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.27(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r13
	callq	*%r13
	movq	%rbx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_objc_sync_enter
	movq	_OBJC_IVAR_$_MACHView._continueRunLoop(%rip), %r14
	movb	$0, (%rbx,%r14)
	movq	%rbx, %rdi
	callq	_objc_sync_exit
	movq	_objc_release@GOTPCREL(%rip), %rbp
	movq	%rbx, %rdi
	callq	*%rbp
	movq	_OBJC_CLASSLIST_REFERENCES_$_.28(%rip), %rdi
	callq	_objc_alloc
	movq	_OBJC_SELECTOR_REFERENCES_.30(%rip), %rcx
	movq	_OBJC_SELECTOR_REFERENCES_.32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	xorl	%r8d, %r8d
	callq	*%r13
	movq	_OBJC_IVAR_$_MACHView._renderThread(%rip), %r15
	movq	(%rbx,%r15), %rdi
	movq	%rax, (%rbx,%r15)
	callq	*%rbp
	movb	$1, (%rbx,%r14)
	movq	(%rbx,%r15), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.34(%rip), %rsi
	callq	*%r13
	movq	_OBJC_SELECTOR_REFERENCES_.21(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_OBJC_SELECTOR_REFERENCES_.36(%rip), %rsi
	movq	%rax, %rdi
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_OBJC_SELECTOR_REFERENCES_.38(%rip), %rsi
	movq	%rax, %rdi
	callq	*%r13
	movq	_OBJC_SELECTOR_REFERENCES_.40(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r13
	movq	%r15, %rdi
	callq	*%rbp
	movq	%r14, %rdi
	callq	*%rbp
	movq	_OBJC_SELECTOR_REFERENCES_.42(%rip), %rdx
	leaq	24(%rsp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_objc_msgSend_stret
	movsd	16(%r14), %xmm0
	movsd	%xmm0, 8(%rsp)
	movsd	24(%r14), %xmm0
	movsd	%xmm0, 16(%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.2(%rip), %r14
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_OBJC_SELECTOR_REFERENCES_.44(%rip), %r12
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	*%r13
	mulsd	8(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
	movq	%r15, %rdi
	callq	*%rbp
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	*%r13
	movsd	16(%rsp), %xmm1

	mulsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rsp)
	movq	%r14, %rdi
	callq	*%rbp
	movq	_OBJC_SELECTOR_REFERENCES_.46(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.48(%rip), %rsi
	movq	%rax, %rdi
	movsd	8(%rsp), %xmm0

	movsd	16(%rsp), %xmm1

	callq	*%r13
	movq	%rbx, %rdi
	callq	*%rbp
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

"-[MACHView setupCAMetalLink]":

	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.50(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %rbp
	callq	*%rbp
	movq	_OBJC_SELECTOR_REFERENCES_.52(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%rbp
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_OBJC_SELECTOR_REFERENCES_.54(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	callq	*%rbp
	movq	_objc_release@GOTPCREL(%rip), %r15
	movq	%r14, %rdi
	callq	*%r15
	movq	_OBJC_CLASSLIST_REFERENCES_$_.55(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.57(%rip), %rsi
	callq	*%rbp
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_NSWindowWillCloseNotification@GOTPCREL(%rip), %rax
	movq	(%rax), %r12
	movq	_OBJC_SELECTOR_REFERENCES_.21(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%rbp
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r13
	movq	_OBJC_SELECTOR_REFERENCES_.61(%rip), %rsi
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.59(%rip), %rcx
	movq	%r12, %r8
	movq	%rax, %r9
	callq	*%rbp
	movq	%r13, %rdi
	callq	*%r15
	movq	%r14, %rdi
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmpq	*%rax
	.cfi_endproc

"-[MACHView windowWillClose:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.63(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	movq	%rdx, %rdi
	callq	*%r15
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_OBJC_SELECTOR_REFERENCES_.21(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r15
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_objc_release@GOTPCREL(%rip), %r12
	movq	%rax, %rdi
	callq	*%r12
	movq	%r14, %rdi
	callq	*%r12
	cmpq	%r15, %r14
	je	LBB10_2
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
LBB10_2:
	movq	_OBJC_SELECTOR_REFERENCES_.65(%rip), %rsi
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.p2align	2, 0x0
LCPI11_0:
	.long	0x42f00000
LCPI11_1:
	.long	0x40400000
	.section	__TEXT,__text,regular,pure_instructions
"-[MACHView makeMetalLink:]":
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_CLASSLIST_REFERENCES_$_.66(%rip), %r14
	movq	%rdx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	_objc_alloc
	movq	_OBJC_SELECTOR_REFERENCES_.68(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r13
	movq	%rax, %rdi
	movq	%r15, %rdx
	callq	*%r13
	movq	%rax, %r14
	movq	_objc_release@GOTPCREL(%rip), %r12
	movq	%r15, %rdi
	callq	*%r12
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %r15
	movq	(%rbx,%r15), %rdi
	movq	%r14, (%rbx,%r15)
	callq	*%r12
	movss	LCPI11_0(%rip), %xmm0
	movaps	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	callq	_CAFrameRateRangeMake
	movq	(%rbx,%r15), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.70(%rip), %rsi
	callq	*%r13
	movq	(%rbx,%r15), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.72(%rip), %rsi
	movss	LCPI11_1(%rip), %xmm0
	callq	*%r13
	movq	(%rbx,%r15), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.74(%rip), %rsi
	xorl	%edx, %edx
	callq	*%r13
	movq	(%rbx,%r15), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.8(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r13, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmpq	*%rax
	.cfi_endproc

"-[MACHView updateTrackingAreas]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView.trackingArea(%rip), %r12
	movq	(%rdi,%r12), %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.76(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	callq	*%r15
	movq	_OBJC_SELECTOR_REFERENCES_.14(%rip), %rdx
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_objc_msgSend_stret
	movq	_OBJC_CLASSLIST_REFERENCES_$_.15(%rip), %rdi
	callq	_objc_alloc
	movq	_OBJC_SELECTOR_REFERENCES_.17(%rip), %rsi
	movq	24(%r14), %rcx
	movq	%rcx, 24(%rsp)
	movq	16(%r14), %rcx
	movq	%rcx, 16(%rsp)
	movq	(%r14), %rcx
	movq	8(%r14), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movl	$67, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	callq	*%r15
	movq	(%rbx,%r12), %rdi
	movq	%rax, (%rbx,%r12)
	callq	*_objc_release@GOTPCREL(%rip)
	movq	(%rbx,%r12), %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.19(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r15
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"-[MACHView metalDisplayLink:needsUpdate:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp(%rip), %r12
	movsd	(%rdi,%r12), %xmm0
	movsd	%xmm0, 8(%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.78(%rip), %r14
	movq	%rcx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %r15
	movq	_objc_msgSend@GOTPCREL(%rip), %r13
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	*%r13
	movsd	8(%rsp), %xmm1

	subsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	*%r13
	movsd	%xmm0, (%rbx,%r12)
	movq	_OBJC_SELECTOR_REFERENCES_.80(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movsd	8(%rsp), %xmm0

	callq	*%r13
	movq	%r15, %rdi
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmpq	*_objc_release@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView startMetalLink]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	callq	_CACurrentMediaTime
	movq	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp(%rip), %rax
	movsd	%xmm0, (%rbx,%rax)
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %rax
	movq	(%rbx,%rax), %rbx
	movq	_OBJC_CLASSLIST_REFERENCES_$_.81(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.83(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	callq	*%r15
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	_NSRunLoopCommonModes@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	_OBJC_SELECTOR_REFERENCES_.85(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	*%r15
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmpq	*_objc_release@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView stopMetalLink]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %r12
	movq	(%rdi,%r12), %r14
	movq	_OBJC_CLASSLIST_REFERENCES_$_.81(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.87(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r13
	callq	*%r13
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_NSRunLoopCommonModes@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	_OBJC_SELECTOR_REFERENCES_.89(%rip), %rsi
	movq	%r14, %rdi
	movq	%r15, %rdx
	callq	*%r13
	movq	%r15, %rdi
	callq	*_objc_release@GOTPCREL(%rip)
	movq	(%rbx,%r12), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.23(%rip), %rsi
	movq	%r13, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmpq	*%rax
	.cfi_endproc

"-[MACHView stopRenderLoop]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %rax
	movq	(%rdi,%rax), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.23(%rip), %rsi
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView dealloc]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.50(%rip), %rsi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	%rsp, %rdi
	movq	%rbx, (%rdi)
	movq	l_OBJC_CLASSLIST_SUP_REFS_$_(%rip), %rax
	movq	%rax, 8(%rdi)
	movq	_OBJC_SELECTOR_REFERENCES_.91(%rip), %rsi
	callq	_objc_msgSendSuper2
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc

"-[MACHView runThread]":

	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movq	_OBJC_CLASSLIST_REFERENCES_$_.81(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.83(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r12
	callq	*%r12
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, (%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.93(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r12
	movq	_NSDefaultRunLoopMode@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.96(%rip), %rax
	movq	%rax, 24(%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.98(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	_OBJC_SELECTOR_REFERENCES_.100(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	_OBJC_IVAR_$_MACHView._continueRunLoop(%rip), %r13
LBB18_1:
	callq	_objc_autoreleasePoolPush
	movq	%rax, %r14
	movq	_OBJC_CLASSLIST_REFERENCES_$_.94(%rip), %rdi
	movq	24(%rsp), %rsi
	callq	*%r12
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	(%rsp), %rdi
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rdx
	movq	%rax, %rcx
	callq	*%r12
	movq	%r15, %rdi
	movq	_objc_release@GOTPCREL(%rip), %rbp
	callq	*%rbp
	movq	%r14, %rdi
	callq	_objc_autoreleasePoolPop
	movq	%rbx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	_objc_sync_enter
	movq	%r14, %rdi
	movq	8(%rsp), %rsi
	callq	*%r12
	movb	(%rbx,%r13), %r15b
	movq	%r14, %rdi
	callq	_objc_sync_exit
	movq	%r14, %rdi
	callq	*%rbp
	testb	%r15b, %r15b
	jne	LBB18_1
	movq	(%rsp), %rdi
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmpq	*_objc_release@GOTPCREL(%rip)
	.cfi_endproc

"-[MACHView resizeDrawable:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movsd	%xmm0, 8(%rsp)
	movq	%rdi, %rbx
	movq	_OBJC_SELECTOR_REFERENCES_.42(%rip), %rdx
	leaq	24(%rsp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_objc_msgSend_stret
	movsd	16(%r14), %xmm1
	mulsd	8(%rsp), %xmm1
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm0
	jae	LBB19_5
	movsd	8(%rsp), %xmm0

	mulsd	48(%rsp), %xmm0
	movsd	%xmm0, 8(%rsp)
	movq	_OBJC_IVAR_$_MACHView._metalLayer(%rip), %r12
	movq	(%rbx,%r12), %rdi
	movsd	%xmm1, 16(%rsp)
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	_objc_sync_enter
	movq	(%rbx,%r12), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.102(%rip), %r15
	movq	%r15, %rsi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movsd	16(%rsp), %xmm1

	ucomisd	%xmm0, %xmm1
	jne	LBB19_3
	jp	LBB19_3
	movq	(%rbx,%r12), %rdi
	movq	%r15, %rsi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movsd	8(%rsp), %xmm0

	ucomisd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm1

	jne	LBB19_3
	jnp	LBB19_4
LBB19_3:
	movq	(%rbx,%r12), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.104(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r15
	movapd	%xmm1, %xmm0
	movsd	8(%rsp), %xmm1

	callq	*%r15
	movq	_OBJC_IVAR_$_MACHView._delegate(%rip), %rax
	movq	(%rbx,%rax), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.48(%rip), %rsi
	movsd	16(%rsp), %xmm0

	movsd	8(%rsp), %xmm1

	callq	*%r15
LBB19_4:
	movq	%r14, %rdi
	callq	_objc_sync_exit
	movq	%r14, %rdi
	callq	*_objc_release@GOTPCREL(%rip)
LBB19_5:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"-[MACHView renderUpdate:with:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movsd	%xmm0, 8(%rsp)
	movq	%rdx, %r14
	movq	%rdi, %r15
	movq	_OBJC_IVAR_$_MACHView._metalLayer(%rip), %r12
	movq	(%rdi,%r12), %rdi
	movq	_objc_retain@GOTPCREL(%rip), %r13
	callq	*%r13
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	*%r13
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_objc_sync_enter
	movq	_OBJC_IVAR_$_MACHView._delegate(%rip), %rax
	movq	(%r15,%rax), %rdi
	movq	(%r15,%r12), %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.106(%rip), %rsi
	movq	%r14, %rcx
	movsd	8(%rsp), %xmm0

	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	_objc_release@GOTPCREL(%rip), %r15
	movq	%r14, %rdi
	callq	*%r15
	movq	%rbx, %rdi
	callq	_objc_sync_exit
	movq	%rbx, %rdi
	movq	%r15, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmpq	*%rax
	.cfi_endproc

"-[MACHView render]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._render_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB21_1
	jmpq	*16(%rdi)
LBB21_1:
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_render:]"
	.globl	"-[MACHView setBlock_render:]"
"-[MACHView setBlock_render:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB22_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._render_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB22_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyDown:]"
	.globl	"-[MACHView setBlock_keyDown:]"
"-[MACHView setBlock_keyDown:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB23_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB23_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyUp:]"
	.globl	"-[MACHView setBlock_keyUp:]"
"-[MACHView setBlock_keyUp:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB24_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB24_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseMoved:]"
	.globl	"-[MACHView setBlock_mouseMoved:]"
"-[MACHView setBlock_mouseMoved:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB25_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB25_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseDown:]"
	.globl	"-[MACHView setBlock_mouseDown:]"
"-[MACHView setBlock_mouseDown:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB26_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB26_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseUp:]"
	.globl	"-[MACHView setBlock_mouseUp:]"
"-[MACHView setBlock_mouseUp:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB27_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB27_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_scrollWheel:]"
	.globl	"-[MACHView setBlock_scrollWheel:]"
"-[MACHView setBlock_scrollWheel:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB28_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._scrollWheel_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB28_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_flagsChanged:]"
	.globl	"-[MACHView setBlock_flagsChanged:]"
"-[MACHView setBlock_flagsChanged:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB29_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._flagsChanged_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB29_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_insertText:]"
	.globl	"-[MACHView setBlock_insertText:]"
"-[MACHView setBlock_insertText:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB30_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._insertText_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB30_1:
	popq	%rbx
	retq
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_magnify:]"
	.globl	"-[MACHView setBlock_magnify:]"
"-[MACHView setBlock_magnify:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB31_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._magnify_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB31_1:
	popq	%rbx
	retq
	.cfi_endproc

"-[MACHView keyDown:]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movq	%rdx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rax
	movq	(%r14,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB32_2
	movq	%rbx, %rsi
	callq	*16(%rdi)
LBB32_2:
	movq	%rsp, %rdx
	movq	%rbx, (%rdx)
	movq	_OBJC_CLASSLIST_REFERENCES_$_.107(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.109(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r12
	movl	$1, %ecx
	callq	*%r12
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_OBJC_SELECTOR_REFERENCES_.111(%rip), %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	callq	*%r12
	movq	_objc_release@GOTPCREL(%rip), %r14
	movq	%r15, %rdi
	callq	*%r14
	movq	%rbx, %rdi
	callq	*%r14
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"-[MACHView insertText:]":

	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 80(%rsp)
	movq	%rdx, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
	movq	%rax, %r14
	movq	_NSApp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.113(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %rbx
	callq	*%rbx
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, 48(%rsp)
	movq	_OBJC_CLASSLIST_REFERENCES_$_.114(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
	callq	*%rbx
	movq	_OBJC_SELECTOR_REFERENCES_.116(%rip), %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	callq	*%rbx
	testb	%al, %al
	movq	%r14, 72(%rsp)
	je	LBB33_2
	movq	_OBJC_SELECTOR_REFERENCES_.118(%rip), %rsi
	movq	%r14, %rdi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	jmp	LBB33_3
LBB33_2:
	movq	%r14, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
LBB33_3:
	movq	%rax, %r12
	movq	_OBJC_SELECTOR_REFERENCES_.120(%rip), %rsi
	movq	%rax, %rdi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	$0, 56(%rsp)
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	LBB33_10
	movq	_OBJC_SELECTOR_REFERENCES_.122(%rip), %r13
	movq	_OBJC_IVAR_$_MACHView._insertText_block(%rip), %r15
	leaq	56(%rsp), %r14
	leaq	44(%rsp), %rbp
LBB33_5:
	movl	$0, 44(%rsp)
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, 16(%rsp)
	movq	%rax, 8(%rsp)
	movq	%r14, 24(%rsp)
	movq	$0, (%rsp)
	movl	$4, %ecx
	movl	$2348810496, %r9d
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbp, %rdx
	xorl	%r8d, %r8d
	callq	*%rbx
	testb	%al, %al
	je	LBB33_9
	movl	44(%rsp), %edx
	movl	%edx, %eax
	andl	$-256, %eax
	cmpl	$63232, %eax
	je	LBB33_9
	movq	80(%rsp), %rax
	movq	(%rax,%r15), %rdi
	testq	%rdi, %rdi
	je	LBB33_9
	movq	48(%rsp), %rsi
	callq	*16(%rdi)
LBB33_9:
	cmpq	$0, 64(%rsp)
	jne	LBB33_5
LBB33_10:
	movq	_objc_release@GOTPCREL(%rip), %rbx
	movq	48(%rsp), %rdi
	callq	*%rbx
	movq	%r12, %rdi
	callq	*%rbx
	movq	72(%rsp), %rdi
	callq	*%rbx
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

"-[MACHView keyUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB34_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB34_1:
	retq
	.cfi_endproc

"-[MACHView flagsChanged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._flagsChanged_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB35_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB35_1:
	retq
	.cfi_endproc

"-[MACHView mouseMoved:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB36_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB36_1:
	retq
	.cfi_endproc

"-[MACHView mouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB37_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB37_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB38_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB38_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB39_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB39_1:
	retq
	.cfi_endproc

"-[MACHView mouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB40_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB40_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB41_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB41_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB42_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB42_1:
	retq
	.cfi_endproc

"-[MACHView mouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB43_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB43_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB44_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB44_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB45_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB45_1:
	retq
	.cfi_endproc

"-[MACHView scrollWheel:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._scrollWheel_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB46_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB46_1:
	retq
	.cfi_endproc

"-[MACHView magnifyWithEvent:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._magnify_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB47_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB47_1:
	retq
	.cfi_endproc

"-[MACHView doCommandBySelector:]":

	.cfi_startproc
	retq
	.cfi_endproc

"-[MACHView metalLayer]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._metalLayer(%rip), %rax
	movq	(%rdi,%rax), %rax
	retq
	.cfi_endproc

"-[MACHView isPaused]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._paused(%rip), %rax
	movsbl	(%rdi,%rax), %eax
	retq
	.cfi_endproc

"-[MACHView setPaused:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._paused(%rip), %rax
	movb	%dl, (%rdi,%rax)
	retq
	.cfi_endproc

"-[MACHView delegate]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._delegate(%rip), %rax
	movq	(%rdi,%rax), %rax
	retq
	.cfi_endproc

"-[MACHView setDelegate:]":

	.cfi_startproc
	addq	_OBJC_IVAR_$_MACHView._delegate(%rip), %rdi
	movq	%rdx, %rsi
	jmp	_objc_storeStrong
	.cfi_endproc

"-[MACHView .cxx_destruct]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView._delegate(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._metalLayer(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._renderThread(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._displayLink(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView.trackingArea(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._render_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._insertText_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._magnify_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._scrollWheel_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._flagsChanged_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	_objc_storeStrong
	addq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	popq	%rbx
	jmp	_objc_storeStrong
	.cfi_endproc

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_CAMetalLayer

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_:
	.asciz	"class"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	L_OBJC_METH_VAR_NAME_

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.1:
	.asciz	"layer"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	L_OBJC_METH_VAR_NAME_.1

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.3:
	.asciz	"setWantsLayer:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	L_OBJC_METH_VAR_NAME_.3

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.5:
	.asciz	"setLayerContentsRedrawPolicy:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.6:
	.quad	L_OBJC_METH_VAR_NAME_.5

	.private_extern	_OBJC_IVAR_$_MACHView._metalLayer
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._metalLayer
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._metalLayer:
	.quad	128

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.7:
	.asciz	"setDelegate:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	L_OBJC_METH_VAR_NAME_.7

	.section	__DATA,__objc_data
	.globl	_OBJC_CLASS_$_MACHView
	.p2align	3, 0x0
_OBJC_CLASS_$_MACHView:
	.quad	_OBJC_METACLASS_$_MACHView
	.quad	_OBJC_CLASS_$_NSView
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_CLASS_RO_$_MACHView

	.section	__DATA,__objc_superrefs,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_CLASSLIST_SUP_REFS_$_:
	.quad	_OBJC_CLASS_$_MACHView

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.9:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.10:
	.quad	L_OBJC_METH_VAR_NAME_.9

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.11:
	.asciz	"initCommon"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.12:
	.quad	L_OBJC_METH_VAR_NAME_.11

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.13:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.14:
	.quad	L_OBJC_METH_VAR_NAME_.13

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.15:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.16:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.17:
	.quad	L_OBJC_METH_VAR_NAME_.16

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.quad	88

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.18:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.19:
	.quad	L_OBJC_METH_VAR_NAME_.18

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.20:
	.asciz	"window"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.21:
	.quad	L_OBJC_METH_VAR_NAME_.20

	.private_extern	_OBJC_IVAR_$_MACHView._displayLink
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._displayLink
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._displayLink:
	.quad	104

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.22:
	.asciz	"invalidate"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.23:
	.quad	L_OBJC_METH_VAR_NAME_.22

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.24:
	.asciz	"movedToWindow"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.25:
	.quad	L_OBJC_METH_VAR_NAME_.24

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.26:
	.asciz	"setupCAMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.27:
	.quad	L_OBJC_METH_VAR_NAME_.26

	.private_extern	_OBJC_IVAR_$_MACHView._continueRunLoop
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._continueRunLoop
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._continueRunLoop:
	.quad	120

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.28:
	.quad	_OBJC_CLASS_$_NSThread

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.29:
	.asciz	"runThread"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.30:
	.quad	L_OBJC_METH_VAR_NAME_.29

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.31:
	.asciz	"initWithTarget:selector:object:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.32:
	.quad	L_OBJC_METH_VAR_NAME_.31

	.private_extern	_OBJC_IVAR_$_MACHView._renderThread
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._renderThread
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._renderThread:
	.quad	112

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.33:
	.asciz	"start"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.34:
	.quad	L_OBJC_METH_VAR_NAME_.33

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.35:
	.asciz	"screen"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.36:
	.quad	L_OBJC_METH_VAR_NAME_.35

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.37:
	.asciz	"backingScaleFactor"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.38:
	.quad	L_OBJC_METH_VAR_NAME_.37

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.39:
	.asciz	"resizeDrawable:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.40:
	.quad	L_OBJC_METH_VAR_NAME_.39

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.41:
	.asciz	"bounds"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.42:
	.quad	L_OBJC_METH_VAR_NAME_.41

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.43:
	.asciz	"contentsScale"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.44:
	.quad	L_OBJC_METH_VAR_NAME_.43

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.45:
	.asciz	"delegate"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.46:
	.quad	L_OBJC_METH_VAR_NAME_.45

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.47:
	.asciz	"drawableResize:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.48:
	.quad	L_OBJC_METH_VAR_NAME_.47

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.49:
	.asciz	"stopRenderLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.50:
	.quad	L_OBJC_METH_VAR_NAME_.49

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.51:
	.asciz	"metalLayer"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.52:
	.quad	L_OBJC_METH_VAR_NAME_.51

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.53:
	.asciz	"makeMetalLink:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.54:
	.quad	L_OBJC_METH_VAR_NAME_.53

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.55:
	.quad	_OBJC_CLASS_$_NSNotificationCenter

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.56:
	.asciz	"defaultCenter"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.57:
	.quad	L_OBJC_METH_VAR_NAME_.56

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.58:
	.asciz	"windowWillClose:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.59:
	.quad	L_OBJC_METH_VAR_NAME_.58

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.60:
	.asciz	"addObserver:selector:name:object:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.61:
	.quad	L_OBJC_METH_VAR_NAME_.60

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.62:
	.asciz	"object"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.63:
	.quad	L_OBJC_METH_VAR_NAME_.62

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.64:
	.asciz	"stopMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.65:
	.quad	L_OBJC_METH_VAR_NAME_.64

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.66:
	.quad	_OBJC_CLASS_$_CAMetalDisplayLink

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.67:
	.asciz	"initWithMetalLayer:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.68:
	.quad	L_OBJC_METH_VAR_NAME_.67

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.69:
	.asciz	"setPreferredFrameRateRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.70:
	.quad	L_OBJC_METH_VAR_NAME_.69

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.71:
	.asciz	"setPreferredFrameLatency:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.72:
	.quad	L_OBJC_METH_VAR_NAME_.71

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.73:
	.asciz	"setPaused:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.74:
	.quad	L_OBJC_METH_VAR_NAME_.73

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.75:
	.asciz	"removeTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.76:
	.quad	L_OBJC_METH_VAR_NAME_.75

	.private_extern	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp:
	.quad	96

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.77:
	.asciz	"targetPresentationTimestamp"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.78:
	.quad	L_OBJC_METH_VAR_NAME_.77

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.79:
	.asciz	"renderUpdate:with:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.80:
	.quad	L_OBJC_METH_VAR_NAME_.79

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.81:
	.quad	_OBJC_CLASS_$_NSRunLoop

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.82:
	.asciz	"currentRunLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.83:
	.quad	L_OBJC_METH_VAR_NAME_.82

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.84:
	.asciz	"addToRunLoop:forMode:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.85:
	.quad	L_OBJC_METH_VAR_NAME_.84

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.86:
	.asciz	"mainRunLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.87:
	.quad	L_OBJC_METH_VAR_NAME_.86

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.88:
	.asciz	"removeFromRunLoop:forMode:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.89:
	.quad	L_OBJC_METH_VAR_NAME_.88

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.90:
	.asciz	"dealloc"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.91:
	.quad	L_OBJC_METH_VAR_NAME_.90

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.92:
	.asciz	"startMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.93:
	.quad	L_OBJC_METH_VAR_NAME_.92

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.94:
	.quad	_OBJC_CLASS_$_NSDate

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.95:
	.asciz	"distantFuture"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.96:
	.quad	L_OBJC_METH_VAR_NAME_.95

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.97:
	.asciz	"runMode:beforeDate:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.98:
	.quad	L_OBJC_METH_VAR_NAME_.97

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.99:
	.asciz	"render"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.100:
	.quad	L_OBJC_METH_VAR_NAME_.99

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.101:
	.asciz	"drawableSize"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.102:
	.quad	L_OBJC_METH_VAR_NAME_.101

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.103:
	.asciz	"setDrawableSize:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.104:
	.quad	L_OBJC_METH_VAR_NAME_.103

	.private_extern	_OBJC_IVAR_$_MACHView._delegate
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._delegate
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._delegate:
	.quad	136

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.105:
	.asciz	"renderTo:with:at:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.106:
	.quad	L_OBJC_METH_VAR_NAME_.105

	.private_extern	_OBJC_IVAR_$_MACHView._render_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._render_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._render_block:
	.quad	80

	.private_extern	_OBJC_IVAR_$_MACHView._keyDown_block
	.globl	_OBJC_IVAR_$_MACHView._keyDown_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._keyDown_block:
	.quad	8

	.private_extern	_OBJC_IVAR_$_MACHView._keyUp_block
	.globl	_OBJC_IVAR_$_MACHView._keyUp_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._keyUp_block:
	.quad	16

	.private_extern	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.globl	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._mouseMoved_block:
	.quad	32

	.private_extern	_OBJC_IVAR_$_MACHView._mouseDown_block
	.globl	_OBJC_IVAR_$_MACHView._mouseDown_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._mouseDown_block:
	.quad	40

	.private_extern	_OBJC_IVAR_$_MACHView._mouseUp_block
	.globl	_OBJC_IVAR_$_MACHView._mouseUp_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._mouseUp_block:
	.quad	48

	.private_extern	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.globl	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._scrollWheel_block:
	.quad	56

	.private_extern	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.globl	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._flagsChanged_block:
	.quad	24

	.private_extern	_OBJC_IVAR_$_MACHView._insertText_block
	.globl	_OBJC_IVAR_$_MACHView._insertText_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._insertText_block:
	.quad	72

	.private_extern	_OBJC_IVAR_$_MACHView._magnify_block
	.globl	_OBJC_IVAR_$_MACHView._magnify_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._magnify_block:
	.quad	64

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.107:
	.quad	_OBJC_CLASS_$_NSArray

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.108:
	.asciz	"arrayWithObjects:count:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.109:
	.quad	L_OBJC_METH_VAR_NAME_.108

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.110:
	.asciz	"interpretKeyEvents:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.111:
	.quad	L_OBJC_METH_VAR_NAME_.110

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.112:
	.asciz	"currentEvent"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.113:
	.quad	L_OBJC_METH_VAR_NAME_.112

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.114:
	.quad	_OBJC_CLASS_$_NSAttributedString

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.115:
	.asciz	"isKindOfClass:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.116:
	.quad	L_OBJC_METH_VAR_NAME_.115

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.117:
	.asciz	"string"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.118:
	.quad	L_OBJC_METH_VAR_NAME_.117

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.119:
	.asciz	"length"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.120:
	.quad	L_OBJC_METH_VAR_NAME_.119

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.121:
	.asciz	"getBytes:maxLength:usedLength:encoding:options:range:remainingRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.122:
	.quad	L_OBJC_METH_VAR_NAME_.121

	.private_extern	_OBJC_IVAR_$_MACHView._paused
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._paused
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._paused:
	.quad	121

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_:
	.asciz	"MACHView"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.123:
	.asciz	"layerClass"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_:
	.asciz	"#16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_CLASS_METHODS_MACHView:
	.long	24
	.long	1
	.quad	L_OBJC_METH_VAR_NAME_.123
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"+[MACHView layerClass]"

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_.124:
	.asciz	"CALayerDelegate"

L_OBJC_CLASS_NAME_.125:
	.asciz	"NSObject"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.126:
	.asciz	"isEqual:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.127:
	.asciz	"c24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.128:
	.asciz	"self"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.129:
	.asciz	"@16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.130:
	.asciz	"performSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.131:
	.asciz	"@24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.132:
	.asciz	"performSelector:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.133:
	.asciz	"@32@0:8:16@24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.134:
	.asciz	"performSelector:withObject:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.135:
	.asciz	"@40@0:8:16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.136:
	.asciz	"isProxy"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.137:
	.asciz	"c16@0:8"

L_OBJC_METH_VAR_TYPE_.138:
	.asciz	"c24@0:8#16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.139:
	.asciz	"isMemberOfClass:"

L_OBJC_METH_VAR_NAME_.140:
	.asciz	"conformsToProtocol:"

L_OBJC_METH_VAR_NAME_.141:
	.asciz	"respondsToSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.142:
	.asciz	"c24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.143:
	.asciz	"retain"

L_OBJC_METH_VAR_NAME_.144:
	.asciz	"release"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.145:
	.asciz	"Vv16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.146:
	.asciz	"autorelease"

L_OBJC_METH_VAR_NAME_.147:
	.asciz	"retainCount"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.148:
	.asciz	"Q16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.149:
	.asciz	"zone"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.150:
	.asciz	"^{_NSZone=}16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.151:
	.asciz	"hash"

L_OBJC_METH_VAR_NAME_.152:
	.asciz	"superclass"

L_OBJC_METH_VAR_NAME_.153:
	.asciz	"description"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject:
	.long	24
	.long	19
	.quad	L_OBJC_METH_VAR_NAME_.126
	.quad	L_OBJC_METH_VAR_TYPE_.127
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.128
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.130
	.quad	L_OBJC_METH_VAR_TYPE_.131
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.132
	.quad	L_OBJC_METH_VAR_TYPE_.133
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.134
	.quad	L_OBJC_METH_VAR_TYPE_.135
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.136
	.quad	L_OBJC_METH_VAR_TYPE_.137
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.115
	.quad	L_OBJC_METH_VAR_TYPE_.138
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.139
	.quad	L_OBJC_METH_VAR_TYPE_.138
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.140
	.quad	L_OBJC_METH_VAR_TYPE_.127
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.141
	.quad	L_OBJC_METH_VAR_TYPE_.142
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.143
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.144
	.quad	L_OBJC_METH_VAR_TYPE_.145
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.146
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.147
	.quad	L_OBJC_METH_VAR_TYPE_.148
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.149
	.quad	L_OBJC_METH_VAR_TYPE_.150
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.151
	.quad	L_OBJC_METH_VAR_TYPE_.148
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.152
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.153
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.154:
	.asciz	"debugDescription"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject:
	.long	24
	.long	1
	.quad	L_OBJC_METH_VAR_NAME_.154
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_PROP_NAME_ATTR_:
	.asciz	"hash"

L_OBJC_PROP_NAME_ATTR_.155:
	.asciz	"TQ,R"

L_OBJC_PROP_NAME_ATTR_.156:
	.asciz	"superclass"

L_OBJC_PROP_NAME_ATTR_.157:
	.asciz	"T#,R"

L_OBJC_PROP_NAME_ATTR_.158:
	.asciz	"description"

L_OBJC_PROP_NAME_ATTR_.159:
	.asciz	"T@\"NSString\",R,C"

L_OBJC_PROP_NAME_ATTR_.160:
	.asciz	"debugDescription"

L_OBJC_PROP_NAME_ATTR_.161:
	.asciz	"T@\"NSString\",?,R,C"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROP_LIST_NSObject:
	.long	16
	.long	4
	.quad	L_OBJC_PROP_NAME_ATTR_
	.quad	L_OBJC_PROP_NAME_ATTR_.155
	.quad	L_OBJC_PROP_NAME_ATTR_.156
	.quad	L_OBJC_PROP_NAME_ATTR_.157
	.quad	L_OBJC_PROP_NAME_ATTR_.158
	.quad	L_OBJC_PROP_NAME_ATTR_.159
	.quad	L_OBJC_PROP_NAME_ATTR_.160
	.quad	L_OBJC_PROP_NAME_ATTR_.161

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.162:
	.asciz	"c24@0:8@\"Protocol\"16"

L_OBJC_METH_VAR_TYPE_.163:
	.asciz	"@\"NSString\"16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject:
	.quad	L_OBJC_METH_VAR_TYPE_.127
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	L_OBJC_METH_VAR_TYPE_.131
	.quad	L_OBJC_METH_VAR_TYPE_.133
	.quad	L_OBJC_METH_VAR_TYPE_.135
	.quad	L_OBJC_METH_VAR_TYPE_.137
	.quad	L_OBJC_METH_VAR_TYPE_.138
	.quad	L_OBJC_METH_VAR_TYPE_.138
	.quad	L_OBJC_METH_VAR_TYPE_.162
	.quad	L_OBJC_METH_VAR_TYPE_.142
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	L_OBJC_METH_VAR_TYPE_.145
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	L_OBJC_METH_VAR_TYPE_.148
	.quad	L_OBJC_METH_VAR_TYPE_.150
	.quad	L_OBJC_METH_VAR_TYPE_.148
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	L_OBJC_METH_VAR_TYPE_.163
	.quad	L_OBJC_METH_VAR_TYPE_.163

	.private_extern	__OBJC_PROTOCOL_$_NSObject
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_PROTOCOL_$_NSObject
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_NSObject:
	.quad	0
	.quad	L_OBJC_CLASS_NAME_.125
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject
	.quad	0
	.quad	__OBJC_$_PROP_LIST_NSObject
	.long	96
	.long	0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_NSObject
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_NSObject
	.p2align	3, 0x0
__OBJC_LABEL_PROTOCOL_$_NSObject:
	.quad	__OBJC_PROTOCOL_$_NSObject

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_REFS_CALayerDelegate:
	.quad	1
	.quad	__OBJC_PROTOCOL_$_NSObject
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.164:
	.asciz	"displayLayer:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.165:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.166:
	.asciz	"drawLayer:inContext:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.167:
	.asciz	"v32@0:8@16^{CGContext=}24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.168:
	.asciz	"layerWillDraw:"

L_OBJC_METH_VAR_NAME_.169:
	.asciz	"layoutSublayersOfLayer:"

L_OBJC_METH_VAR_NAME_.170:
	.asciz	"actionForLayer:forKey:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.171:
	.asciz	"@32@0:8@16@24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_CALayerDelegate:
	.long	24
	.long	5
	.quad	L_OBJC_METH_VAR_NAME_.164
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.166
	.quad	L_OBJC_METH_VAR_TYPE_.167
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.168
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.169
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.170
	.quad	L_OBJC_METH_VAR_TYPE_.171
	.quad	0

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.172:
	.asciz	"v24@0:8@\"CALayer\"16"

L_OBJC_METH_VAR_TYPE_.173:
	.asciz	"v32@0:8@\"CALayer\"16^{CGContext=}24"

L_OBJC_METH_VAR_TYPE_.174:
	.asciz	"@\"<CAAction>\"32@0:8@\"CALayer\"16@\"NSString\"24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_CALayerDelegate:
	.quad	L_OBJC_METH_VAR_TYPE_.172
	.quad	L_OBJC_METH_VAR_TYPE_.173
	.quad	L_OBJC_METH_VAR_TYPE_.172
	.quad	L_OBJC_METH_VAR_TYPE_.172
	.quad	L_OBJC_METH_VAR_TYPE_.174

	.private_extern	__OBJC_PROTOCOL_$_CALayerDelegate
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_CALayerDelegate
	.weak_definition	__OBJC_PROTOCOL_$_CALayerDelegate
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_CALayerDelegate:
	.quad	0
	.quad	L_OBJC_CLASS_NAME_.124
	.quad	__OBJC_$_PROTOCOL_REFS_CALayerDelegate
	.quad	0
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_CALayerDelegate
	.quad	0
	.quad	0
	.long	96
	.long	0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_CALayerDelegate
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_CALayerDelegate
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_CALayerDelegate
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_CALayerDelegate
	.p2align	3, 0x0
__OBJC_LABEL_PROTOCOL_$_CALayerDelegate:
	.quad	__OBJC_PROTOCOL_$_CALayerDelegate

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_.175:
	.asciz	"CAMetalDisplayLinkDelegate"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.176:
	.asciz	"metalDisplayLink:needsUpdate:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.177:
	.asciz	"v32@0:8@16@24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_CAMetalDisplayLinkDelegate:
	.long	24
	.long	1
	.quad	L_OBJC_METH_VAR_NAME_.176
	.quad	L_OBJC_METH_VAR_TYPE_.177
	.quad	0

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.178:
	.asciz	"v32@0:8@\"CAMetalDisplayLink\"16@\"CAMetalDisplayLinkUpdate\"24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_CAMetalDisplayLinkDelegate:
	.quad	L_OBJC_METH_VAR_TYPE_.178

	.private_extern	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.weak_definition	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate:
	.quad	0
	.quad	L_OBJC_CLASS_NAME_.175
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_CAMetalDisplayLinkDelegate
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	96
	.long	0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_CAMetalDisplayLinkDelegate
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.p2align	3, 0x0
__OBJC_LABEL_PROTOCOL_$_CAMetalDisplayLinkDelegate:
	.quad	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_CLASS_PROTOCOLS_$_MACHView:
	.quad	2
	.quad	__OBJC_PROTOCOL_$_CALayerDelegate
	.quad	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.quad	0

	.p2align	3, 0x0
__OBJC_METACLASS_RO_$_MACHView:
	.long	389
	.long	40
	.long	40
	.space	4
	.quad	0
	.quad	L_OBJC_CLASS_NAME_
	.quad	__OBJC_$_CLASS_METHODS_MACHView
	.quad	__OBJC_CLASS_PROTOCOLS_$_MACHView
	.quad	0
	.quad	0
	.quad	0

	.section	__DATA,__objc_data
	.globl	_OBJC_METACLASS_$_MACHView
	.p2align	3, 0x0
_OBJC_METACLASS_$_MACHView:
	.quad	_OBJC_METACLASS_$_NSObject
	.quad	_OBJC_METACLASS_$_NSView
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_METACLASS_RO_$_MACHView

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_.179:
	.asciz	"\013\022\022"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.180:
	.asciz	"canBecomeKeyView"

L_OBJC_METH_VAR_NAME_.181:
	.asciz	"acceptsFirstResponder"

L_OBJC_METH_VAR_NAME_.182:
	.asciz	"makeBackingLayer"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.183:
	.asciz	"v16@0:8"

L_OBJC_METH_VAR_TYPE_.184:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.185:
	.asciz	"didMoveToWindow"

L_OBJC_METH_VAR_NAME_.186:
	.asciz	"viewDidMoveToWindow"

L_OBJC_METH_VAR_NAME_.187:
	.asciz	"updateTrackingAreas"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.188:
	.asciz	"v24@0:8d16"

L_OBJC_METH_VAR_TYPE_.189:
	.asciz	"v32@0:8@16d24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.190:
	.asciz	"keyDown:"

L_OBJC_METH_VAR_NAME_.191:
	.asciz	"insertText:"

L_OBJC_METH_VAR_NAME_.192:
	.asciz	"keyUp:"

L_OBJC_METH_VAR_NAME_.193:
	.asciz	"flagsChanged:"

L_OBJC_METH_VAR_NAME_.194:
	.asciz	"mouseMoved:"

L_OBJC_METH_VAR_NAME_.195:
	.asciz	"mouseDragged:"

L_OBJC_METH_VAR_NAME_.196:
	.asciz	"rightMouseDragged:"

L_OBJC_METH_VAR_NAME_.197:
	.asciz	"otherMouseDragged:"

L_OBJC_METH_VAR_NAME_.198:
	.asciz	"mouseDown:"

L_OBJC_METH_VAR_NAME_.199:
	.asciz	"rightMouseDown:"

L_OBJC_METH_VAR_NAME_.200:
	.asciz	"otherMouseDown:"

L_OBJC_METH_VAR_NAME_.201:
	.asciz	"mouseUp:"

L_OBJC_METH_VAR_NAME_.202:
	.asciz	"rightMouseUp:"

L_OBJC_METH_VAR_NAME_.203:
	.asciz	"otherMouseUp:"

L_OBJC_METH_VAR_NAME_.204:
	.asciz	"scrollWheel:"

L_OBJC_METH_VAR_NAME_.205:
	.asciz	"magnifyWithEvent:"

L_OBJC_METH_VAR_NAME_.206:
	.asciz	"doCommandBySelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.207:
	.asciz	"v24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.208:
	.asciz	"isPaused"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.209:
	.asciz	"v20@0:8c16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.210:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	44
	.quad	L_OBJC_METH_VAR_NAME_.180
	.quad	L_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	L_OBJC_METH_VAR_NAME_.181
	.quad	L_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	L_OBJC_METH_VAR_NAME_.182
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView makeBackingLayer]"
	.quad	L_OBJC_METH_VAR_NAME_.11
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView initCommon]"
	.quad	L_OBJC_METH_VAR_NAME_.9
	.quad	L_OBJC_METH_VAR_TYPE_.184
	.quad	"-[MACHView initWithFrame:]"
	.quad	L_OBJC_METH_VAR_NAME_.185
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView didMoveToWindow]"
	.quad	L_OBJC_METH_VAR_NAME_.186
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView viewDidMoveToWindow]"
	.quad	L_OBJC_METH_VAR_NAME_.24
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView movedToWindow]"
	.quad	L_OBJC_METH_VAR_NAME_.26
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView setupCAMetalLink]"
	.quad	L_OBJC_METH_VAR_NAME_.58
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView windowWillClose:]"
	.quad	L_OBJC_METH_VAR_NAME_.53
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView makeMetalLink:]"
	.quad	L_OBJC_METH_VAR_NAME_.187
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView updateTrackingAreas]"
	.quad	L_OBJC_METH_VAR_NAME_.176
	.quad	L_OBJC_METH_VAR_TYPE_.177
	.quad	"-[MACHView metalDisplayLink:needsUpdate:]"
	.quad	L_OBJC_METH_VAR_NAME_.92
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView startMetalLink]"
	.quad	L_OBJC_METH_VAR_NAME_.64
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView stopMetalLink]"
	.quad	L_OBJC_METH_VAR_NAME_.49
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView stopRenderLoop]"
	.quad	L_OBJC_METH_VAR_NAME_.90
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView dealloc]"
	.quad	L_OBJC_METH_VAR_NAME_.29
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView runThread]"
	.quad	L_OBJC_METH_VAR_NAME_.39
	.quad	L_OBJC_METH_VAR_TYPE_.188
	.quad	"-[MACHView resizeDrawable:]"
	.quad	L_OBJC_METH_VAR_NAME_.79
	.quad	L_OBJC_METH_VAR_TYPE_.189
	.quad	"-[MACHView renderUpdate:with:]"
	.quad	L_OBJC_METH_VAR_NAME_.99
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView render]"
	.quad	L_OBJC_METH_VAR_NAME_.190
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView keyDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.191
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView insertText:]"
	.quad	L_OBJC_METH_VAR_NAME_.192
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView keyUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.193
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView flagsChanged:]"
	.quad	L_OBJC_METH_VAR_NAME_.194
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseMoved:]"
	.quad	L_OBJC_METH_VAR_NAME_.195
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.196
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.197
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.198
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.199
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.200
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.201
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.202
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.203
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.204
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView scrollWheel:]"
	.quad	L_OBJC_METH_VAR_NAME_.205
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView magnifyWithEvent:]"
	.quad	L_OBJC_METH_VAR_NAME_.206
	.quad	L_OBJC_METH_VAR_TYPE_.207
	.quad	"-[MACHView doCommandBySelector:]"
	.quad	L_OBJC_METH_VAR_NAME_.51
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView metalLayer]"
	.quad	L_OBJC_METH_VAR_NAME_.208
	.quad	L_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView isPaused]"
	.quad	L_OBJC_METH_VAR_NAME_.73
	.quad	L_OBJC_METH_VAR_TYPE_.209
	.quad	"-[MACHView setPaused:]"
	.quad	L_OBJC_METH_VAR_NAME_.45
	.quad	L_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView delegate]"
	.quad	L_OBJC_METH_VAR_NAME_.7
	.quad	L_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView setDelegate:]"
	.quad	L_OBJC_METH_VAR_NAME_.210
	.quad	L_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.211:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.212:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.213:
	.asciz	"_keyUp_block"

L_OBJC_METH_VAR_NAME_.214:
	.asciz	"_flagsChanged_block"

L_OBJC_METH_VAR_NAME_.215:
	.asciz	"_mouseMoved_block"

L_OBJC_METH_VAR_NAME_.216:
	.asciz	"_mouseDown_block"

L_OBJC_METH_VAR_NAME_.217:
	.asciz	"_mouseUp_block"

L_OBJC_METH_VAR_NAME_.218:
	.asciz	"_scrollWheel_block"

L_OBJC_METH_VAR_NAME_.219:
	.asciz	"_magnify_block"

L_OBJC_METH_VAR_NAME_.220:
	.asciz	"_insertText_block"

L_OBJC_METH_VAR_NAME_.221:
	.asciz	"_render_block"

L_OBJC_METH_VAR_NAME_.222:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.223:
	.asciz	"@\"NSTrackingArea\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.224:
	.asciz	"_previousTargetPresentationTimestamp"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.225:
	.asciz	"d"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.226:
	.asciz	"_displayLink"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.227:
	.asciz	"@\"CAMetalDisplayLink\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.228:
	.asciz	"_renderThread"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.229:
	.asciz	"@\"NSThread\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.230:
	.asciz	"_continueRunLoop"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.231:
	.asciz	"c"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.232:
	.asciz	"_paused"

L_OBJC_METH_VAR_NAME_.233:
	.asciz	"_metalLayer"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.234:
	.asciz	"@\"CAMetalLayer\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.235:
	.asciz	"_delegate"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.236:
	.asciz	"@\"<GameViewDelegate>\""

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	18
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	L_OBJC_METH_VAR_NAME_.211
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	L_OBJC_METH_VAR_NAME_.213
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	L_OBJC_METH_VAR_NAME_.214
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	L_OBJC_METH_VAR_NAME_.215
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	L_OBJC_METH_VAR_NAME_.216
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	L_OBJC_METH_VAR_NAME_.217
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	L_OBJC_METH_VAR_NAME_.218
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._magnify_block
	.quad	L_OBJC_METH_VAR_NAME_.219
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._insertText_block
	.quad	L_OBJC_METH_VAR_NAME_.220
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._render_block
	.quad	L_OBJC_METH_VAR_NAME_.221
	.quad	L_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	L_OBJC_METH_VAR_NAME_.222
	.quad	L_OBJC_METH_VAR_TYPE_.223
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.quad	L_OBJC_METH_VAR_NAME_.224
	.quad	L_OBJC_METH_VAR_TYPE_.225
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._displayLink
	.quad	L_OBJC_METH_VAR_NAME_.226
	.quad	L_OBJC_METH_VAR_TYPE_.227
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._renderThread
	.quad	L_OBJC_METH_VAR_NAME_.228
	.quad	L_OBJC_METH_VAR_TYPE_.229
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._continueRunLoop
	.quad	L_OBJC_METH_VAR_NAME_.230
	.quad	L_OBJC_METH_VAR_TYPE_.231
	.long	0
	.long	1
	.quad	_OBJC_IVAR_$_MACHView._paused
	.quad	L_OBJC_METH_VAR_NAME_.232
	.quad	L_OBJC_METH_VAR_TYPE_.231
	.long	0
	.long	1
	.quad	_OBJC_IVAR_$_MACHView._metalLayer
	.quad	L_OBJC_METH_VAR_NAME_.233
	.quad	L_OBJC_METH_VAR_TYPE_.234
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._delegate
	.quad	L_OBJC_METH_VAR_NAME_.235
	.quad	L_OBJC_METH_VAR_TYPE_.236
	.long	3
	.long	8

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_PROP_NAME_ATTR_.237:
	.asciz	"metalLayer"

L_OBJC_PROP_NAME_ATTR_.238:
	.asciz	"T@\"CAMetalLayer\",R,N,V_metalLayer"

L_OBJC_PROP_NAME_ATTR_.239:
	.asciz	"paused"

L_OBJC_PROP_NAME_ATTR_.240:
	.asciz	"Tc,N,GisPaused,V_paused"

L_OBJC_PROP_NAME_ATTR_.241:
	.asciz	"delegate"

L_OBJC_PROP_NAME_ATTR_.242:
	.asciz	"T@\"<GameViewDelegate>\",&,N,V_delegate"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROP_LIST_MACHView:
	.long	16
	.long	7
	.quad	L_OBJC_PROP_NAME_ATTR_.237
	.quad	L_OBJC_PROP_NAME_ATTR_.238
	.quad	L_OBJC_PROP_NAME_ATTR_.239
	.quad	L_OBJC_PROP_NAME_ATTR_.240
	.quad	L_OBJC_PROP_NAME_ATTR_.241
	.quad	L_OBJC_PROP_NAME_ATTR_.242
	.quad	L_OBJC_PROP_NAME_ATTR_
	.quad	L_OBJC_PROP_NAME_ATTR_.155
	.quad	L_OBJC_PROP_NAME_ATTR_.156
	.quad	L_OBJC_PROP_NAME_ATTR_.157
	.quad	L_OBJC_PROP_NAME_ATTR_.158
	.quad	L_OBJC_PROP_NAME_ATTR_.159
	.quad	L_OBJC_PROP_NAME_ATTR_.160
	.quad	L_OBJC_PROP_NAME_ATTR_.161

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	144
	.space	4
	.quad	L_OBJC_CLASS_NAME_.179
	.quad	L_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_MACHView
	.quad	__OBJC_CLASS_PROTOCOLS_$_MACHView
	.quad	__OBJC_$_INSTANCE_VARIABLES_MACHView
	.quad	0
	.quad	__OBJC_$_PROP_LIST_MACHView

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_MACHView

	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_CALayerDelegate
	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_NSObject
	.no_dead_strip	__OBJC_PROTOCOL_$_CALayerDelegate
	.no_dead_strip	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.no_dead_strip	__OBJC_PROTOCOL_$_NSObject
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols

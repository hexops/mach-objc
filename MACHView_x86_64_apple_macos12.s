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

"-[MACHView dealloc]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView.separateThread(%rip), %rax
	cmpb	$0, (%rdi,%rax)
	je	LBB2_2
	movq	_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
	movq	%rbx, %rdi
	callq	*_objc_msgSend@GOTPCREL(%rip)
LBB2_2:
	movq	%rsp, %rdi
	movq	%rbx, (%rdi)
	movq	l_OBJC_CLASSLIST_SUP_REFS_$_(%rip), %rax
	movq	%rax, 8(%rdi)
	movq	_OBJC_SELECTOR_REFERENCES_.2(%rip), %rsi
	callq	_objc_msgSendSuper2
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc

"-[MACHView viewDidMoveToWindow]":

	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	leaq	8(%rsp), %rdi
	movq	%rbx, (%rdi)
	movq	l_OBJC_CLASSLIST_SUP_REFS_$_(%rip), %rax
	movq	%rax, 8(%rdi)
	movq	_OBJC_SELECTOR_REFERENCES_.4(%rip), %rsi
	callq	_objc_msgSendSuper2
	movq	_OBJC_IVAR_$_MACHView.separateThread(%rip), %rax
	cmpb	$0, (%rbx,%rax)
	je	LBB3_3
	movq	_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r14
	movq	%rbx, %rdi
	callq	*%r14
	movq	_OBJC_SELECTOR_REFERENCES_.6(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r14
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	*_objc_release@GOTPCREL(%rip)
	testq	%r14, %r14
	je	LBB3_3
	movq	__dispatch_source_type_data_add@GOTPCREL(%rip), %rdi
	movq	__dispatch_main_q@GOTPCREL(%rip), %rcx
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_dispatch_source_create
	movq	_OBJC_IVAR_$_MACHView.m_displaySource(%rip), %r14
	movq	(%rbx,%r14), %rdi
	movq	%rax, (%rbx,%r14)
	callq	*_objc_release@GOTPCREL(%rip)
	movq	(%rbx,%r14), %rdi
	movq	__NSConcreteStackBlock@GOTPCREL(%rip), %rax
	leaq	24(%rsp), %rsi
	movq	%rax, (%rsi)
	movl	$3254779904, %eax
	movq	%rax, 8(%rsi)
	leaq	"___31-[MACHView viewDidMoveToWindow]_block_invoke"(%rip), %rax
	movq	%rax, 16(%rsi)
	leaq	"___block_descriptor_40_8_32s_e5_v8\x01?0l"(%rip), %rax
	movq	%rax, 24(%rsi)
	movq	%rbx, 32(%rsi)
	callq	_dispatch_source_set_event_handler
	movq	(%rbx,%r14), %rdi
	callq	_dispatch_resume
	movq	_OBJC_IVAR_$_MACHView.m_displayLink(%rip), %r15
	leaq	(%rbx,%r15), %rdi
	callq	_CVDisplayLinkCreateWithActiveCGDisplays
	movq	(%rbx,%r15), %rdi
	movq	(%rbx,%r14), %rdx
	leaq	_displayLinkCallback(%rip), %rsi
	callq	_CVDisplayLinkSetOutputCallback
	movq	(%rbx,%r15), %rdi
	callq	_CVDisplayLinkStart
LBB3_3:
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"___31-[MACHView viewDidMoveToWindow]_block_invoke":

	.cfi_startproc
	movq	32(%rdi), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.8(%rip), %rsi
	jmpq	*_objc_msgSend@GOTPCREL(%rip)
	.cfi_endproc

	.private_extern	___copy_helper_block_8_32s
	.globl	___copy_helper_block_8_32s
	.weak_def_can_be_hidden	___copy_helper_block_8_32s
___copy_helper_block_8_32s:
	.cfi_startproc
	movq	32(%rsi), %rdi
	jmpq	*_objc_retain@GOTPCREL(%rip)
	.cfi_endproc

	.private_extern	___destroy_helper_block_8_32s
	.globl	___destroy_helper_block_8_32s
	.weak_def_can_be_hidden	___destroy_helper_block_8_32s
___destroy_helper_block_8_32s:
	.cfi_startproc
	movq	32(%rdi), %rdi
	jmpq	*_objc_release@GOTPCREL(%rip)
	.cfi_endproc

_displayLinkCallback:

	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%r9, %rbx
	callq	_objc_autoreleasePoolPush
	movq	%rax, %r14
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_dispatch_source_merge_data
	movq	%r14, %rdi
	callq	_objc_autoreleasePoolPop
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc

"-[MACHView render]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._render_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB8_1
	jmpq	*16(%rdi)
LBB8_1:
	retq
	.cfi_endproc

"-[MACHView stopRenderLoop]":

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
	movq	_OBJC_IVAR_$_MACHView.m_displaySource(%rip), %r14
	movq	(%rdi,%r14), %rdi
	testq	%rdi, %rdi
	je	LBB9_2
	callq	_dispatch_source_cancel
	movq	(%rbx,%r14), %rdi
	movq	$0, (%rbx,%r14)
	callq	*_objc_release@GOTPCREL(%rip)
LBB9_2:
	movq	_OBJC_IVAR_$_MACHView.m_displayLink(%rip), %r14
	movq	(%rbx,%r14), %rdi
	testq	%rdi, %rdi
	je	LBB9_4
	callq	_CVDisplayLinkStop
	movq	(%rbx,%r14), %rdi
	callq	_CVDisplayLinkRelease
	movq	$0, (%rbx,%r14)
LBB9_4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
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
	je	LBB10_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._render_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB10_1:
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
	je	LBB11_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB11_1:
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
	je	LBB12_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB12_1:
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
	je	LBB13_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB13_1:
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
	je	LBB14_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB14_1:
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
	je	LBB15_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB15_1:
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
	je	LBB16_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._scrollWheel_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB16_1:
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
	je	LBB17_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._flagsChanged_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB17_1:
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
	je	LBB18_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._insertText_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB18_1:
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
	je	LBB19_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._magnify_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB19_1:
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
	je	LBB20_2
	movq	%rbx, %rsi
	callq	*16(%rdi)
LBB20_2:
	movq	%rsp, %rdx
	movq	%rbx, (%rdx)
	movq	_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.10(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %r12
	movl	$1, %ecx
	callq	*%r12
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, %r15
	movq	_OBJC_SELECTOR_REFERENCES_.12(%rip), %rsi
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
	movq	_OBJC_SELECTOR_REFERENCES_.14(%rip), %rsi
	movq	_objc_msgSend@GOTPCREL(%rip), %rbx
	callq	*%rbx
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	movq	%rax, 48(%rsp)
	movq	_OBJC_CLASSLIST_REFERENCES_$_.15(%rip), %rdi
	movq	_OBJC_SELECTOR_REFERENCES_.17(%rip), %rsi
	callq	*%rbx
	movq	_OBJC_SELECTOR_REFERENCES_.19(%rip), %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	callq	*%rbx
	testb	%al, %al
	movq	%r14, 72(%rsp)
	je	LBB21_2
	movq	_OBJC_SELECTOR_REFERENCES_.21(%rip), %rsi
	movq	%r14, %rdi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	%rax, %rdi
	callq	_objc_retainAutoreleasedReturnValue
	jmp	LBB21_3
LBB21_2:
	movq	%r14, %rdi
	callq	*_objc_retain@GOTPCREL(%rip)
LBB21_3:
	movq	%rax, %r12
	movq	_OBJC_SELECTOR_REFERENCES_.23(%rip), %rsi
	movq	%rax, %rdi
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	$0, 56(%rsp)
	movq	%rax, 64(%rsp)
	testq	%rax, %rax
	je	LBB21_10
	movq	_OBJC_SELECTOR_REFERENCES_.25(%rip), %r13
	movq	_OBJC_IVAR_$_MACHView._insertText_block(%rip), %r15
	leaq	56(%rsp), %r14
	leaq	44(%rsp), %rbp
LBB21_5:
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
	je	LBB21_9
	movl	44(%rsp), %edx
	movl	%edx, %eax
	andl	$-256, %eax
	cmpl	$63232, %eax
	je	LBB21_9
	movq	80(%rsp), %rax
	movq	(%rax,%r15), %rdi
	testq	%rdi, %rdi
	je	LBB21_9
	movq	48(%rsp), %rsi
	callq	*16(%rdi)
LBB21_9:
	cmpq	$0, 64(%rsp)
	jne	LBB21_5
LBB21_10:
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
	je	LBB22_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB22_1:
	retq
	.cfi_endproc

"-[MACHView flagsChanged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._flagsChanged_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB23_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB23_1:
	retq
	.cfi_endproc

"-[MACHView mouseMoved:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB24_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB24_1:
	retq
	.cfi_endproc

"-[MACHView mouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB25_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB25_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB26_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB26_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseDragged:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseMoved_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB27_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB27_1:
	retq
	.cfi_endproc

"-[MACHView mouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB28_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB28_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB29_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB29_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB30_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB30_1:
	retq
	.cfi_endproc

"-[MACHView mouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB31_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB31_1:
	retq
	.cfi_endproc

"-[MACHView rightMouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB32_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB32_1:
	retq
	.cfi_endproc

"-[MACHView otherMouseUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._mouseUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB33_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB33_1:
	retq
	.cfi_endproc

"-[MACHView scrollWheel:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._scrollWheel_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB34_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB34_1:
	retq
	.cfi_endproc

"-[MACHView magnifyWithEvent:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._magnify_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB35_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB35_1:
	retq
	.cfi_endproc

"-[MACHView doCommandBySelector:]":

	.cfi_startproc
	retq
	.cfi_endproc

"-[MACHView initWithFrame:withThread:]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	%edx, %ebx
	movq	_OBJC_SELECTOR_REFERENCES_.27(%rip), %rsi
	movq	72(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	48(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	callq	*_objc_msgSend@GOTPCREL(%rip)
	movq	_OBJC_IVAR_$_MACHView.separateThread(%rip), %rcx
	movb	%bl, (%rax,%rcx)
	addq	$32, %rsp
	popq	%rbx
	retq
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
	movq	_OBJC_SELECTOR_REFERENCES_.27(%rip), %rsi
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
	je	LBB38_2
	movq	_OBJC_SELECTOR_REFERENCES_.29(%rip), %rdx
	leaq	48(%rsp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_objc_msgSend_stret
	movq	_OBJC_CLASSLIST_REFERENCES_$_.30(%rip), %rdi
	callq	_objc_alloc
	movq	_OBJC_SELECTOR_REFERENCES_.32(%rip), %rsi
	movq	24(%r14), %rcx
	movq	%rcx, 24(%rsp)
	movq	16(%r14), %rcx
	movq	%rcx, 16(%rsp)
	movq	(%r14), %rcx
	movq	8(%r14), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movq	_objc_msgSend@GOTPCREL(%rip), %r14
	movl	$67, %edx
	movq	%rax, %rdi
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	callq	*%r14
	movq	_OBJC_IVAR_$_MACHView.trackingArea(%rip), %r15
	movq	(%rbx,%r15), %rdi
	movq	%rax, (%rbx,%r15)
	callq	*_objc_release@GOTPCREL(%rip)
	movq	(%rbx,%r15), %rdx
	movq	_OBJC_SELECTOR_REFERENCES_.34(%rip), %rsi
	movq	%rbx, %rdi
	callq	*%r14
LBB38_2:
	movq	%rbx, %rax
	addq	$80, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc

"-[MACHView .cxx_destruct]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	_OBJC_IVAR_$_MACHView.m_displaySource(%rip), %rdi
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

	.private_extern	_OBJC_IVAR_$_MACHView.separateThread
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.separateThread
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView.separateThread:
	.quad	112

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_:
	.asciz	"stopRenderLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	L_OBJC_METH_VAR_NAME_

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
L_OBJC_METH_VAR_NAME_.1:
	.asciz	"dealloc"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	L_OBJC_METH_VAR_NAME_.1

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.3:
	.asciz	"viewDidMoveToWindow"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	L_OBJC_METH_VAR_NAME_.3

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.5:
	.asciz	"window"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.6:
	.quad	L_OBJC_METH_VAR_NAME_.5

	.private_extern	_OBJC_IVAR_$_MACHView.m_displaySource
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.m_displaySource
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView.m_displaySource:
	.quad	96

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.7:
	.asciz	"render"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	L_OBJC_METH_VAR_NAME_.7

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	"v8@?0"

	.private_extern	"___block_descriptor_40_8_32s_e5_v8\x01?0l"
	.section	__DATA,__const
	.globl	"___block_descriptor_40_8_32s_e5_v8\x01?0l"
	.weak_def_can_be_hidden	"___block_descriptor_40_8_32s_e5_v8\x01?0l"
	.p2align	3, 0x0
"___block_descriptor_40_8_32s_e5_v8\x01?0l":
	.quad	0
	.quad	40
	.quad	___copy_helper_block_8_32s
	.quad	___destroy_helper_block_8_32s
	.quad	L_.str
	.quad	256

	.private_extern	_OBJC_IVAR_$_MACHView.m_displayLink
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.m_displayLink
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView.m_displayLink:
	.quad	104

	.private_extern	_OBJC_IVAR_$_MACHView._render_block
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
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_NSArray

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.9:
	.asciz	"arrayWithObjects:count:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.10:
	.quad	L_OBJC_METH_VAR_NAME_.9

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.11:
	.asciz	"interpretKeyEvents:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.12:
	.quad	L_OBJC_METH_VAR_NAME_.11

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.13:
	.asciz	"currentEvent"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.14:
	.quad	L_OBJC_METH_VAR_NAME_.13

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.15:
	.quad	_OBJC_CLASS_$_NSAttributedString

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.16:
	.asciz	"class"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.17:
	.quad	L_OBJC_METH_VAR_NAME_.16

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.18:
	.asciz	"isKindOfClass:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.19:
	.quad	L_OBJC_METH_VAR_NAME_.18

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.20:
	.asciz	"string"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.21:
	.quad	L_OBJC_METH_VAR_NAME_.20

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.22:
	.asciz	"length"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.23:
	.quad	L_OBJC_METH_VAR_NAME_.22

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.24:
	.asciz	"getBytes:maxLength:usedLength:encoding:options:range:remainingRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.25:
	.quad	L_OBJC_METH_VAR_NAME_.24

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.26:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.27:
	.quad	L_OBJC_METH_VAR_NAME_.26

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.28:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.29:
	.quad	L_OBJC_METH_VAR_NAME_.28

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.30:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.31:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.32:
	.quad	L_OBJC_METH_VAR_NAME_.31

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.quad	88

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.33:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.34:
	.quad	L_OBJC_METH_VAR_NAME_.33

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_:
	.asciz	"MACHView"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_METACLASS_RO_$_MACHView:
	.long	389
	.long	40
	.long	40
	.space	4
	.quad	0
	.quad	L_OBJC_CLASS_NAME_
	.quad	0
	.quad	0
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
L_OBJC_CLASS_NAME_.35:
	.asciz	"\f"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.36:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_:
	.asciz	"c16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.37:
	.asciz	"acceptsFirstResponder"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.38:
	.asciz	"v16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.39:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.40:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.41:
	.asciz	"insertText:"

L_OBJC_METH_VAR_NAME_.42:
	.asciz	"keyUp:"

L_OBJC_METH_VAR_NAME_.43:
	.asciz	"flagsChanged:"

L_OBJC_METH_VAR_NAME_.44:
	.asciz	"mouseMoved:"

L_OBJC_METH_VAR_NAME_.45:
	.asciz	"mouseDragged:"

L_OBJC_METH_VAR_NAME_.46:
	.asciz	"rightMouseDragged:"

L_OBJC_METH_VAR_NAME_.47:
	.asciz	"otherMouseDragged:"

L_OBJC_METH_VAR_NAME_.48:
	.asciz	"mouseDown:"

L_OBJC_METH_VAR_NAME_.49:
	.asciz	"rightMouseDown:"

L_OBJC_METH_VAR_NAME_.50:
	.asciz	"otherMouseDown:"

L_OBJC_METH_VAR_NAME_.51:
	.asciz	"mouseUp:"

L_OBJC_METH_VAR_NAME_.52:
	.asciz	"rightMouseUp:"

L_OBJC_METH_VAR_NAME_.53:
	.asciz	"otherMouseUp:"

L_OBJC_METH_VAR_NAME_.54:
	.asciz	"scrollWheel:"

L_OBJC_METH_VAR_NAME_.55:
	.asciz	"magnifyWithEvent:"

L_OBJC_METH_VAR_NAME_.56:
	.asciz	"doCommandBySelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.57:
	.asciz	"v24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.58:
	.asciz	"initWithFrame:withThread:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.59:
	.asciz	"@52@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16c48"

L_OBJC_METH_VAR_TYPE_.60:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.61:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	26
	.quad	L_OBJC_METH_VAR_NAME_.36
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	L_OBJC_METH_VAR_NAME_.37
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	L_OBJC_METH_VAR_NAME_.1
	.quad	L_OBJC_METH_VAR_TYPE_.38
	.quad	"-[MACHView dealloc]"
	.quad	L_OBJC_METH_VAR_NAME_.3
	.quad	L_OBJC_METH_VAR_TYPE_.38
	.quad	"-[MACHView viewDidMoveToWindow]"
	.quad	L_OBJC_METH_VAR_NAME_.7
	.quad	L_OBJC_METH_VAR_TYPE_.38
	.quad	"-[MACHView render]"
	.quad	L_OBJC_METH_VAR_NAME_
	.quad	L_OBJC_METH_VAR_TYPE_.38
	.quad	"-[MACHView stopRenderLoop]"
	.quad	L_OBJC_METH_VAR_NAME_.39
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView keyDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.41
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView insertText:]"
	.quad	L_OBJC_METH_VAR_NAME_.42
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView keyUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.43
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView flagsChanged:]"
	.quad	L_OBJC_METH_VAR_NAME_.44
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView mouseMoved:]"
	.quad	L_OBJC_METH_VAR_NAME_.45
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView mouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.46
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.47
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	L_OBJC_METH_VAR_NAME_.48
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView mouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.49
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView rightMouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.50
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView otherMouseDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.51
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView mouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.52
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView rightMouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.53
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView otherMouseUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.54
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView scrollWheel:]"
	.quad	L_OBJC_METH_VAR_NAME_.55
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView magnifyWithEvent:]"
	.quad	L_OBJC_METH_VAR_NAME_.56
	.quad	L_OBJC_METH_VAR_TYPE_.57
	.quad	"-[MACHView doCommandBySelector:]"
	.quad	L_OBJC_METH_VAR_NAME_.58
	.quad	L_OBJC_METH_VAR_TYPE_.59
	.quad	"-[MACHView initWithFrame:withThread:]"
	.quad	L_OBJC_METH_VAR_NAME_.26
	.quad	L_OBJC_METH_VAR_TYPE_.60
	.quad	"-[MACHView initWithFrame:]"
	.quad	L_OBJC_METH_VAR_NAME_.61
	.quad	L_OBJC_METH_VAR_TYPE_.38
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.62:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.63:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.64:
	.asciz	"_keyUp_block"

L_OBJC_METH_VAR_NAME_.65:
	.asciz	"_flagsChanged_block"

L_OBJC_METH_VAR_NAME_.66:
	.asciz	"_mouseMoved_block"

L_OBJC_METH_VAR_NAME_.67:
	.asciz	"_mouseDown_block"

L_OBJC_METH_VAR_NAME_.68:
	.asciz	"_mouseUp_block"

L_OBJC_METH_VAR_NAME_.69:
	.asciz	"_scrollWheel_block"

L_OBJC_METH_VAR_NAME_.70:
	.asciz	"_magnify_block"

L_OBJC_METH_VAR_NAME_.71:
	.asciz	"_insertText_block"

L_OBJC_METH_VAR_NAME_.72:
	.asciz	"_render_block"

L_OBJC_METH_VAR_NAME_.73:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.74:
	.asciz	"@\"NSTrackingArea\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.75:
	.asciz	"m_displaySource"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.76:
	.asciz	"@\"NSObject<OS_dispatch_source>\""

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.77:
	.asciz	"m_displayLink"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.78:
	.asciz	"^{__CVDisplayLink=}"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.79:
	.asciz	"separateThread"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.80:
	.asciz	"c"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	14
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	L_OBJC_METH_VAR_NAME_.62
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	L_OBJC_METH_VAR_NAME_.64
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	L_OBJC_METH_VAR_NAME_.65
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	L_OBJC_METH_VAR_NAME_.66
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	L_OBJC_METH_VAR_NAME_.67
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	L_OBJC_METH_VAR_NAME_.68
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	L_OBJC_METH_VAR_NAME_.69
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._magnify_block
	.quad	L_OBJC_METH_VAR_NAME_.70
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._insertText_block
	.quad	L_OBJC_METH_VAR_NAME_.71
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._render_block
	.quad	L_OBJC_METH_VAR_NAME_.72
	.quad	L_OBJC_METH_VAR_TYPE_.63
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	L_OBJC_METH_VAR_NAME_.73
	.quad	L_OBJC_METH_VAR_TYPE_.74
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.m_displaySource
	.quad	L_OBJC_METH_VAR_NAME_.75
	.quad	L_OBJC_METH_VAR_TYPE_.76
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.m_displayLink
	.quad	L_OBJC_METH_VAR_NAME_.77
	.quad	L_OBJC_METH_VAR_TYPE_.78
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.separateThread
	.quad	L_OBJC_METH_VAR_NAME_.79
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.long	0
	.long	1

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	113
	.space	4
	.quad	L_OBJC_CLASS_NAME_.35
	.quad	L_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_MACHView
	.quad	0
	.quad	__OBJC_$_INSTANCE_VARIABLES_MACHView
	.quad	0
	.quad	0

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_MACHView

	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols

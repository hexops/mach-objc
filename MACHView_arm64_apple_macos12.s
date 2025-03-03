	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.p2align	2
"-[MACHView canBecomeKeyView]":
	.cfi_startproc
	mov	w0, #1
	ret
	.cfi_endproc

	.p2align	2
"-[MACHView acceptsFirstResponder]":
	.cfi_startproc
	mov	w0, #1
	ret
	.cfi_endproc

	.p2align	2
"-[MACHView dealloc]":
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Lloh0:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh1:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	bl	_objc_msgSend
Lloh2:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh3:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x19, x8, [sp]
Lloh4:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
Lloh5:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	mov	x0, sp
	bl	_objc_msgSendSuper2
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	ret
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
lCPI3_0:
	.long	3254779904
	.long	0
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
"-[MACHView viewDidMoveToWindow]":
	.cfi_startproc
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x22, x21, [sp, #64]
	stp	x20, x19, [sp, #80]
	stp	x29, x30, [sp, #96]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Lloh6:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh7:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x0, x8, [sp, #48]
Lloh8:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.4@PAGE
Lloh9:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.4@PAGEOFF]
	add	x0, sp, #48
	bl	_objc_msgSendSuper2
Lloh10:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh11:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
Lloh12:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.6@PAGE
Lloh13:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.6@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
	bl	_objc_release
	cbz	x20, LBB3_2
Lloh14:
	adrp	x0, __dispatch_source_type_data_add@GOTPAGE
Lloh15:
	ldr	x0, [x0, __dispatch_source_type_data_add@GOTPAGEOFF]
Lloh16:
	adrp	x3, __dispatch_main_q@GOTPAGE
Lloh17:
	ldr	x3, [x3, __dispatch_main_q@GOTPAGEOFF]
	mov	x1, #0
	mov	x2, #0
	bl	_dispatch_source_create
Lloh18:
	adrp	x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGE
Lloh19:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGEOFF]
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
	ldr	x0, [x19, x20]
Lloh20:
	adrp	x8, __NSConcreteStackBlock@GOTPAGE
Lloh21:
	ldr	x8, [x8, __NSConcreteStackBlock@GOTPAGEOFF]
	str	x8, [sp, #8]
Lloh22:
	adrp	x8, lCPI3_0@PAGE
Lloh23:
	ldr	d0, [x8, lCPI3_0@PAGEOFF]
Lloh24:
	adrp	x8, "___31-[MACHView viewDidMoveToWindow]_block_invoke"@PAGE
Lloh25:
	add	x8, x8, "___31-[MACHView viewDidMoveToWindow]_block_invoke"@PAGEOFF
	str	d0, [sp, #16]
Lloh26:
	adrp	x9, "___block_descriptor_40_8_32s_e5_v8\x01?0l"@PAGE
Lloh27:
	add	x9, x9, "___block_descriptor_40_8_32s_e5_v8\x01?0l"@PAGEOFF
	stp	x8, x9, [sp, #24]
	str	x19, [sp, #40]
	add	x1, sp, #8
	bl	_dispatch_source_set_event_handler
	ldr	x0, [x19, x20]
	bl	_dispatch_resume
Lloh28:
	adrp	x8, _OBJC_IVAR_$_MACHView.m_displayLink@PAGE
Lloh29:
	ldrsw	x21, [x8, _OBJC_IVAR_$_MACHView.m_displayLink@PAGEOFF]
	add	x0, x19, x21
	bl	_CVDisplayLinkCreateWithActiveCGDisplays
	ldr	x0, [x19, x21]
	ldr	x2, [x19, x20]
Lloh30:
	adrp	x1, _displayLinkCallback@PAGE
Lloh31:
	add	x1, x1, _displayLinkCallback@PAGEOFF
	bl	_CVDisplayLinkSetOutputCallback
	ldr	x0, [x19, x21]
	bl	_CVDisplayLinkStart
LBB3_2:
	ldp	x29, x30, [sp, #96]
	ldp	x20, x19, [sp, #80]
	ldp	x22, x21, [sp, #64]
	add	sp, sp, #112
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	ret
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpLdr	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdrp	Lloh22, Lloh24
	.loh AdrpLdr	Lloh22, Lloh23
	.loh AdrpLdrGot	Lloh20, Lloh21
	.loh AdrpLdr	Lloh18, Lloh19
	.loh AdrpLdrGot	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh14, Lloh15
	.cfi_endproc

	.p2align	2
"___31-[MACHView viewDidMoveToWindow]_block_invoke":
	.cfi_startproc
	ldr	x0, [x0, #32]
Lloh32:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.8@PAGE
Lloh33:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.8@PAGEOFF]
	b	_objc_msgSend
	.loh AdrpLdr	Lloh32, Lloh33
	.cfi_endproc

	.private_extern	___copy_helper_block_8_32s
	.globl	___copy_helper_block_8_32s
	.weak_def_can_be_hidden	___copy_helper_block_8_32s
	.p2align	2
___copy_helper_block_8_32s:
	.cfi_startproc
	ldr	x0, [x1, #32]
	b	_objc_retain
	.cfi_endproc

	.private_extern	___destroy_helper_block_8_32s
	.globl	___destroy_helper_block_8_32s
	.weak_def_can_be_hidden	___destroy_helper_block_8_32s
	.p2align	2
___destroy_helper_block_8_32s:
	.cfi_startproc
	ldr	x0, [x0, #32]
	b	_objc_release
	.cfi_endproc

	.p2align	2
_displayLinkCallback:
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x5
	bl	_objc_autoreleasePoolPush
	mov	x20, x0
	mov	x0, x19
	mov	w1, #1
	bl	_dispatch_source_merge_data
	mov	x0, x20
	bl	_objc_autoreleasePoolPop
	mov	w0, #0
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	ret
	.cfi_endproc

	.p2align	2
"-[MACHView render]":
	.cfi_startproc
Lloh34:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh35:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._render_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB8_2
	ldr	x1, [x0, #16]
	br	x1
LBB8_2:
	ret
	.loh AdrpLdr	Lloh34, Lloh35
	.cfi_endproc

	.p2align	2
"-[MACHView stopRenderLoop]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Lloh36:
	adrp	x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGE
Lloh37:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGEOFF]
	ldr	x0, [x0, x20]
	cbz	x0, LBB9_2
	bl	_dispatch_source_cancel
	ldr	x0, [x19, x20]
	str	xzr, [x19, x20]
	bl	_objc_release
LBB9_2:
Lloh38:
	adrp	x8, _OBJC_IVAR_$_MACHView.m_displayLink@PAGE
Lloh39:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.m_displayLink@PAGEOFF]
	ldr	x0, [x19, x20]
	cbz	x0, LBB9_4
	bl	_CVDisplayLinkStop
	ldr	x0, [x19, x20]
	bl	_CVDisplayLinkRelease
	str	xzr, [x19, x20]
LBB9_4:
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	ret
	.loh AdrpLdr	Lloh36, Lloh37
	.loh AdrpLdr	Lloh38, Lloh39
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_render:]"
	.globl	"-[MACHView setBlock_render:]"
	.p2align	2
"-[MACHView setBlock_render:]":
	.cfi_startproc
	cbz	x0, LBB10_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh40:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh41:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._render_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB10_2:
	ret
	.loh AdrpLdr	Lloh40, Lloh41
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyDown:]"
	.globl	"-[MACHView setBlock_keyDown:]"
	.p2align	2
"-[MACHView setBlock_keyDown:]":
	.cfi_startproc
	cbz	x0, LBB11_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh42:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh43:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB11_2:
	ret
	.loh AdrpLdr	Lloh42, Lloh43
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyUp:]"
	.globl	"-[MACHView setBlock_keyUp:]"
	.p2align	2
"-[MACHView setBlock_keyUp:]":
	.cfi_startproc
	cbz	x0, LBB12_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh44:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh45:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB12_2:
	ret
	.loh AdrpLdr	Lloh44, Lloh45
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseMoved:]"
	.globl	"-[MACHView setBlock_mouseMoved:]"
	.p2align	2
"-[MACHView setBlock_mouseMoved:]":
	.cfi_startproc
	cbz	x0, LBB13_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh46:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh47:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB13_2:
	ret
	.loh AdrpLdr	Lloh46, Lloh47
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseDown:]"
	.globl	"-[MACHView setBlock_mouseDown:]"
	.p2align	2
"-[MACHView setBlock_mouseDown:]":
	.cfi_startproc
	cbz	x0, LBB14_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh48:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh49:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB14_2:
	ret
	.loh AdrpLdr	Lloh48, Lloh49
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseUp:]"
	.globl	"-[MACHView setBlock_mouseUp:]"
	.p2align	2
"-[MACHView setBlock_mouseUp:]":
	.cfi_startproc
	cbz	x0, LBB15_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh50:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh51:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB15_2:
	ret
	.loh AdrpLdr	Lloh50, Lloh51
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_scrollWheel:]"
	.globl	"-[MACHView setBlock_scrollWheel:]"
	.p2align	2
"-[MACHView setBlock_scrollWheel:]":
	.cfi_startproc
	cbz	x0, LBB16_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh52:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh53:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB16_2:
	ret
	.loh AdrpLdr	Lloh52, Lloh53
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_flagsChanged:]"
	.globl	"-[MACHView setBlock_flagsChanged:]"
	.p2align	2
"-[MACHView setBlock_flagsChanged:]":
	.cfi_startproc
	cbz	x0, LBB17_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh54:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh55:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB17_2:
	ret
	.loh AdrpLdr	Lloh54, Lloh55
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_insertText:]"
	.globl	"-[MACHView setBlock_insertText:]"
	.p2align	2
"-[MACHView setBlock_insertText:]":
	.cfi_startproc
	cbz	x0, LBB18_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh56:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh57:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB18_2:
	ret
	.loh AdrpLdr	Lloh56, Lloh57
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_magnify:]"
	.globl	"-[MACHView setBlock_magnify:]"
	.p2align	2
"-[MACHView setBlock_magnify:]":
	.cfi_startproc
	cbz	x0, LBB19_2
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh58:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh59:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
LBB19_2:
	ret
	.loh AdrpLdr	Lloh58, Lloh59
	.cfi_endproc

	.p2align	2
"-[MACHView keyDown:]":
	.cfi_startproc
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]
	stp	x20, x19, [sp, #32]
	stp	x29, x30, [sp, #48]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x2
	mov	x20, x0
	mov	x0, x2
	bl	_objc_retain
Lloh60:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh61:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB20_2
	ldr	x8, [x0, #16]
	mov	x1, x19
	blr	x8
LBB20_2:
	str	x19, [sp, #8]
Lloh62:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
Lloh63:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
Lloh64:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.10@PAGE
Lloh65:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.10@PAGEOFF]
	add	x2, sp, #8
	mov	w3, #1
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh66:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.12@PAGE
Lloh67:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.12@PAGEOFF]
	mov	x0, x20
	mov	x2, x21
	bl	_objc_msgSend
	mov	x0, x21
	bl	_objc_release
	mov	x0, x19
	bl	_objc_release
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	add	sp, sp, #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	ret
	.loh AdrpLdr	Lloh60, Lloh61
	.loh AdrpLdr	Lloh66, Lloh67
	.loh AdrpLdr	Lloh64, Lloh65
	.loh AdrpAdrp	Lloh62, Lloh64
	.loh AdrpLdr	Lloh62, Lloh63
	.cfi_endproc

	.p2align	2
"-[MACHView insertText:]":
	.cfi_startproc
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x26, x25, [sp, #48]
	stp	x24, x23, [sp, #64]
	stp	x22, x21, [sp, #80]
	stp	x20, x19, [sp, #96]
	stp	x29, x30, [sp, #112]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x2
	mov	x20, x0
	mov	x0, x2
	bl	_objc_retain
Lloh68:
	adrp	x8, _NSApp@GOTPAGE
Lloh69:
	ldr	x8, [x8, _NSApp@GOTPAGEOFF]
Lloh70:
	ldr	x0, [x8]
Lloh71:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.14@PAGE
Lloh72:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.14@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh73:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGE
Lloh74:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGEOFF]
Lloh75:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.17@PAGE
Lloh76:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.17@PAGEOFF]
	bl	_objc_msgSend
	mov	x2, x0
Lloh77:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.19@PAGE
Lloh78:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.19@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	cbz	w0, LBB21_2
Lloh79:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.21@PAGE
Lloh80:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.21@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x22, x0
	b	LBB21_3
LBB21_2:
	mov	x0, x19
	bl	_objc_retain
	mov	x22, x19
LBB21_3:
Lloh81:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.23@PAGE
Lloh82:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.23@PAGEOFF]
	mov	x0, x22
	bl	_objc_msgSend
	stp	xzr, x0, [sp, #32]
	cbz	x0, LBB21_10
Lloh83:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.25@PAGE
Lloh84:
	ldr	x23, [x8, _OBJC_SELECTOR_REFERENCES_.25@PAGEOFF]
	add	x24, sp, #32
	adrp	x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
LBB21_5:
	str	wzr, [sp, #28]
	ldr	x8, [sp, #32]
	stp	x0, x24, [sp, #8]
	add	x2, sp, #28
	str	x8, [sp]
	mov	x0, x22
	mov	x1, x23
	mov	w3, #4
	mov	x4, #0
	mov	w5, #256
	movk	w5, #35840, lsl #16
	mov	x6, #0
	bl	_objc_msgSend
	cbz	w0, LBB21_9
	ldr	w2, [sp, #28]
	lsr	w8, w2, #8
	cmp	w8, #247
	b.eq	LBB21_9
	ldrsw	x8, [x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB21_9
	ldr	x8, [x0, #16]
	mov	x1, x21
	blr	x8
LBB21_9:
	ldr	x0, [sp, #40]
	cbnz	x0, LBB21_5
LBB21_10:
	mov	x0, x21
	bl	_objc_release
	mov	x0, x22
	bl	_objc_release
	mov	x0, x19
	bl	_objc_release
	ldp	x29, x30, [sp, #112]
	ldp	x20, x19, [sp, #96]
	ldp	x22, x21, [sp, #80]
	ldp	x24, x23, [sp, #64]
	ldp	x26, x25, [sp, #48]
	add	sp, sp, #128
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	ret
	.loh AdrpLdr	Lloh77, Lloh78
	.loh AdrpLdr	Lloh75, Lloh76
	.loh AdrpAdrp	Lloh73, Lloh75
	.loh AdrpLdr	Lloh73, Lloh74
	.loh AdrpLdr	Lloh71, Lloh72
	.loh AdrpLdrGotLdr	Lloh68, Lloh69, Lloh70
	.loh AdrpLdr	Lloh79, Lloh80
	.loh AdrpLdr	Lloh81, Lloh82
	.loh AdrpLdr	Lloh83, Lloh84
	.cfi_endproc

	.p2align	2
"-[MACHView keyUp:]":
	.cfi_startproc
Lloh85:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh86:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB22_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB22_2:
	ret
	.loh AdrpLdr	Lloh85, Lloh86
	.cfi_endproc

	.p2align	2
"-[MACHView flagsChanged:]":
	.cfi_startproc
Lloh87:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh88:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB23_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB23_2:
	ret
	.loh AdrpLdr	Lloh87, Lloh88
	.cfi_endproc

	.p2align	2
"-[MACHView mouseMoved:]":
	.cfi_startproc
Lloh89:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh90:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB24_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB24_2:
	ret
	.loh AdrpLdr	Lloh89, Lloh90
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDragged:]":
	.cfi_startproc
Lloh91:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh92:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB25_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB25_2:
	ret
	.loh AdrpLdr	Lloh91, Lloh92
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDragged:]":
	.cfi_startproc
Lloh93:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh94:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB26_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB26_2:
	ret
	.loh AdrpLdr	Lloh93, Lloh94
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDragged:]":
	.cfi_startproc
Lloh95:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh96:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB27_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB27_2:
	ret
	.loh AdrpLdr	Lloh95, Lloh96
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDown:]":
	.cfi_startproc
Lloh97:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh98:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB28_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB28_2:
	ret
	.loh AdrpLdr	Lloh97, Lloh98
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDown:]":
	.cfi_startproc
Lloh99:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh100:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB29_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB29_2:
	ret
	.loh AdrpLdr	Lloh99, Lloh100
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDown:]":
	.cfi_startproc
Lloh101:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh102:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB30_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB30_2:
	ret
	.loh AdrpLdr	Lloh101, Lloh102
	.cfi_endproc

	.p2align	2
"-[MACHView mouseUp:]":
	.cfi_startproc
Lloh103:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh104:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB31_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB31_2:
	ret
	.loh AdrpLdr	Lloh103, Lloh104
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseUp:]":
	.cfi_startproc
Lloh105:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh106:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB32_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB32_2:
	ret
	.loh AdrpLdr	Lloh105, Lloh106
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseUp:]":
	.cfi_startproc
Lloh107:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh108:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB33_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB33_2:
	ret
	.loh AdrpLdr	Lloh107, Lloh108
	.cfi_endproc

	.p2align	2
"-[MACHView scrollWheel:]":
	.cfi_startproc
Lloh109:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh110:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB34_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB34_2:
	ret
	.loh AdrpLdr	Lloh109, Lloh110
	.cfi_endproc

	.p2align	2
"-[MACHView magnifyWithEvent:]":
	.cfi_startproc
Lloh111:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh112:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB35_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB35_2:
	ret
	.loh AdrpLdr	Lloh111, Lloh112
	.cfi_endproc

	.p2align	2
"-[MACHView doCommandBySelector:]":
	.cfi_startproc
	ret
	.cfi_endproc

	.p2align	2
"-[MACHView initWithFrame:]":
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	d11, d10, [sp, #16]
	stp	d9, d8, [sp, #32]
	stp	x20, x19, [sp, #48]
	stp	x29, x30, [sp, #64]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
Lloh113:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh114:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x0, x8, [sp]
Lloh115:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.27@PAGE
Lloh116:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.27@PAGEOFF]
	mov	x0, sp
	bl	_objc_msgSendSuper2
	mov	x19, x0
	cbz	x0, LBB37_2
Lloh117:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.29@PAGE
Lloh118:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.29@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh119:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.30@PAGE
Lloh120:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.30@PAGEOFF]
	bl	_objc_alloc
Lloh121:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.32@PAGE
Lloh122:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.32@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	fmov	d2, d10
	fmov	d3, d11
	mov	w2, #67
	mov	x3, x19
	mov	x4, #0
	bl	_objc_msgSend
Lloh123:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh124:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
	ldr	x2, [x19, x20]
Lloh125:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.34@PAGE
Lloh126:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.34@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
LBB37_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #64]
	ldp	x20, x19, [sp, #48]
	ldp	d9, d8, [sp, #32]
	ldp	d11, d10, [sp, #16]
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	ret
	.loh AdrpLdr	Lloh115, Lloh116
	.loh AdrpLdr	Lloh113, Lloh114
	.loh AdrpLdr	Lloh125, Lloh126
	.loh AdrpLdr	Lloh123, Lloh124
	.loh AdrpLdr	Lloh121, Lloh122
	.loh AdrpLdr	Lloh119, Lloh120
	.loh AdrpLdr	Lloh117, Lloh118
	.cfi_endproc

	.p2align	2
"-[MACHView updateTrackingAreas]":
	.cfi_startproc
	stp	d11, d10, [sp, #-64]!
	.cfi_def_cfa_offset 64
	stp	d9, d8, [sp, #16]
	stp	x20, x19, [sp, #32]
	stp	x29, x30, [sp, #48]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	mov	x19, x0
Lloh127:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh128:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x2, [x0, x20]
Lloh129:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.36@PAGE
Lloh130:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.36@PAGEOFF]
	bl	_objc_msgSend
Lloh131:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.29@PAGE
Lloh132:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.29@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh133:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.30@PAGE
Lloh134:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.30@PAGEOFF]
	bl	_objc_alloc
Lloh135:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.32@PAGE
Lloh136:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.32@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	fmov	d2, d10
	fmov	d3, d11
	mov	w2, #67
	mov	x3, x19
	mov	x4, #0
	bl	_objc_msgSend
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
	ldr	x2, [x19, x20]
Lloh137:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.34@PAGE
Lloh138:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.34@PAGEOFF]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	d9, d8, [sp, #16]
	ldp	d11, d10, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	b	_objc_msgSend
	.loh AdrpLdr	Lloh137, Lloh138
	.loh AdrpLdr	Lloh135, Lloh136
	.loh AdrpLdr	Lloh133, Lloh134
	.loh AdrpLdr	Lloh131, Lloh132
	.loh AdrpLdr	Lloh129, Lloh130
	.loh AdrpAdrp	Lloh127, Lloh129
	.loh AdrpLdr	Lloh127, Lloh128
	.cfi_endproc

	.p2align	2
"-[MACHView .cxx_destruct]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Lloh139:
	adrp	x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGE
Lloh140:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView.m_displaySource@PAGEOFF]
	add	x0, x0, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh141:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh142:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh143:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh144:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._render_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh145:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh146:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh147:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh148:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh149:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh150:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh151:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh152:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh153:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh154:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh155:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh156:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh157:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh158:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh159:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh160:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh161:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh162:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_storeStrong
	.loh AdrpLdr	Lloh161, Lloh162
	.loh AdrpLdr	Lloh159, Lloh160
	.loh AdrpLdr	Lloh157, Lloh158
	.loh AdrpLdr	Lloh155, Lloh156
	.loh AdrpLdr	Lloh153, Lloh154
	.loh AdrpLdr	Lloh151, Lloh152
	.loh AdrpLdr	Lloh149, Lloh150
	.loh AdrpLdr	Lloh147, Lloh148
	.loh AdrpLdr	Lloh145, Lloh146
	.loh AdrpLdr	Lloh143, Lloh144
	.loh AdrpLdr	Lloh141, Lloh142
	.loh AdrpLdr	Lloh139, Lloh140
	.cfi_endproc

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_:
	.asciz	"stopRenderLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	l_OBJC_METH_VAR_NAME_

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
l_OBJC_METH_VAR_NAME_.1:
	.asciz	"dealloc"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	l_OBJC_METH_VAR_NAME_.1

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.3:
	.asciz	"viewDidMoveToWindow"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	l_OBJC_METH_VAR_NAME_.3

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.5:
	.asciz	"window"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.6:
	.quad	l_OBJC_METH_VAR_NAME_.5

	.private_extern	_OBJC_IVAR_$_MACHView.m_displaySource
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.m_displaySource
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.m_displaySource:
	.long	96

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.7:
	.asciz	"render"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	l_OBJC_METH_VAR_NAME_.7

	.section	__TEXT,__cstring,cstring_literals
l_.str:
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
	.quad	l_.str
	.quad	256

	.private_extern	_OBJC_IVAR_$_MACHView.m_displayLink
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.m_displayLink
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.m_displayLink:
	.long	104

	.private_extern	_OBJC_IVAR_$_MACHView._render_block
	.globl	_OBJC_IVAR_$_MACHView._render_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._render_block:
	.long	80

	.private_extern	_OBJC_IVAR_$_MACHView._keyDown_block
	.globl	_OBJC_IVAR_$_MACHView._keyDown_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._keyDown_block:
	.long	8

	.private_extern	_OBJC_IVAR_$_MACHView._keyUp_block
	.globl	_OBJC_IVAR_$_MACHView._keyUp_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._keyUp_block:
	.long	16

	.private_extern	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.globl	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._mouseMoved_block:
	.long	32

	.private_extern	_OBJC_IVAR_$_MACHView._mouseDown_block
	.globl	_OBJC_IVAR_$_MACHView._mouseDown_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._mouseDown_block:
	.long	40

	.private_extern	_OBJC_IVAR_$_MACHView._mouseUp_block
	.globl	_OBJC_IVAR_$_MACHView._mouseUp_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._mouseUp_block:
	.long	48

	.private_extern	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.globl	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._scrollWheel_block:
	.long	56

	.private_extern	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.globl	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._flagsChanged_block:
	.long	24

	.private_extern	_OBJC_IVAR_$_MACHView._insertText_block
	.globl	_OBJC_IVAR_$_MACHView._insertText_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._insertText_block:
	.long	72

	.private_extern	_OBJC_IVAR_$_MACHView._magnify_block
	.globl	_OBJC_IVAR_$_MACHView._magnify_block
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._magnify_block:
	.long	64

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_NSArray

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.9:
	.asciz	"arrayWithObjects:count:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.10:
	.quad	l_OBJC_METH_VAR_NAME_.9

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.11:
	.asciz	"interpretKeyEvents:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.12:
	.quad	l_OBJC_METH_VAR_NAME_.11

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.13:
	.asciz	"currentEvent"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.14:
	.quad	l_OBJC_METH_VAR_NAME_.13

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.15:
	.quad	_OBJC_CLASS_$_NSAttributedString

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.16:
	.asciz	"class"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.17:
	.quad	l_OBJC_METH_VAR_NAME_.16

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.18:
	.asciz	"isKindOfClass:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.19:
	.quad	l_OBJC_METH_VAR_NAME_.18

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.20:
	.asciz	"string"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.21:
	.quad	l_OBJC_METH_VAR_NAME_.20

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.22:
	.asciz	"length"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.23:
	.quad	l_OBJC_METH_VAR_NAME_.22

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.24:
	.asciz	"getBytes:maxLength:usedLength:encoding:options:range:remainingRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.25:
	.quad	l_OBJC_METH_VAR_NAME_.24

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.26:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.27:
	.quad	l_OBJC_METH_VAR_NAME_.26

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.28:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.29:
	.quad	l_OBJC_METH_VAR_NAME_.28

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.30:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.31:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.32:
	.quad	l_OBJC_METH_VAR_NAME_.31

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.long	88

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.33:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.34:
	.quad	l_OBJC_METH_VAR_NAME_.33

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.35:
	.asciz	"removeTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.36:
	.quad	l_OBJC_METH_VAR_NAME_.35

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_:
	.asciz	"MACHView"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_METACLASS_RO_$_MACHView:
	.long	389
	.long	40
	.long	40
	.space	4
	.quad	0
	.quad	l_OBJC_CLASS_NAME_
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
l_OBJC_CLASS_NAME_.37:
	.asciz	"\f"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.38:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"B16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.39:
	.asciz	"acceptsFirstResponder"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.40:
	.asciz	"v16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.41:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.42:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.43:
	.asciz	"insertText:"

l_OBJC_METH_VAR_NAME_.44:
	.asciz	"keyUp:"

l_OBJC_METH_VAR_NAME_.45:
	.asciz	"flagsChanged:"

l_OBJC_METH_VAR_NAME_.46:
	.asciz	"mouseMoved:"

l_OBJC_METH_VAR_NAME_.47:
	.asciz	"mouseDragged:"

l_OBJC_METH_VAR_NAME_.48:
	.asciz	"rightMouseDragged:"

l_OBJC_METH_VAR_NAME_.49:
	.asciz	"otherMouseDragged:"

l_OBJC_METH_VAR_NAME_.50:
	.asciz	"mouseDown:"

l_OBJC_METH_VAR_NAME_.51:
	.asciz	"rightMouseDown:"

l_OBJC_METH_VAR_NAME_.52:
	.asciz	"otherMouseDown:"

l_OBJC_METH_VAR_NAME_.53:
	.asciz	"mouseUp:"

l_OBJC_METH_VAR_NAME_.54:
	.asciz	"rightMouseUp:"

l_OBJC_METH_VAR_NAME_.55:
	.asciz	"otherMouseUp:"

l_OBJC_METH_VAR_NAME_.56:
	.asciz	"scrollWheel:"

l_OBJC_METH_VAR_NAME_.57:
	.asciz	"magnifyWithEvent:"

l_OBJC_METH_VAR_NAME_.58:
	.asciz	"doCommandBySelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.59:
	.asciz	"v24@0:8:16"

l_OBJC_METH_VAR_TYPE_.60:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.61:
	.asciz	"updateTrackingAreas"

l_OBJC_METH_VAR_NAME_.62:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	26
	.quad	l_OBJC_METH_VAR_NAME_.38
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	l_OBJC_METH_VAR_NAME_.39
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	l_OBJC_METH_VAR_NAME_.1
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView dealloc]"
	.quad	l_OBJC_METH_VAR_NAME_.3
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView viewDidMoveToWindow]"
	.quad	l_OBJC_METH_VAR_NAME_.7
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView render]"
	.quad	l_OBJC_METH_VAR_NAME_
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView stopRenderLoop]"
	.quad	l_OBJC_METH_VAR_NAME_.41
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView keyDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.43
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView insertText:]"
	.quad	l_OBJC_METH_VAR_NAME_.44
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView keyUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.45
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView flagsChanged:]"
	.quad	l_OBJC_METH_VAR_NAME_.46
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView mouseMoved:]"
	.quad	l_OBJC_METH_VAR_NAME_.47
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView mouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.48
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.49
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.50
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView mouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.51
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView rightMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.52
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView otherMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.53
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView mouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.54
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView rightMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.55
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView otherMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.56
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView scrollWheel:]"
	.quad	l_OBJC_METH_VAR_NAME_.57
	.quad	l_OBJC_METH_VAR_TYPE_.42
	.quad	"-[MACHView magnifyWithEvent:]"
	.quad	l_OBJC_METH_VAR_NAME_.58
	.quad	l_OBJC_METH_VAR_TYPE_.59
	.quad	"-[MACHView doCommandBySelector:]"
	.quad	l_OBJC_METH_VAR_NAME_.26
	.quad	l_OBJC_METH_VAR_TYPE_.60
	.quad	"-[MACHView initWithFrame:]"
	.quad	l_OBJC_METH_VAR_NAME_.61
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView updateTrackingAreas]"
	.quad	l_OBJC_METH_VAR_NAME_.62
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.63:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.64:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.65:
	.asciz	"_keyUp_block"

l_OBJC_METH_VAR_NAME_.66:
	.asciz	"_flagsChanged_block"

l_OBJC_METH_VAR_NAME_.67:
	.asciz	"_mouseMoved_block"

l_OBJC_METH_VAR_NAME_.68:
	.asciz	"_mouseDown_block"

l_OBJC_METH_VAR_NAME_.69:
	.asciz	"_mouseUp_block"

l_OBJC_METH_VAR_NAME_.70:
	.asciz	"_scrollWheel_block"

l_OBJC_METH_VAR_NAME_.71:
	.asciz	"_magnify_block"

l_OBJC_METH_VAR_NAME_.72:
	.asciz	"_insertText_block"

l_OBJC_METH_VAR_NAME_.73:
	.asciz	"_render_block"

l_OBJC_METH_VAR_NAME_.74:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.75:
	.asciz	"@\"NSTrackingArea\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.76:
	.asciz	"m_displaySource"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.77:
	.asciz	"@\"NSObject<OS_dispatch_source>\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.78:
	.asciz	"m_displayLink"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.79:
	.asciz	"^{__CVDisplayLink=}"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	13
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	l_OBJC_METH_VAR_NAME_.63
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	l_OBJC_METH_VAR_NAME_.65
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	l_OBJC_METH_VAR_NAME_.66
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	l_OBJC_METH_VAR_NAME_.67
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	l_OBJC_METH_VAR_NAME_.68
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	l_OBJC_METH_VAR_NAME_.69
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	l_OBJC_METH_VAR_NAME_.70
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._magnify_block
	.quad	l_OBJC_METH_VAR_NAME_.71
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._insertText_block
	.quad	l_OBJC_METH_VAR_NAME_.72
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._render_block
	.quad	l_OBJC_METH_VAR_NAME_.73
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	l_OBJC_METH_VAR_NAME_.74
	.quad	l_OBJC_METH_VAR_TYPE_.75
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.m_displaySource
	.quad	l_OBJC_METH_VAR_NAME_.76
	.quad	l_OBJC_METH_VAR_TYPE_.77
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.m_displayLink
	.quad	l_OBJC_METH_VAR_NAME_.78
	.quad	l_OBJC_METH_VAR_TYPE_.79
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	112
	.space	4
	.quad	l_OBJC_CLASS_NAME_.37
	.quad	l_OBJC_CLASS_NAME_
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

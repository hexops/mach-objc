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

	.private_extern	"-[MACHView setBlock_keyDown:]"
	.globl	"-[MACHView setBlock_keyDown:]"
	.p2align	2
"-[MACHView setBlock_keyDown:]":
	.cfi_startproc
	cbz	x0, LBB2_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh0:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh1:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB2_2:
	ret
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyUp:]"
	.globl	"-[MACHView setBlock_keyUp:]"
	.p2align	2
"-[MACHView setBlock_keyUp:]":
	.cfi_startproc
	cbz	x0, LBB3_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh2:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh3:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB3_2:
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseMoved:]"
	.globl	"-[MACHView setBlock_mouseMoved:]"
	.p2align	2
"-[MACHView setBlock_mouseMoved:]":
	.cfi_startproc
	cbz	x0, LBB4_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh4:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh5:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB4_2:
	ret
	.loh AdrpLdr	Lloh4, Lloh5
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseDown:]"
	.globl	"-[MACHView setBlock_mouseDown:]"
	.p2align	2
"-[MACHView setBlock_mouseDown:]":
	.cfi_startproc
	cbz	x0, LBB5_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh6:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh7:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB5_2:
	ret
	.loh AdrpLdr	Lloh6, Lloh7
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseUp:]"
	.globl	"-[MACHView setBlock_mouseUp:]"
	.p2align	2
"-[MACHView setBlock_mouseUp:]":
	.cfi_startproc
	cbz	x0, LBB6_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh8:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh9:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB6_2:
	ret
	.loh AdrpLdr	Lloh8, Lloh9
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_scrollWheel:]"
	.globl	"-[MACHView setBlock_scrollWheel:]"
	.p2align	2
"-[MACHView setBlock_scrollWheel:]":
	.cfi_startproc
	cbz	x0, LBB7_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh10:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh11:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB7_2:
	ret
	.loh AdrpLdr	Lloh10, Lloh11
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_flagsChanged:]"
	.globl	"-[MACHView setBlock_flagsChanged:]"
	.p2align	2
"-[MACHView setBlock_flagsChanged:]":
	.cfi_startproc
	cbz	x0, LBB8_2
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh12:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh13:
	ldrsw	x10, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	mov	x9, x0
	ldr	x8, [x19, x10]
	str	x9, [x19, x10]
	mov	x0, x8
	ldp	x20, x19, [sp], #32
	b	_objc_release
LBB8_2:
	ret
	.loh AdrpLdr	Lloh12, Lloh13
	.cfi_endproc

	.p2align	2
"-[MACHView keyDown:]":
	.cfi_startproc
Lloh14:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh15:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB9_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB9_2:
	ret
	.loh AdrpLdr	Lloh14, Lloh15
	.cfi_endproc

	.p2align	2
"-[MACHView keyUp:]":
	.cfi_startproc
Lloh16:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh17:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB10_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB10_2:
	ret
	.loh AdrpLdr	Lloh16, Lloh17
	.cfi_endproc

	.p2align	2
"-[MACHView flagsChanged:]":
	.cfi_startproc
Lloh18:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh19:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB11_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB11_2:
	ret
	.loh AdrpLdr	Lloh18, Lloh19
	.cfi_endproc

	.p2align	2
"-[MACHView mouseMoved:]":
	.cfi_startproc
Lloh20:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh21:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB12_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB12_2:
	ret
	.loh AdrpLdr	Lloh20, Lloh21
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDragged:]":
	.cfi_startproc
Lloh22:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh23:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB13_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB13_2:
	ret
	.loh AdrpLdr	Lloh22, Lloh23
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDragged:]":
	.cfi_startproc
Lloh24:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh25:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB14_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB14_2:
	ret
	.loh AdrpLdr	Lloh24, Lloh25
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDragged:]":
	.cfi_startproc
Lloh26:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh27:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB15_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB15_2:
	ret
	.loh AdrpLdr	Lloh26, Lloh27
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDown:]":
	.cfi_startproc
Lloh28:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh29:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB16_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB16_2:
	ret
	.loh AdrpLdr	Lloh28, Lloh29
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDown:]":
	.cfi_startproc
Lloh30:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh31:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB17_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB17_2:
	ret
	.loh AdrpLdr	Lloh30, Lloh31
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDown:]":
	.cfi_startproc
Lloh32:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh33:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB18_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB18_2:
	ret
	.loh AdrpLdr	Lloh32, Lloh33
	.cfi_endproc

	.p2align	2
"-[MACHView mouseUp:]":
	.cfi_startproc
Lloh34:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh35:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB19_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB19_2:
	ret
	.loh AdrpLdr	Lloh34, Lloh35
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseUp:]":
	.cfi_startproc
Lloh36:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh37:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB20_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB20_2:
	ret
	.loh AdrpLdr	Lloh36, Lloh37
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseUp:]":
	.cfi_startproc
Lloh38:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh39:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB21_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB21_2:
	ret
	.loh AdrpLdr	Lloh38, Lloh39
	.cfi_endproc

	.p2align	2
"-[MACHView scrollWheel:]":
	.cfi_startproc
Lloh40:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh41:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB22_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB22_2:
	ret
	.loh AdrpLdr	Lloh40, Lloh41
	.cfi_endproc

	.p2align	2
"-[MACHView initWithFrame:]":
	.cfi_startproc
	sub	sp, sp, #80
	stp	d11, d10, [sp, #16]
	stp	d9, d8, [sp, #32]
	stp	x20, x19, [sp, #48]
	stp	x29, x30, [sp, #64]
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
Lloh42:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh43:
	adrp	x9, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh44:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
Lloh45:
	ldr	x1, [x9, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	stp	x0, x8, [sp]
	mov	x0, sp
	bl	_objc_msgSendSuper2
	mov	x19, x0
	cbz	x0, LBB23_2
Lloh46:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
	mov	x0, x19
Lloh47:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	bl	_objc_msgSend
Lloh48:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
	fmov	d8, d0
	fmov	d9, d1
Lloh49:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	fmov	d10, d2
	fmov	d11, d3
	bl	_objc_alloc
	fmov	d0, d8
	fmov	d1, d9
Lloh50:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.4@PAGE
	fmov	d2, d10
	fmov	d3, d11
Lloh51:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.4@PAGEOFF]
	mov	w2, #67
	mov	x3, x19
	mov	x4, xzr
	bl	_objc_msgSend
Lloh52:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh53:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
Lloh54:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.6@PAGE
	ldr	x2, [x19, x20]
	mov	x0, x19
Lloh55:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.6@PAGEOFF]
	bl	_objc_msgSend
LBB23_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #64]
	ldp	x20, x19, [sp, #48]
	ldp	d9, d8, [sp, #32]
	ldp	d11, d10, [sp, #16]
	add	sp, sp, #80
	ret
	.loh AdrpLdr	Lloh43, Lloh45
	.loh AdrpLdr	Lloh42, Lloh44
	.loh AdrpLdr	Lloh54, Lloh55
	.loh AdrpLdr	Lloh52, Lloh53
	.loh AdrpLdr	Lloh50, Lloh51
	.loh AdrpLdr	Lloh48, Lloh49
	.loh AdrpLdr	Lloh46, Lloh47
	.cfi_endproc

	.p2align	2
"-[MACHView updateTrackingAreas]":
	.cfi_startproc
	stp	d11, d10, [sp, #-64]!
	stp	d9, d8, [sp, #16]
	stp	x20, x19, [sp, #32]
	stp	x29, x30, [sp, #48]
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
Lloh56:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
	mov	x19, x0
Lloh57:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
Lloh58:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.8@PAGE
Lloh59:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.8@PAGEOFF]
	ldr	x2, [x0, x20]
	bl	_objc_msgSend
Lloh60:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
	mov	x0, x19
Lloh61:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	bl	_objc_msgSend
Lloh62:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
	fmov	d8, d0
	fmov	d9, d1
Lloh63:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	fmov	d10, d2
	fmov	d11, d3
	bl	_objc_alloc
	fmov	d0, d8
	fmov	d1, d9
Lloh64:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.4@PAGE
	fmov	d2, d10
	fmov	d3, d11
Lloh65:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.4@PAGEOFF]
	mov	w2, #67
	mov	x3, x19
	mov	x4, xzr
	bl	_objc_msgSend
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
Lloh66:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.6@PAGE
	ldr	x2, [x19, x20]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]
Lloh67:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.6@PAGEOFF]
	ldp	x20, x19, [sp, #32]
	ldp	d9, d8, [sp, #16]
	ldp	d11, d10, [sp], #64
	b	_objc_msgSend
	.loh AdrpLdr	Lloh66, Lloh67
	.loh AdrpLdr	Lloh64, Lloh65
	.loh AdrpLdr	Lloh62, Lloh63
	.loh AdrpLdr	Lloh60, Lloh61
	.loh AdrpLdr	Lloh58, Lloh59
	.loh AdrpAdrp	Lloh56, Lloh58
	.loh AdrpLdr	Lloh56, Lloh57
	.cfi_endproc

	.p2align	2
"-[MACHView .cxx_destruct]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Lloh68:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
	mov	x19, x0
	mov	x1, xzr
Lloh69:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	add	x0, x0, x8
	bl	_objc_storeStrong
Lloh70:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
	mov	x1, xzr
Lloh71:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh72:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
	mov	x1, xzr
Lloh73:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh74:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
	mov	x1, xzr
Lloh75:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh76:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
	mov	x1, xzr
Lloh77:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh78:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
	mov	x1, xzr
Lloh79:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh80:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
	mov	x1, xzr
Lloh81:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	add	x0, x19, x8
	bl	_objc_storeStrong
Lloh82:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh83:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	mov	x1, xzr
	add	x0, x19, x8
	ldp	x20, x19, [sp], #32
	b	_objc_storeStrong
	.loh AdrpLdr	Lloh82, Lloh83
	.loh AdrpLdr	Lloh80, Lloh81
	.loh AdrpLdr	Lloh78, Lloh79
	.loh AdrpLdr	Lloh76, Lloh77
	.loh AdrpLdr	Lloh74, Lloh75
	.loh AdrpLdr	Lloh72, Lloh73
	.loh AdrpLdr	Lloh70, Lloh71
	.loh AdrpLdr	Lloh68, Lloh69
	.cfi_endproc

	.private_extern	_OBJC_IVAR_$_MACHView._keyDown_block
	.section	__DATA,__objc_ivar
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
l_OBJC_METH_VAR_NAME_:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	l_OBJC_METH_VAR_NAME_

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.1:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	l_OBJC_METH_VAR_NAME_.1

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.3:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	l_OBJC_METH_VAR_NAME_.3

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.long	64

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.5:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.6:
	.quad	l_OBJC_METH_VAR_NAME_.5

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.7:
	.asciz	"removeTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	l_OBJC_METH_VAR_NAME_.7

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
l_OBJC_CLASS_NAME_.9:
	.asciz	"\b"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.10:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"B16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.11:
	.asciz	"acceptsFirstResponder"

l_OBJC_METH_VAR_NAME_.12:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.13:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.14:
	.asciz	"keyUp:"

l_OBJC_METH_VAR_NAME_.15:
	.asciz	"flagsChanged:"

l_OBJC_METH_VAR_NAME_.16:
	.asciz	"mouseMoved:"

l_OBJC_METH_VAR_NAME_.17:
	.asciz	"mouseDragged:"

l_OBJC_METH_VAR_NAME_.18:
	.asciz	"rightMouseDragged:"

l_OBJC_METH_VAR_NAME_.19:
	.asciz	"otherMouseDragged:"

l_OBJC_METH_VAR_NAME_.20:
	.asciz	"mouseDown:"

l_OBJC_METH_VAR_NAME_.21:
	.asciz	"rightMouseDown:"

l_OBJC_METH_VAR_NAME_.22:
	.asciz	"otherMouseDown:"

l_OBJC_METH_VAR_NAME_.23:
	.asciz	"mouseUp:"

l_OBJC_METH_VAR_NAME_.24:
	.asciz	"rightMouseUp:"

l_OBJC_METH_VAR_NAME_.25:
	.asciz	"otherMouseUp:"

l_OBJC_METH_VAR_NAME_.26:
	.asciz	"scrollWheel:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.27:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.28:
	.asciz	"updateTrackingAreas"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.29:
	.asciz	"v16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.30:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	19
	.quad	l_OBJC_METH_VAR_NAME_.10
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	l_OBJC_METH_VAR_NAME_.11
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	l_OBJC_METH_VAR_NAME_.12
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView keyDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.14
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView keyUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.15
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView flagsChanged:]"
	.quad	l_OBJC_METH_VAR_NAME_.16
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView mouseMoved:]"
	.quad	l_OBJC_METH_VAR_NAME_.17
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView mouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.18
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.19
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.20
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView mouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.21
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView rightMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.22
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView otherMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.23
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView mouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.24
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView rightMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.25
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView otherMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.26
	.quad	l_OBJC_METH_VAR_TYPE_.13
	.quad	"-[MACHView scrollWheel:]"
	.quad	l_OBJC_METH_VAR_NAME_
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	"-[MACHView initWithFrame:]"
	.quad	l_OBJC_METH_VAR_NAME_.28
	.quad	l_OBJC_METH_VAR_TYPE_.29
	.quad	"-[MACHView updateTrackingAreas]"
	.quad	l_OBJC_METH_VAR_NAME_.30
	.quad	l_OBJC_METH_VAR_TYPE_.29
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.31:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.32:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.33:
	.asciz	"_keyUp_block"

l_OBJC_METH_VAR_NAME_.34:
	.asciz	"_flagsChanged_block"

l_OBJC_METH_VAR_NAME_.35:
	.asciz	"_mouseMoved_block"

l_OBJC_METH_VAR_NAME_.36:
	.asciz	"_mouseDown_block"

l_OBJC_METH_VAR_NAME_.37:
	.asciz	"_mouseUp_block"

l_OBJC_METH_VAR_NAME_.38:
	.asciz	"_scrollWheel_block"

l_OBJC_METH_VAR_NAME_.39:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.40:
	.asciz	"@\"NSTrackingArea\""

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	l_OBJC_METH_VAR_NAME_.31
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	l_OBJC_METH_VAR_NAME_.33
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	l_OBJC_METH_VAR_NAME_.34
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	l_OBJC_METH_VAR_NAME_.35
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	l_OBJC_METH_VAR_NAME_.36
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	l_OBJC_METH_VAR_NAME_.37
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	l_OBJC_METH_VAR_NAME_.38
	.quad	l_OBJC_METH_VAR_TYPE_.32
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	l_OBJC_METH_VAR_NAME_.39
	.quad	l_OBJC_METH_VAR_TYPE_.40
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	72
	.space	4
	.quad	l_OBJC_CLASS_NAME_.9
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

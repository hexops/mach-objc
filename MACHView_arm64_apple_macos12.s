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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh0:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh1:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh2:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh3:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh4:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh5:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh6:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh7:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh8:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh9:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh10:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh11:
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
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	x0, x1
	bl	_objc_retainBlock
Lloh12:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh13:
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
LBB8_2:
	ret
	.loh AdrpLdr	Lloh12, Lloh13
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_insertText:]"
	.globl	"-[MACHView setBlock_insertText:]"
	.p2align	2
"-[MACHView setBlock_insertText:]":
	.cfi_startproc
	cbz	x0, LBB9_2
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
Lloh14:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh15:
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
LBB9_2:
	ret
	.loh AdrpLdr	Lloh14, Lloh15
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_magnify:]"
	.globl	"-[MACHView setBlock_magnify:]"
	.p2align	2
"-[MACHView setBlock_magnify:]":
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
Lloh16:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh17:
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
LBB10_2:
	ret
	.loh AdrpLdr	Lloh16, Lloh17
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
Lloh18:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh19:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB11_2
	ldr	x8, [x0, #16]
	mov	x1, x19
	blr	x8
LBB11_2:
	str	x19, [sp, #8]
Lloh20:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
Lloh21:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
Lloh22:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh23:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	add	x2, sp, #8
	mov	w3, #1
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh24:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
Lloh25:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
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
	.loh AdrpLdr	Lloh18, Lloh19
	.loh AdrpLdr	Lloh24, Lloh25
	.loh AdrpLdr	Lloh22, Lloh23
	.loh AdrpAdrp	Lloh20, Lloh22
	.loh AdrpLdr	Lloh20, Lloh21
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
Lloh26:
	adrp	x8, _NSApp@GOTPAGE
Lloh27:
	ldr	x8, [x8, _NSApp@GOTPAGEOFF]
Lloh28:
	ldr	x0, [x8]
Lloh29:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.4@PAGE
Lloh30:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.4@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh31:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.5@PAGE
Lloh32:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.5@PAGEOFF]
Lloh33:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.7@PAGE
Lloh34:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.7@PAGEOFF]
	bl	_objc_msgSend
	mov	x2, x0
Lloh35:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.9@PAGE
Lloh36:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.9@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	cbz	w0, LBB12_2
Lloh37:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.11@PAGE
Lloh38:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.11@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x22, x0
	b	LBB12_3
LBB12_2:
	mov	x0, x19
	bl	_objc_retain
	mov	x22, x19
LBB12_3:
Lloh39:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.13@PAGE
Lloh40:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.13@PAGEOFF]
	mov	x0, x22
	bl	_objc_msgSend
	stp	xzr, x0, [sp, #32]
	cbz	x0, LBB12_10
Lloh41:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.15@PAGE
Lloh42:
	ldr	x23, [x8, _OBJC_SELECTOR_REFERENCES_.15@PAGEOFF]
	add	x24, sp, #32
	adrp	x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
LBB12_5:
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
	cbz	w0, LBB12_9
	ldr	w2, [sp, #28]
	lsr	w8, w2, #8
	cmp	w8, #247
	b.eq	LBB12_9
	ldrsw	x8, [x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB12_9
	ldr	x8, [x0, #16]
	mov	x1, x21
	blr	x8
LBB12_9:
	ldr	x0, [sp, #40]
	cbnz	x0, LBB12_5
LBB12_10:
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
	.loh AdrpLdr	Lloh35, Lloh36
	.loh AdrpLdr	Lloh33, Lloh34
	.loh AdrpAdrp	Lloh31, Lloh33
	.loh AdrpLdr	Lloh31, Lloh32
	.loh AdrpLdr	Lloh29, Lloh30
	.loh AdrpLdrGotLdr	Lloh26, Lloh27, Lloh28
	.loh AdrpLdr	Lloh37, Lloh38
	.loh AdrpLdr	Lloh39, Lloh40
	.loh AdrpLdr	Lloh41, Lloh42
	.cfi_endproc

	.p2align	2
"-[MACHView keyUp:]":
	.cfi_startproc
Lloh43:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh44:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB13_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB13_2:
	ret
	.loh AdrpLdr	Lloh43, Lloh44
	.cfi_endproc

	.p2align	2
"-[MACHView flagsChanged:]":
	.cfi_startproc
Lloh45:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh46:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB14_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB14_2:
	ret
	.loh AdrpLdr	Lloh45, Lloh46
	.cfi_endproc

	.p2align	2
"-[MACHView mouseMoved:]":
	.cfi_startproc
Lloh47:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh48:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB15_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB15_2:
	ret
	.loh AdrpLdr	Lloh47, Lloh48
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDragged:]":
	.cfi_startproc
Lloh49:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh50:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB16_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB16_2:
	ret
	.loh AdrpLdr	Lloh49, Lloh50
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDragged:]":
	.cfi_startproc
Lloh51:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh52:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB17_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB17_2:
	ret
	.loh AdrpLdr	Lloh51, Lloh52
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDragged:]":
	.cfi_startproc
Lloh53:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh54:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB18_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB18_2:
	ret
	.loh AdrpLdr	Lloh53, Lloh54
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDown:]":
	.cfi_startproc
Lloh55:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh56:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB19_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB19_2:
	ret
	.loh AdrpLdr	Lloh55, Lloh56
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDown:]":
	.cfi_startproc
Lloh57:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh58:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB20_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB20_2:
	ret
	.loh AdrpLdr	Lloh57, Lloh58
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDown:]":
	.cfi_startproc
Lloh59:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh60:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB21_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB21_2:
	ret
	.loh AdrpLdr	Lloh59, Lloh60
	.cfi_endproc

	.p2align	2
"-[MACHView mouseUp:]":
	.cfi_startproc
Lloh61:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh62:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB22_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB22_2:
	ret
	.loh AdrpLdr	Lloh61, Lloh62
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseUp:]":
	.cfi_startproc
Lloh63:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh64:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB23_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB23_2:
	ret
	.loh AdrpLdr	Lloh63, Lloh64
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseUp:]":
	.cfi_startproc
Lloh65:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh66:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB24_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB24_2:
	ret
	.loh AdrpLdr	Lloh65, Lloh66
	.cfi_endproc

	.p2align	2
"-[MACHView scrollWheel:]":
	.cfi_startproc
Lloh67:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh68:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB25_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB25_2:
	ret
	.loh AdrpLdr	Lloh67, Lloh68
	.cfi_endproc

	.p2align	2
"-[MACHView magnifyWithEvent:]":
	.cfi_startproc
Lloh69:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh70:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB26_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB26_2:
	ret
	.loh AdrpLdr	Lloh69, Lloh70
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
Lloh71:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh72:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x0, x8, [sp]
Lloh73:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.17@PAGE
Lloh74:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.17@PAGEOFF]
	mov	x0, sp
	bl	_objc_msgSendSuper2
	mov	x19, x0
	cbz	x0, LBB28_2
Lloh75:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.19@PAGE
Lloh76:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.19@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh77:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.20@PAGE
Lloh78:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.20@PAGEOFF]
	bl	_objc_alloc
Lloh79:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.22@PAGE
Lloh80:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.22@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	fmov	d2, d10
	fmov	d3, d11
	mov	w2, #67
	mov	x3, x19
	mov	x4, #0
	bl	_objc_msgSend
Lloh81:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh82:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
	ldr	x2, [x19, x20]
Lloh83:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.24@PAGE
Lloh84:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.24@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
LBB28_2:
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
	.loh AdrpLdr	Lloh73, Lloh74
	.loh AdrpLdr	Lloh71, Lloh72
	.loh AdrpLdr	Lloh83, Lloh84
	.loh AdrpLdr	Lloh81, Lloh82
	.loh AdrpLdr	Lloh79, Lloh80
	.loh AdrpLdr	Lloh77, Lloh78
	.loh AdrpLdr	Lloh75, Lloh76
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
Lloh85:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh86:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x2, [x0, x20]
Lloh87:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.26@PAGE
Lloh88:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.26@PAGEOFF]
	bl	_objc_msgSend
Lloh89:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.19@PAGE
Lloh90:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.19@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh91:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.20@PAGE
Lloh92:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.20@PAGEOFF]
	bl	_objc_alloc
Lloh93:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.22@PAGE
Lloh94:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.22@PAGEOFF]
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
Lloh95:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.24@PAGE
Lloh96:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.24@PAGEOFF]
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
	.loh AdrpLdr	Lloh95, Lloh96
	.loh AdrpLdr	Lloh93, Lloh94
	.loh AdrpLdr	Lloh91, Lloh92
	.loh AdrpLdr	Lloh89, Lloh90
	.loh AdrpLdr	Lloh87, Lloh88
	.loh AdrpAdrp	Lloh85, Lloh87
	.loh AdrpLdr	Lloh85, Lloh86
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
Lloh97:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh98:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	add	x0, x0, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh99:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh100:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh101:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh102:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh103:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh104:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh105:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh106:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh107:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh108:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh109:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh110:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh111:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh112:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh113:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh114:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh115:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh116:
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
	.loh AdrpLdr	Lloh115, Lloh116
	.loh AdrpLdr	Lloh113, Lloh114
	.loh AdrpLdr	Lloh111, Lloh112
	.loh AdrpLdr	Lloh109, Lloh110
	.loh AdrpLdr	Lloh107, Lloh108
	.loh AdrpLdr	Lloh105, Lloh106
	.loh AdrpLdr	Lloh103, Lloh104
	.loh AdrpLdr	Lloh101, Lloh102
	.loh AdrpLdr	Lloh99, Lloh100
	.loh AdrpLdr	Lloh97, Lloh98
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
l_OBJC_METH_VAR_NAME_:
	.asciz	"arrayWithObjects:count:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	l_OBJC_METH_VAR_NAME_

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.1:
	.asciz	"interpretKeyEvents:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	l_OBJC_METH_VAR_NAME_.1

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.3:
	.asciz	"currentEvent"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	l_OBJC_METH_VAR_NAME_.3

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.5:
	.quad	_OBJC_CLASS_$_NSAttributedString

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.6:
	.asciz	"class"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.7:
	.quad	l_OBJC_METH_VAR_NAME_.6

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.8:
	.asciz	"isKindOfClass:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.9:
	.quad	l_OBJC_METH_VAR_NAME_.8

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.10:
	.asciz	"string"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.11:
	.quad	l_OBJC_METH_VAR_NAME_.10

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.12:
	.asciz	"length"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.13:
	.quad	l_OBJC_METH_VAR_NAME_.12

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.14:
	.asciz	"getBytes:maxLength:usedLength:encoding:options:range:remainingRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.15:
	.quad	l_OBJC_METH_VAR_NAME_.14

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
l_OBJC_METH_VAR_NAME_.16:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.17:
	.quad	l_OBJC_METH_VAR_NAME_.16

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.18:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.19:
	.quad	l_OBJC_METH_VAR_NAME_.18

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.20:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.21:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.22:
	.quad	l_OBJC_METH_VAR_NAME_.21

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.long	80

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.23:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.24:
	.quad	l_OBJC_METH_VAR_NAME_.23

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.25:
	.asciz	"removeTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.26:
	.quad	l_OBJC_METH_VAR_NAME_.25

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
l_OBJC_CLASS_NAME_.27:
	.asciz	"\n"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.28:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"B16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.29:
	.asciz	"acceptsFirstResponder"

l_OBJC_METH_VAR_NAME_.30:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.31:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.32:
	.asciz	"insertText:"

l_OBJC_METH_VAR_NAME_.33:
	.asciz	"keyUp:"

l_OBJC_METH_VAR_NAME_.34:
	.asciz	"flagsChanged:"

l_OBJC_METH_VAR_NAME_.35:
	.asciz	"mouseMoved:"

l_OBJC_METH_VAR_NAME_.36:
	.asciz	"mouseDragged:"

l_OBJC_METH_VAR_NAME_.37:
	.asciz	"rightMouseDragged:"

l_OBJC_METH_VAR_NAME_.38:
	.asciz	"otherMouseDragged:"

l_OBJC_METH_VAR_NAME_.39:
	.asciz	"mouseDown:"

l_OBJC_METH_VAR_NAME_.40:
	.asciz	"rightMouseDown:"

l_OBJC_METH_VAR_NAME_.41:
	.asciz	"otherMouseDown:"

l_OBJC_METH_VAR_NAME_.42:
	.asciz	"mouseUp:"

l_OBJC_METH_VAR_NAME_.43:
	.asciz	"rightMouseUp:"

l_OBJC_METH_VAR_NAME_.44:
	.asciz	"otherMouseUp:"

l_OBJC_METH_VAR_NAME_.45:
	.asciz	"scrollWheel:"

l_OBJC_METH_VAR_NAME_.46:
	.asciz	"magnifyWithEvent:"

l_OBJC_METH_VAR_NAME_.47:
	.asciz	"doCommandBySelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.48:
	.asciz	"v24@0:8:16"

l_OBJC_METH_VAR_TYPE_.49:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.50:
	.asciz	"updateTrackingAreas"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.51:
	.asciz	"v16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.52:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	22
	.quad	l_OBJC_METH_VAR_NAME_.28
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	l_OBJC_METH_VAR_NAME_.29
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	l_OBJC_METH_VAR_NAME_.30
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView keyDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.32
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView insertText:]"
	.quad	l_OBJC_METH_VAR_NAME_.33
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView keyUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.34
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView flagsChanged:]"
	.quad	l_OBJC_METH_VAR_NAME_.35
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView mouseMoved:]"
	.quad	l_OBJC_METH_VAR_NAME_.36
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView mouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.37
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.38
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.39
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView mouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.40
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView rightMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.41
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView otherMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.42
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView mouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.43
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView rightMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.44
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView otherMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.45
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView scrollWheel:]"
	.quad	l_OBJC_METH_VAR_NAME_.46
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	"-[MACHView magnifyWithEvent:]"
	.quad	l_OBJC_METH_VAR_NAME_.47
	.quad	l_OBJC_METH_VAR_TYPE_.48
	.quad	"-[MACHView doCommandBySelector:]"
	.quad	l_OBJC_METH_VAR_NAME_.16
	.quad	l_OBJC_METH_VAR_TYPE_.49
	.quad	"-[MACHView initWithFrame:]"
	.quad	l_OBJC_METH_VAR_NAME_.50
	.quad	l_OBJC_METH_VAR_TYPE_.51
	.quad	"-[MACHView updateTrackingAreas]"
	.quad	l_OBJC_METH_VAR_NAME_.52
	.quad	l_OBJC_METH_VAR_TYPE_.51
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.53:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.54:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.55:
	.asciz	"_keyUp_block"

l_OBJC_METH_VAR_NAME_.56:
	.asciz	"_flagsChanged_block"

l_OBJC_METH_VAR_NAME_.57:
	.asciz	"_mouseMoved_block"

l_OBJC_METH_VAR_NAME_.58:
	.asciz	"_mouseDown_block"

l_OBJC_METH_VAR_NAME_.59:
	.asciz	"_mouseUp_block"

l_OBJC_METH_VAR_NAME_.60:
	.asciz	"_scrollWheel_block"

l_OBJC_METH_VAR_NAME_.61:
	.asciz	"_magnify_block"

l_OBJC_METH_VAR_NAME_.62:
	.asciz	"_insertText_block"

l_OBJC_METH_VAR_NAME_.63:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.64:
	.asciz	"@\"NSTrackingArea\""

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	10
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	l_OBJC_METH_VAR_NAME_.53
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	l_OBJC_METH_VAR_NAME_.55
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	l_OBJC_METH_VAR_NAME_.56
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	l_OBJC_METH_VAR_NAME_.57
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	l_OBJC_METH_VAR_NAME_.58
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	l_OBJC_METH_VAR_NAME_.59
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	l_OBJC_METH_VAR_NAME_.60
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._magnify_block
	.quad	l_OBJC_METH_VAR_NAME_.61
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._insertText_block
	.quad	l_OBJC_METH_VAR_NAME_.62
	.quad	l_OBJC_METH_VAR_TYPE_.54
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	l_OBJC_METH_VAR_NAME_.63
	.quad	l_OBJC_METH_VAR_TYPE_.64
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	88
	.space	4
	.quad	l_OBJC_CLASS_NAME_.27
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

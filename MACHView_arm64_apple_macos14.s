	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0
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
"+[MACHView layerClass]":
	.cfi_startproc
Lloh0:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
Lloh1:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
Lloh2:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh3:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	b	_objc_msgSend
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdrp	Lloh0, Lloh2
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc

	.p2align	2
"-[MACHView makeBackingLayer]":
	.cfi_startproc
Lloh4:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
Lloh5:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
Lloh6:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
Lloh7:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	b	_objc_msgSend
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpAdrp	Lloh4, Lloh6
	.loh AdrpLdr	Lloh4, Lloh5
	.cfi_endproc

	.p2align	2
"-[MACHView initCommon]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Lloh8:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.4@PAGE
Lloh9:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.4@PAGEOFF]
	mov	w2, #1
	bl	_objc_msgSend
Lloh10:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.6@PAGE
Lloh11:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.6@PAGEOFF]
	mov	x0, x19
	mov	w2, #2
	bl	_objc_msgSend
Lloh12:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
Lloh13:
	ldr	x20, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	mov	x0, x19
	mov	x1, x20
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
Lloh14:
	adrp	x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGE
Lloh15:
	ldrsw	x9, [x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGEOFF]
	ldr	x8, [x19, x9]
	str	x0, [x19, x9]
	mov	x0, x8
	bl	_objc_release
	mov	x0, x19
	mov	x1, x20
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh16:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.8@PAGE
Lloh17:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.8@PAGEOFF]
	mov	x2, x19
	bl	_objc_msgSend
	mov	x0, x20
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
	.loh AdrpLdr	Lloh16, Lloh17
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpLdr	Lloh8, Lloh9
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
Lloh18:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh19:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x0, x8, [sp]
Lloh20:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.10@PAGE
Lloh21:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.10@PAGEOFF]
	mov	x0, sp
	bl	_objc_msgSendSuper2
	mov	x19, x0
	cbz	x0, LBB5_2
Lloh22:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.12@PAGE
Lloh23:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.12@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
Lloh24:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.14@PAGE
Lloh25:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.14@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh26:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGE
Lloh27:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGEOFF]
	bl	_objc_alloc
Lloh28:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.17@PAGE
Lloh29:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.17@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	fmov	d2, d10
	fmov	d3, d11
	mov	w2, #67
	mov	x3, x19
	mov	x4, #0
	bl	_objc_msgSend
Lloh30:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh31:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x8, [x19, x20]
	str	x0, [x19, x20]
	mov	x0, x8
	bl	_objc_release
	ldr	x2, [x19, x20]
Lloh32:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.19@PAGE
Lloh33:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.19@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
LBB5_2:
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
	.loh AdrpLdr	Lloh20, Lloh21
	.loh AdrpLdr	Lloh18, Lloh19
	.loh AdrpLdr	Lloh32, Lloh33
	.loh AdrpLdr	Lloh30, Lloh31
	.loh AdrpLdr	Lloh28, Lloh29
	.loh AdrpLdr	Lloh26, Lloh27
	.loh AdrpLdr	Lloh24, Lloh25
	.loh AdrpLdr	Lloh22, Lloh23
	.cfi_endproc

	.p2align	2
"-[MACHView didMoveToWindow]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_remember_state
	mov	x19, x0
Lloh34:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.21@PAGE
Lloh35:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.21@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
	bl	_objc_release
	cbz	x20, LBB6_2
Lloh36:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.25@PAGE
Lloh37:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.25@PAGEOFF]
	mov	x0, x19
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_msgSend
LBB6_2:
	.cfi_restore_state
Lloh38:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh39:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	ldr	x0, [x19, x20]
Lloh40:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.23@PAGE
Lloh41:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.23@PAGEOFF]
	bl	_objc_msgSend
	ldr	x0, [x19, x20]
	str	xzr, [x19, x20]
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
	.loh AdrpLdr	Lloh34, Lloh35
	.loh AdrpLdr	Lloh36, Lloh37
	.loh AdrpLdr	Lloh40, Lloh41
	.loh AdrpAdrp	Lloh38, Lloh40
	.loh AdrpLdr	Lloh38, Lloh39
	.cfi_endproc

	.p2align	2
"-[MACHView viewDidMoveToWindow]":
	.cfi_startproc
Lloh42:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.25@PAGE
Lloh43:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.25@PAGEOFF]
	b	_objc_msgSend
	.loh AdrpLdr	Lloh42, Lloh43
	.cfi_endproc

	.p2align	2
"-[MACHView movedToWindow]":
	.cfi_startproc
	stp	d9, d8, [sp, #-64]!
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	mov	x19, x0
Lloh44:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.27@PAGE
Lloh45:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.27@PAGEOFF]
	bl	_objc_msgSend
	mov	x0, x19
	bl	_objc_retain
	bl	_objc_sync_enter
Lloh46:
	adrp	x8, _OBJC_IVAR_$_MACHView._continueRunLoop@PAGE
Lloh47:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView._continueRunLoop@PAGEOFF]
	strb	wzr, [x19, x20]
	mov	x0, x19
	bl	_objc_sync_exit
	mov	x0, x19
	bl	_objc_release
Lloh48:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.28@PAGE
Lloh49:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.28@PAGEOFF]
	bl	_objc_alloc
Lloh50:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.30@PAGE
Lloh51:
	ldr	x3, [x8, _OBJC_SELECTOR_REFERENCES_.30@PAGEOFF]
Lloh52:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.32@PAGE
Lloh53:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.32@PAGEOFF]
	mov	x2, x19
	mov	x4, #0
	bl	_objc_msgSend
Lloh54:
	adrp	x8, _OBJC_IVAR_$_MACHView._renderThread@PAGE
Lloh55:
	ldrsw	x21, [x8, _OBJC_IVAR_$_MACHView._renderThread@PAGEOFF]
	ldr	x8, [x19, x21]
	str	x0, [x19, x21]
	mov	x0, x8
	bl	_objc_release
	mov	w8, #1
	strb	w8, [x19, x20]
	ldr	x0, [x19, x21]
Lloh56:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.34@PAGE
Lloh57:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.34@PAGEOFF]
	bl	_objc_msgSend
Lloh58:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.21@PAGE
Lloh59:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.21@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh60:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.36@PAGE
Lloh61:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.36@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh62:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.38@PAGE
Lloh63:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.38@PAGEOFF]
	bl	_objc_msgSend
Lloh64:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.40@PAGE
Lloh65:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.40@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x0, x21
	bl	_objc_release
	mov	x0, x20
	bl	_objc_release
Lloh66:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.42@PAGE
Lloh67:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.42@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d2
	fmov	d9, d3
Lloh68:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.2@PAGE
Lloh69:
	ldr	x20, [x8, _OBJC_SELECTOR_REFERENCES_.2@PAGEOFF]
	mov	x0, x19
	mov	x1, x20
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh70:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.44@PAGE
Lloh71:
	ldr	x22, [x8, _OBJC_SELECTOR_REFERENCES_.44@PAGEOFF]
	mov	x1, x22
	bl	_objc_msgSend
	fmul	d8, d8, d0
	mov	x0, x21
	bl	_objc_release
	mov	x0, x19
	mov	x1, x20
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
	mov	x1, x22
	bl	_objc_msgSend
	fmul	d9, d9, d0
	mov	x0, x20
	bl	_objc_release
Lloh72:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.46@PAGE
Lloh73:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.46@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x19, x0
Lloh74:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.48@PAGE
Lloh75:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.48@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	bl	_objc_msgSend
	mov	x0, x19
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	d9, d8, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore b8
	.cfi_restore b9
	b	_objc_release
	.loh AdrpLdr	Lloh74, Lloh75
	.loh AdrpLdr	Lloh72, Lloh73
	.loh AdrpLdr	Lloh70, Lloh71
	.loh AdrpLdr	Lloh68, Lloh69
	.loh AdrpLdr	Lloh66, Lloh67
	.loh AdrpLdr	Lloh64, Lloh65
	.loh AdrpLdr	Lloh62, Lloh63
	.loh AdrpLdr	Lloh60, Lloh61
	.loh AdrpLdr	Lloh58, Lloh59
	.loh AdrpLdr	Lloh56, Lloh57
	.loh AdrpLdr	Lloh54, Lloh55
	.loh AdrpLdr	Lloh52, Lloh53
	.loh AdrpAdrp	Lloh50, Lloh52
	.loh AdrpLdr	Lloh50, Lloh51
	.loh AdrpLdr	Lloh48, Lloh49
	.loh AdrpLdr	Lloh46, Lloh47
	.loh AdrpLdr	Lloh44, Lloh45
	.cfi_endproc

	.p2align	2
"-[MACHView setupCAMetalLink]":
	.cfi_startproc
	stp	x24, x23, [sp, #-64]!
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
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x0
Lloh76:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.50@PAGE
Lloh77:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.50@PAGEOFF]
	bl	_objc_msgSend
Lloh78:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.52@PAGE
Lloh79:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.52@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh80:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.54@PAGE
Lloh81:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.54@PAGEOFF]
	mov	x0, x19
	mov	x2, x20
	bl	_objc_msgSend
	mov	x0, x20
	bl	_objc_release
Lloh82:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.55@PAGE
Lloh83:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.55@PAGEOFF]
Lloh84:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.57@PAGE
Lloh85:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.57@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh86:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.59@PAGE
Lloh87:
	ldr	x21, [x8, _OBJC_SELECTOR_REFERENCES_.59@PAGEOFF]
Lloh88:
	adrp	x8, _NSWindowWillCloseNotification@GOTPAGE
Lloh89:
	ldr	x8, [x8, _NSWindowWillCloseNotification@GOTPAGEOFF]
Lloh90:
	ldr	x22, [x8]
Lloh91:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.21@PAGE
Lloh92:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.21@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x23, x0
Lloh93:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.61@PAGE
Lloh94:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.61@PAGEOFF]
	mov	x0, x20
	mov	x2, x19
	mov	x3, x21
	mov	x4, x22
	mov	x5, x23
	bl	_objc_msgSend
	mov	x0, x23
	bl	_objc_release
	mov	x0, x20
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	x24, x23, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	b	_objc_release
	.loh AdrpLdr	Lloh93, Lloh94
	.loh AdrpLdr	Lloh91, Lloh92
	.loh AdrpLdrGotLdr	Lloh88, Lloh89, Lloh90
	.loh AdrpAdrp	Lloh86, Lloh88
	.loh AdrpLdr	Lloh86, Lloh87
	.loh AdrpLdr	Lloh84, Lloh85
	.loh AdrpAdrp	Lloh82, Lloh84
	.loh AdrpLdr	Lloh82, Lloh83
	.loh AdrpLdr	Lloh80, Lloh81
	.loh AdrpLdr	Lloh78, Lloh79
	.loh AdrpLdr	Lloh76, Lloh77
	.cfi_endproc

	.p2align	2
"-[MACHView windowWillClose:]":
	.cfi_startproc
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_remember_state
	mov	x19, x0
Lloh95:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.63@PAGE
Lloh96:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.63@PAGEOFF]
	mov	x0, x2
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh97:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.21@PAGE
Lloh98:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.21@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
	bl	_objc_release
	mov	x0, x20
	bl	_objc_release
	cmp	x20, x21
	b.eq	LBB10_2
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	ret
LBB10_2:
	.cfi_restore_state
Lloh99:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.65@PAGE
Lloh100:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.65@PAGEOFF]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	b	_objc_msgSend
	.loh AdrpLdr	Lloh97, Lloh98
	.loh AdrpLdr	Lloh95, Lloh96
	.loh AdrpLdr	Lloh99, Lloh100
	.cfi_endproc

	.p2align	2
"-[MACHView makeMetalLink:]":
	.cfi_startproc
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x20, x2
	mov	x19, x0
Lloh101:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.66@PAGE
Lloh102:
	ldr	x21, [x8, _OBJC_CLASSLIST_REFERENCES_$_.66@PAGEOFF]
	mov	x0, x2
	bl	_objc_retain
	mov	x0, x21
	bl	_objc_alloc
Lloh103:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.68@PAGE
Lloh104:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.68@PAGEOFF]
	mov	x2, x20
	bl	_objc_msgSend
	mov	x21, x0
	mov	x0, x20
	bl	_objc_release
Lloh105:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh106:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	ldr	x0, [x19, x20]
	str	x21, [x19, x20]
	bl	_objc_release
	mov	w8, #1123024896
	fmov	s0, w8
	fmov	s1, s0
	fmov	s2, s0
	bl	_CAFrameRateRangeMake
Lloh107:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.70@PAGE
Lloh108:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.70@PAGEOFF]
	ldr	x0, [x19, x20]
	bl	_objc_msgSend
	ldr	x0, [x19, x20]
Lloh109:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.72@PAGE
Lloh110:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.72@PAGEOFF]
	fmov	s0, #3.00000000
	bl	_objc_msgSend
	ldr	x0, [x19, x20]
Lloh111:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.74@PAGE
Lloh112:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.74@PAGEOFF]
	mov	w2, #0
	bl	_objc_msgSend
	ldr	x0, [x19, x20]
Lloh113:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.8@PAGE
Lloh114:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.8@PAGEOFF]
	mov	x2, x19
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	b	_objc_msgSend
	.loh AdrpLdr	Lloh113, Lloh114
	.loh AdrpLdr	Lloh111, Lloh112
	.loh AdrpLdr	Lloh109, Lloh110
	.loh AdrpLdr	Lloh107, Lloh108
	.loh AdrpLdr	Lloh105, Lloh106
	.loh AdrpLdr	Lloh103, Lloh104
	.loh AdrpLdr	Lloh101, Lloh102
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
Lloh115:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh116:
	ldrsw	x20, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	ldr	x2, [x0, x20]
Lloh117:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.76@PAGE
Lloh118:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.76@PAGEOFF]
	bl	_objc_msgSend
Lloh119:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.14@PAGE
Lloh120:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.14@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	fmov	d8, d0
	fmov	d9, d1
	fmov	d10, d2
	fmov	d11, d3
Lloh121:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGE
Lloh122:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.15@PAGEOFF]
	bl	_objc_alloc
Lloh123:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.17@PAGE
Lloh124:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.17@PAGEOFF]
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
Lloh125:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.19@PAGE
Lloh126:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.19@PAGEOFF]
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
	.loh AdrpLdr	Lloh125, Lloh126
	.loh AdrpLdr	Lloh123, Lloh124
	.loh AdrpLdr	Lloh121, Lloh122
	.loh AdrpLdr	Lloh119, Lloh120
	.loh AdrpLdr	Lloh117, Lloh118
	.loh AdrpAdrp	Lloh115, Lloh117
	.loh AdrpLdr	Lloh115, Lloh116
	.cfi_endproc

	.p2align	2
"-[MACHView metalDisplayLink:needsUpdate:]":
	.cfi_startproc
	stp	d9, d8, [sp, #-64]!
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	mov	x19, x3
	mov	x20, x0
Lloh127:
	adrp	x8, _OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp@PAGE
Lloh128:
	ldrsw	x22, [x8, _OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp@PAGEOFF]
	ldr	d8, [x0, x22]
Lloh129:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.78@PAGE
Lloh130:
	ldr	x21, [x8, _OBJC_SELECTOR_REFERENCES_.78@PAGEOFF]
	mov	x0, x3
	bl	_objc_retain
	mov	x0, x19
	mov	x1, x21
	bl	_objc_msgSend
	fsub	d8, d8, d0
	mov	x0, x19
	mov	x1, x21
	bl	_objc_msgSend
	str	d0, [x20, x22]
Lloh131:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.80@PAGE
Lloh132:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.80@PAGEOFF]
	mov	x0, x20
	mov	x2, x19
	fmov	d0, d8
	bl	_objc_msgSend
	mov	x0, x19
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	d9, d8, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore b8
	.cfi_restore b9
	b	_objc_release
	.loh AdrpLdr	Lloh131, Lloh132
	.loh AdrpLdr	Lloh129, Lloh130
	.loh AdrpAdrp	Lloh127, Lloh129
	.loh AdrpLdr	Lloh127, Lloh128
	.cfi_endproc

	.p2align	2
"-[MACHView startMetalLink]":
	.cfi_startproc
	stp	x20, x19, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	bl	_CACurrentMediaTime
Lloh133:
	adrp	x8, _OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp@PAGE
Lloh134:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp@PAGEOFF]
	str	d0, [x19, x8]
Lloh135:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh136:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	ldr	x19, [x19, x8]
Lloh137:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGE
Lloh138:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGEOFF]
Lloh139:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.83@PAGE
Lloh140:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.83@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh141:
	adrp	x8, _NSRunLoopCommonModes@GOTPAGE
Lloh142:
	ldr	x8, [x8, _NSRunLoopCommonModes@GOTPAGEOFF]
Lloh143:
	ldr	x3, [x8]
Lloh144:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.85@PAGE
Lloh145:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.85@PAGEOFF]
	mov	x0, x19
	mov	x2, x20
	bl	_objc_msgSend
	mov	x0, x20
	ldp	x29, x30, [sp, #16]
	ldp	x20, x19, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	_objc_release
	.loh AdrpLdr	Lloh144, Lloh145
	.loh AdrpLdrGotLdr	Lloh141, Lloh142, Lloh143
	.loh AdrpLdr	Lloh139, Lloh140
	.loh AdrpAdrp	Lloh137, Lloh139
	.loh AdrpLdr	Lloh137, Lloh138
	.loh AdrpLdr	Lloh135, Lloh136
	.loh AdrpLdr	Lloh133, Lloh134
	.cfi_endproc

	.p2align	2
"-[MACHView stopMetalLink]":
	.cfi_startproc
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Lloh146:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh147:
	ldrsw	x22, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	ldr	x20, [x0, x22]
Lloh148:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGE
Lloh149:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGEOFF]
Lloh150:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.87@PAGE
Lloh151:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.87@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh152:
	adrp	x8, _NSRunLoopCommonModes@GOTPAGE
Lloh153:
	ldr	x8, [x8, _NSRunLoopCommonModes@GOTPAGEOFF]
Lloh154:
	ldr	x3, [x8]
Lloh155:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.89@PAGE
Lloh156:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.89@PAGEOFF]
	mov	x0, x20
	mov	x2, x21
	bl	_objc_msgSend
	mov	x0, x21
	bl	_objc_release
	ldr	x0, [x19, x22]
Lloh157:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.23@PAGE
Lloh158:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.23@PAGEOFF]
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	b	_objc_msgSend
	.loh AdrpLdr	Lloh157, Lloh158
	.loh AdrpLdr	Lloh155, Lloh156
	.loh AdrpLdrGotLdr	Lloh152, Lloh153, Lloh154
	.loh AdrpLdr	Lloh150, Lloh151
	.loh AdrpAdrp	Lloh148, Lloh150
	.loh AdrpLdr	Lloh148, Lloh149
	.loh AdrpAdrp	Lloh146, Lloh148
	.loh AdrpLdr	Lloh146, Lloh147
	.cfi_endproc

	.p2align	2
"-[MACHView stopRenderLoop]":
	.cfi_startproc
Lloh159:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh160:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	ldr	x0, [x0, x8]
Lloh161:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.23@PAGE
Lloh162:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.23@PAGEOFF]
	b	_objc_msgSend
	.loh AdrpLdr	Lloh161, Lloh162
	.loh AdrpLdr	Lloh159, Lloh160
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
Lloh163:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.50@PAGE
Lloh164:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.50@PAGEOFF]
	bl	_objc_msgSend
Lloh165:
	adrp	x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGE
Lloh166:
	ldr	x8, [x8, l_OBJC_CLASSLIST_SUP_REFS_$_@PAGEOFF]
	stp	x19, x8, [sp]
Lloh167:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.91@PAGE
Lloh168:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.91@PAGEOFF]
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
	.loh AdrpLdr	Lloh167, Lloh168
	.loh AdrpLdr	Lloh165, Lloh166
	.loh AdrpLdr	Lloh163, Lloh164
	.cfi_endproc

	.p2align	2
"-[MACHView runThread]":
	.cfi_startproc
	stp	x28, x27, [sp, #-96]!
	.cfi_def_cfa_offset 96
	stp	x26, x25, [sp, #16]
	stp	x24, x23, [sp, #32]
	stp	x22, x21, [sp, #48]
	stp	x20, x19, [sp, #64]
	stp	x29, x30, [sp, #80]
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x19, x0
Lloh169:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGE
Lloh170:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.81@PAGEOFF]
Lloh171:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.83@PAGE
Lloh172:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.83@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x20, x0
Lloh173:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.93@PAGE
Lloh174:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.93@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
Lloh175:
	adrp	x8, _NSDefaultRunLoopMode@GOTPAGE
Lloh176:
	ldr	x8, [x8, _NSDefaultRunLoopMode@GOTPAGEOFF]
Lloh177:
	ldr	x21, [x8]
Lloh178:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.96@PAGE
Lloh179:
	ldr	x22, [x8, _OBJC_SELECTOR_REFERENCES_.96@PAGEOFF]
Lloh180:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.98@PAGE
Lloh181:
	ldr	x23, [x8, _OBJC_SELECTOR_REFERENCES_.98@PAGEOFF]
Lloh182:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.100@PAGE
Lloh183:
	ldr	x24, [x8, _OBJC_SELECTOR_REFERENCES_.100@PAGEOFF]
	adrp	x27, _OBJC_CLASSLIST_REFERENCES_$_.94@PAGE
	adrp	x28, _OBJC_IVAR_$_MACHView._continueRunLoop@PAGE
LBB18_1:
	bl	_objc_autoreleasePoolPush
	mov	x25, x0
	ldr	x0, [x27, _OBJC_CLASSLIST_REFERENCES_$_.94@PAGEOFF]
	mov	x1, x22
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x26, x0
	mov	x0, x20
	mov	x1, x23
	mov	x2, x21
	mov	x3, x26
	bl	_objc_msgSend
	mov	x0, x26
	bl	_objc_release
	mov	x0, x25
	bl	_objc_autoreleasePoolPop
	mov	x0, x19
	bl	_objc_retain
	bl	_objc_sync_enter
	mov	x0, x19
	mov	x1, x24
	bl	_objc_msgSend
	ldrsw	x8, [x28, _OBJC_IVAR_$_MACHView._continueRunLoop@PAGEOFF]
	ldrb	w25, [x19, x8]
	mov	x0, x19
	bl	_objc_sync_exit
	mov	x0, x19
	bl	_objc_release
	tbnz	w25, #0, LBB18_1
	mov	x0, x20
	ldp	x29, x30, [sp, #80]
	ldp	x20, x19, [sp, #64]
	ldp	x22, x21, [sp, #48]
	ldp	x24, x23, [sp, #32]
	ldp	x26, x25, [sp, #16]
	ldp	x28, x27, [sp], #96
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
	.cfi_restore w27
	.cfi_restore w28
	b	_objc_release
	.loh AdrpLdr	Lloh182, Lloh183
	.loh AdrpAdrp	Lloh180, Lloh182
	.loh AdrpLdr	Lloh180, Lloh181
	.loh AdrpAdrp	Lloh178, Lloh180
	.loh AdrpLdr	Lloh178, Lloh179
	.loh AdrpLdrGotLdr	Lloh175, Lloh176, Lloh177
	.loh AdrpLdr	Lloh173, Lloh174
	.loh AdrpLdr	Lloh171, Lloh172
	.loh AdrpAdrp	Lloh169, Lloh171
	.loh AdrpLdr	Lloh169, Lloh170
	.cfi_endproc

	.p2align	2
"-[MACHView resizeDrawable:]":
	.cfi_startproc
	stp	d9, d8, [sp, #-64]!
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	.cfi_remember_state
	fmov	d9, d0
	mov	x19, x0
Lloh184:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.42@PAGE
Lloh185:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.42@PAGEOFF]
	bl	_objc_msgSend
	fmul	d8, d2, d9
	fcmp	d8, #0.0
	b.ls	LBB19_5
	fmul	d9, d3, d9
Lloh186:
	adrp	x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGE
Lloh187:
	ldrsw	x22, [x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGEOFF]
	ldr	x20, [x19, x22]
	mov	x0, x20
	bl	_objc_retain
	bl	_objc_sync_enter
	ldr	x0, [x19, x22]
Lloh188:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.102@PAGE
Lloh189:
	ldr	x21, [x8, _OBJC_SELECTOR_REFERENCES_.102@PAGEOFF]
	mov	x1, x21
	bl	_objc_msgSend
	fcmp	d8, d0
	b.ne	LBB19_3
	ldr	x0, [x19, x22]
	mov	x1, x21
	bl	_objc_msgSend
	fcmp	d9, d1
	b.eq	LBB19_4
LBB19_3:
	ldr	x0, [x19, x22]
Lloh190:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.104@PAGE
Lloh191:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.104@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	bl	_objc_msgSend
Lloh192:
	adrp	x8, _OBJC_IVAR_$_MACHView._delegate@PAGE
Lloh193:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._delegate@PAGEOFF]
	ldr	x0, [x19, x8]
Lloh194:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.48@PAGE
Lloh195:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.48@PAGEOFF]
	fmov	d0, d8
	fmov	d1, d9
	bl	_objc_msgSend
LBB19_4:
	mov	x0, x20
	bl	_objc_sync_exit
	mov	x0, x20
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	d9, d8, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore b8
	.cfi_restore b9
	b	_objc_release
LBB19_5:
	.cfi_restore_state
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	d9, d8, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore b8
	.cfi_restore b9
	ret
	.loh AdrpLdr	Lloh184, Lloh185
	.loh AdrpLdr	Lloh188, Lloh189
	.loh AdrpLdr	Lloh186, Lloh187
	.loh AdrpLdr	Lloh194, Lloh195
	.loh AdrpLdr	Lloh192, Lloh193
	.loh AdrpLdr	Lloh190, Lloh191
	.cfi_endproc

	.p2align	2
"-[MACHView renderUpdate:with:]":
	.cfi_startproc
	stp	d9, d8, [sp, #-64]!
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	fmov	d8, d0
	mov	x19, x2
	mov	x20, x0
Lloh196:
	adrp	x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGE
Lloh197:
	ldrsw	x22, [x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGEOFF]
	ldr	x21, [x0, x22]
	mov	x0, x21
	bl	_objc_retain
	mov	x0, x19
	bl	_objc_retain
	mov	x0, x21
	bl	_objc_sync_enter
Lloh198:
	adrp	x8, _OBJC_IVAR_$_MACHView._delegate@PAGE
Lloh199:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._delegate@PAGEOFF]
	ldr	x0, [x20, x8]
	ldr	x2, [x20, x22]
Lloh200:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.106@PAGE
Lloh201:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.106@PAGEOFF]
	mov	x3, x19
	fmov	d0, d8
	bl	_objc_msgSend
	mov	x0, x19
	bl	_objc_release
	mov	x0, x21
	bl	_objc_sync_exit
	mov	x0, x21
	ldp	x29, x30, [sp, #48]
	ldp	x20, x19, [sp, #32]
	ldp	x22, x21, [sp, #16]
	ldp	d9, d8, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore b8
	.cfi_restore b9
	b	_objc_release
	.loh AdrpLdr	Lloh200, Lloh201
	.loh AdrpLdr	Lloh198, Lloh199
	.loh AdrpLdr	Lloh196, Lloh197
	.cfi_endproc

	.p2align	2
"-[MACHView render]":
	.cfi_startproc
Lloh202:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh203:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._render_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB21_2
	ldr	x1, [x0, #16]
	br	x1
LBB21_2:
	ret
	.loh AdrpLdr	Lloh202, Lloh203
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_render:]"
	.globl	"-[MACHView setBlock_render:]"
	.p2align	2
"-[MACHView setBlock_render:]":
	.cfi_startproc
	cbz	x0, LBB22_2
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
Lloh204:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh205:
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
LBB22_2:
	ret
	.loh AdrpLdr	Lloh204, Lloh205
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyDown:]"
	.globl	"-[MACHView setBlock_keyDown:]"
	.p2align	2
"-[MACHView setBlock_keyDown:]":
	.cfi_startproc
	cbz	x0, LBB23_2
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
Lloh206:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh207:
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
LBB23_2:
	ret
	.loh AdrpLdr	Lloh206, Lloh207
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_keyUp:]"
	.globl	"-[MACHView setBlock_keyUp:]"
	.p2align	2
"-[MACHView setBlock_keyUp:]":
	.cfi_startproc
	cbz	x0, LBB24_2
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
Lloh208:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh209:
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
LBB24_2:
	ret
	.loh AdrpLdr	Lloh208, Lloh209
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseMoved:]"
	.globl	"-[MACHView setBlock_mouseMoved:]"
	.p2align	2
"-[MACHView setBlock_mouseMoved:]":
	.cfi_startproc
	cbz	x0, LBB25_2
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
Lloh210:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh211:
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
LBB25_2:
	ret
	.loh AdrpLdr	Lloh210, Lloh211
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseDown:]"
	.globl	"-[MACHView setBlock_mouseDown:]"
	.p2align	2
"-[MACHView setBlock_mouseDown:]":
	.cfi_startproc
	cbz	x0, LBB26_2
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
Lloh212:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh213:
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
LBB26_2:
	ret
	.loh AdrpLdr	Lloh212, Lloh213
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_mouseUp:]"
	.globl	"-[MACHView setBlock_mouseUp:]"
	.p2align	2
"-[MACHView setBlock_mouseUp:]":
	.cfi_startproc
	cbz	x0, LBB27_2
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
Lloh214:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh215:
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
LBB27_2:
	ret
	.loh AdrpLdr	Lloh214, Lloh215
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_scrollWheel:]"
	.globl	"-[MACHView setBlock_scrollWheel:]"
	.p2align	2
"-[MACHView setBlock_scrollWheel:]":
	.cfi_startproc
	cbz	x0, LBB28_2
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
Lloh216:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh217:
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
LBB28_2:
	ret
	.loh AdrpLdr	Lloh216, Lloh217
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_flagsChanged:]"
	.globl	"-[MACHView setBlock_flagsChanged:]"
	.p2align	2
"-[MACHView setBlock_flagsChanged:]":
	.cfi_startproc
	cbz	x0, LBB29_2
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
Lloh218:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh219:
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
LBB29_2:
	ret
	.loh AdrpLdr	Lloh218, Lloh219
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_insertText:]"
	.globl	"-[MACHView setBlock_insertText:]"
	.p2align	2
"-[MACHView setBlock_insertText:]":
	.cfi_startproc
	cbz	x0, LBB30_2
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
Lloh220:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh221:
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
LBB30_2:
	ret
	.loh AdrpLdr	Lloh220, Lloh221
	.cfi_endproc

	.private_extern	"-[MACHView setBlock_magnify:]"
	.globl	"-[MACHView setBlock_magnify:]"
	.p2align	2
"-[MACHView setBlock_magnify:]":
	.cfi_startproc
	cbz	x0, LBB31_2
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
Lloh222:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh223:
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
LBB31_2:
	ret
	.loh AdrpLdr	Lloh222, Lloh223
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
Lloh224:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh225:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB32_2
	ldr	x8, [x0, #16]
	mov	x1, x19
	blr	x8
LBB32_2:
	str	x19, [sp, #8]
Lloh226:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.107@PAGE
Lloh227:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.107@PAGEOFF]
Lloh228:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.109@PAGE
Lloh229:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.109@PAGEOFF]
	add	x2, sp, #8
	mov	w3, #1
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh230:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.111@PAGE
Lloh231:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.111@PAGEOFF]
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
	.loh AdrpLdr	Lloh224, Lloh225
	.loh AdrpLdr	Lloh230, Lloh231
	.loh AdrpLdr	Lloh228, Lloh229
	.loh AdrpAdrp	Lloh226, Lloh228
	.loh AdrpLdr	Lloh226, Lloh227
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
Lloh232:
	adrp	x8, _NSApp@GOTPAGE
Lloh233:
	ldr	x8, [x8, _NSApp@GOTPAGEOFF]
Lloh234:
	ldr	x0, [x8]
Lloh235:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.113@PAGE
Lloh236:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.113@PAGEOFF]
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x21, x0
Lloh237:
	adrp	x8, _OBJC_CLASSLIST_REFERENCES_$_.114@PAGE
Lloh238:
	ldr	x0, [x8, _OBJC_CLASSLIST_REFERENCES_$_.114@PAGEOFF]
Lloh239:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh240:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	bl	_objc_msgSend
	mov	x2, x0
Lloh241:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.116@PAGE
Lloh242:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.116@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	cbz	w0, LBB33_2
Lloh243:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.118@PAGE
Lloh244:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.118@PAGEOFF]
	mov	x0, x19
	bl	_objc_msgSend
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	mov	x22, x0
	b	LBB33_3
LBB33_2:
	mov	x0, x19
	bl	_objc_retain
	mov	x22, x19
LBB33_3:
Lloh245:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.120@PAGE
Lloh246:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.120@PAGEOFF]
	mov	x0, x22
	bl	_objc_msgSend
	stp	xzr, x0, [sp, #32]
	cbz	x0, LBB33_10
Lloh247:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.122@PAGE
Lloh248:
	ldr	x23, [x8, _OBJC_SELECTOR_REFERENCES_.122@PAGEOFF]
	add	x24, sp, #32
	adrp	x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
LBB33_5:
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
	cbz	w0, LBB33_9
	ldr	w2, [sp, #28]
	lsr	w8, w2, #8
	cmp	w8, #247
	b.eq	LBB33_9
	ldrsw	x8, [x25, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	ldr	x0, [x20, x8]
	cbz	x0, LBB33_9
	ldr	x8, [x0, #16]
	mov	x1, x21
	blr	x8
LBB33_9:
	ldr	x0, [sp, #40]
	cbnz	x0, LBB33_5
LBB33_10:
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
	.loh AdrpLdr	Lloh241, Lloh242
	.loh AdrpLdr	Lloh239, Lloh240
	.loh AdrpAdrp	Lloh237, Lloh239
	.loh AdrpLdr	Lloh237, Lloh238
	.loh AdrpLdr	Lloh235, Lloh236
	.loh AdrpLdrGotLdr	Lloh232, Lloh233, Lloh234
	.loh AdrpLdr	Lloh243, Lloh244
	.loh AdrpLdr	Lloh245, Lloh246
	.loh AdrpLdr	Lloh247, Lloh248
	.cfi_endproc

	.p2align	2
"-[MACHView keyUp:]":
	.cfi_startproc
Lloh249:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh250:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB34_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB34_2:
	ret
	.loh AdrpLdr	Lloh249, Lloh250
	.cfi_endproc

	.p2align	2
"-[MACHView flagsChanged:]":
	.cfi_startproc
Lloh251:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh252:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB35_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB35_2:
	ret
	.loh AdrpLdr	Lloh251, Lloh252
	.cfi_endproc

	.p2align	2
"-[MACHView mouseMoved:]":
	.cfi_startproc
Lloh253:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh254:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB36_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB36_2:
	ret
	.loh AdrpLdr	Lloh253, Lloh254
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDragged:]":
	.cfi_startproc
Lloh255:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh256:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB37_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB37_2:
	ret
	.loh AdrpLdr	Lloh255, Lloh256
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDragged:]":
	.cfi_startproc
Lloh257:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh258:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB38_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB38_2:
	ret
	.loh AdrpLdr	Lloh257, Lloh258
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDragged:]":
	.cfi_startproc
Lloh259:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh260:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB39_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB39_2:
	ret
	.loh AdrpLdr	Lloh259, Lloh260
	.cfi_endproc

	.p2align	2
"-[MACHView mouseDown:]":
	.cfi_startproc
Lloh261:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh262:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB40_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB40_2:
	ret
	.loh AdrpLdr	Lloh261, Lloh262
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseDown:]":
	.cfi_startproc
Lloh263:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh264:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB41_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB41_2:
	ret
	.loh AdrpLdr	Lloh263, Lloh264
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseDown:]":
	.cfi_startproc
Lloh265:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh266:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB42_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB42_2:
	ret
	.loh AdrpLdr	Lloh265, Lloh266
	.cfi_endproc

	.p2align	2
"-[MACHView mouseUp:]":
	.cfi_startproc
Lloh267:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh268:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB43_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB43_2:
	ret
	.loh AdrpLdr	Lloh267, Lloh268
	.cfi_endproc

	.p2align	2
"-[MACHView rightMouseUp:]":
	.cfi_startproc
Lloh269:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh270:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB44_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB44_2:
	ret
	.loh AdrpLdr	Lloh269, Lloh270
	.cfi_endproc

	.p2align	2
"-[MACHView otherMouseUp:]":
	.cfi_startproc
Lloh271:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh272:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB45_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB45_2:
	ret
	.loh AdrpLdr	Lloh271, Lloh272
	.cfi_endproc

	.p2align	2
"-[MACHView scrollWheel:]":
	.cfi_startproc
Lloh273:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh274:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB46_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB46_2:
	ret
	.loh AdrpLdr	Lloh273, Lloh274
	.cfi_endproc

	.p2align	2
"-[MACHView magnifyWithEvent:]":
	.cfi_startproc
Lloh275:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh276:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB47_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB47_2:
	ret
	.loh AdrpLdr	Lloh275, Lloh276
	.cfi_endproc

	.p2align	2
"-[MACHView doCommandBySelector:]":
	.cfi_startproc
	ret
	.cfi_endproc

	.p2align	2
"-[MACHView metalLayer]":
	.cfi_startproc
Lloh277:
	adrp	x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGE
Lloh278:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGEOFF]
	ldr	x0, [x0, x8]
	ret
	.loh AdrpLdr	Lloh277, Lloh278
	.cfi_endproc

	.p2align	2
"-[MACHView isPaused]":
	.cfi_startproc
Lloh279:
	adrp	x8, _OBJC_IVAR_$_MACHView._paused@PAGE
Lloh280:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._paused@PAGEOFF]
	ldrb	w0, [x0, x8]
	ret
	.loh AdrpLdr	Lloh279, Lloh280
	.cfi_endproc

	.p2align	2
"-[MACHView setPaused:]":
	.cfi_startproc
Lloh281:
	adrp	x8, _OBJC_IVAR_$_MACHView._paused@PAGE
Lloh282:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._paused@PAGEOFF]
	strb	w2, [x0, x8]
	ret
	.loh AdrpLdr	Lloh281, Lloh282
	.cfi_endproc

	.p2align	2
"-[MACHView delegate]":
	.cfi_startproc
Lloh283:
	adrp	x8, _OBJC_IVAR_$_MACHView._delegate@PAGE
Lloh284:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._delegate@PAGEOFF]
	ldr	x0, [x0, x8]
	ret
	.loh AdrpLdr	Lloh283, Lloh284
	.cfi_endproc

	.p2align	2
"-[MACHView setDelegate:]":
	.cfi_startproc
	mov	x1, x2
Lloh285:
	adrp	x8, _OBJC_IVAR_$_MACHView._delegate@PAGE
Lloh286:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._delegate@PAGEOFF]
	add	x0, x0, x8
	b	_objc_storeStrong
	.loh AdrpLdr	Lloh285, Lloh286
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
Lloh287:
	adrp	x8, _OBJC_IVAR_$_MACHView._delegate@PAGE
Lloh288:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._delegate@PAGEOFF]
	add	x0, x0, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh289:
	adrp	x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGE
Lloh290:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._metalLayer@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh291:
	adrp	x8, _OBJC_IVAR_$_MACHView._renderThread@PAGE
Lloh292:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._renderThread@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh293:
	adrp	x8, _OBJC_IVAR_$_MACHView._displayLink@PAGE
Lloh294:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._displayLink@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh295:
	adrp	x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGE
Lloh296:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView.trackingArea@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh297:
	adrp	x8, _OBJC_IVAR_$_MACHView._render_block@PAGE
Lloh298:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._render_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh299:
	adrp	x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGE
Lloh300:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._insertText_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh301:
	adrp	x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGE
Lloh302:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._magnify_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh303:
	adrp	x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGE
Lloh304:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._scrollWheel_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh305:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGE
Lloh306:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh307:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGE
Lloh308:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseDown_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh309:
	adrp	x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGE
Lloh310:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._mouseMoved_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh311:
	adrp	x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGE
Lloh312:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._flagsChanged_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh313:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh314:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	add	x0, x19, x8
	mov	x1, #0
	bl	_objc_storeStrong
Lloh315:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh316:
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
	.loh AdrpLdr	Lloh315, Lloh316
	.loh AdrpLdr	Lloh313, Lloh314
	.loh AdrpLdr	Lloh311, Lloh312
	.loh AdrpLdr	Lloh309, Lloh310
	.loh AdrpLdr	Lloh307, Lloh308
	.loh AdrpLdr	Lloh305, Lloh306
	.loh AdrpLdr	Lloh303, Lloh304
	.loh AdrpLdr	Lloh301, Lloh302
	.loh AdrpLdr	Lloh299, Lloh300
	.loh AdrpLdr	Lloh297, Lloh298
	.loh AdrpLdr	Lloh295, Lloh296
	.loh AdrpLdr	Lloh293, Lloh294
	.loh AdrpLdr	Lloh291, Lloh292
	.loh AdrpLdr	Lloh289, Lloh290
	.loh AdrpLdr	Lloh287, Lloh288
	.cfi_endproc

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_CAMetalLayer

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_:
	.asciz	"class"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_:
	.quad	l_OBJC_METH_VAR_NAME_

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.1:
	.asciz	"layer"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.2:
	.quad	l_OBJC_METH_VAR_NAME_.1

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.3:
	.asciz	"setWantsLayer:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.4:
	.quad	l_OBJC_METH_VAR_NAME_.3

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.5:
	.asciz	"setLayerContentsRedrawPolicy:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.6:
	.quad	l_OBJC_METH_VAR_NAME_.5

	.private_extern	_OBJC_IVAR_$_MACHView._metalLayer
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._metalLayer
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._metalLayer:
	.long	128

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.7:
	.asciz	"setDelegate:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	l_OBJC_METH_VAR_NAME_.7

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
l_OBJC_METH_VAR_NAME_.9:
	.asciz	"initWithFrame:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.10:
	.quad	l_OBJC_METH_VAR_NAME_.9

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.11:
	.asciz	"initCommon"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.12:
	.quad	l_OBJC_METH_VAR_NAME_.11

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.13:
	.asciz	"visibleRect"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.14:
	.quad	l_OBJC_METH_VAR_NAME_.13

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.15:
	.quad	_OBJC_CLASS_$_NSTrackingArea

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.16:
	.asciz	"initWithRect:options:owner:userInfo:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.17:
	.quad	l_OBJC_METH_VAR_NAME_.16

	.private_extern	_OBJC_IVAR_$_MACHView.trackingArea
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView.trackingArea
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView.trackingArea:
	.long	88

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.18:
	.asciz	"addTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.19:
	.quad	l_OBJC_METH_VAR_NAME_.18

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.20:
	.asciz	"window"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.21:
	.quad	l_OBJC_METH_VAR_NAME_.20

	.private_extern	_OBJC_IVAR_$_MACHView._displayLink
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._displayLink
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._displayLink:
	.long	104

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.22:
	.asciz	"invalidate"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.23:
	.quad	l_OBJC_METH_VAR_NAME_.22

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.24:
	.asciz	"movedToWindow"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.25:
	.quad	l_OBJC_METH_VAR_NAME_.24

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.26:
	.asciz	"setupCAMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.27:
	.quad	l_OBJC_METH_VAR_NAME_.26

	.private_extern	_OBJC_IVAR_$_MACHView._continueRunLoop
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._continueRunLoop
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._continueRunLoop:
	.long	120

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.28:
	.quad	_OBJC_CLASS_$_NSThread

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.29:
	.asciz	"runThread"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.30:
	.quad	l_OBJC_METH_VAR_NAME_.29

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.31:
	.asciz	"initWithTarget:selector:object:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.32:
	.quad	l_OBJC_METH_VAR_NAME_.31

	.private_extern	_OBJC_IVAR_$_MACHView._renderThread
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._renderThread
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._renderThread:
	.long	112

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.33:
	.asciz	"start"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.34:
	.quad	l_OBJC_METH_VAR_NAME_.33

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.35:
	.asciz	"screen"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.36:
	.quad	l_OBJC_METH_VAR_NAME_.35

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.37:
	.asciz	"backingScaleFactor"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.38:
	.quad	l_OBJC_METH_VAR_NAME_.37

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.39:
	.asciz	"resizeDrawable:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.40:
	.quad	l_OBJC_METH_VAR_NAME_.39

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.41:
	.asciz	"bounds"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.42:
	.quad	l_OBJC_METH_VAR_NAME_.41

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.43:
	.asciz	"contentsScale"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.44:
	.quad	l_OBJC_METH_VAR_NAME_.43

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.45:
	.asciz	"delegate"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.46:
	.quad	l_OBJC_METH_VAR_NAME_.45

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.47:
	.asciz	"drawableResize:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.48:
	.quad	l_OBJC_METH_VAR_NAME_.47

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.49:
	.asciz	"stopRenderLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.50:
	.quad	l_OBJC_METH_VAR_NAME_.49

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.51:
	.asciz	"metalLayer"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.52:
	.quad	l_OBJC_METH_VAR_NAME_.51

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.53:
	.asciz	"makeMetalLink:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.54:
	.quad	l_OBJC_METH_VAR_NAME_.53

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.55:
	.quad	_OBJC_CLASS_$_NSNotificationCenter

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.56:
	.asciz	"defaultCenter"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.57:
	.quad	l_OBJC_METH_VAR_NAME_.56

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.58:
	.asciz	"windowWillClose:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.59:
	.quad	l_OBJC_METH_VAR_NAME_.58

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.60:
	.asciz	"addObserver:selector:name:object:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.61:
	.quad	l_OBJC_METH_VAR_NAME_.60

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.62:
	.asciz	"object"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.63:
	.quad	l_OBJC_METH_VAR_NAME_.62

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.64:
	.asciz	"stopMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.65:
	.quad	l_OBJC_METH_VAR_NAME_.64

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.66:
	.quad	_OBJC_CLASS_$_CAMetalDisplayLink

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.67:
	.asciz	"initWithMetalLayer:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.68:
	.quad	l_OBJC_METH_VAR_NAME_.67

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.69:
	.asciz	"setPreferredFrameRateRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.70:
	.quad	l_OBJC_METH_VAR_NAME_.69

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.71:
	.asciz	"setPreferredFrameLatency:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.72:
	.quad	l_OBJC_METH_VAR_NAME_.71

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.73:
	.asciz	"setPaused:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.74:
	.quad	l_OBJC_METH_VAR_NAME_.73

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.75:
	.asciz	"removeTrackingArea:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.76:
	.quad	l_OBJC_METH_VAR_NAME_.75

	.private_extern	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp:
	.long	96

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.77:
	.asciz	"targetPresentationTimestamp"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.78:
	.quad	l_OBJC_METH_VAR_NAME_.77

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.79:
	.asciz	"renderUpdate:with:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.80:
	.quad	l_OBJC_METH_VAR_NAME_.79

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.81:
	.quad	_OBJC_CLASS_$_NSRunLoop

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.82:
	.asciz	"currentRunLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.83:
	.quad	l_OBJC_METH_VAR_NAME_.82

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.84:
	.asciz	"addToRunLoop:forMode:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.85:
	.quad	l_OBJC_METH_VAR_NAME_.84

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.86:
	.asciz	"mainRunLoop"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.87:
	.quad	l_OBJC_METH_VAR_NAME_.86

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.88:
	.asciz	"removeFromRunLoop:forMode:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.89:
	.quad	l_OBJC_METH_VAR_NAME_.88

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.90:
	.asciz	"dealloc"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.91:
	.quad	l_OBJC_METH_VAR_NAME_.90

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.92:
	.asciz	"startMetalLink"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.93:
	.quad	l_OBJC_METH_VAR_NAME_.92

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.94:
	.quad	_OBJC_CLASS_$_NSDate

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.95:
	.asciz	"distantFuture"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.96:
	.quad	l_OBJC_METH_VAR_NAME_.95

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.97:
	.asciz	"runMode:beforeDate:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.98:
	.quad	l_OBJC_METH_VAR_NAME_.97

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.99:
	.asciz	"render"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.100:
	.quad	l_OBJC_METH_VAR_NAME_.99

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.101:
	.asciz	"drawableSize"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.102:
	.quad	l_OBJC_METH_VAR_NAME_.101

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.103:
	.asciz	"setDrawableSize:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.104:
	.quad	l_OBJC_METH_VAR_NAME_.103

	.private_extern	_OBJC_IVAR_$_MACHView._delegate
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._delegate
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._delegate:
	.long	136

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.105:
	.asciz	"renderTo:with:at:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.106:
	.quad	l_OBJC_METH_VAR_NAME_.105

	.private_extern	_OBJC_IVAR_$_MACHView._render_block
	.section	__DATA,__objc_ivar
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
_OBJC_CLASSLIST_REFERENCES_$_.107:
	.quad	_OBJC_CLASS_$_NSArray

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.108:
	.asciz	"arrayWithObjects:count:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.109:
	.quad	l_OBJC_METH_VAR_NAME_.108

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.110:
	.asciz	"interpretKeyEvents:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.111:
	.quad	l_OBJC_METH_VAR_NAME_.110

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.112:
	.asciz	"currentEvent"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.113:
	.quad	l_OBJC_METH_VAR_NAME_.112

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0
_OBJC_CLASSLIST_REFERENCES_$_.114:
	.quad	_OBJC_CLASS_$_NSAttributedString

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.115:
	.asciz	"isKindOfClass:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.116:
	.quad	l_OBJC_METH_VAR_NAME_.115

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.117:
	.asciz	"string"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.118:
	.quad	l_OBJC_METH_VAR_NAME_.117

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.119:
	.asciz	"length"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.120:
	.quad	l_OBJC_METH_VAR_NAME_.119

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.121:
	.asciz	"getBytes:maxLength:usedLength:encoding:options:range:remainingRange:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3, 0x0
_OBJC_SELECTOR_REFERENCES_.122:
	.quad	l_OBJC_METH_VAR_NAME_.121

	.private_extern	_OBJC_IVAR_$_MACHView._paused
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._paused
	.p2align	2, 0x0
_OBJC_IVAR_$_MACHView._paused:
	.long	121

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_:
	.asciz	"MACHView"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.123:
	.asciz	"layerClass"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"#16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_CLASS_METHODS_MACHView:
	.long	24
	.long	1
	.quad	l_OBJC_METH_VAR_NAME_.123
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"+[MACHView layerClass]"

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_.124:
	.asciz	"CALayerDelegate"

l_OBJC_CLASS_NAME_.125:
	.asciz	"NSObject"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.126:
	.asciz	"isEqual:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.127:
	.asciz	"B24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.128:
	.asciz	"self"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.129:
	.asciz	"@16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.130:
	.asciz	"performSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.131:
	.asciz	"@24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.132:
	.asciz	"performSelector:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.133:
	.asciz	"@32@0:8:16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.134:
	.asciz	"performSelector:withObject:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.135:
	.asciz	"@40@0:8:16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.136:
	.asciz	"isProxy"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.137:
	.asciz	"B16@0:8"

l_OBJC_METH_VAR_TYPE_.138:
	.asciz	"B24@0:8#16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.139:
	.asciz	"isMemberOfClass:"

l_OBJC_METH_VAR_NAME_.140:
	.asciz	"conformsToProtocol:"

l_OBJC_METH_VAR_NAME_.141:
	.asciz	"respondsToSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.142:
	.asciz	"B24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.143:
	.asciz	"retain"

l_OBJC_METH_VAR_NAME_.144:
	.asciz	"release"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.145:
	.asciz	"Vv16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.146:
	.asciz	"autorelease"

l_OBJC_METH_VAR_NAME_.147:
	.asciz	"retainCount"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.148:
	.asciz	"Q16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.149:
	.asciz	"zone"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.150:
	.asciz	"^{_NSZone=}16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.151:
	.asciz	"hash"

l_OBJC_METH_VAR_NAME_.152:
	.asciz	"superclass"

l_OBJC_METH_VAR_NAME_.153:
	.asciz	"description"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject:
	.long	24
	.long	19
	.quad	l_OBJC_METH_VAR_NAME_.126
	.quad	l_OBJC_METH_VAR_TYPE_.127
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.128
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.130
	.quad	l_OBJC_METH_VAR_TYPE_.131
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.132
	.quad	l_OBJC_METH_VAR_TYPE_.133
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.134
	.quad	l_OBJC_METH_VAR_TYPE_.135
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.136
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.115
	.quad	l_OBJC_METH_VAR_TYPE_.138
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.139
	.quad	l_OBJC_METH_VAR_TYPE_.138
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.140
	.quad	l_OBJC_METH_VAR_TYPE_.127
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.141
	.quad	l_OBJC_METH_VAR_TYPE_.142
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.143
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.144
	.quad	l_OBJC_METH_VAR_TYPE_.145
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.146
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.147
	.quad	l_OBJC_METH_VAR_TYPE_.148
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.149
	.quad	l_OBJC_METH_VAR_TYPE_.150
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.151
	.quad	l_OBJC_METH_VAR_TYPE_.148
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.152
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.153
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.154:
	.asciz	"debugDescription"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject:
	.long	24
	.long	1
	.quad	l_OBJC_METH_VAR_NAME_.154
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_PROP_NAME_ATTR_:
	.asciz	"hash"

l_OBJC_PROP_NAME_ATTR_.155:
	.asciz	"TQ,R"

l_OBJC_PROP_NAME_ATTR_.156:
	.asciz	"superclass"

l_OBJC_PROP_NAME_ATTR_.157:
	.asciz	"T#,R"

l_OBJC_PROP_NAME_ATTR_.158:
	.asciz	"description"

l_OBJC_PROP_NAME_ATTR_.159:
	.asciz	"T@\"NSString\",R,C"

l_OBJC_PROP_NAME_ATTR_.160:
	.asciz	"debugDescription"

l_OBJC_PROP_NAME_ATTR_.161:
	.asciz	"T@\"NSString\",?,R,C"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROP_LIST_NSObject:
	.long	16
	.long	4
	.quad	l_OBJC_PROP_NAME_ATTR_
	.quad	l_OBJC_PROP_NAME_ATTR_.155
	.quad	l_OBJC_PROP_NAME_ATTR_.156
	.quad	l_OBJC_PROP_NAME_ATTR_.157
	.quad	l_OBJC_PROP_NAME_ATTR_.158
	.quad	l_OBJC_PROP_NAME_ATTR_.159
	.quad	l_OBJC_PROP_NAME_ATTR_.160
	.quad	l_OBJC_PROP_NAME_ATTR_.161

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.162:
	.asciz	"B24@0:8@\"Protocol\"16"

l_OBJC_METH_VAR_TYPE_.163:
	.asciz	"@\"NSString\"16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject:
	.quad	l_OBJC_METH_VAR_TYPE_.127
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	l_OBJC_METH_VAR_TYPE_.131
	.quad	l_OBJC_METH_VAR_TYPE_.133
	.quad	l_OBJC_METH_VAR_TYPE_.135
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	l_OBJC_METH_VAR_TYPE_.138
	.quad	l_OBJC_METH_VAR_TYPE_.138
	.quad	l_OBJC_METH_VAR_TYPE_.162
	.quad	l_OBJC_METH_VAR_TYPE_.142
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	l_OBJC_METH_VAR_TYPE_.145
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	l_OBJC_METH_VAR_TYPE_.148
	.quad	l_OBJC_METH_VAR_TYPE_.150
	.quad	l_OBJC_METH_VAR_TYPE_.148
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	l_OBJC_METH_VAR_TYPE_.163
	.quad	l_OBJC_METH_VAR_TYPE_.163

	.private_extern	__OBJC_PROTOCOL_$_NSObject
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_PROTOCOL_$_NSObject
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_NSObject:
	.quad	0
	.quad	l_OBJC_CLASS_NAME_.125
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
l_OBJC_METH_VAR_NAME_.164:
	.asciz	"displayLayer:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.165:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.166:
	.asciz	"drawLayer:inContext:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.167:
	.asciz	"v32@0:8@16^{CGContext=}24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.168:
	.asciz	"layerWillDraw:"

l_OBJC_METH_VAR_NAME_.169:
	.asciz	"layoutSublayersOfLayer:"

l_OBJC_METH_VAR_NAME_.170:
	.asciz	"actionForLayer:forKey:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.171:
	.asciz	"@32@0:8@16@24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_CALayerDelegate:
	.long	24
	.long	5
	.quad	l_OBJC_METH_VAR_NAME_.164
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.166
	.quad	l_OBJC_METH_VAR_TYPE_.167
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.168
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.169
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.170
	.quad	l_OBJC_METH_VAR_TYPE_.171
	.quad	0

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.172:
	.asciz	"v24@0:8@\"CALayer\"16"

l_OBJC_METH_VAR_TYPE_.173:
	.asciz	"v32@0:8@\"CALayer\"16^{CGContext=}24"

l_OBJC_METH_VAR_TYPE_.174:
	.asciz	"@\"<CAAction>\"32@0:8@\"CALayer\"16@\"NSString\"24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_CALayerDelegate:
	.quad	l_OBJC_METH_VAR_TYPE_.172
	.quad	l_OBJC_METH_VAR_TYPE_.173
	.quad	l_OBJC_METH_VAR_TYPE_.172
	.quad	l_OBJC_METH_VAR_TYPE_.172
	.quad	l_OBJC_METH_VAR_TYPE_.174

	.private_extern	__OBJC_PROTOCOL_$_CALayerDelegate
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_CALayerDelegate
	.weak_definition	__OBJC_PROTOCOL_$_CALayerDelegate
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_CALayerDelegate:
	.quad	0
	.quad	l_OBJC_CLASS_NAME_.124
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
l_OBJC_CLASS_NAME_.175:
	.asciz	"CAMetalDisplayLinkDelegate"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.176:
	.asciz	"metalDisplayLink:needsUpdate:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.177:
	.asciz	"v32@0:8@16@24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_CAMetalDisplayLinkDelegate:
	.long	24
	.long	1
	.quad	l_OBJC_METH_VAR_NAME_.176
	.quad	l_OBJC_METH_VAR_TYPE_.177
	.quad	0

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.178:
	.asciz	"v32@0:8@\"CAMetalDisplayLink\"16@\"CAMetalDisplayLinkUpdate\"24"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_CAMetalDisplayLinkDelegate:
	.quad	l_OBJC_METH_VAR_TYPE_.178

	.private_extern	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.weak_definition	__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_CAMetalDisplayLinkDelegate:
	.quad	0
	.quad	l_OBJC_CLASS_NAME_.175
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
	.quad	l_OBJC_CLASS_NAME_
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
l_OBJC_CLASS_NAME_.179:
	.asciz	"\013\022\022"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.180:
	.asciz	"canBecomeKeyView"

l_OBJC_METH_VAR_NAME_.181:
	.asciz	"acceptsFirstResponder"

l_OBJC_METH_VAR_NAME_.182:
	.asciz	"makeBackingLayer"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.183:
	.asciz	"v16@0:8"

l_OBJC_METH_VAR_TYPE_.184:
	.asciz	"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.185:
	.asciz	"didMoveToWindow"

l_OBJC_METH_VAR_NAME_.186:
	.asciz	"viewDidMoveToWindow"

l_OBJC_METH_VAR_NAME_.187:
	.asciz	"updateTrackingAreas"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.188:
	.asciz	"v24@0:8d16"

l_OBJC_METH_VAR_TYPE_.189:
	.asciz	"v32@0:8@16d24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.190:
	.asciz	"keyDown:"

l_OBJC_METH_VAR_NAME_.191:
	.asciz	"insertText:"

l_OBJC_METH_VAR_NAME_.192:
	.asciz	"keyUp:"

l_OBJC_METH_VAR_NAME_.193:
	.asciz	"flagsChanged:"

l_OBJC_METH_VAR_NAME_.194:
	.asciz	"mouseMoved:"

l_OBJC_METH_VAR_NAME_.195:
	.asciz	"mouseDragged:"

l_OBJC_METH_VAR_NAME_.196:
	.asciz	"rightMouseDragged:"

l_OBJC_METH_VAR_NAME_.197:
	.asciz	"otherMouseDragged:"

l_OBJC_METH_VAR_NAME_.198:
	.asciz	"mouseDown:"

l_OBJC_METH_VAR_NAME_.199:
	.asciz	"rightMouseDown:"

l_OBJC_METH_VAR_NAME_.200:
	.asciz	"otherMouseDown:"

l_OBJC_METH_VAR_NAME_.201:
	.asciz	"mouseUp:"

l_OBJC_METH_VAR_NAME_.202:
	.asciz	"rightMouseUp:"

l_OBJC_METH_VAR_NAME_.203:
	.asciz	"otherMouseUp:"

l_OBJC_METH_VAR_NAME_.204:
	.asciz	"scrollWheel:"

l_OBJC_METH_VAR_NAME_.205:
	.asciz	"magnifyWithEvent:"

l_OBJC_METH_VAR_NAME_.206:
	.asciz	"doCommandBySelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.207:
	.asciz	"v24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.208:
	.asciz	"isPaused"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.209:
	.asciz	"v20@0:8B16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.210:
	.asciz	".cxx_destruct"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	44
	.quad	l_OBJC_METH_VAR_NAME_.180
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	l_OBJC_METH_VAR_NAME_.181
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	l_OBJC_METH_VAR_NAME_.182
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView makeBackingLayer]"
	.quad	l_OBJC_METH_VAR_NAME_.11
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView initCommon]"
	.quad	l_OBJC_METH_VAR_NAME_.9
	.quad	l_OBJC_METH_VAR_TYPE_.184
	.quad	"-[MACHView initWithFrame:]"
	.quad	l_OBJC_METH_VAR_NAME_.185
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView didMoveToWindow]"
	.quad	l_OBJC_METH_VAR_NAME_.186
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView viewDidMoveToWindow]"
	.quad	l_OBJC_METH_VAR_NAME_.24
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView movedToWindow]"
	.quad	l_OBJC_METH_VAR_NAME_.26
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView setupCAMetalLink]"
	.quad	l_OBJC_METH_VAR_NAME_.58
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView windowWillClose:]"
	.quad	l_OBJC_METH_VAR_NAME_.53
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView makeMetalLink:]"
	.quad	l_OBJC_METH_VAR_NAME_.187
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView updateTrackingAreas]"
	.quad	l_OBJC_METH_VAR_NAME_.176
	.quad	l_OBJC_METH_VAR_TYPE_.177
	.quad	"-[MACHView metalDisplayLink:needsUpdate:]"
	.quad	l_OBJC_METH_VAR_NAME_.92
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView startMetalLink]"
	.quad	l_OBJC_METH_VAR_NAME_.64
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView stopMetalLink]"
	.quad	l_OBJC_METH_VAR_NAME_.49
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView stopRenderLoop]"
	.quad	l_OBJC_METH_VAR_NAME_.90
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView dealloc]"
	.quad	l_OBJC_METH_VAR_NAME_.29
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView runThread]"
	.quad	l_OBJC_METH_VAR_NAME_.39
	.quad	l_OBJC_METH_VAR_TYPE_.188
	.quad	"-[MACHView resizeDrawable:]"
	.quad	l_OBJC_METH_VAR_NAME_.79
	.quad	l_OBJC_METH_VAR_TYPE_.189
	.quad	"-[MACHView renderUpdate:with:]"
	.quad	l_OBJC_METH_VAR_NAME_.99
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView render]"
	.quad	l_OBJC_METH_VAR_NAME_.190
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView keyDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.191
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView insertText:]"
	.quad	l_OBJC_METH_VAR_NAME_.192
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView keyUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.193
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView flagsChanged:]"
	.quad	l_OBJC_METH_VAR_NAME_.194
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseMoved:]"
	.quad	l_OBJC_METH_VAR_NAME_.195
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.196
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.197
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseDragged:]"
	.quad	l_OBJC_METH_VAR_NAME_.198
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.199
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.200
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.201
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView mouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.202
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView rightMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.203
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView otherMouseUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.204
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView scrollWheel:]"
	.quad	l_OBJC_METH_VAR_NAME_.205
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView magnifyWithEvent:]"
	.quad	l_OBJC_METH_VAR_NAME_.206
	.quad	l_OBJC_METH_VAR_TYPE_.207
	.quad	"-[MACHView doCommandBySelector:]"
	.quad	l_OBJC_METH_VAR_NAME_.51
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView metalLayer]"
	.quad	l_OBJC_METH_VAR_NAME_.208
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	"-[MACHView isPaused]"
	.quad	l_OBJC_METH_VAR_NAME_.73
	.quad	l_OBJC_METH_VAR_TYPE_.209
	.quad	"-[MACHView setPaused:]"
	.quad	l_OBJC_METH_VAR_NAME_.45
	.quad	l_OBJC_METH_VAR_TYPE_.129
	.quad	"-[MACHView delegate]"
	.quad	l_OBJC_METH_VAR_NAME_.7
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	"-[MACHView setDelegate:]"
	.quad	l_OBJC_METH_VAR_NAME_.210
	.quad	l_OBJC_METH_VAR_TYPE_.183
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.211:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.212:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.213:
	.asciz	"_keyUp_block"

l_OBJC_METH_VAR_NAME_.214:
	.asciz	"_flagsChanged_block"

l_OBJC_METH_VAR_NAME_.215:
	.asciz	"_mouseMoved_block"

l_OBJC_METH_VAR_NAME_.216:
	.asciz	"_mouseDown_block"

l_OBJC_METH_VAR_NAME_.217:
	.asciz	"_mouseUp_block"

l_OBJC_METH_VAR_NAME_.218:
	.asciz	"_scrollWheel_block"

l_OBJC_METH_VAR_NAME_.219:
	.asciz	"_magnify_block"

l_OBJC_METH_VAR_NAME_.220:
	.asciz	"_insertText_block"

l_OBJC_METH_VAR_NAME_.221:
	.asciz	"_render_block"

l_OBJC_METH_VAR_NAME_.222:
	.asciz	"trackingArea"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.223:
	.asciz	"@\"NSTrackingArea\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.224:
	.asciz	"_previousTargetPresentationTimestamp"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.225:
	.asciz	"d"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.226:
	.asciz	"_displayLink"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.227:
	.asciz	"@\"CAMetalDisplayLink\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.228:
	.asciz	"_renderThread"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.229:
	.asciz	"@\"NSThread\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.230:
	.asciz	"_continueRunLoop"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.231:
	.asciz	"B"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.232:
	.asciz	"_paused"

l_OBJC_METH_VAR_NAME_.233:
	.asciz	"_metalLayer"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.234:
	.asciz	"@\"CAMetalLayer\""

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.235:
	.asciz	"_delegate"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.236:
	.asciz	"@\"<GameViewDelegate>\""

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	18
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	l_OBJC_METH_VAR_NAME_.211
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	l_OBJC_METH_VAR_NAME_.213
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._flagsChanged_block
	.quad	l_OBJC_METH_VAR_NAME_.214
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseMoved_block
	.quad	l_OBJC_METH_VAR_NAME_.215
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseDown_block
	.quad	l_OBJC_METH_VAR_NAME_.216
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._mouseUp_block
	.quad	l_OBJC_METH_VAR_NAME_.217
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._scrollWheel_block
	.quad	l_OBJC_METH_VAR_NAME_.218
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._magnify_block
	.quad	l_OBJC_METH_VAR_NAME_.219
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._insertText_block
	.quad	l_OBJC_METH_VAR_NAME_.220
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._render_block
	.quad	l_OBJC_METH_VAR_NAME_.221
	.quad	l_OBJC_METH_VAR_TYPE_.212
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView.trackingArea
	.quad	l_OBJC_METH_VAR_NAME_.222
	.quad	l_OBJC_METH_VAR_TYPE_.223
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._previousTargetPresentationTimestamp
	.quad	l_OBJC_METH_VAR_NAME_.224
	.quad	l_OBJC_METH_VAR_TYPE_.225
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._displayLink
	.quad	l_OBJC_METH_VAR_NAME_.226
	.quad	l_OBJC_METH_VAR_TYPE_.227
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._renderThread
	.quad	l_OBJC_METH_VAR_NAME_.228
	.quad	l_OBJC_METH_VAR_TYPE_.229
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._continueRunLoop
	.quad	l_OBJC_METH_VAR_NAME_.230
	.quad	l_OBJC_METH_VAR_TYPE_.231
	.long	0
	.long	1
	.quad	_OBJC_IVAR_$_MACHView._paused
	.quad	l_OBJC_METH_VAR_NAME_.232
	.quad	l_OBJC_METH_VAR_TYPE_.231
	.long	0
	.long	1
	.quad	_OBJC_IVAR_$_MACHView._metalLayer
	.quad	l_OBJC_METH_VAR_NAME_.233
	.quad	l_OBJC_METH_VAR_TYPE_.234
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._delegate
	.quad	l_OBJC_METH_VAR_NAME_.235
	.quad	l_OBJC_METH_VAR_TYPE_.236
	.long	3
	.long	8

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_PROP_NAME_ATTR_.237:
	.asciz	"metalLayer"

l_OBJC_PROP_NAME_ATTR_.238:
	.asciz	"T@\"CAMetalLayer\",R,N,V_metalLayer"

l_OBJC_PROP_NAME_ATTR_.239:
	.asciz	"paused"

l_OBJC_PROP_NAME_ATTR_.240:
	.asciz	"TB,N,GisPaused,V_paused"

l_OBJC_PROP_NAME_ATTR_.241:
	.asciz	"delegate"

l_OBJC_PROP_NAME_ATTR_.242:
	.asciz	"T@\"<GameViewDelegate>\",&,N,V_delegate"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROP_LIST_MACHView:
	.long	16
	.long	7
	.quad	l_OBJC_PROP_NAME_ATTR_.237
	.quad	l_OBJC_PROP_NAME_ATTR_.238
	.quad	l_OBJC_PROP_NAME_ATTR_.239
	.quad	l_OBJC_PROP_NAME_ATTR_.240
	.quad	l_OBJC_PROP_NAME_ATTR_.241
	.quad	l_OBJC_PROP_NAME_ATTR_.242
	.quad	l_OBJC_PROP_NAME_ATTR_
	.quad	l_OBJC_PROP_NAME_ATTR_.155
	.quad	l_OBJC_PROP_NAME_ATTR_.156
	.quad	l_OBJC_PROP_NAME_ATTR_.157
	.quad	l_OBJC_PROP_NAME_ATTR_.158
	.quad	l_OBJC_PROP_NAME_ATTR_.159
	.quad	l_OBJC_PROP_NAME_ATTR_.160
	.quad	l_OBJC_PROP_NAME_ATTR_.161

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	144
	.space	4
	.quad	l_OBJC_CLASS_NAME_.179
	.quad	l_OBJC_CLASS_NAME_
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

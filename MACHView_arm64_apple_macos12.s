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

	.p2align	2
"-[MACHView keyDown:]":
	.cfi_startproc
Lloh4:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
Lloh5:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB4_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB4_2:
	ret
	.loh AdrpLdr	Lloh4, Lloh5
	.cfi_endproc

	.p2align	2
"-[MACHView keyUp:]":
	.cfi_startproc
Lloh6:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
Lloh7:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	ldr	x0, [x0, x8]
	cbz	x0, LBB5_2
	ldr	x3, [x0, #16]
	mov	x1, x2
	br	x3
LBB5_2:
	ret
	.loh AdrpLdr	Lloh6, Lloh7
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
Lloh8:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGE
	mov	x19, x0
	mov	x1, xzr
Lloh9:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyUp_block@PAGEOFF]
	add	x0, x0, x8
	bl	_objc_storeStrong
Lloh10:
	adrp	x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGE
	ldp	x29, x30, [sp, #16]
Lloh11:
	ldrsw	x8, [x8, _OBJC_IVAR_$_MACHView._keyDown_block@PAGEOFF]
	mov	x1, xzr
	add	x0, x19, x8
	ldp	x20, x19, [sp], #32
	b	_objc_storeStrong
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpLdr	Lloh8, Lloh9
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
l_OBJC_CLASS_NAME_.1:
	.asciz	"\002"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:
	.asciz	"B16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.2:
	.asciz	"acceptsFirstResponder"

l_OBJC_METH_VAR_NAME_.3:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.4:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.5:
	.asciz	"keyUp:"

l_OBJC_METH_VAR_NAME_.6:
	.asciz	".cxx_destruct"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.7:
	.asciz	"v16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	5
	.quad	l_OBJC_METH_VAR_NAME_
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	l_OBJC_METH_VAR_NAME_.2
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	l_OBJC_METH_VAR_NAME_.3
	.quad	l_OBJC_METH_VAR_TYPE_.4
	.quad	"-[MACHView keyDown:]"
	.quad	l_OBJC_METH_VAR_NAME_.5
	.quad	l_OBJC_METH_VAR_TYPE_.4
	.quad	"-[MACHView keyUp:]"
	.quad	l_OBJC_METH_VAR_NAME_.6
	.quad	l_OBJC_METH_VAR_TYPE_.7
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.8:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.9:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.10:
	.asciz	"_keyUp_block"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	2
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	l_OBJC_METH_VAR_NAME_.8
	.quad	l_OBJC_METH_VAR_TYPE_.9
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	l_OBJC_METH_VAR_NAME_.10
	.quad	l_OBJC_METH_VAR_TYPE_.9
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	24
	.space	4
	.quad	l_OBJC_CLASS_NAME_.1
	.quad	l_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_MACHView
	.quad	0
	.quad	__OBJC_$_INSTANCE_VARIABLES_MACHView
	.quad	0
	.quad	0

	.section	__DATA,__objc_data
	.globl	_OBJC_CLASS_$_MACHView
	.p2align	3, 0x0
_OBJC_CLASS_$_MACHView:
	.quad	_OBJC_METACLASS_$_MACHView
	.quad	_OBJC_CLASS_$_NSView
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_CLASS_RO_$_MACHView

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_MACHView

	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols

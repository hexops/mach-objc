	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
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

	.private_extern	"-[MACHView setBlock_keyDown:]"
	.globl	"-[MACHView setBlock_keyDown:]"
"-[MACHView setBlock_keyDown:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB2_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB2_1:
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
	je	LBB3_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rcx
	movq	(%rbx,%rcx), %rdi
	movq	%rax, (%rbx,%rcx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB3_1:
	popq	%rbx
	retq
	.cfi_endproc

"-[MACHView keyDown:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._keyDown_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB4_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB4_1:
	retq
	.cfi_endproc

"-[MACHView keyUp:]":

	.cfi_startproc
	movq	_OBJC_IVAR_$_MACHView._keyUp_block(%rip), %rax
	movq	(%rdi,%rax), %rdi
	testq	%rdi, %rdi
	je	LBB5_1
	movq	16(%rdi), %rax
	movq	%rdx, %rsi
	jmpq	*%rax
LBB5_1:
	retq
	.cfi_endproc

"-[MACHView .cxx_destruct]":

	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
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

	.private_extern	_OBJC_IVAR_$_MACHView._keyDown_block
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHView._keyDown_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._keyDown_block:
	.quad	8

	.private_extern	_OBJC_IVAR_$_MACHView._keyUp_block
	.globl	_OBJC_IVAR_$_MACHView._keyUp_block
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHView._keyUp_block:
	.quad	16

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
L_OBJC_CLASS_NAME_.1:
	.asciz	"\002"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_:
	.asciz	"canBecomeKeyView"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_:
	.asciz	"c16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.2:
	.asciz	"acceptsFirstResponder"

L_OBJC_METH_VAR_NAME_.3:
	.asciz	"keyDown:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.4:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.5:
	.asciz	"keyUp:"

L_OBJC_METH_VAR_NAME_.6:
	.asciz	".cxx_destruct"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.7:
	.asciz	"v16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHView:
	.long	24
	.long	5
	.quad	L_OBJC_METH_VAR_NAME_
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView canBecomeKeyView]"
	.quad	L_OBJC_METH_VAR_NAME_.2
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHView acceptsFirstResponder]"
	.quad	L_OBJC_METH_VAR_NAME_.3
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	"-[MACHView keyDown:]"
	.quad	L_OBJC_METH_VAR_NAME_.5
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	"-[MACHView keyUp:]"
	.quad	L_OBJC_METH_VAR_NAME_.6
	.quad	L_OBJC_METH_VAR_TYPE_.7
	.quad	"-[MACHView .cxx_destruct]"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.8:
	.asciz	"_keyDown_block"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.9:
	.asciz	"@?"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.10:
	.asciz	"_keyUp_block"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHView:
	.long	32
	.long	2
	.quad	_OBJC_IVAR_$_MACHView._keyDown_block
	.quad	L_OBJC_METH_VAR_NAME_.8
	.quad	L_OBJC_METH_VAR_TYPE_.9
	.long	3
	.long	8
	.quad	_OBJC_IVAR_$_MACHView._keyUp_block
	.quad	L_OBJC_METH_VAR_NAME_.10
	.quad	L_OBJC_METH_VAR_TYPE_.9
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHView:
	.long	388
	.long	8
	.long	24
	.space	4
	.quad	L_OBJC_CLASS_NAME_.1
	.quad	L_OBJC_CLASS_NAME_
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

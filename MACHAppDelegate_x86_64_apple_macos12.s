	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.private_extern	"-[MACHAppDelegate setRunBlock:]"
	.globl	"-[MACHAppDelegate setRunBlock:]"
"-[MACHAppDelegate setRunBlock:]":
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	testq	%rdi, %rdi
	je	LBB0_1
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	_objc_retainBlock
	movq	8(%rbx), %rdi
	movq	%rax, 8(%rbx)
	popq	%rbx
	jmpq	*_objc_release@GOTPCREL(%rip)
LBB0_1:
	popq	%rbx
	retq
	.cfi_endproc

"-[MACHAppDelegate applicationDidFinishLaunching:]":

	.cfi_startproc
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB1_1
	jmpq	*16(%rdi)
LBB1_1:
	retq
	.cfi_endproc

"-[MACHAppDelegate applicationShouldTerminate:]":

	.cfi_startproc
	xorl	%eax, %eax
	retq
	.cfi_endproc

"-[MACHAppDelegate applicationShouldTerminateAfterLastWindowClosed:]":

	.cfi_startproc
	movl	$1, %eax
	retq
	.cfi_endproc

"-[MACHAppDelegate .cxx_destruct]":

	.cfi_startproc
	addq	$8, %rdi
	xorl	%esi, %esi
	jmp	_objc_storeStrong
	.cfi_endproc

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_:
	.asciz	"MACHAppDelegate"

L_OBJC_CLASS_NAME_.1:
	.asciz	"NSApplicationDelegate"

L_OBJC_CLASS_NAME_.2:
	.asciz	"NSObject"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_:
	.asciz	"isEqual:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_:
	.asciz	"c24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.3:
	.asciz	"class"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.4:
	.asciz	"#16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.5:
	.asciz	"self"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.6:
	.asciz	"@16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.7:
	.asciz	"performSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.8:
	.asciz	"@24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.9:
	.asciz	"performSelector:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.10:
	.asciz	"@32@0:8:16@24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.11:
	.asciz	"performSelector:withObject:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.12:
	.asciz	"@40@0:8:16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.13:
	.asciz	"isProxy"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.14:
	.asciz	"c16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.15:
	.asciz	"isKindOfClass:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.16:
	.asciz	"c24@0:8#16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.17:
	.asciz	"isMemberOfClass:"

L_OBJC_METH_VAR_NAME_.18:
	.asciz	"conformsToProtocol:"

L_OBJC_METH_VAR_NAME_.19:
	.asciz	"respondsToSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.20:
	.asciz	"c24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.21:
	.asciz	"retain"

L_OBJC_METH_VAR_NAME_.22:
	.asciz	"release"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.23:
	.asciz	"Vv16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.24:
	.asciz	"autorelease"

L_OBJC_METH_VAR_NAME_.25:
	.asciz	"retainCount"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.26:
	.asciz	"Q16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.27:
	.asciz	"zone"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.28:
	.asciz	"^{_NSZone=}16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.29:
	.asciz	"hash"

L_OBJC_METH_VAR_NAME_.30:
	.asciz	"superclass"

L_OBJC_METH_VAR_NAME_.31:
	.asciz	"description"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject:
	.long	24
	.long	19
	.quad	L_OBJC_METH_VAR_NAME_
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.3
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.5
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.7
	.quad	L_OBJC_METH_VAR_TYPE_.8
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.9
	.quad	L_OBJC_METH_VAR_TYPE_.10
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.11
	.quad	L_OBJC_METH_VAR_TYPE_.12
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.13
	.quad	L_OBJC_METH_VAR_TYPE_.14
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.15
	.quad	L_OBJC_METH_VAR_TYPE_.16
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.17
	.quad	L_OBJC_METH_VAR_TYPE_.16
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.18
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.19
	.quad	L_OBJC_METH_VAR_TYPE_.20
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.21
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.22
	.quad	L_OBJC_METH_VAR_TYPE_.23
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.24
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.25
	.quad	L_OBJC_METH_VAR_TYPE_.26
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.27
	.quad	L_OBJC_METH_VAR_TYPE_.28
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.29
	.quad	L_OBJC_METH_VAR_TYPE_.26
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.30
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.31
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.32:
	.asciz	"debugDescription"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject:
	.long	24
	.long	1
	.quad	L_OBJC_METH_VAR_NAME_.32
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_PROP_NAME_ATTR_:
	.asciz	"hash"

L_OBJC_PROP_NAME_ATTR_.33:
	.asciz	"TQ,R"

L_OBJC_PROP_NAME_ATTR_.34:
	.asciz	"superclass"

L_OBJC_PROP_NAME_ATTR_.35:
	.asciz	"T#,R"

L_OBJC_PROP_NAME_ATTR_.36:
	.asciz	"description"

L_OBJC_PROP_NAME_ATTR_.37:
	.asciz	"T@\"NSString\",R,C"

L_OBJC_PROP_NAME_ATTR_.38:
	.asciz	"debugDescription"

L_OBJC_PROP_NAME_ATTR_.39:
	.asciz	"T@\"NSString\",?,R,C"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROP_LIST_NSObject:
	.long	16
	.long	4
	.quad	L_OBJC_PROP_NAME_ATTR_
	.quad	L_OBJC_PROP_NAME_ATTR_.33
	.quad	L_OBJC_PROP_NAME_ATTR_.34
	.quad	L_OBJC_PROP_NAME_ATTR_.35
	.quad	L_OBJC_PROP_NAME_ATTR_.36
	.quad	L_OBJC_PROP_NAME_ATTR_.37
	.quad	L_OBJC_PROP_NAME_ATTR_.38
	.quad	L_OBJC_PROP_NAME_ATTR_.39

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.40:
	.asciz	"c24@0:8@\"Protocol\"16"

L_OBJC_METH_VAR_TYPE_.41:
	.asciz	"@\"NSString\"16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject:
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	L_OBJC_METH_VAR_TYPE_.8
	.quad	L_OBJC_METH_VAR_TYPE_.10
	.quad	L_OBJC_METH_VAR_TYPE_.12
	.quad	L_OBJC_METH_VAR_TYPE_.14
	.quad	L_OBJC_METH_VAR_TYPE_.16
	.quad	L_OBJC_METH_VAR_TYPE_.16
	.quad	L_OBJC_METH_VAR_TYPE_.40
	.quad	L_OBJC_METH_VAR_TYPE_.20
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	L_OBJC_METH_VAR_TYPE_.23
	.quad	L_OBJC_METH_VAR_TYPE_.6
	.quad	L_OBJC_METH_VAR_TYPE_.26
	.quad	L_OBJC_METH_VAR_TYPE_.28
	.quad	L_OBJC_METH_VAR_TYPE_.26
	.quad	L_OBJC_METH_VAR_TYPE_.4
	.quad	L_OBJC_METH_VAR_TYPE_.41
	.quad	L_OBJC_METH_VAR_TYPE_.41

	.private_extern	__OBJC_PROTOCOL_$_NSObject
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_PROTOCOL_$_NSObject
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_NSObject:
	.quad	0
	.quad	L_OBJC_CLASS_NAME_.2
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
__OBJC_$_PROTOCOL_REFS_NSApplicationDelegate:
	.quad	1
	.quad	__OBJC_PROTOCOL_$_NSObject
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.42:
	.asciz	"applicationShouldTerminate:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.43:
	.asciz	"Q24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.44:
	.asciz	"application:openURLs:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.45:
	.asciz	"v32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.46:
	.asciz	"application:openFile:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.47:
	.asciz	"c32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.48:
	.asciz	"application:openFiles:"

L_OBJC_METH_VAR_NAME_.49:
	.asciz	"application:openTempFile:"

L_OBJC_METH_VAR_NAME_.50:
	.asciz	"applicationShouldOpenUntitledFile:"

L_OBJC_METH_VAR_NAME_.51:
	.asciz	"applicationOpenUntitledFile:"

L_OBJC_METH_VAR_NAME_.52:
	.asciz	"application:openFileWithoutUI:"

L_OBJC_METH_VAR_NAME_.53:
	.asciz	"application:printFile:"

L_OBJC_METH_VAR_NAME_.54:
	.asciz	"application:printFiles:withSettings:showPrintPanels:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.55:
	.asciz	"Q44@0:8@16@24@32c40"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.56:
	.asciz	"applicationShouldTerminateAfterLastWindowClosed:"

L_OBJC_METH_VAR_NAME_.57:
	.asciz	"applicationShouldHandleReopen:hasVisibleWindows:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.58:
	.asciz	"c28@0:8@16c24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.59:
	.asciz	"applicationDockMenu:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.60:
	.asciz	"@24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.61:
	.asciz	"application:willPresentError:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.62:
	.asciz	"@32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.63:
	.asciz	"application:didRegisterForRemoteNotificationsWithDeviceToken:"

L_OBJC_METH_VAR_NAME_.64:
	.asciz	"application:didFailToRegisterForRemoteNotificationsWithError:"

L_OBJC_METH_VAR_NAME_.65:
	.asciz	"application:didReceiveRemoteNotification:"

L_OBJC_METH_VAR_NAME_.66:
	.asciz	"applicationSupportsSecureRestorableState:"

L_OBJC_METH_VAR_NAME_.67:
	.asciz	"application:handlerForIntent:"

L_OBJC_METH_VAR_NAME_.68:
	.asciz	"application:willEncodeRestorableState:"

L_OBJC_METH_VAR_NAME_.69:
	.asciz	"application:didDecodeRestorableState:"

L_OBJC_METH_VAR_NAME_.70:
	.asciz	"application:willContinueUserActivityWithType:"

L_OBJC_METH_VAR_NAME_.71:
	.asciz	"application:continueUserActivity:restorationHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.72:
	.asciz	"c40@0:8@16@24@?32"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.73:
	.asciz	"application:didFailToContinueUserActivityWithType:error:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.74:
	.asciz	"v40@0:8@16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.75:
	.asciz	"application:didUpdateUserActivity:"

L_OBJC_METH_VAR_NAME_.76:
	.asciz	"application:userDidAcceptCloudKitShareWithMetadata:"

L_OBJC_METH_VAR_NAME_.77:
	.asciz	"application:delegateHandlesKey:"

L_OBJC_METH_VAR_NAME_.78:
	.asciz	"applicationShouldAutomaticallyLocalizeKeyEquivalents:"

L_OBJC_METH_VAR_NAME_.79:
	.asciz	"applicationWillFinishLaunching:"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.80:
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.81:
	.asciz	"applicationDidFinishLaunching:"

L_OBJC_METH_VAR_NAME_.82:
	.asciz	"applicationWillHide:"

L_OBJC_METH_VAR_NAME_.83:
	.asciz	"applicationDidHide:"

L_OBJC_METH_VAR_NAME_.84:
	.asciz	"applicationWillUnhide:"

L_OBJC_METH_VAR_NAME_.85:
	.asciz	"applicationDidUnhide:"

L_OBJC_METH_VAR_NAME_.86:
	.asciz	"applicationWillBecomeActive:"

L_OBJC_METH_VAR_NAME_.87:
	.asciz	"applicationDidBecomeActive:"

L_OBJC_METH_VAR_NAME_.88:
	.asciz	"applicationWillResignActive:"

L_OBJC_METH_VAR_NAME_.89:
	.asciz	"applicationDidResignActive:"

L_OBJC_METH_VAR_NAME_.90:
	.asciz	"applicationWillUpdate:"

L_OBJC_METH_VAR_NAME_.91:
	.asciz	"applicationDidUpdate:"

L_OBJC_METH_VAR_NAME_.92:
	.asciz	"applicationWillTerminate:"

L_OBJC_METH_VAR_NAME_.93:
	.asciz	"applicationDidChangeScreenParameters:"

L_OBJC_METH_VAR_NAME_.94:
	.asciz	"applicationDidChangeOcclusionState:"

L_OBJC_METH_VAR_NAME_.95:
	.asciz	"applicationProtectedDataWillBecomeUnavailable:"

L_OBJC_METH_VAR_NAME_.96:
	.asciz	"applicationProtectedDataDidBecomeAvailable:"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSApplicationDelegate:
	.long	24
	.long	45
	.quad	L_OBJC_METH_VAR_NAME_.42
	.quad	L_OBJC_METH_VAR_TYPE_.43
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.44
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.46
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.48
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.49
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.50
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.51
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.52
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.53
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.54
	.quad	L_OBJC_METH_VAR_TYPE_.55
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.56
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.57
	.quad	L_OBJC_METH_VAR_TYPE_.58
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.59
	.quad	L_OBJC_METH_VAR_TYPE_.60
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.61
	.quad	L_OBJC_METH_VAR_TYPE_.62
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.63
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.64
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.65
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.66
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.67
	.quad	L_OBJC_METH_VAR_TYPE_.62
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.68
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.69
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.70
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.71
	.quad	L_OBJC_METH_VAR_TYPE_.72
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.73
	.quad	L_OBJC_METH_VAR_TYPE_.74
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.75
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.76
	.quad	L_OBJC_METH_VAR_TYPE_.45
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.77
	.quad	L_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.78
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.79
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.81
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.82
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.83
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.84
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.85
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.86
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.87
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.88
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.89
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.90
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.91
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.92
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.93
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.94
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.95
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	L_OBJC_METH_VAR_NAME_.96
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	0

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.97:
	.asciz	"Q24@0:8@\"NSApplication\"16"

L_OBJC_METH_VAR_TYPE_.98:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSArray\"24"

L_OBJC_METH_VAR_TYPE_.99:
	.asciz	"c32@0:8@\"NSApplication\"16@\"NSString\"24"

L_OBJC_METH_VAR_TYPE_.100:
	.asciz	"c24@0:8@\"NSApplication\"16"

L_OBJC_METH_VAR_TYPE_.101:
	.asciz	"c32@0:8@16@\"NSString\"24"

L_OBJC_METH_VAR_TYPE_.102:
	.asciz	"Q44@0:8@\"NSApplication\"16@\"NSArray\"24@\"NSDictionary\"32c40"

L_OBJC_METH_VAR_TYPE_.103:
	.asciz	"c28@0:8@\"NSApplication\"16c24"

L_OBJC_METH_VAR_TYPE_.104:
	.asciz	"@\"NSMenu\"24@0:8@\"NSApplication\"16"

L_OBJC_METH_VAR_TYPE_.105:
	.asciz	"@\"NSError\"32@0:8@\"NSApplication\"16@\"NSError\"24"

L_OBJC_METH_VAR_TYPE_.106:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSData\"24"

L_OBJC_METH_VAR_TYPE_.107:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSError\"24"

L_OBJC_METH_VAR_TYPE_.108:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSDictionary\"24"

L_OBJC_METH_VAR_TYPE_.109:
	.asciz	"@32@0:8@\"NSApplication\"16@\"INIntent\"24"

L_OBJC_METH_VAR_TYPE_.110:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSCoder\"24"

L_OBJC_METH_VAR_TYPE_.111:
	.asciz	"c40@0:8@\"NSApplication\"16@\"NSUserActivity\"24@?<v@?@\"NSArray\">32"

L_OBJC_METH_VAR_TYPE_.112:
	.asciz	"v40@0:8@\"NSApplication\"16@\"NSString\"24@\"NSError\"32"

L_OBJC_METH_VAR_TYPE_.113:
	.asciz	"v32@0:8@\"NSApplication\"16@\"NSUserActivity\"24"

L_OBJC_METH_VAR_TYPE_.114:
	.asciz	"v32@0:8@\"NSApplication\"16@\"CKShareMetadata\"24"

L_OBJC_METH_VAR_TYPE_.115:
	.asciz	"v24@0:8@\"NSNotification\"16"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_NSApplicationDelegate:
	.quad	L_OBJC_METH_VAR_TYPE_.97
	.quad	L_OBJC_METH_VAR_TYPE_.98
	.quad	L_OBJC_METH_VAR_TYPE_.99
	.quad	L_OBJC_METH_VAR_TYPE_.98
	.quad	L_OBJC_METH_VAR_TYPE_.99
	.quad	L_OBJC_METH_VAR_TYPE_.100
	.quad	L_OBJC_METH_VAR_TYPE_.100
	.quad	L_OBJC_METH_VAR_TYPE_.101
	.quad	L_OBJC_METH_VAR_TYPE_.99
	.quad	L_OBJC_METH_VAR_TYPE_.102
	.quad	L_OBJC_METH_VAR_TYPE_.100
	.quad	L_OBJC_METH_VAR_TYPE_.103
	.quad	L_OBJC_METH_VAR_TYPE_.104
	.quad	L_OBJC_METH_VAR_TYPE_.105
	.quad	L_OBJC_METH_VAR_TYPE_.106
	.quad	L_OBJC_METH_VAR_TYPE_.107
	.quad	L_OBJC_METH_VAR_TYPE_.108
	.quad	L_OBJC_METH_VAR_TYPE_.100
	.quad	L_OBJC_METH_VAR_TYPE_.109
	.quad	L_OBJC_METH_VAR_TYPE_.110
	.quad	L_OBJC_METH_VAR_TYPE_.110
	.quad	L_OBJC_METH_VAR_TYPE_.99
	.quad	L_OBJC_METH_VAR_TYPE_.111
	.quad	L_OBJC_METH_VAR_TYPE_.112
	.quad	L_OBJC_METH_VAR_TYPE_.113
	.quad	L_OBJC_METH_VAR_TYPE_.114
	.quad	L_OBJC_METH_VAR_TYPE_.99
	.quad	L_OBJC_METH_VAR_TYPE_.100
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115
	.quad	L_OBJC_METH_VAR_TYPE_.115

	.private_extern	__OBJC_PROTOCOL_$_NSApplicationDelegate
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_NSApplicationDelegate
	.weak_definition	__OBJC_PROTOCOL_$_NSApplicationDelegate
	.p2align	3, 0x0
__OBJC_PROTOCOL_$_NSApplicationDelegate:
	.quad	0
	.quad	L_OBJC_CLASS_NAME_.1
	.quad	__OBJC_$_PROTOCOL_REFS_NSApplicationDelegate
	.quad	0
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSApplicationDelegate
	.quad	0
	.quad	0
	.long	96
	.long	0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_NSApplicationDelegate
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_NSApplicationDelegate
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_NSApplicationDelegate
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_NSApplicationDelegate
	.p2align	3, 0x0
__OBJC_LABEL_PROTOCOL_$_NSApplicationDelegate:
	.quad	__OBJC_PROTOCOL_$_NSApplicationDelegate

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_CLASS_PROTOCOLS_$_MACHAppDelegate:
	.quad	1
	.quad	__OBJC_PROTOCOL_$_NSApplicationDelegate
	.quad	0

	.p2align	3, 0x0
__OBJC_METACLASS_RO_$_MACHAppDelegate:
	.long	389
	.long	40
	.long	40
	.space	4
	.quad	0
	.quad	L_OBJC_CLASS_NAME_
	.quad	0
	.quad	__OBJC_CLASS_PROTOCOLS_$_MACHAppDelegate
	.quad	0
	.quad	0
	.quad	0

	.section	__DATA,__objc_data
	.globl	_OBJC_METACLASS_$_MACHAppDelegate
	.p2align	3, 0x0
_OBJC_METACLASS_$_MACHAppDelegate:
	.quad	_OBJC_METACLASS_$_NSObject
	.quad	_OBJC_METACLASS_$_NSObject
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_METACLASS_RO_$_MACHAppDelegate

	.section	__TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_.116:
	.asciz	"\001"

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.117:
	.asciz	".cxx_destruct"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.118:
	.asciz	"v16@0:8"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_METHODS_MACHAppDelegate:
	.long	24
	.long	4
	.quad	L_OBJC_METH_VAR_NAME_.81
	.quad	L_OBJC_METH_VAR_TYPE_.80
	.quad	"-[MACHAppDelegate applicationDidFinishLaunching:]"
	.quad	L_OBJC_METH_VAR_NAME_.42
	.quad	L_OBJC_METH_VAR_TYPE_.43
	.quad	"-[MACHAppDelegate applicationShouldTerminate:]"
	.quad	L_OBJC_METH_VAR_NAME_.56
	.quad	L_OBJC_METH_VAR_TYPE_
	.quad	"-[MACHAppDelegate applicationShouldTerminateAfterLastWindowClosed:]"
	.quad	L_OBJC_METH_VAR_NAME_.117
	.quad	L_OBJC_METH_VAR_TYPE_.118
	.quad	"-[MACHAppDelegate .cxx_destruct]"

	.private_extern	_OBJC_IVAR_$_MACHAppDelegate._runBlock
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_MACHAppDelegate._runBlock
	.p2align	3, 0x0
_OBJC_IVAR_$_MACHAppDelegate._runBlock:
	.quad	8

	.section	__TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.119:
	.asciz	"_runBlock"

	.section	__TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.120:
	.asciz	"@?"

	.section	__DATA,__objc_const
	.p2align	3, 0x0
__OBJC_$_INSTANCE_VARIABLES_MACHAppDelegate:
	.long	32
	.long	1
	.quad	_OBJC_IVAR_$_MACHAppDelegate._runBlock
	.quad	L_OBJC_METH_VAR_NAME_.119
	.quad	L_OBJC_METH_VAR_TYPE_.120
	.long	3
	.long	8

	.p2align	3, 0x0
__OBJC_$_PROP_LIST_MACHAppDelegate:
	.long	16
	.long	4
	.quad	L_OBJC_PROP_NAME_ATTR_
	.quad	L_OBJC_PROP_NAME_ATTR_.33
	.quad	L_OBJC_PROP_NAME_ATTR_.34
	.quad	L_OBJC_PROP_NAME_ATTR_.35
	.quad	L_OBJC_PROP_NAME_ATTR_.36
	.quad	L_OBJC_PROP_NAME_ATTR_.37
	.quad	L_OBJC_PROP_NAME_ATTR_.38
	.quad	L_OBJC_PROP_NAME_ATTR_.39

	.p2align	3, 0x0
__OBJC_CLASS_RO_$_MACHAppDelegate:
	.long	388
	.long	8
	.long	16
	.space	4
	.quad	L_OBJC_CLASS_NAME_.116
	.quad	L_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_MACHAppDelegate
	.quad	__OBJC_CLASS_PROTOCOLS_$_MACHAppDelegate
	.quad	__OBJC_$_INSTANCE_VARIABLES_MACHAppDelegate
	.quad	0
	.quad	__OBJC_$_PROP_LIST_MACHAppDelegate

	.section	__DATA,__objc_data
	.globl	_OBJC_CLASS_$_MACHAppDelegate
	.p2align	3, 0x0
_OBJC_CLASS_$_MACHAppDelegate:
	.quad	_OBJC_METACLASS_$_MACHAppDelegate
	.quad	_OBJC_CLASS_$_NSObject
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_CLASS_RO_$_MACHAppDelegate

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3, 0x0
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_MACHAppDelegate

	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_NSApplicationDelegate
	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_NSObject
	.no_dead_strip	__OBJC_PROTOCOL_$_NSApplicationDelegate
	.no_dead_strip	__OBJC_PROTOCOL_$_NSObject
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols

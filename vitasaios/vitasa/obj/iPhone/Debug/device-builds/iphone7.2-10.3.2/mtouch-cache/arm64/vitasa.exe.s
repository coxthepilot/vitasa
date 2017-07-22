.subsections_via_symbols
.section __DWARF, __debug_line,regular,debug
Ldebug_line_section_start:
Ldebug_line_start:
.section __DWARF, __debug_abbrev,regular,debug

	.byte 1,17,1,37,8,3,8,27,8,19,11,17,1,18,1,16,6,0,0,2,46,1,3,8,135,64,8,58,15,59,15,17
	.byte 1,18,1,64,10,0,0,3,5,0,3,8,73,19,2,10,0,0,15,5,0,3,8,73,19,2,6,0,0,4,36,0
	.byte 11,11,62,11,3,8,0,0,5,2,1,3,8,11,15,0,0,17,2,0,3,8,11,15,0,0,6,13,0,3,8,73
	.byte 19,56,10,0,0,7,22,0,3,8,73,19,0,0,8,4,1,3,8,11,15,73,19,0,0,9,40,0,3,8,28,13
	.byte 0,0,10,57,1,3,8,0,0,11,52,0,3,8,73,19,2,10,0,0,12,52,0,3,8,73,19,2,6,0,0,13
	.byte 15,0,73,19,0,0,14,16,0,73,19,0,0,16,28,0,73,19,56,10,0,0,18,46,0,3,8,17,1,18,1,0
	.byte 0,0
.section __DWARF, __debug_info,regular,debug
Ldebug_info_start:

LDIFF_SYM0=Ldebug_info_end - Ldebug_info_begin
	.long LDIFF_SYM0
Ldebug_info_begin:

	.short 2
	.long 0
	.byte 8,1
	.asciz "Mono AOT Compiler 5.0.1 (tarball Mon May 22 16:16:38 EDT 2017)"
	.asciz "vitasa.exe"
	.asciz ""

	.byte 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
LDIFF_SYM1=Ldebug_line_start - Ldebug_line_section_start
	.long LDIFF_SYM1
LDIE_I1:

	.byte 4,1,5
	.asciz "sbyte"
LDIE_U1:

	.byte 4,1,7
	.asciz "byte"
LDIE_I2:

	.byte 4,2,5
	.asciz "short"
LDIE_U2:

	.byte 4,2,7
	.asciz "ushort"
LDIE_I4:

	.byte 4,4,5
	.asciz "int"
LDIE_U4:

	.byte 4,4,7
	.asciz "uint"
LDIE_I8:

	.byte 4,8,5
	.asciz "long"
LDIE_U8:

	.byte 4,8,7
	.asciz "ulong"
LDIE_I:

	.byte 4,8,5
	.asciz "intptr"
LDIE_U:

	.byte 4,8,7
	.asciz "uintptr"
LDIE_R4:

	.byte 4,4,4
	.asciz "float"
LDIE_R8:

	.byte 4,8,4
	.asciz "double"
LDIE_BOOLEAN:

	.byte 4,1,2
	.asciz "boolean"
LDIE_CHAR:

	.byte 4,2,8
	.asciz "char"
LDIE_STRING:

	.byte 4,8,1
	.asciz "string"
LDIE_OBJECT:

	.byte 4,8,1
	.asciz "object"
LDIE_SZARRAY:

	.byte 4,8,1
	.asciz "object"
.section __DWARF, __debug_loc,regular,debug
Ldebug_loc_start:
.section __DWARF, __debug_frame,regular,debug
	.align 3

LDIFF_SYM2=Lcie0_end - Lcie0_start
	.long LDIFF_SYM2
Lcie0_start:

	.long -1
	.byte 3
	.asciz ""

	.byte 1,120,30
	.align 3
Lcie0_end:
.text
	.align 3
jit_code_start:

	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.text
	.align 4
	.no_dead_strip vitasa_Application_Main_string__
vitasa_Application_Main_string__:
.file 1 "/Users/Billy/Projects/vitasa/vitasa/Main.cs"
.loc 1 9 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #208]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 1 12 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xd2800001

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #216]
.word 0xd2800001
bl _p_1
.word 0xf9400fb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.loc 1 13 0
.word 0xf9400fb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_0:
.text
	.align 4
	.no_dead_strip vitasa_Application__ctor
vitasa_Application__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #224]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_1:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_get_Window
vitasa_AppDelegate_get_Window:
.file 2 "/Users/Billy/Projects/vitasa/vitasa/AppDelegate.cs"
.loc 2 15 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #232]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9401400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_2:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_set_Window_UIKit_UIWindow
vitasa_AppDelegate_set_Window_UIKit_UIWindow:
.loc 2 16 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #240]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9001401
.word 0x9100a000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_3:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary
vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary:
.loc 2 20 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #248]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd280001a
.word 0xf9401bb1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.loc 2 24 0
.word 0xf9401bb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xd280003a
.loc 2 25 0
.word 0xf9401bb1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020
.word 0xd2800020
.word 0xf9401bb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_4:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication
vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication:
.loc 2 28 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #256]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.loc 2 33 0
.word 0xf94013b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_5:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication
vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication:
.loc 2 36 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #264]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.loc 2 39 0
.word 0xf94013b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_6:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication
vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication:
.loc 2 42 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #272]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.loc 2 45 0
.word 0xf94013b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_7:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_OnActivated_UIKit_UIApplication
vitasa_AppDelegate_OnActivated_UIKit_UIApplication:
.loc 2 48 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #280]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.loc 2 51 0
.word 0xf94013b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_8:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate_WillTerminate_UIKit_UIApplication
vitasa_AppDelegate_WillTerminate_UIKit_UIApplication:
.loc 2 54 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #288]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.loc 2 56 0
.word 0xf94013b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_9:
.text
	.align 4
	.no_dead_strip vitasa_AppDelegate__ctor
vitasa_AppDelegate__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #296]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_3
.word 0xf9400fb1
.word 0xf9404a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_a:
.text
	.align 4
	.no_dead_strip vitasa_ViewController__ctor_intptr
vitasa_ViewController__ctor_intptr:
.file 3 "/Users/Billy/Projects/vitasa/vitasa/ViewController.cs"
.loc 3 11 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #304]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_4
.word 0xf94013b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.loc 3 12 0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.loc 3 14 0
.word 0xf94013b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_ViewDidLoad
vitasa_ViewController_ViewDidLoad:
.loc 3 17 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #312]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xd2800019
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.loc 3 18 0
.word 0xf94013b1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_5
.word 0xf94013b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.loc 3 23 0
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_6
.word 0xf90027a0
.word 0xf94013b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #320]
bl _p_7
.word 0xf90023a0
.word 0xf94013b1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xf94027a2
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418450
.word 0xd63f0200
.word 0xf94013b1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.loc 3 25 0
.word 0xf94013b1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000300
.loc 3 26 0
.word 0xf94013b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xd2800501
.word 0xd2800501
bl _p_8
.word 0xf90027a0
bl _p_9
.word 0xf94013b1
.word 0xf9417631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xf90023a0
.word 0xf9001b40
.word 0x9100c340
bl _p_2
.word 0xf94023a0
.loc 3 27 0
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_c:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_DidReceiveMemoryWarning
vitasa_ViewController_DidReceiveMemoryWarning:
.loc 3 30 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #336]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 3 31 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_10
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 3 33 0
.word 0xf9400fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_d:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
.loc 3 36 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023b9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xf90027a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #344]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf90037bf
.word 0xf9402bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.loc 3 37 0
.word 0xf9402bb1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1903e0
.word 0xf94027a2
.word 0xaa1803e0
.word 0xaa1903e1
bl _p_11
.word 0xf9402bb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.loc 3 39 0
.word 0xf9402bb1
.word 0xf940ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9004fa0
.word 0xf9402bb1
.word 0xf940f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #352]
bl _p_12
.word 0x53001c00
.word 0xf9004ba0
.word 0xf9402bb1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404ba0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000660
.loc 3 40 0
.word 0xf9402bb1
.word 0xf9413e31
.word 0xb4000051
.word 0xd63f0220
.loc 3 41 0
.word 0xf9402bb1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xf90043a0
.word 0xf9402bb1
.word 0xf9417631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xb4000180
.word 0xf94043a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #360]
.word 0xeb01001f
.word 0x10000011
.word 0x54001881
.word 0xf94043a0
.word 0xaa0003f6
.loc 3 42 0
.word 0xf9402bb1
.word 0xf941c231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xaa1803e0
.word 0xf9401b00
.word 0xf9004ba0
.word 0xf9001ac0
.word 0x9100c2c0
bl _p_2
.word 0xf9404ba0
.loc 3 43 0
.word 0xf9402bb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0x1400009e
.loc 3 44 0
.word 0xf9402bb1
.word 0xf9420631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9004fa0
.word 0xf9402bb1
.word 0xf9422e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #368]
bl _p_12
.word 0x53001c00
.word 0xf9004ba0
.word 0xf9402bb1
.word 0xf9425a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404ba0
.word 0xaa0003f5
.word 0xaa0003e1
.word 0x34000660
.loc 3 45 0
.word 0xf9402bb1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
.loc 3 46 0
.word 0xf9402bb1
.word 0xf9428a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402bb1
.word 0xf942b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xb4000180
.word 0xf9403fa0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #376]
.word 0xeb01001f
.word 0x10000011
.word 0x54000ea1
.word 0xf9403fa0
.word 0xaa0003f4
.loc 3 47 0
.word 0xf9402bb1
.word 0xf942fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1403e0
.word 0xaa1803e0
.word 0xf9401b00
.word 0xf9004ba0
.word 0xf9001a80
.word 0x9100c280
bl _p_2
.word 0xf9404ba0
.loc 3 48 0
.word 0xf9402bb1
.word 0xf9432e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400004f
.loc 3 49 0
.word 0xf9402bb1
.word 0xf9434231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9004fa0
.word 0xf9402bb1
.word 0xf9436a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #384]
bl _p_12
.word 0x53001c00
.word 0xf9004ba0
.word 0xf9402bb1
.word 0xf9439631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404ba0
.word 0xaa0003f3
.word 0xaa0003e1
.word 0x34000640
.loc 3 50 0
.word 0xf9402bb1
.word 0xf943b631
.word 0xb4000051
.word 0xd63f0220
.loc 3 51 0
.word 0xf9402bb1
.word 0xf943c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf943ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xb4000180
.word 0xf9403ba0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x540004c1
.word 0xf9403ba0
.word 0xf90037a0
.loc 3 52 0
.word 0xf9402bb1
.word 0xf9443a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xaa1803e1
.word 0xf9401b01
.word 0xf9004ba1
.word 0xf9001801
.word 0x9100c000
bl _p_2
.word 0xf9404ba0
.loc 3 53 0
.word 0xf9402bb1
.word 0xf9446a31
.word 0xb4000051
.word 0xd63f0220
.loc 3 54 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9448a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9449a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023b9
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_e:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_get_B_GettingReady
vitasa_ViewController_get_B_GettingReady:
.file 4 "/Users/Billy/Projects/vitasa/vitasa/ViewController.designer.cs"
.loc 4 18 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #400]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9401c00
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_f:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_set_B_GettingReady_UIKit_UIButton
vitasa_ViewController_set_B_GettingReady_UIKit_UIButton:
.loc 4 18 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #408]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_10:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_get_B_ViewAsList
vitasa_ViewController_get_B_ViewAsList:
.loc 4 22 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #416]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_11:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton
vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton:
.loc 4 22 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #424]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_12:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_get_B_ViewOnMap
vitasa_ViewController_get_B_ViewOnMap:
.loc 4 26 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #432]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_13:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton
vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton:
.loc 4 26 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #440]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002401
.word 0x91012000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_14:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_get_I_Background
vitasa_ViewController_get_I_Background:
.loc 4 30 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #448]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402800
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_15:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_set_I_Background_UIKit_UIImageView
vitasa_ViewController_set_I_Background_UIKit_UIImageView:
.loc 4 30 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #456]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002801
.word 0x91014000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_16:
.text
	.align 4
	.no_dead_strip vitasa_ViewController_ReleaseDesignerOutlets
vitasa_ViewController_ReleaseDesignerOutlets:
.loc 4 33 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #464]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xf9401fb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 34 0
.word 0xf9401fb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_14
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000540
.word 0xf9401fb1
.word 0xf940ca31
.word 0xb4000051
.word 0xd63f0220
.loc 4 35 0
.word 0xf9401fb1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_14
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf940fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9401fb1
.word 0xf9411a31
.word 0xb4000051
.word 0xd63f0220
.loc 4 36 0
.word 0xf9401fb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_16
.word 0xf9401fb1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 37 0
.word 0xf9401fb1
.word 0xf9415e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 39 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9417e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_17
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf9419e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000540
.word 0xf9401fb1
.word 0xf941ca31
.word 0xb4000051
.word 0xd63f0220
.loc 4 40 0
.word 0xf9401fb1
.word 0xf941da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_17
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf941fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9401fb1
.word 0xf9421a31
.word 0xb4000051
.word 0xd63f0220
.loc 4 41 0
.word 0xf9401fb1
.word 0xf9422a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_18
.word 0xf9401fb1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 42 0
.word 0xf9401fb1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 44 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9427e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_19
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf9429e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0x34000540
.word 0xf9401fb1
.word 0xf942ca31
.word 0xb4000051
.word 0xd63f0220
.loc 4 45 0
.word 0xf9401fb1
.word 0xf942da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_19
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf942fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9401fb1
.word 0xf9431a31
.word 0xb4000051
.word 0xd63f0220
.loc 4 46 0
.word 0xf9401fb1
.word 0xf9432a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_20
.word 0xf9401fb1
.word 0xf9434e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 47 0
.word 0xf9401fb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 49 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9437e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_6
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf9439e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f6
.word 0xaa1603e0
.word 0x34000540
.word 0xf9401fb1
.word 0xf943ca31
.word 0xb4000051
.word 0xd63f0220
.loc 4 50 0
.word 0xf9401fb1
.word 0xf943da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_6
.word 0xf9002ba0
.word 0xf9401fb1
.word 0xf943fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9401fb1
.word 0xf9441a31
.word 0xb4000051
.word 0xd63f0220
.loc 4 51 0
.word 0xf9401fb1
.word 0xf9442a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_21
.word 0xf9401fb1
.word 0xf9444e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 52 0
.word 0xf9401fb1
.word 0xf9445e31
.word 0xb4000051
.word 0xd63f0220
.loc 4 53 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9447e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9448e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_17:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList__ctor_intptr
vitasa_VC_SitesList__ctor_intptr:
.file 5 "/Users/Billy/Projects/vitasa/vitasa/VC_SitesList.cs"
.loc 5 14 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #472]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9001f3f
.loc 5 16 0
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400fa1
.word 0xaa1903e0
bl _p_4
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 5 17 0
.word 0xf94013b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.loc 5 18 0
.word 0xf94013b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_18:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_ViewDidLoad
vitasa_VC_SitesList_ViewDidLoad:
.loc 5 21 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #480]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xd2800018
.word 0x910183a0
.word 0xf90033bf
.word 0xd2800017
.word 0xf9401bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 22 0
.word 0xf9401bb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_5
.word 0xf9401bb1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.loc 5 25 0
.word 0xf9401bb1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000300
.loc 5 26 0
.word 0xf9401bb1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xd2800501
.word 0xd2800501
bl _p_8
.word 0xf9003fa0
bl _p_9
.word 0xf9401bb1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xf9003ba0
.word 0xf9001b40
.word 0x9100c340
bl _p_2
.word 0xf9403ba0
.loc 5 29 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf90047a0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #488]
bl _p_22
.word 0xf94047a1
.word 0xf90043a0
.word 0xaa1a03e2
bl _p_23
.word 0xf9401bb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9003fa0
.word 0xf9001f40
.word 0x9100e340
bl _p_2
.word 0xf9403fa0
.loc 5 32 0
.word 0xf9401bb1
.word 0xf941b231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_24
.word 0xf9003ba0
.word 0xf9401bb1
.word 0xf941d231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba2
.word 0xaa1a03e0
.word 0xf9401f41
.word 0xaa0203e0
.word 0xf940005e
bl _p_25
.word 0xf9401bb1
.word 0xf941fa31
.word 0xb4000051
.word 0xd63f0220
.loc 5 35 0
.word 0xf9401bb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400800
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000ce0
.loc 5 36 0
.word 0xf9401bb1
.word 0xf9423e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 39 0
.word 0xf9401bb1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.word 0x910163a0
.word 0xf90037a0
bl _p_26
.word 0xf94037be
.word 0xf90003c0
.word 0xf9401bb1
.word 0xf9427231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0x91008000
.word 0x910123a1
.word 0xf9400000
.word 0xf90027a0
.word 0x910143a0
.word 0xf90037a0
.word 0x910163a0
.word 0xf9402fa0
.word 0x910123a1
.word 0xf94027a1
bl _p_27
.word 0xf94037be
.word 0xf90003c0
.word 0xf9401bb1
.word 0xf942be31
.word 0xb4000051
.word 0xd63f0220
.word 0x910143a0
.word 0x910183a0
.word 0xf9402ba0
.word 0xf90033a0
.loc 5 40 0
.word 0xf9401bb1
.word 0xf942de31
.word 0xb4000051
.word 0xd63f0220
.word 0x910183a0
bl _p_28
.word 0xfd004ba0
.word 0xf9401bb1
.word 0xf942fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xfd404ba0
.word 0xd280001e
.word 0xf2e809de
.word 0x9e6703c1
.word 0x1e612000
.word 0x9a9fd7e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0x340001a0
.loc 5 41 0
.word 0xf9401bb1
.word 0xf9432e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_29
.word 0xf9401bb1
.word 0xf9434a31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000016
.loc 5 44 0
.word 0xf9401bb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_24
.word 0xf9003ba0
.word 0xf9401bb1
.word 0xf9437e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9419430
.word 0xd63f0200
.word 0xf9401bb1
.word 0xf943a231
.word 0xb4000051
.word 0xd63f0220
.loc 5 45 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf943c231
.word 0xb4000051
.word 0xd63f0220
.word 0x1400000c
.loc 5 47 0
.word 0xf9401bb1
.word 0xf943d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_29
.word 0xf9401bb1
.word 0xf943f231
.word 0xb4000051
.word 0xd63f0220
.loc 5 48 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9441231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9442231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_19:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_LoadSitesFromWebService
vitasa_VC_SitesList_LoadSitesFromWebService:
.loc 5 51 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #496]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 5 54 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf90023a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000600

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #504]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf94023a1
.word 0xf9001fa1
.word 0xf9001001
.word 0xf9001ba0
.word 0x91008000
bl _p_2
.word 0xf9401ba0
.word 0xf9401fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #512]
.word 0xf9001401

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #520]
.word 0xf9002001

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #528]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0xd2800001
.word 0x3901801f
bl _p_30
.word 0xf9400fb1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.loc 5 72 0
.word 0xf9400fb1
.word 0xf9411631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_1a:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite
vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite:
.loc 5 75 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fa0
.word 0xf90013a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #536]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800018
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 76 0
.word 0xf94017b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xf9400802
.word 0xf94013a0
.word 0xf9400801
.word 0xaa0203e0
.word 0xf940005e
bl _p_31
.word 0x93407c00
.word 0xf90027a0
.word 0xf94017b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xf90023a0
.word 0xaa0003f8
.loc 5 77 0
.word 0xf94017b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xaa0003e1
.word 0xf94017b1
.word 0xf940d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_1b:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
.loc 5 127 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023b9
.word 0xf90027a0
.word 0xaa0103f9
.word 0xf9002ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #544]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402fb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 5 128 0
.word 0xf9402fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xaa1903e1
.word 0xf9402ba2
.word 0xaa1903e1
bl _p_11
.word 0xf9402fb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.loc 5 130 0
.word 0xf9402fb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #552]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000720
.loc 5 131 0
.word 0xf9402fb1
.word 0xf9413231
.word 0xb4000051
.word 0xd63f0220
.loc 5 132 0
.word 0xf9402fb1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f8
.word 0xf9402fb1
.word 0xf9416a31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #560]
.word 0xeb01001f
.word 0x10000011
.word 0x54000f61
.word 0xaa1803e0
.word 0xaa1803f6
.loc 5 133 0
.word 0xf9402fb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001b00
.word 0x9100c300
bl _p_2
.word 0xf9403ba0
.loc 5 134 0
.word 0xf9402fb1
.word 0xf941de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800020
.word 0xd280003e
.word 0x3901c31e
.loc 5 135 0
.word 0xf9402fb1
.word 0xf941fe31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400004d
.loc 5 136 0
.word 0xf9402fb1
.word 0xf9421231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #568]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9426631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f5
.word 0xaa0003e1
.word 0x34000600
.loc 5 137 0
.word 0xf9402fb1
.word 0xf9428631
.word 0xb4000051
.word 0xd63f0220
.loc 5 138 0
.word 0xf9402fb1
.word 0xf9429631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f3
.word 0xf9402fb1
.word 0xf942be31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000173
.word 0xf9400260
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x10000011
.word 0x540004c1
.word 0xaa1303e0
.word 0xaa1303f4
.loc 5 139 0
.word 0xf9402fb1
.word 0xf9430231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1303e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001a60
.word 0x9100c260
bl _p_2
.word 0xf9403ba0
.loc 5 140 0
.word 0xf9402fb1
.word 0xf9433231
.word 0xb4000051
.word 0xd63f0220
.loc 5 141 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9435231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9436231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023b9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_1c:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_get_B_Back
vitasa_VC_SitesList_get_B_Back:
.file 6 "/Users/Billy/Projects/vitasa/vitasa/VC_SitesList.designer.cs"
.loc 6 19 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #584]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_1d:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_set_B_Back_UIKit_UIButton
vitasa_VC_SitesList_set_B_Back_UIKit_UIButton:
.loc 6 19 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #592]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_1e:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_get_TV_SitesList
vitasa_VC_SitesList_get_TV_SitesList:
.loc 6 23 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #600]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_1f:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView
vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView:
.loc 6 23 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #608]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002401
.word 0x91012000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_20:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_ReleaseDesignerOutlets
vitasa_VC_SitesList_ReleaseDesignerOutlets:
.loc 6 26 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #616]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800019
.word 0xd2800018
.word 0xf94017b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.loc 6 27 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_32
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000540
.word 0xf94017b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.loc 6 28 0
.word 0xf94017b1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_32
.word 0xf90023a0
.word 0xf94017b1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.loc 6 29 0
.word 0xf94017b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_33
.word 0xf94017b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.loc 6 30 0
.word 0xf94017b1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.loc 6 32 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9417231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_24
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000540
.word 0xf94017b1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.loc 6 33 0
.word 0xf94017b1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_24
.word 0xf90023a0
.word 0xf94017b1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.loc 6 34 0
.word 0xf94017b1
.word 0xf9421e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_34
.word 0xf94017b1
.word 0xf9424231
.word 0xb4000051
.word 0xd63f0220
.loc 6 35 0
.word 0xf94017b1
.word 0xf9425231
.word 0xb4000051
.word 0xd63f0220
.loc 6 36 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9427231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9428231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_21:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0
vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0:
.word 0xa9b37bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #624]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9003fbf
.word 0x910183a0
.word 0xd2800000
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9400fb1
.word 0xf9404a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf90063a0
bl _p_35
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xf9003fa0
.word 0xf9403fa0
.word 0xf9400ba1
.word 0xf9005fa1
.word 0xf9001401
.word 0x9100a000
bl _p_2
.word 0xf9405fa0
.word 0xf9403fa0
.word 0xf9005ba0
.word 0x910123a0
.word 0xaa0003e8
bl _p_36
.word 0xf9400fb1
.word 0xf940c231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x910123a1
.word 0x91004001
.word 0xaa0103e0
.word 0xf94027a2
.word 0xf90057a2
.word 0xf9000022
.word 0xf90053a0
bl _p_2
.word 0xf94053a0
.word 0xf94057a1
.word 0x91002000
.word 0xf9402ba1
.word 0xf9004fa1
.word 0xf9000001
.word 0xf9004ba0
bl _p_2
.word 0xf9404ba0
.word 0xf9404fa1
.word 0x91002000
.word 0xf9402fa1
.word 0xf90047a1
.word 0xf9000001
bl _p_2
.word 0xf94047a0
.word 0xf9403fa0
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9403fa0
.word 0x91004000
.word 0x9100c3a1
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400401
.word 0xf9001fa1
.word 0xf9400800
.word 0xf90023a0
.word 0x9100c3a0
.word 0x910183a0
.word 0xf9401ba0
.word 0xf90033a0
.word 0xf9401fa0
.word 0xf90037a0
.word 0xf94023a0
.word 0xf9003ba0
.word 0x910183a0
.word 0x9101e3a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #640]
bl _p_37
.word 0xf9400fb1
.word 0xf941aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000200
.word 0x91004000
bl _p_38
.word 0xf90043a0
.word 0xf9400fb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9400fb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8cd7bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13

Lme_22:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1
vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1:
.loc 5 68 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #648]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 5 69 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_24
.word 0xf9001ba0
.word 0xf9400fb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9419430
.word 0xd63f0200
.word 0xf9400fb1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.loc 5 70 0
.word 0xf9400fb1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf940c231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_23:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap__ctor_intptr
vitasa_VC_SitesMap__ctor_intptr:
.file 7 "/Users/Billy/Projects/vitasa/vitasa/VC_SitesMap.cs"
.loc 7 16 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #656]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9001f3f
.loc 7 18 0
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400fa1
.word 0xaa1903e0
bl _p_4
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 7 19 0
.word 0xf94013b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.loc 7 20 0
.word 0xf94013b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_24:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_ViewDidLoad
vitasa_VC_SitesMap_ViewDidLoad:
.loc 7 23 0 prologue_end
.word 0xa9a87bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xf90013b7
.word 0xa902ebb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #664]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd2800019
.word 0xf90093bf
.word 0x910443a0
.word 0xd2800000
.word 0xf9008ba0
.word 0xf9008fa0
.word 0x9103c3a0
.word 0xd2800000
.word 0xf9007ba0
.word 0xf9007fa0
.word 0xf90083a0
.word 0xf90087a0
.word 0xd2800017
.word 0xd2800016
.word 0x9103a3a0
.word 0xf90077bf
.word 0xd2800015
.word 0xf9401fb1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.loc 7 24 0
.word 0xf9401fb1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_5
.word 0xf9401fb1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.loc 7 26 0
.word 0xf9401fb1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf900bba0
.word 0xf9401fb1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940bba2
.word 0xd2800000
.word 0xaa0203e0
.word 0xd2800001
.word 0xf9400042
.word 0xf9419450
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 27 0
.word 0xf9401fb1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf900b7a0
.word 0xf9401fb1
.word 0xf9415a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b7a2
.word 0xd2800240
.word 0xaa0203e0
.word 0xd2800241
.word 0xf9400042
.word 0xf9415050
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf9418631
.word 0xb4000051
.word 0xd63f0220
.loc 7 28 0
.word 0xf9401fb1
.word 0xf9419631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf900b3a0
.word 0xf9401fb1
.word 0xf941b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b3a2
.word 0xd2800020
.word 0xaa0203e0
.word 0xd2800021
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf941e231
.word 0xb4000051
.word 0xd63f0220
.loc 7 29 0
.word 0xf9401fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf900aba0
.word 0xf9401fb1
.word 0xf9421231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9410c30
.word 0xd63f0200
.word 0xf900afa0
.word 0xf9401fb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940afa1
.word 0x910323a0
.word 0xf90097a0
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9414c30
.word 0xd63f0200
.word 0xf94097be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0xf9401fb1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940aba1
.word 0xaa0103e0
.word 0x910323a2
.word 0xfd4067a0
.word 0xfd406ba1
.word 0xfd406fa2
.word 0xfd4073a3
.word 0xf9400021
.word 0xf9414830
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf942b231
.word 0xb4000051
.word 0xd63f0220
.loc 7 31 0
.word 0xf9401fb1
.word 0xf942c231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #672]
bl _p_22
.word 0xf900a7a0
bl _p_40
.word 0xf9401fb1
.word 0xf942ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940a7a0
.word 0xaa0003f9
.loc 7 32 0
.word 0xf9401fb1
.word 0xf9430231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf9432631
.word 0xb4000051
.word 0xd63f0220
.loc 7 33 0
.word 0xf9401fb1
.word 0xf9433631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e1
.word 0xaa0103e0
.word 0xf9400021
.word 0xf940d030
.word 0xd63f0200
.word 0xf900a3a0
.word 0xf9401fb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940a3a0
.word 0xf90093a0
.loc 7 38 0
.word 0xf9401fb1
.word 0xf9437631
.word 0xb4000051
.word 0xd63f0220
.word 0x910443a0
.word 0xd2852afe
.word 0xf2b1931e
.word 0xf2cd77de
.word 0xf2e807be
.word 0x9e6703c0
.word 0xd28b083e
.word 0xf2b65afe
.word 0xf2d3c8de
.word 0xf2f80b1e
.word 0x9e6703c0
.word 0xd2852afe
.word 0xf2b1931e
.word 0xf2cd77de
.word 0xf2e807be
.word 0x9e6703c0
.word 0xd28b083e
.word 0xf2b65afe
.word 0xf2d3c8de
.word 0xf2f80b1e
.word 0x9e6703c1
bl _p_41
.loc 7 40 0
.word 0xf9401fb1
.word 0xf943de31
.word 0xb4000051
.word 0xd63f0220
.word 0x910443a0
.word 0x910223a0
.word 0xf9408ba0
.word 0xf90047a0
.word 0xf9408fa0
.word 0xf9004ba0
.word 0xd280001e
.word 0xf2d1001e
.word 0xf2e81a7e
.word 0x9e6703c0
.word 0xd280001e
.word 0xf2d1001e
.word 0xf2e81a7e
.word 0x9e6703c0
.word 0x9102a3a0
.word 0xf90097a0
.word 0x910223a0
.word 0xfd4047a0
.word 0xfd404ba1
.word 0xd280001e
.word 0xf2d1001e
.word 0xf2e81a7e
.word 0x9e6703c2
.word 0xd280001e
.word 0xf2d1001e
.word 0xf2e81a7e
.word 0x9e6703c3
bl _p_42
.word 0xf94097be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0xf9401fb1
.word 0xf9447231
.word 0xb4000051
.word 0xd63f0220
.word 0x9102a3a0
.word 0x9103c3a0
.word 0xf94057a0
.word 0xf9007ba0
.word 0xf9405ba0
.word 0xf9007fa0
.word 0xf9405fa0
.word 0xf90083a0
.word 0xf94063a0
.word 0xf90087a0
.loc 7 41 0
.word 0xf9401fb1
.word 0xf944aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf9009fa0
.word 0xf9401fb1
.word 0xf944ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9409fa1
.word 0x910443a0
.word 0x9101e3a0
.word 0xf9408ba0
.word 0xf9003fa0
.word 0xf9408fa0
.word 0xf90043a0
.word 0xaa0103e0
.word 0x9101e3a2
.word 0xfd403fa0
.word 0xfd4043a1
.word 0xf9400021
.word 0xf9419830
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf9451231
.word 0xb4000051
.word 0xd63f0220
.loc 7 42 0
.word 0xf9401fb1
.word 0xf9452231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf9009ba0
.word 0xf9401fb1
.word 0xf9454231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9409ba1
.word 0x9103c3a0
.word 0x910163a0
.word 0xf9407ba0
.word 0xf9002fa0
.word 0xf9407fa0
.word 0xf90033a0
.word 0xf94083a0
.word 0xf90037a0
.word 0xf94087a0
.word 0xf9003ba0
.word 0xaa0103e0
.word 0x910163a2
.word 0xfd402fa0
.word 0xfd4033a1
.word 0xfd4037a2
.word 0xfd403ba3
.word 0xf9400021
.word 0xf9419030
.word 0xd63f0200
.word 0xf9401fb1
.word 0xf945a231
.word 0xb4000051
.word 0xd63f0220
.loc 7 47 0
.word 0xf9401fb1
.word 0xf945b231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0x34000300
.loc 7 48 0
.word 0xf9401fb1
.word 0xf945e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xd2800501
.word 0xd2800501
bl _p_8
.word 0xf9009fa0
bl _p_9
.word 0xf9401fb1
.word 0xf9461631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9409fa0
.word 0xf9009ba0
.word 0xf9001b40
.word 0x9100c340
bl _p_2
.word 0xf9409ba0
.loc 7 51 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9464e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400800
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f6
.word 0xaa1603e0
.word 0x34000ba0
.loc 7 52 0
.word 0xf9401fb1
.word 0xf9468231
.word 0xb4000051
.word 0xd63f0220
.loc 7 57 0
.word 0xf9401fb1
.word 0xf9469231
.word 0xb4000051
.word 0xd63f0220
.word 0x910283a0
.word 0xf90097a0
bl _p_26
.word 0xf94097be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf946b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0x91008000
.word 0x910143a1
.word 0xf9400000
.word 0xf9002ba0
.word 0x910263a0
.word 0xf90097a0
.word 0x910283a0
.word 0xf94053a0
.word 0x910143a1
.word 0xf9402ba1
bl _p_27
.word 0xf94097be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf9470231
.word 0xb4000051
.word 0xd63f0220
.word 0x910263a0
.word 0x9103a3a0
.word 0xf9404fa0
.word 0xf90077a0
.loc 7 58 0
.word 0xf9401fb1
.word 0xf9472231
.word 0xb4000051
.word 0xd63f0220
.word 0x9103a3a0
bl _p_28
.word 0xfd00bfa0
.word 0xf9401fb1
.word 0xf9473e31
.word 0xb4000051
.word 0xd63f0220
.word 0xfd40bfa0
.word 0xd280001e
.word 0xf2e809de
.word 0x9e6703c1
.word 0x1e612000
.word 0x9a9fd7e0
.word 0xaa0003f5
.word 0xaa1503e0
.word 0x340001a0
.loc 7 59 0
.word 0xf9401fb1
.word 0xf9477231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_43
.word 0xf9401fb1
.word 0xf9478e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400000c
.loc 7 62 0
.word 0xf9401fb1
.word 0xf947a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_44
.word 0xf9401fb1
.word 0xf947be31
.word 0xb4000051
.word 0xd63f0220
.loc 7 63 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf947de31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400000c
.loc 7 65 0
.word 0xf9401fb1
.word 0xf947f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_43
.word 0xf9401fb1
.word 0xf9480e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 66 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9482e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9483e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415bb5
.word 0xf94013b7
.word 0xa942ebb9
.word 0x910003bf
.word 0xa8d87bfd
.word 0xd65f03c0

Lme_25:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_LoadSitesFromWebService
vitasa_VC_SitesMap_LoadSitesFromWebService:
.loc 7 69 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #680]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 7 72 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf90023a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000600

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #504]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf94023a1
.word 0xf9001fa1
.word 0xf9001001
.word 0xf9001ba0
.word 0x91008000
bl _p_2
.word 0xf9401ba0
.word 0xf9401fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #688]
.word 0xf9001401

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #696]
.word 0xf9002001

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #704]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0xd2800001
.word 0x3901801f
bl _p_30
.word 0xf9400fb1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.loc 7 90 0
.word 0xf9400fb1
.word 0xf9411631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_26:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_PutPinsOnMap
vitasa_VC_SitesMap_PutPinsOnMap:
.loc 7 93 0 prologue_end
.word 0xa9ad7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #712]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0x9101a3a0
.word 0xd2800000
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf90043bf
.word 0x9e6703e0
.word 0xfd0047a0
.word 0x9e6703e0
.word 0xfd004ba0
.word 0x390263bf
.word 0x390283bf
.word 0xf90057bf
.word 0xf9400fb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.loc 7 94 0
.word 0xf9400fb1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf90083a0
.word 0xf9400ba0
.word 0xf9401800
.word 0xf9008ba0
.word 0xf9400ba0
.word 0xf9008fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #720]
bl _p_22
.word 0xf9408ba1
.word 0xf9408fa2
.word 0xf90087a0
bl _p_45
.word 0xf9400fb1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0xf94087a1
.word 0xf9007fa1
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf9407fa0
.loc 7 95 0
.word 0xf9400fb1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_39
.word 0xf9007ba0
.word 0xf9400fb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba2
.word 0xf9400ba0
.word 0xf9401c01
.word 0xaa0203e0
.word 0xf940005e
bl _p_46
.word 0xf9400fb1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.loc 7 97 0
.word 0xf9400fb1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9417231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9401800
.word 0xf9400801
.word 0x910143a0
.word 0xaa0003e8
.word 0xaa0103e0
.word 0xf940003e
bl _p_47
.word 0xf9400fb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0x910143a0
.word 0x9101a3a0
.word 0xf9402ba0
.word 0xf90037a0
.word 0xf9402fa0
.word 0xf9003ba0
.word 0xf94033a0
.word 0xf9003fa0
.word 0x140000fb
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf941e631
.word 0xb4000051
.word 0xd63f0220
.word 0x9101a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_48
.word 0xf9007ba0
.word 0xf9400fb1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0xf90043a0
.loc 7 98 0
.word 0xf9400fb1
.word 0xf9422631
.word 0xb4000051
.word 0xd63f0220
.loc 7 99 0
.word 0xf9400fb1
.word 0xf9423631
.word 0xb4000051
.word 0xd63f0220
.word 0xd280001e
.word 0xf2ffff1e
.word 0x9e6703c0
.word 0xfd0047a0
.loc 7 100 0
.word 0xf9400fb1
.word 0xf9425631
.word 0xb4000051
.word 0xd63f0220
.word 0xd280001e
.word 0xf2ffff1e
.word 0x9e6703c0
.word 0xfd004ba0
.loc 7 101 0
.word 0xf9400fb1
.word 0xf9427631
.word 0xb4000051
.word 0xd63f0220
.word 0xd280003e
.word 0x390263be
.loc 7 103 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9429e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 104 0
.word 0xf9400fb1
.word 0xf942ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9402000
bl _p_49
.word 0xfd0097a0
.word 0xf9400fb1
.word 0xf942ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xfd4097a0
.word 0xfd0047a0
.loc 7 105 0
.word 0xf9400fb1
.word 0xf942e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9402400
bl _p_49
.word 0xfd0093a0
.word 0xf9400fb1
.word 0xf9430631
.word 0xb4000051
.word 0xd63f0220
.word 0xfd4093a0
.word 0xfd004ba0
.loc 7 106 0
.word 0xf9400fb1
.word 0xf9431e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400001b
.word 0xf9005fa0
.word 0xf9405fa0
.loc 7 107 0
.word 0xf9400fb1
.word 0xf9433a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 108 0
.word 0xf9400fb1
.word 0xf9434a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 109 0
.word 0xf9400fb1
.word 0xf9435a31
.word 0xb4000051
.word 0xd63f0220
.word 0x390263bf
.loc 7 110 0
.word 0xf9400fb1
.word 0xf9436e31
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf90077a0
.word 0xf94077a0
.word 0xb4000060
.word 0xf94077a0
bl _p_51
.word 0x14000001
.loc 7 112 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf943aa31
.word 0xb4000051
.word 0xd63f0220
.word 0x394263a0
.word 0x390283a0
.word 0x394283a0
.word 0x34000ec0
.loc 7 113 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf943da31
.word 0xb4000051
.word 0xd63f0220
.loc 7 114 0
.word 0xf9400fb1
.word 0xf943ea31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #736]
bl _p_22
.word 0xf90087a0
bl _p_52
.word 0xf9400fb1
.word 0xf9441231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94087a0
.word 0xf90057a0
.loc 7 115 0
.word 0xf9400fb1
.word 0xf9442a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94057a2
.word 0xf94043a0
.word 0xf9400801
.word 0xaa0203e0
.word 0xf9400042
.word 0xf940d450
.word 0xd63f0200
.word 0xf9400fb1
.word 0xf9445631
.word 0xb4000051
.word 0xd63f0220
.loc 7 116 0
.word 0xf9400fb1
.word 0xf9446631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94057a0
.word 0xf90083a0
.word 0xfd4047a0
.word 0xfd404ba1
.word 0x910103a0
.word 0xd2800000
.word 0xf90023a0
.word 0xf90027a0
.word 0x910103a0
bl _p_41
.word 0x910103a0
.word 0x9100c3a0
.word 0xf94023a0
.word 0xf9001ba0
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf9400fb1
.word 0xf944b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a1
.word 0xaa0103e0
.word 0x9100c3a2
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9400021
.word 0xf940dc30
.word 0xd63f0200
.word 0xf9400fb1
.word 0xf944e631
.word 0xb4000051
.word 0xd63f0220
.loc 7 117 0
.word 0xf9400fb1
.word 0xf944f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_39
.word 0xf9007fa0
.word 0xf9400fb1
.word 0xf9451231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #744]
.word 0xd2800021
bl _p_53
.word 0xf9005ba0
.word 0xf9405ba0
.word 0xf9007ba0
.word 0xf9405ba3
.word 0xd2800000
.word 0xf94057a2
.word 0xaa0303e0
.word 0xd2800001
.word 0xf9400063
.word 0xf9404c70
.word 0xd63f0200
.word 0xf9407ba1
.word 0xf9407fa2
.word 0xaa0203e0
.word 0xf9400042
.word 0xf941a050
.word 0xd63f0200
.word 0xf9400fb1
.word 0xf9457e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 118 0
.word 0xf9400fb1
.word 0xf9458e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 119 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf945ae31
.word 0xb4000051
.word 0xd63f0220
.loc 7 97 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf945ce31
.word 0xb4000051
.word 0xd63f0220
.word 0x9101a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_54
.word 0x53001c00
.word 0xf9007ba0
.word 0xf9400fb1
.word 0xf945fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0x35ffde40
.word 0x94000002
.word 0x1400000d
.word 0xf90073be
.word 0x9101a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_55
.word 0xf9400fb1
.word 0xf9463231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073be
.word 0xd61f03c0
.loc 7 120 0
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9465a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9466a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8d37bfd
.word 0xd65f03c0

Lme_27:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
.loc 7 123 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023b9
.word 0xf90027a0
.word 0xaa0103f9
.word 0xf9002ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #752]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402fb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 124 0
.word 0xf9402fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xaa1903e1
.word 0xf9402ba2
.word 0xaa1903e1
bl _p_11
.word 0xf9402fb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.loc 7 126 0
.word 0xf9402fb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #760]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000700
.loc 7 127 0
.word 0xf9402fb1
.word 0xf9413231
.word 0xb4000051
.word 0xd63f0220
.loc 7 128 0
.word 0xf9402fb1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f8
.word 0xf9402fb1
.word 0xf9416a31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #560]
.word 0xeb01001f
.word 0x10000011
.word 0x54000f41
.word 0xaa1803e0
.word 0xaa1803f6
.loc 7 129 0
.word 0xf9402fb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001b00
.word 0x9100c300
bl _p_2
.word 0xf9403ba0
.loc 7 130 0
.word 0xf9402fb1
.word 0xf941de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800000
.word 0x3901c31f
.loc 7 131 0
.word 0xf9402fb1
.word 0xf941fa31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400004d
.loc 7 132 0
.word 0xf9402fb1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf9423631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #768]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9426231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f5
.word 0xaa0003e1
.word 0x34000600
.loc 7 133 0
.word 0xf9402fb1
.word 0xf9428231
.word 0xb4000051
.word 0xd63f0220
.loc 7 134 0
.word 0xf9402fb1
.word 0xf9429231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f3
.word 0xf9402fb1
.word 0xf942ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000173
.word 0xf9400260
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x10000011
.word 0x540004c1
.word 0xaa1303e0
.word 0xaa1303f4
.loc 7 135 0
.word 0xf9402fb1
.word 0xf942fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1303e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001a60
.word 0x9100c260
bl _p_2
.word 0xf9403ba0
.loc 7 136 0
.word 0xf9402fb1
.word 0xf9432e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 137 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9434e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023b9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_28:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_get_B_Back
vitasa_VC_SitesMap_get_B_Back:
.file 8 "/Users/Billy/Projects/vitasa/vitasa/VC_SitesMap.designer.cs"
.loc 8 19 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #776]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_29:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton
vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton:
.loc 8 19 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #784]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_2a:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_get_Map_SitesMap
vitasa_VC_SitesMap_get_Map_SitesMap:
.loc 8 23 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #792]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_2b:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView
vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView:
.loc 8 23 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #800]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002401
.word 0x91012000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_2c:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_ReleaseDesignerOutlets
vitasa_VC_SitesMap_ReleaseDesignerOutlets:
.loc 8 26 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #808]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800019
.word 0xd2800018
.word 0xf94017b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.loc 8 27 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_56
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000540
.word 0xf94017b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.loc 8 28 0
.word 0xf94017b1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_56
.word 0xf90023a0
.word 0xf94017b1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.loc 8 29 0
.word 0xf94017b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_57
.word 0xf94017b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.loc 8 30 0
.word 0xf94017b1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.loc 8 32 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9417231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000540
.word 0xf94017b1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.loc 8 33 0
.word 0xf94017b1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_39
.word 0xf90023a0
.word 0xf94017b1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.loc 8 34 0
.word 0xf94017b1
.word 0xf9421e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_58
.word 0xf94017b1
.word 0xf9424231
.word 0xb4000051
.word 0xd63f0220
.loc 8 35 0
.word 0xf94017b1
.word 0xf9425231
.word 0xb4000051
.word 0xd63f0220
.loc 8 36 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9427231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9428231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_2d:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0
vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0:
.word 0xa9b37bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #816]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9003fbf
.word 0x910183a0
.word 0xd2800000
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9400fb1
.word 0xf9404a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #824]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf90063a0
bl _p_59
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xf9003fa0
.word 0xf9403fa0
.word 0xf9400ba1
.word 0xf9005fa1
.word 0xf9001401
.word 0x9100a000
bl _p_2
.word 0xf9405fa0
.word 0xf9403fa0
.word 0xf9005ba0
.word 0x910123a0
.word 0xaa0003e8
bl _p_36
.word 0xf9400fb1
.word 0xf940c231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x910123a1
.word 0x91004001
.word 0xaa0103e0
.word 0xf94027a2
.word 0xf90057a2
.word 0xf9000022
.word 0xf90053a0
bl _p_2
.word 0xf94053a0
.word 0xf94057a1
.word 0x91002000
.word 0xf9402ba1
.word 0xf9004fa1
.word 0xf9000001
.word 0xf9004ba0
bl _p_2
.word 0xf9404ba0
.word 0xf9404fa1
.word 0x91002000
.word 0xf9402fa1
.word 0xf90047a1
.word 0xf9000001
bl _p_2
.word 0xf94047a0
.word 0xf9403fa0
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9403fa0
.word 0x91004000
.word 0x9100c3a1
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400401
.word 0xf9001fa1
.word 0xf9400800
.word 0xf90023a0
.word 0x9100c3a0
.word 0x910183a0
.word 0xf9401ba0
.word 0xf90033a0
.word 0xf9401fa0
.word 0xf90037a0
.word 0xf94023a0
.word 0xf9003ba0
.word 0x910183a0
.word 0x9101e3a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #832]
bl _p_60
.word 0xf9400fb1
.word 0xf941aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000200
.word 0x91004000
bl _p_38
.word 0xf90043a0
.word 0xf9400fb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9400fb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8cd7bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13

Lme_2e:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1
vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1:
.loc 7 86 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #840]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.loc 7 87 0
.word 0xf9400fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_44
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 88 0
.word 0xf9400fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_2f:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady__ctor_intptr
vitasa_VC_GetReady__ctor_intptr:
.file 9 "/Users/Billy/Projects/vitasa/vitasa/VC_GetReady.cs"
.loc 9 12 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #848]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_4
.word 0xf94013b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.loc 9 13 0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.loc 9 14 0
.word 0xf94013b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_30:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
.loc 9 17 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xf9001bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xf9001fa2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #856]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xd2800017
.word 0xd2800016
.word 0xf94023b1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.loc 9 18 0
.word 0xf94023b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1903e0
.word 0xf9401fa2
.word 0xaa1803e0
.word 0xaa1903e1
bl _p_11
.word 0xf94023b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.loc 9 20 0
.word 0xf94023b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf90037a0
.word 0xf94023b1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #864]
bl _p_12
.word 0x53001c00
.word 0xf90033a0
.word 0xf94023b1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000600
.loc 9 21 0
.word 0xf94023b1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.loc 9 22 0
.word 0xf94023b1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f5
.word 0xf94023b1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000175
.word 0xf94002a0
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x10000011
.word 0x540004a1
.word 0xaa1503e0
.word 0xaa1503f6
.loc 9 23 0
.word 0xf94023b1
.word 0xf941a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xaa1803e0
.word 0xf9401b00
.word 0xf90033a0
.word 0xf9001aa0
.word 0x9100c2a0
bl _p_2
.word 0xf94033a0
.loc 9 24 0
.word 0xf94023b1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.loc 9 25 0
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf941f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9420631
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415bb5
.word 0xa94263b7
.word 0xf9401bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_31:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_get_B_Back
vitasa_VC_GetReady_get_B_Back:
.file 10 "/Users/Billy/Projects/vitasa/vitasa/VC_GetReady.designer.cs"
.loc 10 19 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #872]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9401c00
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_32:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_set_B_Back_UIKit_UIButton
vitasa_VC_GetReady_set_B_Back_UIKit_UIButton:
.loc 10 19 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #880]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_33:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_get_TB_ReadyMessage
vitasa_VC_GetReady_get_TB_ReadyMessage:
.loc 10 23 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #888]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_34:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView
vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView:
.loc 10 23 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #896]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_35:
.text
	.align 4
	.no_dead_strip vitasa_VC_GetReady_ReleaseDesignerOutlets
vitasa_VC_GetReady_ReleaseDesignerOutlets:
.loc 10 26 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #904]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800019
.word 0xd2800018
.word 0xf94017b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.loc 10 27 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_61
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000540
.word 0xf94017b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.loc 10 28 0
.word 0xf94017b1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_61
.word 0xf90023a0
.word 0xf94017b1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.loc 10 29 0
.word 0xf94017b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_62
.word 0xf94017b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.loc 10 30 0
.word 0xf94017b1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.loc 10 32 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9417231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_63
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000540
.word 0xf94017b1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.loc 10 33 0
.word 0xf94017b1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_63
.word 0xf90023a0
.word 0xf94017b1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf94017b1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.loc 10 34 0
.word 0xf94017b1
.word 0xf9421e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_64
.word 0xf94017b1
.word 0xf9424231
.word 0xb4000051
.word 0xd63f0220
.loc 10 35 0
.word 0xf94017b1
.word 0xf9425231
.word 0xb4000051
.word 0xd63f0220
.loc 10 36 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9427231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9428231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_36:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__ctor
vitasa_C_VitaSite__ctor:
.file 11 "/Users/Billy/Projects/vitasa/vitasa/C_VitaSite.cs"
.loc 11 12 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #912]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9000b5f
.loc 11 13 0
.word 0xf9400fb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9000f5f
.loc 11 14 0
.word 0xf9400fb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900135f
.loc 11 15 0
.word 0xf9400fb1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900175f
.loc 11 16 0
.word 0xf9400fb1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9001b5f
.loc 11 17 0
.word 0xf9400fb1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9001f5f
.loc 11 18 0
.word 0xf9400fb1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900235f
.loc 11 19 0
.word 0xf9400fb1
.word 0xf9411a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900275f
.loc 11 20 0
.word 0xf9400fb1
.word 0xf9413631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9002b5f
.loc 11 21 0
.word 0xf9400fb1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9002f5f
.loc 11 22 0
.word 0xf9400fb1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900335f
.loc 11 23 0
.word 0xf9400fb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf900375f
.loc 11 24 0
.word 0xf9400fb1
.word 0xf941a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf9003b5f
.loc 11 25 0
.word 0xf9400fb1
.word 0xf941c231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0x3901e35f
.loc 11 45 0
.word 0xf9400fb1
.word 0xf941de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.loc 11 46 0
.word 0xf9400fb1
.word 0xf9420231
.word 0xb4000051
.word 0xd63f0220
.loc 11 47 0
.word 0xf9400fb1
.word 0xf9421231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9422231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_37:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__ctor_System_Json_JsonValue
vitasa_C_VitaSite__ctor_System_Json_JsonValue:
.loc 11 12 0 prologue_end
.word 0xa9b37bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #920]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0x3901a3bf
.word 0x3901c3bf
.word 0x3901e3bf
.word 0x390203bf
.word 0x390223bf
.word 0x390243bf
.word 0x390263bf
.word 0x390283bf
.word 0xf9402bb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9000b3f
.loc 11 13 0
.word 0xf9402bb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9000f3f
.loc 11 14 0
.word 0xf9402bb1
.word 0xf940d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900133f
.loc 11 15 0
.word 0xf9402bb1
.word 0xf940f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900173f
.loc 11 16 0
.word 0xf9402bb1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9001b3f
.loc 11 17 0
.word 0xf9402bb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9001f3f
.loc 11 18 0
.word 0xf9402bb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900233f
.loc 11 19 0
.word 0xf9402bb1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900273f
.loc 11 20 0
.word 0xf9402bb1
.word 0xf9417e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9002b3f
.loc 11 21 0
.word 0xf9402bb1
.word 0xf9419a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9002f3f
.loc 11 22 0
.word 0xf9402bb1
.word 0xf941b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900333f
.loc 11 23 0
.word 0xf9402bb1
.word 0xf941d231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf900373f
.loc 11 24 0
.word 0xf9402bb1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9003b3f
.loc 11 25 0
.word 0xf9402bb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0x3901e33f
.loc 11 53 0
.word 0xf9402bb1
.word 0xf9422631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9402bb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.loc 11 54 0
.word 0xf9402bb1
.word 0xf9424a31
.word 0xb4000051
.word 0xd63f0220
.loc 11 57 0
.word 0xf9402bb1
.word 0xf9425a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #928]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9429631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f8
.word 0xaa0003e1
.word 0x34000420
.loc 11 58 0
.word 0xf9402bb1
.word 0xf942b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #928]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf942f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf9430e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9000b20
.word 0x91004320
bl _p_2
.word 0xf9405ba0
.loc 11 60 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9434631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #936]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9438231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000420
.loc 11 61 0
.word 0xf9402bb1
.word 0xf943a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #936]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf943de31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf943fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9000f20
.word 0x91006320
bl _p_2
.word 0xf9405ba0
.loc 11 63 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9443231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #944]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9446e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f6
.word 0xaa0003e1
.word 0x34000420
.loc 11 64 0
.word 0xf9402bb1
.word 0xf9448e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #944]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf944ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf944e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9001320
.word 0x91008320
bl _p_2
.word 0xf9405ba0
.loc 11 66 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9451e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9455a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f5
.word 0xaa0003e1
.word 0x34000420
.loc 11 67 0
.word 0xf9402bb1
.word 0xf9457a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf945b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf945d231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9001720
.word 0x9100a320
bl _p_2
.word 0xf9405ba0
.loc 11 69 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9460a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #960]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9464631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f4
.word 0xaa0003e1
.word 0x34000420
.loc 11 70 0
.word 0xf9402bb1
.word 0xf9466631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #960]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf946a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf946be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9001b20
.word 0x9100c320
bl _p_2
.word 0xf9405ba0
.loc 11 72 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf946f631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #968]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0x53001c00
.word 0xf9005ba0
.word 0xf9402bb1
.word 0xf9473231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xaa0003f3
.word 0xaa0003e1
.word 0x34000420
.loc 11 73 0
.word 0xf9402bb1
.word 0xf9475231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #968]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf9478e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf947aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9001f20
.word 0x9100e320
bl _p_2
.word 0xf9405ba0
.loc 11 75 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf947e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #976]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf9481e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x3901a3a0
.word 0x3941a3a0
.word 0x34000420
.loc 11 76 0
.word 0xf9402bb1
.word 0xf9483e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #976]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf9487a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf9489631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9002320
.word 0x91010320
bl _p_2
.word 0xf9405ba0
.loc 11 78 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf948ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf9490a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x3901c3a0
.word 0x3941c3a0
.word 0x34000420
.loc 11 79 0
.word 0xf9402bb1
.word 0xf9492a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf9496631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf9498231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9002720
.word 0x91012320
bl _p_2
.word 0xf9405ba0
.loc 11 81 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf949ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #992]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf949f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x3901e3a0
.word 0x3941e3a0
.word 0x34000420
.loc 11 82 0
.word 0xf9402bb1
.word 0xf94a1631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #992]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf94a5231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94a6e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9002b20
.word 0x91014320
bl _p_2
.word 0xf9405ba0
.loc 11 84 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94aa631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1000]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94ae231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x390203a0
.word 0x394203a0
.word 0x34000420
.loc 11 85 0
.word 0xf9402bb1
.word 0xf94b0231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1000]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf94b3e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94b5a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9002f20
.word 0x91016320
bl _p_2
.word 0xf9405ba0
.loc 11 87 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94b9231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1008]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94bce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x390223a0
.word 0x394223a0
.word 0x34000420
.loc 11 88 0
.word 0xf9402bb1
.word 0xf94bee31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1008]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf94c2a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94c4631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9003320
.word 0x91018320
bl _p_2
.word 0xf9405ba0
.loc 11 90 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94c7e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94cba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x390243a0
.word 0x394243a0
.word 0x34000420
.loc 11 91 0
.word 0xf9402bb1
.word 0xf94cda31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf94d1631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94d3231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9003720
.word 0x9101a320
bl _p_2
.word 0xf9405ba0
.loc 11 93 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94d6a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1024]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94da631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x390263a0
.word 0x394263a0
.word 0x34000420
.loc 11 94 0
.word 0xf9402bb1
.word 0xf94dc631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1024]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf90063a0
.word 0xf9402bb1
.word 0xf94e0231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
bl _p_65
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94e1e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9005ba0
.word 0xf9003b20
.word 0x9101c320
bl _p_2
.word 0xf9405ba0
.loc 11 96 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94e5631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1032]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403850
.word 0xd63f0200
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94e9231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x390283a0
.word 0x394283a0
.word 0x340003c0
.loc 11 97 0
.word 0xf9402bb1
.word 0xf94eb231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1032]
.word 0xf9400001
.word 0xaa1a03e0
.word 0xf9400342
.word 0xf9403c50
.word 0xd63f0200
.word 0xf9005fa0
.word 0xf9402bb1
.word 0xf94eee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
bl _p_66
.word 0xf9005ba0
.word 0x53001c00
.word 0xf9402bb1
.word 0xf94f0e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x3901e320
.loc 11 98 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94f3631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf94f4631
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8cd7bfd
.word 0xd65f03c0

Lme_38:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite_ImportSites_System_Json_JsonValue
vitasa_C_VitaSite_ImportSites_System_Json_JsonValue:
.loc 11 106 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xf9001bb9
.word 0xf9001fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1040]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xd2800019
.word 0xf9002fbf
.word 0xd2800018
.word 0xd2800017
.word 0xf90033bf
.word 0xd2800016
.word 0xf94023b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.loc 11 110 0
.word 0xf94023b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1048]
.word 0xd2800401
.word 0xd2800401
bl _p_8
.word 0xf90057a0
bl _p_67
.word 0xf94023b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94057a0
.word 0xaa0003f9
.loc 11 111 0
.word 0xf94023b1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1056]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90053a0
.word 0xf94023b1
.word 0xf9411a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xf9002fa0
.word 0x1400004f
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1064]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f5
.word 0xf94023b1
.word 0xf9418231
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000175
.word 0xf94002a0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1072]
.word 0xeb01001f
.word 0x10000011
.word 0x540013c1
.word 0xaa1503e0
.word 0xaa1503f8
.loc 11 112 0
.word 0xf94023b1
.word 0xf941c631
.word 0xb4000051
.word 0xd63f0220
.loc 11 113 0
.word 0xf94023b1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1080]
.word 0xd2801001
.word 0xd2801001
bl _p_8
.word 0xf90053a0
.word 0xaa1503e1
bl _p_68
.word 0xf94023b1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xaa0003f7
.loc 11 114 0
.word 0xf94023b1
.word 0xf9422631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1703e0
.word 0xaa1903e0
.word 0xaa1703e1
.word 0xf940033e
bl _p_69
.word 0xf94023b1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.loc 11 115 0
.word 0xf94023b1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.loc 11 111 0
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9427e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1088]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0xf90053a0
.word 0xf94023b1
.word 0xf942be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0x35fff320
.word 0x94000002
.word 0x14000038
.word 0xf9004bbe
.word 0xf9402fa0
.word 0xf90037a0
.word 0xf94037a0
.word 0xf9003ba0
.word 0xf94037a0
.word 0xeb1f001f
.word 0x54000380
.word 0xf94037a0
.word 0xf9400000
.word 0xf9003fa0
.word 0xf9403fa0
.word 0xb9402800

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1096]
.word 0xeb01001f
.word 0x540001e3
.word 0xf9403fa0
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1096]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000080
.word 0x14000001
.word 0xf9003bbf
.word 0x14000001
.word 0xf9403ba0
.word 0xf90033a0
.word 0xf94033a0
.word 0xb40001e0
.word 0xf94033a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1104]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94023b1
.word 0xf943a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404bbe
.word 0xd61f03c0
.loc 11 117 0
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf943ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903f6
.loc 11 118 0
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf943f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf94023b1
.word 0xf9440a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415bb5
.word 0xa94263b7
.word 0xf9401bb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_39:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite_FetchSitesList
vitasa_C_VitaSite_FetchSitesList:
.word 0xa9b47bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1112]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0xf9003bbf
.word 0x910163a0
.word 0xd2800000
.word 0xf9002fa0
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9400bb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1120]
.word 0xd2801101
.word 0xd2801101
bl _p_8
.word 0xf9005fa0
bl _p_70
.word 0xf9400bb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xf9003ba0
.word 0xf9403ba0
.word 0xf9005ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1128]
.word 0x910103a0
.word 0xaa0003e8
bl _p_71
.word 0xf9400bb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0x910103a1
.word 0x91004001
.word 0xaa0103e0
.word 0xf94023a2
.word 0xf90057a2
.word 0xf9000022
.word 0xf90053a0
bl _p_2
.word 0xf94053a0
.word 0xf94057a1
.word 0x91002000
.word 0xf94027a1
.word 0xf9004fa1
.word 0xf9000001
.word 0xf9004ba0
bl _p_2
.word 0xf9404ba0
.word 0xf9404fa1
.word 0x91002000
.word 0xf9402ba1
.word 0xf90047a1
.word 0xf9000001
bl _p_2
.word 0xf94047a0
.word 0xf9403ba0
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900801e
.word 0xf9403ba0
.word 0x91004000
.word 0x9100a3a1
.word 0xf9400001
.word 0xf90017a1
.word 0xf9400401
.word 0xf9001ba1
.word 0xf9400800
.word 0xf9001fa0
.word 0x9100a3a0
.word 0x910163a0
.word 0xf94017a0
.word 0xf9002fa0
.word 0xf9401ba0
.word 0xf90033a0
.word 0xf9401fa0
.word 0xf90037a0
.word 0x910163a0
.word 0x9101c3a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1136]
bl _p_72
.word 0xf9400bb1
.word 0xf9419631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000260
.word 0x91004000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1128]
bl _p_73
.word 0xf90043a0
.word 0xf9400bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9400bb1
.word 0xf941e231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13

Lme_3a:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite
vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite:
.loc 11 157 0 prologue_end
.word 0xa9a67bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1144]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xf9401bb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.loc 11 159 0
.word 0xf9401bb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1080]
.word 0xd2801001
.word 0xd2801001
bl _p_8
.word 0xf900cfa0
bl _p_74
.word 0xf9401bb1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0xf940cfa0
.word 0xaa0003f9
.loc 11 160 0
.word 0xf9401bb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1152]
.word 0xf900cba0
.word 0xf9000b20
.word 0x91004320
bl _p_2
.word 0xf940cba0
.loc 11 161 0
.word 0xf9401bb1
.word 0xf940f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1160]
.word 0xf900c7a1
.word 0xf9000f21
.word 0x91006000
bl _p_2
.word 0xf940c7a0
.loc 11 162 0
.word 0xf9401bb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1168]
.word 0xf900c3a1
.word 0xf9001321
.word 0x91008000
bl _p_2
.word 0xf940c3a0
.loc 11 163 0
.word 0xf9401bb1
.word 0xf9415a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1176]
.word 0xf900bfa1
.word 0xf9001721
.word 0x9100a000
bl _p_2
.word 0xf940bfa0
.loc 11 164 0
.word 0xf9401bb1
.word 0xf9418e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1184]
.word 0xf900bba1
.word 0xf9001b21
.word 0x9100c000
bl _p_2
.word 0xf940bba0
.loc 11 165 0
.word 0xf9401bb1
.word 0xf941c231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1192]
.word 0xf900b7a1
.word 0xf9001f21
.word 0x9100e000
bl _p_2
.word 0xf940b7a0
.loc 11 166 0
.word 0xf9401bb1
.word 0xf941f631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1200]
.word 0xf900b3a1
.word 0xf9002321
.word 0x91010000
bl _p_2
.word 0xf940b3a0
.loc 11 167 0
.word 0xf9401bb1
.word 0xf9422a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1208]
.word 0xf900afa1
.word 0xf9002721
.word 0x91012000
bl _p_2
.word 0xf940afa0
.loc 11 168 0
.word 0xf9401bb1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xf900aba1
.word 0xf9002b21
.word 0x91014000
bl _p_2
.word 0xf940aba0
.loc 11 169 0
.word 0xf9401bb1
.word 0xf9429231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1224]
.word 0xf900a7a1
.word 0xf9002f21
.word 0x91016000
bl _p_2
.word 0xf940a7a0
.loc 11 170 0
.word 0xf9401bb1
.word 0xf942c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1232]
.word 0xf900a3a1
.word 0xf9003321
.word 0x91018000
bl _p_2
.word 0xf940a3a0
.loc 11 171 0
.word 0xf9401bb1
.word 0xf942fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1240]
.word 0xf9009fa1
.word 0xf9003721
.word 0x9101a000
bl _p_2
.word 0xf9409fa0
.loc 11 172 0
.word 0xf9401bb1
.word 0xf9432e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1248]
.word 0xf9009ba1
.word 0xf9003b21
.word 0x9101c000
bl _p_2
.word 0xf9409ba0
.loc 11 173 0
.word 0xf9401bb1
.word 0xf9436231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800020
.word 0xd280003e
.word 0x3901e33e
.loc 11 174 0
.word 0xf9401bb1
.word 0xf9438231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1903e1
.word 0xaa1a03e0
.word 0xf940035e
bl _p_69
.word 0xf9401bb1
.word 0xf943a631
.word 0xb4000051
.word 0xd63f0220
.loc 11 176 0
.word 0xf9401bb1
.word 0xf943b631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1080]
.word 0xd2801001
.word 0xd2801001
bl _p_8
.word 0xf90097a0
bl _p_74
.word 0xf9401bb1
.word 0xf943e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94097a0
.word 0xaa0003f8
.loc 11 177 0
.word 0xf9401bb1
.word 0xf943fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1256]
.word 0xf90093a0
.word 0xf9000b00
.word 0x91004300
bl _p_2
.word 0xf94093a0
.loc 11 178 0
.word 0xf9401bb1
.word 0xf9443231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1264]
.word 0xf9008fa1
.word 0xf9000f01
.word 0x91006000
bl _p_2
.word 0xf9408fa0
.loc 11 179 0
.word 0xf9401bb1
.word 0xf9446631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1272]
.word 0xf9008ba1
.word 0xf9001301
.word 0x91008000
bl _p_2
.word 0xf9408ba0
.loc 11 180 0
.word 0xf9401bb1
.word 0xf9449a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1176]
.word 0xf90087a1
.word 0xf9001701
.word 0x9100a000
bl _p_2
.word 0xf94087a0
.loc 11 181 0
.word 0xf9401bb1
.word 0xf944ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1184]
.word 0xf90083a1
.word 0xf9001b01
.word 0x9100c000
bl _p_2
.word 0xf94083a0
.loc 11 182 0
.word 0xf9401bb1
.word 0xf9450231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1280]
.word 0xf9007fa1
.word 0xf9001f01
.word 0x9100e000
bl _p_2
.word 0xf9407fa0
.loc 11 183 0
.word 0xf9401bb1
.word 0xf9453631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1288]
.word 0xf9007ba1
.word 0xf9002301
.word 0x91010000
bl _p_2
.word 0xf9407ba0
.loc 11 184 0
.word 0xf9401bb1
.word 0xf9456a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1296]
.word 0xf90077a1
.word 0xf9002701
.word 0x91012000
bl _p_2
.word 0xf94077a0
.loc 11 185 0
.word 0xf9401bb1
.word 0xf9459e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xf90073a1
.word 0xf9002b01
.word 0x91014000
bl _p_2
.word 0xf94073a0
.loc 11 186 0
.word 0xf9401bb1
.word 0xf945d231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1224]
.word 0xf9006fa1
.word 0xf9002f01
.word 0x91016000
bl _p_2
.word 0xf9406fa0
.loc 11 187 0
.word 0xf9401bb1
.word 0xf9460631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1304]
.word 0xf9006ba1
.word 0xf9003301
.word 0x91018000
bl _p_2
.word 0xf9406ba0
.loc 11 188 0
.word 0xf9401bb1
.word 0xf9463a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1312]
.word 0xf90067a1
.word 0xf9003701
.word 0x9101a000
bl _p_2
.word 0xf94067a0
.loc 11 189 0
.word 0xf9401bb1
.word 0xf9466e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1248]
.word 0xf90063a1
.word 0xf9003b01
.word 0x9101c000
bl _p_2
.word 0xf94063a0
.loc 11 190 0
.word 0xf9401bb1
.word 0xf946a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800000
.word 0x3901e31f
.loc 11 191 0
.word 0xf9401bb1
.word 0xf946be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1803e1
.word 0xaa1a03e0
.word 0xf940035e
bl _p_69
.word 0xf9401bb1
.word 0xf946e231
.word 0xb4000051
.word 0xd63f0220
.loc 11 193 0
.word 0xf9401bb1
.word 0xf946f231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1080]
.word 0xd2801001
.word 0xd2801001
bl _p_8
.word 0xf9005fa0
bl _p_74
.word 0xf9401bb1
.word 0xf9472231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405fa0
.word 0xaa0003f7
.loc 11 194 0
.word 0xf9401bb1
.word 0xf9473a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1320]
.word 0xf9005ba0
.word 0xf9000ae0
.word 0x910042e0
bl _p_2
.word 0xf9405ba0
.loc 11 195 0
.word 0xf9401bb1
.word 0xf9476e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1328]
.word 0xf90057a1
.word 0xf9000ee1
.word 0x91006000
bl _p_2
.word 0xf94057a0
.loc 11 196 0
.word 0xf9401bb1
.word 0xf947a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1336]
.word 0xf90053a1
.word 0xf90012e1
.word 0x91008000
bl _p_2
.word 0xf94053a0
.loc 11 197 0
.word 0xf9401bb1
.word 0xf947d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1176]
.word 0xf9004fa1
.word 0xf90016e1
.word 0x9100a000
bl _p_2
.word 0xf9404fa0
.loc 11 198 0
.word 0xf9401bb1
.word 0xf9480a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1184]
.word 0xf9004ba1
.word 0xf9001ae1
.word 0x9100c000
bl _p_2
.word 0xf9404ba0
.loc 11 199 0
.word 0xf9401bb1
.word 0xf9483e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1344]
.word 0xf90047a1
.word 0xf9001ee1
.word 0x9100e000
bl _p_2
.word 0xf94047a0
.loc 11 200 0
.word 0xf9401bb1
.word 0xf9487231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1352]
.word 0xf90043a1
.word 0xf90022e1
.word 0x91010000
bl _p_2
.word 0xf94043a0
.loc 11 201 0
.word 0xf9401bb1
.word 0xf948a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1360]
.word 0xf9003fa1
.word 0xf90026e1
.word 0x91012000
bl _p_2
.word 0xf9403fa0
.loc 11 202 0
.word 0xf9401bb1
.word 0xf948da31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xf9003ba1
.word 0xf9002ae1
.word 0x91014000
bl _p_2
.word 0xf9403ba0
.loc 11 203 0
.word 0xf9401bb1
.word 0xf9490e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1224]
.word 0xf90037a1
.word 0xf9002ee1
.word 0x91016000
bl _p_2
.word 0xf94037a0
.loc 11 204 0
.word 0xf9401bb1
.word 0xf9494231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1368]
.word 0xf90033a1
.word 0xf90032e1
.word 0x91018000
bl _p_2
.word 0xf94033a0
.loc 11 205 0
.word 0xf9401bb1
.word 0xf9497631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1376]
.word 0xf9002fa1
.word 0xf90036e1
.word 0x9101a000
bl _p_2
.word 0xf9402fa0
.loc 11 206 0
.word 0xf9401bb1
.word 0xf949aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1248]
.word 0xf9002ba1
.word 0xf9003ae1
.word 0x9101c000
bl _p_2
.word 0xf9402ba0
.loc 11 207 0
.word 0xf9401bb1
.word 0xf949de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xd2800020
.word 0xd280003e
.word 0x3901e2fe
.loc 11 208 0
.word 0xf9401bb1
.word 0xf949fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1703e1
.word 0xaa1a03e0
.word 0xf940035e
bl _p_69
.word 0xf9401bb1
.word 0xf94a2231
.word 0xb4000051
.word 0xd63f0220
.loc 11 209 0
.word 0xf9401bb1
.word 0xf94a3231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf94a4231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8da7bfd
.word 0xd65f03c0

Lme_3b:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__cctor
vitasa_C_VitaSite__cctor:
.loc 11 27 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1384]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0xf9400bb1
.word 0xf9402e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1392]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #928]
.word 0xf9000001
.loc 11 28 0
.word 0xf9400bb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1400]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #936]
.word 0xf9000001
.loc 11 29 0
.word 0xf9400bb1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1408]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #944]
.word 0xf9000001
.loc 11 30 0
.word 0xf9400bb1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1416]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xf9000001
.loc 11 31 0
.word 0xf9400bb1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1424]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #960]
.word 0xf9000001
.loc 11 32 0
.word 0xf9400bb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1432]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #968]
.word 0xf9000001
.loc 11 33 0
.word 0xf9400bb1
.word 0xf9415631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1440]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #976]
.word 0xf9000001
.loc 11 34 0
.word 0xf9400bb1
.word 0xf9418231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1448]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xf9000001
.loc 11 35 0
.word 0xf9400bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1456]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #992]
.word 0xf9000001
.loc 11 36 0
.word 0xf9400bb1
.word 0xf941da31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1464]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1000]
.word 0xf9000001
.loc 11 37 0
.word 0xf9400bb1
.word 0xf9420631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1472]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1008]
.word 0xf9000001
.loc 11 38 0
.word 0xf9400bb1
.word 0xf9423231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1480]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9000001
.loc 11 39 0
.word 0xf9400bb1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1488]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1024]
.word 0xf9000001
.loc 11 40 0
.word 0xf9400bb1
.word 0xf9428a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1496]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1032]
.word 0xf9000001
.word 0xf9400bb1
.word 0xf942b631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_3c:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails__ctor_intptr
vitasa_VC_SiteDetails__ctor_intptr:
.file 12 "/Users/Billy/Projects/vitasa/vitasa/VC_SiteDetails.cs"
.loc 12 11 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1504]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0x3901c33f
.loc 12 13 0
.word 0xf94013b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400fa1
.word 0xaa1903e0
bl _p_4
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 12 14 0
.word 0xf94013b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.loc 12 16 0
.word 0xf94013b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_3d:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_ViewDidLoad
vitasa_VC_SiteDetails_ViewDidLoad:
.loc 12 19 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1512]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xd2800019
.word 0xd2800018
.word 0xf94023b1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.loc 12 20 0
.word 0xf94023b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_5
.word 0xf94023b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.loc 12 22 0
.word 0xf94023b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000240
.loc 12 23 0
.word 0xf94023b1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd280a021
.word 0xd280a021
bl _p_75
.word 0xaa0003e1
.word 0xd2800e40
.word 0xf2a04000
.word 0xd2800e40
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 12 24 0
.word 0xf94023b1
.word 0xf9411631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000240
.loc 12 25 0
.word 0xf94023b1
.word 0xf9414a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd280aaa1
.word 0xd280aaa1
bl _p_75
.word 0xaa0003e1
.word 0xd2800e40
.word 0xf2a04000
.word 0xd2800e40
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 12 28 0
.word 0xf94023b1
.word 0xf9418e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_76
.word 0xf90053a0
.word 0xf94023b1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xeb1f035f
.word 0x10000011
.word 0x54001ec0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1520]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf900101a
.word 0xf9004fa0
.word 0x91008000
bl _p_2
.word 0xf9404fa1
.word 0xf94053a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1528]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1544]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_77
.word 0xf94023b1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.loc 12 41 0
.word 0xf94023b1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_78
.word 0xf9004ba0
.word 0xf94023b1
.word 0xf9427e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404ba2
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xf9400801
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf942b231
.word 0xb4000051
.word 0xd63f0220
.loc 12 42 0
.word 0xf94023b1
.word 0xf942c231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_79
.word 0xf90047a0
.word 0xf94023b1
.word 0xf942e231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94047a2
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xf9401001
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf9431631
.word 0xb4000051
.word 0xd63f0220
.loc 12 43 0
.word 0xf94023b1
.word 0xf9432631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_80
.word 0xf90043a0
.word 0xf94023b1
.word 0xf9434631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a2
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xf9401401
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf9437a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 44 0
.word 0xf94023b1
.word 0xf9438a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_81
.word 0xf9003fa0
.word 0xf94023b1
.word 0xf943aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xf9401800

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1552]
.word 0xaa1a03e2
.word 0xf9401b42
.word 0xf9400c42
.word 0xf9401c42
bl _p_82
.word 0xf9003ba0
.word 0xf94023b1
.word 0xf943ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xf9403fa2
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf9441631
.word 0xb4000051
.word 0xd63f0220
.loc 12 45 0
.word 0xf94023b1
.word 0xf9442631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_83
.word 0xf90037a0
.word 0xf94023b1
.word 0xf9444631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a2
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0xf9403401
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf9447a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 46 0
.word 0xf94023b1
.word 0xf9448a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_84
.word 0xf90033a0
.word 0xf94023b1
.word 0xf944aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1560]
.word 0xaa1a03e0
.word 0xf9401b40
.word 0xf9400c00
.word 0x3941e000
.word 0xaa0203f7
.word 0xaa0103f6
.word 0x35000100
.word 0xaa1703e0
.word 0xaa1603e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1568]
.word 0xaa0003f5
.word 0x14000007
.word 0xaa1703e0
.word 0xaa1603e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1576]
.word 0xaa0003f5
.word 0xaa1703e0
.word 0xaa1603e0
.word 0xaa1503e0
.word 0xaa1603e0
.word 0xaa1503e1
bl _p_85
.word 0xf90033a0
.word 0xf94023b1
.word 0xf9453631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a1
.word 0xaa1703e0
.word 0xf94002e2
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94023b1
.word 0xf9455a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 47 0
.word 0xf94023b1
.word 0xf9456a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9457a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_3e:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
.loc 12 50 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023b9
.word 0xf90027a0
.word 0xaa0103f9
.word 0xf9002ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1584]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402fb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 51 0
.word 0xf9402fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xaa1903e1
.word 0xf9402ba2
.word 0xaa1903e1
bl _p_11
.word 0xf9402fb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.loc 12 53 0
.word 0xf9402fb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1592]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f7
.word 0xaa0003e1
.word 0x34000620
.loc 12 54 0
.word 0xf9402fb1
.word 0xf9413231
.word 0xb4000051
.word 0xd63f0220
.loc 12 55 0
.word 0xf9402fb1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f8
.word 0xf9402fb1
.word 0xf9416a31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #376]
.word 0xeb01001f
.word 0x10000011
.word 0x54000e61
.word 0xaa1803e0
.word 0xaa1803f6
.loc 12 56 0
.word 0xf9402fb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001b00
.word 0x9100c300
bl _p_2
.word 0xf9403ba0
.loc 12 57 0
.word 0xf9402fb1
.word 0xf941de31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400004d
.loc 12 58 0
.word 0xf9402fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d030
.word 0xd63f0200
.word 0xf9003fa0
.word 0xf9402fb1
.word 0xf9421a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1600]
bl _p_12
.word 0x53001c00
.word 0xf9003ba0
.word 0xf9402fb1
.word 0xf9424631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f5
.word 0xaa0003e1
.word 0x34000600
.loc 12 59 0
.word 0xf9402fb1
.word 0xf9426631
.word 0xb4000051
.word 0xd63f0220
.loc 12 60 0
.word 0xf9402fb1
.word 0xf9427631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf9400321
.word 0xf940d430
.word 0xd63f0200
.word 0xaa0003f3
.word 0xf9402fb1
.word 0xf9429e31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000173
.word 0xf9400260
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #360]
.word 0xeb01001f
.word 0x10000011
.word 0x540004c1
.word 0xaa1303e0
.word 0xaa1303f4
.loc 12 61 0
.word 0xf9402fb1
.word 0xf942e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1303e0
.word 0xf94027a0
.word 0xf9401800
.word 0xf9003ba0
.word 0xf9001a60
.word 0x9100c260
bl _p_2
.word 0xf9403ba0
.loc 12 62 0
.word 0xf9402fb1
.word 0xf9431231
.word 0xb4000051
.word 0xd63f0220
.loc 12 64 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9433231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9434231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023b9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_3f:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_B_Back
vitasa_VC_SiteDetails_get_B_Back:
.file 13 "/Users/Billy/Projects/vitasa/vitasa/VC_SiteDetails.designer.cs"
.loc 13 19 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1608]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9401c00
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_40:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton
vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton:
.loc 13 19 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1616]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_41:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_Address
vitasa_VC_SiteDetails_get_L_Address:
.loc 13 23 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1624]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_42:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel:
.loc 13 23 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1632]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_43:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_City
vitasa_VC_SiteDetails_get_L_City:
.loc 13 27 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1640]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_44:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel:
.loc 13 27 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1648]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002401
.word 0x91012000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_45:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_SiteCoordinator
vitasa_VC_SiteDetails_get_L_SiteCoordinator:
.loc 13 31 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1656]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402800
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_46:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel:
.loc 13 31 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1664]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002801
.word 0x91014000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_47:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_SiteName
vitasa_VC_SiteDetails_get_L_SiteName:
.loc 13 35 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1672]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9402c00
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_48:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel:
.loc 13 35 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1680]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9002c01
.word 0x91016000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_49:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_SiteStatus
vitasa_VC_SiteDetails_get_L_SiteStatus:
.loc 13 39 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1688]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9403000
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_4a:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel:
.loc 13 39 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1696]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9003001
.word 0x91018000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_4b:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_get_L_StatePlusZip
vitasa_VC_SiteDetails_get_L_StatePlusZip:
.loc 13 43 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1704]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9403400
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_4c:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel
vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel:
.loc 13 43 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1712]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9003401
.word 0x9101a000
bl _p_2
.word 0xf94023a0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_4d:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails_ReleaseDesignerOutlets
vitasa_VC_SiteDetails_ReleaseDesignerOutlets:
.loc 13 46 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1720]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 47 0
.word 0xf9402bb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_76
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 48 0
.word 0xf9402bb1
.word 0xf940ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_76
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9412a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 49 0
.word 0xf9402bb1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_86
.word 0xf9402bb1
.word 0xf9415e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 50 0
.word 0xf9402bb1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 52 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9418e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_79
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf941da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 53 0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_79
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9422a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 54 0
.word 0xf9402bb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_87
.word 0xf9402bb1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 55 0
.word 0xf9402bb1
.word 0xf9426e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 57 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9428e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_80
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf942ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf942da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 58 0
.word 0xf9402bb1
.word 0xf942ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_80
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9430a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9432a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 59 0
.word 0xf9402bb1
.word 0xf9433a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_88
.word 0xf9402bb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 60 0
.word 0xf9402bb1
.word 0xf9436e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 62 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9438e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_83
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf943ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f6
.word 0xaa1603e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf943da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 63 0
.word 0xf9402bb1
.word 0xf943ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_83
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9440a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9442a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 64 0
.word 0xf9402bb1
.word 0xf9443a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_89
.word 0xf9402bb1
.word 0xf9445e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 65 0
.word 0xf9402bb1
.word 0xf9446e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 67 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9448e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_78
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf944ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f5
.word 0xaa1503e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf944da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 68 0
.word 0xf9402bb1
.word 0xf944ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_78
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9450a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9452a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 69 0
.word 0xf9402bb1
.word 0xf9453a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_90
.word 0xf9402bb1
.word 0xf9455e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 70 0
.word 0xf9402bb1
.word 0xf9456e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 72 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9458e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_84
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf945ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f4
.word 0xaa1403e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf945da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 73 0
.word 0xf9402bb1
.word 0xf945ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_84
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9460a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9462a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 74 0
.word 0xf9402bb1
.word 0xf9463a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_91
.word 0xf9402bb1
.word 0xf9465e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 75 0
.word 0xf9402bb1
.word 0xf9466e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 77 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9468e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_81
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf946ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f3
.word 0xaa1303e0
.word 0x34000540
.word 0xf9402bb1
.word 0xf946da31
.word 0xb4000051
.word 0xd63f0220
.loc 13 78 0
.word 0xf9402bb1
.word 0xf946ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_81
.word 0xf9003ba0
.word 0xf9402bb1
.word 0xf9470a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xaa0103e0
.word 0xf940003e
bl _p_15
.word 0xf9402bb1
.word 0xf9472a31
.word 0xb4000051
.word 0xd63f0220
.loc 13 79 0
.word 0xf9402bb1
.word 0xf9473a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xaa1a03e0
.word 0xd2800001
bl _p_92
.word 0xf9402bb1
.word 0xf9475e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 80 0
.word 0xf9402bb1
.word 0xf9476e31
.word 0xb4000051
.word 0xd63f0220
.loc 13 81 0
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9478e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9479e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_4e:
.text
	.align 4
	.no_dead_strip vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs
vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs:
.loc 12 29 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xf90013a1
.word 0xf90017a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1728]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xf9401bb1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.loc 12 30 0
.word 0xf9401bb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0x3941c340
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x34000380
.loc 12 31 0
.word 0xf9401bb1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 12 32 0
.word 0xf9401bb1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1600]
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0xaa1a03e2
.word 0xf9400343
.word 0xf9414470
.word 0xd63f0200
.word 0xf9401bb1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.loc 12 33 0
.word 0xf9401bb1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400001b
.loc 12 35 0
.word 0xf9401bb1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.loc 12 36 0
.word 0xf9401bb1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1592]
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0xaa1a03e2
.word 0xf9400343
.word 0xf9414470
.word 0xd63f0200
.word 0xf9401bb1
.word 0xf9414a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 37 0
.word 0xf9401bb1
.word 0xf9415a31
.word 0xb4000051
.word 0xd63f0220
.loc 12 38 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9417a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_4f:
.text
	.align 4
	.no_dead_strip vitasa_C_PassAroundContainer__ctor
vitasa_C_PassAroundContainer__ctor:
.file 14 "/Users/Billy/Projects/vitasa/vitasa/C_PassAroundContainer.cs"
.loc 14 21 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1736]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.loc 14 22 0
.word 0xf9400fb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.loc 14 23 0
.word 0xf9400fb1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_50:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList
vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList:
.loc 5 82 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1744]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800000
.word 0xf9001b1f
.loc 5 86 0
.word 0xf94017b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
bl _p_93
.word 0xf94017b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 5 87 0
.word 0xf94017b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.loc 5 88 0
.word 0xf94017b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9400fa0
.word 0xf90027a0
.word 0xf9001700
.word 0x9100a300
bl _p_2
.word 0xf94027a0
.loc 5 90 0
.word 0xf94017b1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94013a0
.word 0xf90023a0
.word 0xf9001b00
.word 0x9100c300
bl _p_2
.word 0xf94023a0
.loc 5 91 0
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_51:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint
vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint:
.loc 5 94 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xf9001ba1
.word 0xf9001fa2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1752]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xf94023b1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 95 0
.word 0xf94023b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800019
.loc 5 96 0
.word 0xf94023b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401740
.word 0xf9400800
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000260
.loc 5 97 0
.word 0xf94023b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401740
.word 0xf9400801
.word 0xaa0103e0
.word 0xf940003e
bl _p_94
.word 0x93407c00
.word 0xf90033a0
.word 0xf94023b1
.word 0xf940f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xaa0003f9
.loc 5 98 0
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x93407f20
.word 0xf90037a0
.word 0xf94023b1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf90033a0
.word 0xaa0003f7
.loc 5 99 0
.word 0xf94023b1
.word 0xf9415631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xaa0003e1
.word 0xf94023b1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_52:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath
vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath:
.loc 5 102 0 prologue_end
.word 0xa9af7bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023ba
.word 0xf90027a0
.word 0xf9002ba1
.word 0xf9002fa2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1760]
.word 0xf90033b0
.word 0xf9400a11
.word 0xf90037b1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf94033b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.loc 5 103 0
.word 0xf94033b1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1768]
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9419c50
.word 0xd63f0200
.word 0xf90057a0
.word 0xf94033b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94057a0
.word 0xf90053a0
.word 0xaa0003f7
.loc 5 105 0
.word 0xf94033b1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xaa0003e1
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0xaa0003f5
.word 0xaa1503e0
.word 0x34000300
.loc 5 106 0
.word 0xf94033b1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800060

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1768]
.word 0xf90057a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1776]
bl _p_22
.word 0xf94057a2
.word 0xf90053a0
.word 0xd2800061
bl _p_95
.word 0xf94033b1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xaa0003f7
.loc 5 108 0
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9417631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xf9401400
.word 0xf9400800
.word 0xf90083a0
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf940003e
bl _p_96
.word 0x93407c00
.word 0xf9007fa0
.word 0xf94033b1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407fa1
.word 0xf94083a2
.word 0xaa0203e0
.word 0xf940005e
bl _p_97
.word 0xf9007ba0
.word 0xf94033b1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0xaa0003f6
.loc 5 110 0
.word 0xf94033b1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1703e0
.word 0xf94002e1
.word 0xf9418430
.word 0xd63f0200
.word 0xf90077a0
.word 0xf94033b1
.word 0xf9421631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94077a2
.word 0xaa1603e0
.word 0xf9400801
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94033b1
.word 0xf9424231
.word 0xb4000051
.word 0xd63f0220
.loc 5 111 0
.word 0xf94033b1
.word 0xf9425231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1703e0
.word 0xf94002e1
.word 0xf9418830
.word 0xd63f0200
.word 0xf90057a0
.word 0xf94033b1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd28000e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1784]
.word 0xd28000e1
bl _p_53
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xf90073a0
.word 0xaa1303e0
.word 0xd2800000
.word 0xaa1603e0
.word 0xf9401002
.word 0xaa1303e0
.word 0xd2800001
.word 0xf9400263
.word 0xf9404c70
.word 0xd63f0200
.word 0xf94073a0
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0xf9006fa0
.word 0xaa1a03e0
.word 0xd2800020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #1792]
.word 0xaa1a03e0
.word 0xd2800021
.word 0xf9400343
.word 0xf9404c70
.word 0xd63f0200
.word 0xf9406fa0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xf9006ba0
.word 0xaa1803e0
.word 0xd2800040
.word 0xaa1603e0
.word 0xf9401402
.word 0xaa1803e0
.word 0xd2800041
.word 0xf9400303
.word 0xf9404c70
.word 0xd63f0200
.word 0xf9406ba0
.word 0xf9003fa0
.word 0xf9403fa0
.word 0xf90067a0
.word 0xf9403fa3
.word 0xd2800060

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #1792]
.word 0xaa0303e0
.word 0xd2800061
.word 0xf9400063
.word 0xf9404c70
.word 0xd63f0200
.word 0xf94067a0
.word 0xf90043a0
.word 0xf94043a0
.word 0xf90063a0
.word 0xf94043a3
.word 0xd2800080
.word 0xaa1603e0
.word 0xf9401802
.word 0xaa0303e0
.word 0xd2800081
.word 0xf9400063
.word 0xf9404c70
.word 0xd63f0200
.word 0xf94063a0
.word 0xf90047a0
.word 0xf94047a0
.word 0xf9005fa0
.word 0xf94047a3
.word 0xd28000a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #1552]
.word 0xaa0303e0
.word 0xd28000a1
.word 0xf9400063
.word 0xf9404c70
.word 0xd63f0200
.word 0xf9405fa0
.word 0xf9004ba0
.word 0xf9404ba0
.word 0xf9005ba0
.word 0xf9404ba3
.word 0xd28000c0
.word 0xaa1603e0
.word 0xf9401c02
.word 0xaa0303e0
.word 0xd28000c1
.word 0xf9400063
.word 0xf9404c70
.word 0xd63f0200
.word 0xf9405ba0
bl _p_98
.word 0xf90053a0
.word 0xf94033b1
.word 0xf9442231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a1
.word 0xf94057a2
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf94033b1
.word 0xf9444a31
.word 0xb4000051
.word 0xd63f0220
.loc 5 113 0
.word 0xf94033b1
.word 0xf9445a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1703f4
.loc 5 114 0
.word 0xf94033b1
.word 0xf9447231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1703e0
.word 0xf94033b1
.word 0xf9448a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023ba
.word 0x910003bf
.word 0xa8d17bfd
.word 0xd65f03c0

Lme_53:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath
vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath:
.loc 5 117 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1800]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 120 0
.word 0xf94017b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9401720
.word 0xf90027a0
.word 0xaa1903e0
.word 0xf9401720
.word 0xf9400800
.word 0xf90033a0
.word 0xf94013a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_96
.word 0x93407c00
.word 0xf9002fa0
.word 0xf94017b1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fa1
.word 0xf94033a2
.word 0xaa0203e0
.word 0xf940005e
bl _p_97
.word 0xf9002ba0
.word 0xf94017b1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xf9402ba1
.word 0xf90023a1
.word 0xf9000c01
.word 0x91006000
bl _p_2
.word 0xf94023a0
.loc 5 122 0
.word 0xf94017b1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9401b23

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #552]
.word 0xaa1903e0
.word 0xf9401b22
.word 0xaa0303e0
.word 0xf9400063
.word 0xf9414470
.word 0xd63f0200
.word 0xf94017b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.loc 5 123 0
.word 0xf94017b1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_54:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor
vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1808]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_55:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext
vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext:
.loc 5 0 0 prologue_end
.word 0xa9ae7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xf9001ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1816]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd280001a
.word 0x9101c3a0
.word 0xf9003bbf
.word 0xd2800019
.word 0xf9003fbf
.word 0xf90043bf
.word 0xf9401fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xb9804800
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x3400005a
.word 0x14000002
.word 0x1400005a
.loc 5 55 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.loc 5 57 0
.word 0xf9401fb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
bl _p_99
.word 0xf90067a0
.word 0xf9401fb1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94067a1
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0103e0
.word 0xf940003e
bl _p_100
.word 0xf94047be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0x9101a3a0
.word 0x9101c3a0
.word 0xf94037a0
.word 0xf9003ba0
.word 0x9101c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_101
.word 0x53001c00
.word 0xf90063a0
.word 0xf9401fb1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0x35000a00
.word 0xf9401ba0
.word 0xd2800001
.word 0xd2800017
.word 0xd2800001
.word 0xd2800001
.word 0xd280001a
.word 0xb900481f
.word 0xf9401fb1
.word 0xf9415631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x9101c3a1
.word 0x910163a1
.word 0xf9403ba1
.word 0xf9002fa1
.word 0x910163a1
.word 0x91010001
.word 0xaa0103e0
.word 0xf9402fa2
.word 0xf90063a2
.word 0xf9000022
bl _p_2
.word 0xf94063a0
.word 0xf9401ba0
.word 0xf9003fa0
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x540023a0
.word 0x91004000
.word 0x9101c3a1
.word 0x9101e3a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1832]
bl _p_102
.word 0xf9401fb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000108
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x91010000
.word 0x910143a1
.word 0xf9400000
.word 0xf9002ba0
.word 0x910143a0
.word 0x9101c3a0
.word 0xf9402ba0
.word 0xf9003ba0
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54001f80
.word 0x91010000
.word 0xf900001f
.word 0xf9401ba0
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800018
.word 0xf2bffff8
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001a
.word 0xf2bffffa
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900481e
.word 0x9101c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_103
.word 0xf9008fa0
.word 0xf9401fb1
.word 0xf9428e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408fa1
.word 0xaa0103f9
.word 0x9101c3a0
.word 0xf9003bbf
.word 0xf9401ba0
.word 0xaa0103e2
.word 0xf9008ba2
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf9408ba0
.word 0xf9401ba0
.word 0xf9401ba1
.word 0xf9401c21
.word 0xf90087a1
.word 0xf9001801
.word 0x9100c000
bl _p_2
.word 0xf94087a0
.word 0xf9401ba0
.word 0xd2800001
.word 0xf9001c1f
.loc 5 60 0
.word 0xf9401fb1
.word 0xf942f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf9007fa0
.word 0xf9401ba0
.word 0xf9401800
bl _p_104
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9432631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407fa0
.word 0xf94083a1
.word 0xf9007ba1
.word 0xf9000801
.word 0x91004000
bl _p_2
.word 0xf9407ba0
.loc 5 61 0
.word 0xf9401fb1
.word 0xf9435231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf9400800
.word 0xf90077a0
.word 0xd2800000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1840]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xaa0003e1
.word 0xf94077a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1848]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1856]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1864]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_105
.word 0xf9401fb1
.word 0xf943ea31
.word 0xb4000051
.word 0xd63f0220
.loc 5 62 0
.word 0xf9401fb1
.word 0xf943fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf90073a0
.word 0x910183a0
.word 0xf90047a0
bl _p_26
.word 0xf94047be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf9442e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a0
.word 0x910183a1
.word 0x91008000
.word 0xf94033a1
.word 0xf9000001
.loc 5 66 0
.word 0xf9401fb1
.word 0xf9445231
.word 0xb4000051
.word 0xd63f0220
bl _p_106
.word 0xf9006ba0
.word 0xf9401fb1
.word 0xf9446a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9006fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000d00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1872]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf9406fa1
.word 0xf90063a1
.word 0xf9001001
.word 0xf90067a0
.word 0x91008000
bl _p_2
.word 0xf94063a0
.word 0xf94067a1
.word 0xf9406ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1880]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1888]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1896]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_107
.word 0xf9401fb1
.word 0xf9451e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400001c
.word 0xf9004ba0
.word 0xf9404ba0
.word 0xf90043a0
.word 0xf9401ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000600
.word 0x91004000
.word 0xf94043a1
bl _p_108
.word 0xf9401fb1
.word 0xf9457231
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf9005ba0
.word 0xf9405ba0
.word 0xb4000060
.word 0xf9405ba0
bl _p_51
.word 0x14000019
.loc 5 71 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf945ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000200
.word 0x91004000
bl _p_109
.word 0xf9401fb1
.word 0xf945ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf945fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8d27bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_56:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1904]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_57:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap
vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap:
.loc 7 143 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1912]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800000
.word 0xf9001b1f
.loc 7 145 0
.word 0xf94017b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800000
.word 0xf9001f1f
.loc 7 153 0
.word 0xf94017b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1920]
.word 0xf9002ba0
.word 0xf9002300
.word 0x91010300
bl _p_2
.word 0xf9402ba0
.loc 7 147 0
.word 0xf94017b1
.word 0xf940ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
bl _p_110
.word 0xf94017b1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.loc 7 148 0
.word 0xf94017b1
.word 0xf940f631
.word 0xb4000051
.word 0xd63f0220
.loc 7 149 0
.word 0xf94017b1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9400fa0
.word 0xf90027a0
.word 0xf9001700
.word 0x9100a300
bl _p_2
.word 0xf94027a0
.loc 7 150 0
.word 0xf94017b1
.word 0xf9413231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94013a0
.word 0xf90023a0
.word 0xf9001f00
.word 0x9100e300
bl _p_2
.word 0xf94023a0
.loc 7 151 0
.word 0xf94017b1
.word 0xf9415e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_58:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation:
.loc 7 0 0 prologue_end
.word 0xa9ad7bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xf90023ba
.word 0xaa0003f8
.word 0xf90027a1
.word 0xf9002ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1928]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf90053bf
.word 0x3902a3bf
.word 0x3902c3bf
.word 0x910223a0
.word 0xd2800000
.word 0xf90047a0
.word 0xf9004ba0
.word 0xf9004fa0
.word 0xd2800013
.word 0xd280001a
.word 0x3902e3bf
.word 0x390303bf
.word 0xf9402fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1936]
.word 0xd2800401
.word 0xd2800401
bl _p_8
.word 0xf9008ba0
bl _p_111
.word 0xf9402fb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xaa1803e1
.word 0xf9000ef8
.word 0x91006000
bl _p_2
.loc 7 157 0
.word 0xf9402fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.loc 7 158 0
.word 0xf9402fb1
.word 0xf940f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf90067a0
.word 0xf94067a0
.word 0xf9006ba0
.word 0xf94067a0
.word 0xeb1f001f
.word 0x54000180
.word 0xf94067a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1944]
.word 0xeb01001f
.word 0x54000040
.word 0xf9006bbf
.word 0xf9406ba0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f97e0
.word 0xaa0003f4
.word 0xaa1403e0
.word 0x34000160
.loc 7 159 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9417a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90053bf
.word 0x14000209
.loc 7 160 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
bl _p_112
.word 0xf90093a0
.word 0xf9402fb1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94093a0
.word 0xf9008fa0
.word 0xaa0003f6
.loc 7 161 0
.word 0xf9402fb1
.word 0xf941da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408fa0
.word 0xaa0003e1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1952]
bl _p_12
.word 0xf9008ba0
.word 0x53001c00
.word 0xf9402fb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
.word 0x3902a3a0
.word 0x3942a3a0
.word 0x34000160
.loc 7 162 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90053bf
.word 0x140001d9
.loc 7 165 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9426231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a2
.word 0xaa1803e0
.word 0xf9402301
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9419c50
.word 0xd63f0200
.word 0xf9006fa0
.word 0xf9402fb1
.word 0xf9429231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9406fa0
.word 0xb4000180
.word 0xf9406fa0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1960]
.word 0xeb01001f
.word 0x10000011
.word 0x540039e1
.word 0xf9406fa0
.word 0xaa0003f5
.loc 7 167 0
.word 0xf9402fb1
.word 0xf942de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xd2800000
.word 0xeb1f02bf
.word 0x9a9f17e0
.word 0x3902c3a0
.word 0x3942c3a0
.word 0x34000380
.loc 7 168 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9431a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9008fa0
.word 0xaa1803e0
.word 0xf9402300
.word 0xf90093a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1968]
bl _p_22
.word 0xf9408fa1
.word 0xf94093a2
.word 0xf9008ba0
bl _p_113
.word 0xf9402fb1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
.word 0xaa0003f5
.loc 7 170 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9438631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xd2800000
.word 0xf9000aff
.loc 7 171 0
.word 0xf9402fb1
.word 0xf943a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf943b231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9401700
.word 0xf9400801
.word 0x9101c3a0
.word 0xaa0003e8
.word 0xaa0103e0
.word 0xf940003e
bl _p_47
.word 0xf9402fb1
.word 0xf943e231
.word 0xb4000051
.word 0xd63f0220
.word 0x9101c3a0
.word 0x910223a0
.word 0xf9403ba0
.word 0xf90047a0
.word 0xf9403fa0
.word 0xf9004ba0
.word 0xf94043a0
.word 0xf9004fa0
.word 0x1400004c
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9442631
.word 0xb4000051
.word 0xd63f0220
.word 0x910223a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_48
.word 0xf90093a0
.word 0xf9402fb1
.word 0xf9444e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94093a0
.word 0xf9008fa0
.word 0xaa0003f3
.loc 7 172 0
.word 0xf9402fb1
.word 0xf9446a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 173 0
.word 0xf9402fb1
.word 0xf9447a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408fa0
.word 0xaa0003e1
.word 0xf9400800
.word 0xaa1603e1
.word 0xaa1603e1
bl _p_12
.word 0x53001c00
.word 0xf9008ba0
.word 0xf9402fb1
.word 0xf944aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
.word 0xaa0003fa
.word 0xaa0003e1
.word 0x340002e0
.loc 7 174 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf944da31
.word 0xb4000051
.word 0xd63f0220
.loc 7 175 0
.word 0xf9402fb1
.word 0xf944ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1303e0
.word 0xf9000af3
.word 0x910042e0
bl _p_2
.loc 7 176 0
.word 0xf9402fb1
.word 0xf9450e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400001e
.loc 7 178 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9453231
.word 0xb4000051
.word 0xd63f0220
.loc 7 171 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9455231
.word 0xb4000051
.word 0xd63f0220
.word 0x910223a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_54
.word 0x53001c00
.word 0xf9008ba0
.word 0xf9402fb1
.word 0xf9457e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
.word 0x35fff420
.word 0x94000002
.word 0x1400000d
.word 0xf90083be
.word 0x910223a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #728]
bl _p_55
.word 0xf9402fb1
.word 0xf945b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083be
.word 0xd61f03c0
.loc 7 180 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf945de31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xf9400ae0
.word 0xd2800001
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0x3902e3a0
.word 0x3942e3a0
.word 0x34000460
.loc 7 181 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9461e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 182 0
.word 0xf9402fb1
.word 0xf9462e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1976]
.word 0xaa1603e1
.word 0xaa1603e1
bl _p_85
.word 0xf9008ba0
.word 0xf9402fb1
.word 0xf9465a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408ba0
bl _p_114
.word 0xf9402fb1
.word 0xf9467231
.word 0xb4000051
.word 0xd63f0220
.loc 7 183 0
.word 0xf9402fb1
.word 0xf9468231
.word 0xb4000051
.word 0xd63f0220
.word 0x140000be
.loc 7 185 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf946a631
.word 0xb4000051
.word 0xd63f0220
.loc 7 186 0
.word 0xf9402fb1
.word 0xf946b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xf9400ae0
.word 0x3941e000
.word 0x390303a0
.word 0x394303a0
.word 0x34000460
.loc 7 187 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf946ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90077b5
.word 0xf94077a0
.word 0xb4000180
.word 0xf94077a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1960]
.word 0xeb01001f
.word 0x10000011
.word 0x540016e1
.word 0xf94077a2
.word 0xd2800020
.word 0xaa0203e0
.word 0xd2800021
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf9475231
.word 0xb4000051
.word 0xd63f0220
.word 0x14000022
.loc 7 189 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9477631
.word 0xb4000051
.word 0xd63f0220
.word 0xf90073b5
.word 0xf94073a0
.word 0xb4000180
.word 0xf94073a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #1960]
.word 0xeb01001f
.word 0x10000011
.word 0x540012a1
.word 0xf94073a2
.word 0xd2800000
.word 0xaa0203e0
.word 0xd2800001
.word 0xf9400042
.word 0xf9418c50
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf947da31
.word 0xb4000051
.word 0xd63f0220
.loc 7 191 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf947fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xd2800020
.word 0xaa1503e0
.word 0xd2800021
.word 0xf94002a2
.word 0xf9418850
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf9482631
.word 0xb4000051
.word 0xd63f0220
.loc 7 193 0
.word 0xf9402fb1
.word 0xf9483631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd2800040
.word 0xd2800040
bl _p_115
.word 0xf90097a0
.word 0xf9402fb1
.word 0xf9485a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94097a0
.word 0xf90093a0
.word 0xf9001b00
.word 0x9100c300
bl _p_2
.word 0xf94093a0
.loc 7 194 0
.word 0xf9402fb1
.word 0xf9488231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9401b00
.word 0xf9008fa0
.word 0xaa1703e0
.word 0xeb1f02ff
.word 0x10000011
.word 0x54000ac0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1520]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf9001017
.word 0xf9008ba0
.word 0x91008000
bl _p_2
.word 0xf9408ba1
.word 0xf9408fa2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1984]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1992]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2000]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_77
.word 0xf9402fb1
.word 0xf9492e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 199 0
.word 0xf9402fb1
.word 0xf9493e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xaa1803e0
.word 0xf9401b01
.word 0xaa1503e0
.word 0xf94002a2
.word 0xf9418450
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf9496a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 200 0
.word 0xf9402fb1
.word 0xf9497a31
.word 0xb4000051
.word 0xd63f0220
.loc 7 202 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9499a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xf90053b5
.loc 7 203 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf949c231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xf9402fb1
.word 0xf949d631
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xf94023ba
.word 0x910003bf
.word 0xa8d37bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_59:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor
vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2008]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_5a:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext
vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext:
.loc 7 0 0 prologue_end
.word 0xa9ae7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xf9001ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2016]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd280001a
.word 0x9101c3a0
.word 0xf9003bbf
.word 0xd2800019
.word 0xf9003fbf
.word 0xf90043bf
.word 0xf9401fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xb9804800
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x3400005a
.word 0x14000002
.word 0x1400005a
.loc 7 73 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 75 0
.word 0xf9401fb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
bl _p_99
.word 0xf90067a0
.word 0xf9401fb1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94067a1
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0103e0
.word 0xf940003e
bl _p_100
.word 0xf94047be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0x9101a3a0
.word 0x9101c3a0
.word 0xf94037a0
.word 0xf9003ba0
.word 0x9101c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_101
.word 0x53001c00
.word 0xf90063a0
.word 0xf9401fb1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0x35000a00
.word 0xf9401ba0
.word 0xd2800001
.word 0xd2800017
.word 0xd2800001
.word 0xd2800001
.word 0xd280001a
.word 0xb900481f
.word 0xf9401fb1
.word 0xf9415631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x9101c3a1
.word 0x910163a1
.word 0xf9403ba1
.word 0xf9002fa1
.word 0x910163a1
.word 0x91010001
.word 0xaa0103e0
.word 0xf9402fa2
.word 0xf90063a2
.word 0xf9000022
bl _p_2
.word 0xf94063a0
.word 0xf9401ba0
.word 0xf9003fa0
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x540023a0
.word 0x91004000
.word 0x9101c3a1
.word 0x9101e3a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2024]
bl _p_116
.word 0xf9401fb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000108
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x91010000
.word 0x910143a1
.word 0xf9400000
.word 0xf9002ba0
.word 0x910143a0
.word 0x9101c3a0
.word 0xf9402ba0
.word 0xf9003ba0
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54001f80
.word 0x91010000
.word 0xf900001f
.word 0xf9401ba0
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800018
.word 0xf2bffff8
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001a
.word 0xf2bffffa
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900481e
.word 0x9101c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_103
.word 0xf9008fa0
.word 0xf9401fb1
.word 0xf9428e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9408fa1
.word 0xaa0103f9
.word 0x9101c3a0
.word 0xf9003bbf
.word 0xf9401ba0
.word 0xaa0103e2
.word 0xf9008ba2
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf9408ba0
.word 0xf9401ba0
.word 0xf9401ba1
.word 0xf9401c21
.word 0xf90087a1
.word 0xf9001801
.word 0x9100c000
bl _p_2
.word 0xf94087a0
.word 0xf9401ba0
.word 0xd2800001
.word 0xf9001c1f
.loc 7 78 0
.word 0xf9401fb1
.word 0xf942f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf9007fa0
.word 0xf9401ba0
.word 0xf9401800
bl _p_104
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9432631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407fa0
.word 0xf94083a1
.word 0xf9007ba1
.word 0xf9000801
.word 0x91004000
bl _p_2
.word 0xf9407ba0
.loc 7 79 0
.word 0xf9401fb1
.word 0xf9435231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf9400800
.word 0xf90077a0
.word 0xd2800000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1840]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xaa0003e1
.word 0xf94077a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1848]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1856]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1864]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_105
.word 0xf9401fb1
.word 0xf943ea31
.word 0xb4000051
.word 0xd63f0220
.loc 7 80 0
.word 0xf9401fb1
.word 0xf943fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9401800
.word 0xf90073a0
.word 0x910183a0
.word 0xf90047a0
bl _p_26
.word 0xf94047be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf9442e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a0
.word 0x910183a1
.word 0x91008000
.word 0xf94033a1
.word 0xf9000001
.loc 7 84 0
.word 0xf9401fb1
.word 0xf9445231
.word 0xb4000051
.word 0xd63f0220
bl _p_106
.word 0xf9006ba0
.word 0xf9401fb1
.word 0xf9446a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9401400
.word 0xf9006fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000d00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #1872]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf9406fa1
.word 0xf90063a1
.word 0xf9001001
.word 0xf90067a0
.word 0x91008000
bl _p_2
.word 0xf94063a0
.word 0xf94067a1
.word 0xf9406ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2032]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2040]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2048]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa0203e0
.word 0xf940005e
bl _p_107
.word 0xf9401fb1
.word 0xf9451e31
.word 0xb4000051
.word 0xd63f0220
.word 0x1400001c
.word 0xf9004ba0
.word 0xf9404ba0
.word 0xf90043a0
.word 0xf9401ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000600
.word 0x91004000
.word 0xf94043a1
bl _p_108
.word 0xf9401fb1
.word 0xf9457231
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf9005ba0
.word 0xf9405ba0
.word 0xb4000060
.word 0xf9405ba0
bl _p_51
.word 0x14000019
.loc 7 89 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf945ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900481e
.word 0xf9401ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000200
.word 0x91004000
bl _p_109
.word 0xf9401fb1
.word 0xf945ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf945fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8d27bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_5b:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2056]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_5c:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__c__DisplayClass31_0__ctor
vitasa_C_VitaSite__c__DisplayClass31_0__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2064]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_5d:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0
vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0:
.loc 11 137 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2072]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400800
bl _p_117
.word 0xf9001ba0
.word 0xf9400fb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9400fb1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_5e:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__FetchSitesListd__31__ctor
vitasa_C_VitaSite__FetchSitesListd__31__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2080]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_5f:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__FetchSitesListd__31_MoveNext
vitasa_C_VitaSite__FetchSitesListd__31_MoveNext:
.loc 11 0 0 prologue_end
.word 0xa9a77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xf9002ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2088]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xb900b3bf
.word 0xf9005fbf
.word 0x9102a3a0
.word 0xf90057bf
.word 0xd280001a
.word 0xf90063bf
.word 0x910283a0
.word 0xf90053bf
.word 0xd2800019
.word 0xd2800018
.word 0xf90067bf
.word 0xf9402fb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xb9808000
.word 0xb900b3a0
.word 0xb980b3a0
.word 0x34000100
.word 0x14000001
.word 0xb980b3a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x54000060
.word 0x14000003
.word 0x140000bc
.word 0x14000101
.loc 11 121 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.loc 11 122 0
.word 0xf9402fb1
.word 0xf940d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2096]
.word 0xf900bba1
.word 0xf9001401
.word 0x9100a000
bl _p_2
.word 0xf940bba0
.loc 11 126 0
.word 0xf9402fb1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf90073a0
.word 0xf9402ba0
.word 0xf9401400
.word 0xf900b7a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2104]
.word 0xd2800901
.word 0xd2800901
bl _p_8
.word 0xf940b7a1
.word 0xf900b3a0
bl _p_118
.word 0xf9402fb1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b3a0
bl _p_119
.word 0xaa0003f3
.word 0xf9402fb1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000173
.word 0xf9400260
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2112]
.word 0xeb01001f
.word 0x10000011
.word 0x54005e61
.word 0xaa1303e0
.word 0xf94073a0
.word 0xf9001813
.word 0x9100c000
bl _p_2
.loc 11 127 0
.word 0xf9402fb1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9401802

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2120]
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9405c50
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.loc 11 128 0
.word 0xf9402fb1
.word 0xf9420231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9401802

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2128]
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9406c50
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf9423631
.word 0xb4000051
.word 0xd63f0220
.loc 11 131 0
.word 0xf9402fb1
.word 0xf9424631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9401801
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9403830
.word 0xd63f0200
.word 0xf900b7a0
.word 0xf9402fb1
.word 0xf9427231
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b7a1
.word 0x910263a0
.word 0xf9006ba0
.word 0xaa0103e0
.word 0xf940003e
bl _p_120
.word 0xf9406bbe
.word 0xf90003c0
.word 0xf9402fb1
.word 0xf942a231
.word 0xb4000051
.word 0xd63f0220
.word 0x910263a0
.word 0x9102a3a0
.word 0xf9404fa0
.word 0xf90057a0
.word 0x9102a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2136]
bl _p_121
.word 0x53001c00
.word 0xf900b3a0
.word 0xf9402fb1
.word 0xf942de31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b3a0
.word 0x35000a20
.word 0xf9402ba0
.word 0xd2800001
.word 0xb900ebbf
.word 0xb980eba1
.word 0xb980eba2
.word 0xb900b3a2
.word 0xb9008001
.word 0xf9402fb1
.word 0xf9431231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x9102a3a1
.word 0x910223a1
.word 0xf94057a1
.word 0xf90047a1
.word 0x910223a1
.word 0x9101c001
.word 0xaa0103e0
.word 0xf94047a2
.word 0xf900b3a2
.word 0xf9000022
bl _p_2
.word 0xf940b3a0
.word 0xf9402ba0
.word 0xf90063a0
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54004f80
.word 0x91004000
.word 0x9102a3a1
.word 0x910303a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2144]
bl _p_122
.word 0xf9402fb1
.word 0xf9438a31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000265
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf943ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x9101c000
.word 0x910203a1
.word 0xf9400000
.word 0xf90043a0
.word 0x910203a0
.word 0x9102a3a0
.word 0xf94043a0
.word 0xf90057a0
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54004b60
.word 0x9101c000
.word 0xf900001f
.word 0xf9402ba0
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800017
.word 0xf2bffff7
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900b3be
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900801e
.word 0x9102a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2136]
bl _p_123
.word 0xf900bba0
.word 0xf9402fb1
.word 0xf9444e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940bba1
.word 0xaa0103fa
.word 0x9102a3a0
.word 0xf90057bf
.word 0xf9402ba0
.word 0xaa0103e2
.word 0xf900b7a2
.word 0xf9002001
.word 0x91010000
bl _p_2
.word 0xf940b7a0
.word 0xf9402ba0
.word 0xf9402ba1
.word 0xf9402021
.word 0xf900b3a1
.word 0xf9001c01
.word 0x9100e000
bl _p_2
.word 0xf940b3a0
.word 0xf9402ba0
.word 0xd2800001
.word 0xf900201f
.word 0xb980b3a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x54000040
.word 0x14000002
.word 0x14000037
.loc 11 132 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf944e231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf900c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2152]
.word 0xd2800301
.word 0xd2800301
bl _p_8
.word 0xf900c7a0
bl _p_124
.word 0xf9402fb1
.word 0xf9451a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940c3a0
.word 0xf940c7a1
.word 0xf900bfa1
.word 0xf9002401
.word 0x91012000
bl _p_2
.word 0xf940bfa0
.loc 11 134 0
.word 0xf9402fb1
.word 0xf9454631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9402400
.word 0xf900b7a0
.word 0xf9402ba0
.word 0xf9401c01
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9403c30
.word 0xd63f0200
.word 0xf900bba0
.word 0xf9402fb1
.word 0xf9457e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b7a0
.word 0xf940bba1
.word 0xf900b3a1
.word 0xf9000801
.word 0x91004000
bl _p_2
.word 0xf940b3a0
.word 0xb980b3a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x54000040
.word 0x14000002
.word 0x14000085
.loc 11 135 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf945d631
.word 0xb4000051
.word 0xd63f0220
.loc 11 137 0
.word 0xf9402fb1
.word 0xf945e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9402400
.word 0xf900c3a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54003ae0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2160]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf940c3a1
.word 0xf900bfa1
.word 0xf9001001
.word 0xf900bba0
.word 0x91008000
bl _p_2
.word 0xf940bba0
.word 0xf940bfa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2168]
.word 0xf9001401

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2176]
.word 0xf9002001

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2184]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0xd2800001
.word 0x3901801f

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2192]
bl _p_125
.word 0xf900b7a0
.word 0xf9402fb1
.word 0xf9469e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b7a1
.word 0x910243a0
.word 0xf9006ba0
.word 0xaa0103e0
.word 0xf940003e
bl _p_100
.word 0xf9406bbe
.word 0xf90003c0
.word 0xf9402fb1
.word 0xf946ce31
.word 0xb4000051
.word 0xd63f0220
.word 0x910243a0
.word 0x910283a0
.word 0xf9404ba0
.word 0xf90053a0
.word 0x910283a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_101
.word 0x53001c00
.word 0xf900b3a0
.word 0xf9402fb1
.word 0xf9470a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b3a0
.word 0x35000a80
.word 0xf9402ba0
.word 0xd2800021
.word 0xd280003e
.word 0xb900dbbe
.word 0xb980dba1
.word 0xb980dba2
.word 0xb900b3a2
.word 0xb9008001
.word 0xf9402fb1
.word 0xf9474231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x910283a1
.word 0x9101e3a1
.word 0xf94053a1
.word 0xf9003fa1
.word 0x9101e3a1
.word 0x9101e001
.word 0xaa0103e0
.word 0xf9403fa2
.word 0xf900b3a2
.word 0xf9000022
bl _p_2
.word 0xf940b3a0
.word 0xf9402ba0
.word 0xf90063a0
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54002e00
.word 0x91004000
.word 0x910283a1
.word 0x910303a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2200]
bl _p_126
.word 0xf9402fb1
.word 0xf947ba31
.word 0xb4000051
.word 0xd63f0220
.word 0x940000eb
.word 0x94000105
.word 0x14000157
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf947e631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x9101e000
.word 0x9101c3a1
.word 0xf9400000
.word 0xf9003ba0
.word 0x9101c3a0
.word 0x910283a0
.word 0xf9403ba0
.word 0xf90053a0
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x540029a0
.word 0x9101e000
.word 0xf900001f
.word 0xf9402ba0
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800016
.word 0xf2bffff6
.word 0x92800001
.word 0xf2bfffe1
.word 0x92800001
.word 0xf2bfffe1
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900b3be
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900801e
.word 0x910283a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1824]
bl _p_103
.word 0xf900bfa0
.word 0xf9402fb1
.word 0xf9488631
.word 0xb4000051
.word 0xd63f0220
.word 0xf940bfa1
.word 0xaa0103f9
.word 0x910283a0
.word 0xf90053bf
.word 0xf9402ba0
.word 0xaa0103e2
.word 0xf900bba2
.word 0xf9003001
.word 0x91018000
bl _p_2
.word 0xf940bba0
.word 0xf9402ba0
.word 0xf9402ba1
.word 0xf9403021
.word 0xf900b7a1
.word 0xf9002801
.word 0x91014000
bl _p_2
.word 0xf940b7a0
.word 0xf9402ba0
.word 0xd2800001
.word 0xf900301f
.loc 11 140 0
.word 0xf9402fb1
.word 0xf948ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9402ba1
.word 0xf9402821
.word 0xf900b3a1
.word 0xf9002c01
.word 0x91016000
bl _p_2
.word 0xf940b3a0
.loc 11 141 0
.word 0xf9402fb1
.word 0xf9491e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9402815
.word 0xaa1503f4
.word 0xeb1f02bf
.word 0x54000180
.word 0xf94002a0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2208]
.word 0xeb01001f
.word 0x54000060
.word 0xd2800014
.word 0x14000001
.word 0xaa1403e0
.word 0xd2800000
.word 0xeb1f029f
.word 0x9a9f97e0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x34000dc0
.loc 11 142 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9499a31
.word 0xb4000051
.word 0xd63f0220
.loc 11 143 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf949ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf949ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf900b7a0
.word 0xf9402ba0
.word 0xf9402800
bl _p_65
.word 0xf900bfa0
.word 0xf9402fb1
.word 0xf949f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf940bfa0
bl _p_127
.word 0xf900bba0
.word 0xf9402fb1
.word 0xf94a0e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b7a0
.word 0xf940bba1
.word 0xf900b3a1
.word 0xf9002c01
.word 0x91016000
bl _p_2
.word 0xf940b3a0
.word 0xf9402fb1
.word 0xf94a3a31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000035
.word 0xf9007ba0
.word 0xf9407ba0
.word 0xf900bba0
.loc 11 144 0
.word 0xf9402fb1
.word 0xf94a5a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940bba0
.word 0xf90067a0
.word 0xf9402ba0
.word 0xf94067a1
.word 0xf900b7a1
.word 0xf9003401
.word 0x9101a000
bl _p_2
.word 0xf940b7a0
.loc 11 145 0
.word 0xf9402fb1
.word 0xf94a8e31
.word 0xb4000051
.word 0xd63f0220
.loc 11 146 0
.word 0xf9402fb1
.word 0xf94a9e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9403401
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9404830
.word 0xd63f0200
.word 0xf900b3a0
.word 0xf9402fb1
.word 0xf94aca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf940b3a0
bl _p_114
.word 0xf9402fb1
.word 0xf94ae231
.word 0xb4000051
.word 0xd63f0220
.loc 11 147 0
.word 0xf9402fb1
.word 0xf94af231
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf900a7a0
.word 0xf940a7a0
.word 0xb4000060
.word 0xf940a7a0
bl _p_51
.word 0x14000001
.loc 11 148 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf94b2e31
.word 0xb4000051
.word 0xd63f0220
.loc 11 151 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf94b4e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9402c00
.word 0xf9005fa0
.word 0x94000003
.word 0x9400001d
.word 0x14000053
.word 0xf9009bbe
.word 0xb980b3a0
.word 0xd2800001
.word 0x6b1f001f
.word 0x540002aa
.word 0xf9402ba0
.word 0xf9402400
.word 0xf9400800
.word 0xb4000220
.word 0xf9402ba0
.word 0xf9402400
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1104]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf94bca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9409bbe
.word 0xd61f03c0
.word 0xf9009fbe
.word 0xb980b3a0
.word 0xd2800001
.word 0x6b1f001f
.word 0x5400026a
.word 0xf9402ba0
.word 0xf9401c00
.word 0xb4000200
.word 0xf9402ba0
.word 0xf9401c01
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1104]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402fb1
.word 0xf94c2e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9409fbe
.word 0xd61f03c0
.word 0xf9007fa0
.word 0xf9407fa0
.word 0xf90067a0
.word 0xf9402ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900801e
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000720
.word 0x91004000
.word 0xf94067a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1128]
bl _p_128
.word 0xf9402fb1
.word 0xf94c9231
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf900aba0
.word 0xf940aba0
.word 0xb4000060
.word 0xf940aba0
bl _p_51
.word 0x1400001d
.loc 11 154 0
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf94cce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x92800021
.word 0xf2bfffe1
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900801e
.word 0xf9402ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x540002c0
.word 0x91004000
.word 0xf9405fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #1128]
bl _p_129
.word 0xf9402fb1
.word 0xf94d1e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf94d2e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8d97bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_60:
.text
	.align 4
	.no_dead_strip vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2216]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_61:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor
vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2224]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_62:
.text
	.align 4
	.no_dead_strip vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs
vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs:
.loc 7 195 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2232]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.loc 7 196 0
.word 0xf94017b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400f40
.word 0xf9401c00
.word 0xf9401800
.word 0xaa1a03e1
.word 0xf9400b41
.word 0xf90023a1
.word 0xf9000c01
.word 0x91006000
bl _p_2
.word 0xf94023a0
.loc 7 197 0
.word 0xf94017b1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400f40
.word 0xf9401c03

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #760]
.word 0xaa1a03e0
.word 0xf9400f40
.word 0xf9401c02
.word 0xaa0303e0
.word 0xf9400063
.word 0xf9414470
.word 0xd63f0200
.word 0xf94017b1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.loc 7 198 0
.word 0xf94017b1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_63:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2240]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402bb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xaa1303e1
.word 0xf90037a0
.word 0xb4000073
.word 0xf94037a0
bl _p_51
.word 0xf94037a0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9101a340
.word 0xf9403740
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xb50003c0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91008340
.word 0xf9401340
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb40001a0
.word 0xaa1503e0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b41
.word 0xaa1503e0
.word 0xd63f0020
.word 0x14000032
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000028
.word 0xaa1703e0
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800019
.word 0xaa1703e0
.word 0xaa1903e0
.word 0x93407f20
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000509
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f6
.word 0xaa1603e1
.word 0xaa0103e0
.word 0xf9003fa1
.word 0xf9400c30
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9403fa0
.word 0xf9003ba1
.word 0xf9402bb1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f4
.word 0xaa1903e0
.word 0x11000720
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xaa1803e1
.word 0x6b18001f
.word 0x54fffc0b
.word 0xaa1403e0
.word 0xaa1403e0
.word 0xf9402bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_65:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF:
.file 15 "/Library/Frameworks/Xamarin.iOS.framework/Versions/10.10.0.36/src/mono/mcs/class/corlib/System/Array.cs"
.loc 15 78 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9002baf
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2256]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf90043a0
.word 0x910103a0
.word 0xd2800000
.word 0xf90023a0
.word 0xf90027a0
.word 0x910103a0
.word 0xf9003fa0
.word 0xf9402ba0
bl _p_131
.word 0xaa0003ef
.word 0xf9403fa0
.word 0xf94043a1
bl _p_132
.word 0x910103a0
.word 0x9100c3a0
.word 0xf94023a0
.word 0xf9001ba0
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf9400fb1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
bl _p_131
.word 0xd2800401
.word 0xd2800401
bl _p_8
.word 0x9100c3a1
.word 0xf90033a0
.word 0x91004001
.word 0xaa0103e0
.word 0xf9401ba2
.word 0xf9003ba2
.word 0xf9000022
.word 0xf90037a0
bl _p_2
.word 0xf94033a0
.word 0xf94037a1
.word 0xf9403ba2
.word 0x91002021
.word 0xf9401fa2
.word 0xf9000022
.word 0xf9400fb1
.word 0xf9411631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_66:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_get_Count
System_Array_InternalArray__ICollection_get_Count:
.loc 15 68 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2264]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xb9801800
.word 0xf9001ba0
.word 0xf9400fb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9400fb1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_67:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_get_IsReadOnly
System_Array_InternalArray__ICollection_get_IsReadOnly:
.loc 15 73 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2272]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020
.word 0xd2800020
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_68:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Clear
System_Array_InternalArray__ICollection_Clear:
.loc 15 83 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2280]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2967cc0
.word 0xd2967cc0
bl _p_133
.word 0xaa0003e1
.word 0xd2801ac0
.word 0xf2a04000
.word 0xd2801ac0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.word 0xf9400fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_69:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Add_T_REF_T_REF
System_Array_InternalArray__ICollection_Add_T_REF_T_REF:
.loc 15 88 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9001faf
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2288]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd29682c0
.word 0xd29682c0
bl _p_133
.word 0xaa0003e1
.word 0xd2801ac0
.word 0xf2a04000
.word 0xd2801ac0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.word 0xf94013b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_6a:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
System_Array_InternalArray__ICollection_Remove_T_REF_T_REF:
.loc 15 93 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9001faf
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2296]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd29682c0
.word 0xd29682c0
bl _p_133
.word 0xaa0003e1
.word 0xd2801ac0
.word 0xf2a04000
.word 0xd2801ac0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.word 0xf94013b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_6b:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
System_Array_InternalArray__ICollection_Contains_T_REF_T_REF:
.loc 15 98 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xf90027af
.word 0xaa0003fa
.word 0xf90017a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2304]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xd2800018
.word 0xf9002bbf
.word 0xf9401bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400340
.word 0x3940b000
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x540002ad
.loc 15 99 0
.word 0xf9401bb1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2968a40
.word 0xd2968a40
bl _p_133
bl _p_134
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf940d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a1
.word 0xd2801c40
.word 0xf2a04000
.word 0xd2801c40
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 15 101 0
.word 0xf9401bb1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xb9801b40
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xaa0003f9
.loc 15 102 0
.word 0xf9401bb1
.word 0xf9413631
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800018
.word 0x14000048
.loc 15 104 0
.word 0xf9401bb1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0x910143a0
.word 0xf94027a0
bl _p_135
.word 0x93407f00
.word 0xd37df000
.word 0x8b000340
.word 0x91008000
.word 0xf9400000
.word 0xf9002ba0
.loc 15 105 0
.word 0xf9401bb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a0
.word 0xb50001c0
.loc 15 106 0
.word 0xf9401bb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xb5000440
.loc 15 107 0
.word 0xf9401bb1
.word 0xf941ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020
.word 0xd2800020
.word 0x14000038
.loc 15 113 0
.word 0xf9401bb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0x9100a3a0
.word 0xf9402ba1
.word 0xf94017a2
.word 0xaa0203e0
.word 0xf9400042
.word 0xf9402c50
.word 0xd63f0200
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x34000100
.loc 15 114 0
.word 0xf9401bb1
.word 0xf9422231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020
.word 0xd2800020
.word 0x1400001e
.loc 15 102 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1903e0
.word 0x6b19031f
.word 0x54fff5cb
.loc 15 118 0
.word 0xf9401bb1
.word 0xf9429a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xd2800000
.word 0xf9401bb1
.word 0xf942b231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_6c:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int:
.loc 15 123 0 prologue_end
.word 0xa9b17bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xf90013b6
.word 0xa902e7b8
.word 0xf9001fba
.word 0xf9006baf
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xf90023a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2312]
.word 0xf90027b0
.word 0xf9400a11
.word 0xf9002bb1
.word 0xf94027b1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb50001f9
.loc 15 124 0
.word 0xf94027b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xd285bee0
.word 0xd285bee0
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 15 128 0
.word 0xf94027b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9400300
.word 0x3940b000
.word 0xf90073a0
.word 0xf94027b1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x540002ad
.loc 15 129 0
.word 0xf94027b1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2968a40
.word 0xd2968a40
bl _p_133
bl _p_134
.word 0xf90073a0
.word 0xf94027b1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a1
.word 0xd2801c40
.word 0xf2a04000
.word 0xd2801c40
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 15 130 0
.word 0xf94027b1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xb98043a0
.word 0xf90033a0
.word 0xaa1803f6
.word 0xd2800000
.word 0xf9400b15
.word 0xeb1f02bf
.word 0x54000060
.word 0xb98002b4
.word 0x14000002
.word 0xb9801ad4
.word 0xf94027b1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0xb140000
.word 0xf90037a0
.word 0xaa1903e0
.word 0xd2800000
.word 0xf9400b20
.word 0xf9003ba0
.word 0xeb1f001f
.word 0x54000080
.word 0xf9403ba0
.word 0xb980041a
.word 0x14000002
.word 0xd280001a
.word 0xf94027b1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9003fb9
.word 0xd2800000
.word 0xf9403fa0
.word 0xf9400800
.word 0xf90043a0
.word 0xeb1f001f
.word 0x540000a0
.word 0xf94043a0
.word 0xb9800000
.word 0xf90047a0
.word 0x14000004
.word 0xf9403fa0
.word 0xb9801800
.word 0xf90047a0
.word 0xf94047a0
.word 0xf90047a0
.word 0xf94027b1
.word 0xf9421e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94047a0
.word 0xb000341
.word 0xf94037a0
.word 0x6b01001f
.word 0x540001ed
.loc 15 131 0
.word 0xf94027b1
.word 0xf9424231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2969540
.word 0xd2969540
bl _p_133
.word 0xaa0003e1
.word 0xd2800e60
.word 0xf2a04000
.word 0xd2800e60
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 15 134 0
.word 0xf94027b1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400320
.word 0x3940b000
.word 0xf90073a0
.word 0xf94027b1
.word 0xf9429a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a0
.word 0xd2800021
.word 0xd280003e
.word 0x6b1e001f
.word 0x540002ad
.loc 15 135 0
.word 0xf94027b1
.word 0xf942be31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2968a40
.word 0xd2968a40
bl _p_133
bl _p_134
.word 0xf90073a0
.word 0xf94027b1
.word 0xf942e231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a1
.word 0xd2801c40
.word 0xf2a04000
.word 0xd2801c40
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 15 136 0
.word 0xf94027b1
.word 0xf9430e31
.word 0xb4000051
.word 0xd63f0220
.word 0xb98043a0
.word 0xd2800001
.word 0x6b1f001f
.word 0x5400034a
.loc 15 137 0
.word 0xf94027b1
.word 0xf9432e31
.word 0xb4000051
.word 0xd63f0220
.word 0xd284f2c0
.word 0xd284f2c0
bl _p_133
.word 0xf90073a0
.word 0xd296ada0
.word 0xd296ada0
bl _p_133
bl _p_134
.word 0xf90077a0
.word 0xf94027b1
.word 0xf9436231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94073a1
.word 0xf94077a2
.word 0xd2800ea0
.word 0xf2a04000
.word 0xd2800ea0
.word 0xf2a04000
bl _mono_create_corlib_exception_2
bl _p_51
.loc 15 140 0
.word 0xf94027b1
.word 0xf9439231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9004bb8
.word 0xaa1803e0
.word 0xd2800000
.word 0xf9400b00
.word 0xf9004fa0
.word 0xeb1f001f
.word 0x540000a0
.word 0xf9404fa0
.word 0xb9800400
.word 0xf90053a0
.word 0x14000002
.word 0xf90053bf
.word 0xf94053a0
.word 0xf90053a0
.word 0xf94027b1
.word 0xf943da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90057b9
.word 0xb98043a0
.word 0xf9005ba0
.word 0xf9005fb8
.word 0xd2800000
.word 0xf9405fa0
.word 0xf9400800
.word 0xf90063a0
.word 0xeb1f001f
.word 0x540000a0
.word 0xf94063a0
.word 0xb9800000
.word 0xf90067a0
.word 0x14000004
.word 0xf9405fa0
.word 0xb9801800
.word 0xf90067a0
.word 0xf94067a0
.word 0xf90067a0
.word 0xf94027b1
.word 0xf9443631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9404ba0
.word 0xf94053a1
.word 0xf94057a2
.word 0xf9405ba3
.word 0xf94067a4
bl _p_136
.loc 15 141 0
.word 0xf94027b1
.word 0xf9445e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9446e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94157b4
.word 0xf94013b6
.word 0xa942e7b8
.word 0xf9401fba
.word 0x910003bf
.word 0xa8cf7bfd
.word 0xd65f03c0

Lme_6d:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite
wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2320]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000480
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb4000200
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000037
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047a1
.word 0x53001c00
.word 0xf90043a0
.word 0xf9402bb1
.word 0xf941b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941f231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_6e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite
wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2328]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xb9006bbf
.word 0xf9402bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf9003ba0
.word 0xf9403ba1
.word 0xf9403ba0
.word 0xf9003fa1
.word 0xb4000060
.word 0xf9403fa0
bl _p_51
.word 0xf9403fa0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9101a300
.word 0xf9403700
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb5000500
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91008300
.word 0xf9401300
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xb4000240
.word 0xaa1303e0
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9100e300
.word 0xf9401f00
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91004300
.word 0xf9400b03
.word 0xaa1303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x93407c00
.word 0x1400003b
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9100e300
.word 0xf9401f00
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91004300
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x93407c00
.word 0x1400002c
.word 0xaa1503e0
.word 0xb9801aa0
.word 0xaa0003f6
.word 0xd2800017
.word 0xaa1503e0
.word 0xaa1703e0
.word 0x93407ee0
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000589
.word 0xd37df000
.word 0x8b0002a0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f4
.word 0xaa1403e3
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90047a3
.word 0xf9400c70
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xb9006ba0
.word 0xaa1703e0
.word 0x110006e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xaa1603e1
.word 0x6b16001f
.word 0x54fffb6b
.word 0xb9806ba0
.word 0xf9402bb1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_6f:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2336]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_70:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2344]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402bb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xaa1303e1
.word 0xf90037a0
.word 0xb4000073
.word 0xf94037a0
bl _p_51
.word 0xf94037a0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9101a340
.word 0xf9403740
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xb50003c0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91008340
.word 0xf9401340
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb40001a0
.word 0xaa1503e0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b41
.word 0xaa1503e0
.word 0xd63f0020
.word 0x14000032
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000028
.word 0xaa1703e0
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800019
.word 0xaa1703e0
.word 0xaa1903e0
.word 0x93407f20
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000509
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f6
.word 0xaa1603e1
.word 0xaa0103e0
.word 0xf9003fa1
.word 0xf9400c30
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9403fa0
.word 0xf9003ba1
.word 0xf9402bb1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f4
.word 0xaa1903e0
.word 0x11000720
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xaa1803e1
.word 0x6b18001f
.word 0x54fffc0b
.word 0xaa1403e0
.word 0xaa1403e0
.word 0xf9402bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_71:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2352]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_72:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2360]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402bb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xaa1303e1
.word 0xf90037a0
.word 0xb4000073
.word 0xf94037a0
bl _p_51
.word 0xf94037a0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000030
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000024
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000489
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9403ba0
.word 0xf9402bb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffc4b
.word 0xf9402bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_73:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2368]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf90037bf
.word 0xf9402bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf9003ba0
.word 0xf9403ba1
.word 0xf9403ba0
.word 0xf9003fa1
.word 0xb4000060
.word 0xf9403fa0
bl _p_51
.word 0xf9403fa0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9101a300
.word 0xf9403700
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb50004c0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91008300
.word 0xf9401300
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xb4000220
.word 0xaa1303e0
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9100e300
.word 0xf9401f00
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91004300
.word 0xf9400b03
.word 0xaa1303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x14000039
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x9100e300
.word 0xf9401f00
.word 0xaa1803e0
.word 0xaa1803e0
.word 0x91004300
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400002b
.word 0xaa1503e0
.word 0xb9801aa0
.word 0xaa0003f6
.word 0xd2800017
.word 0xaa1503e0
.word 0xaa1703e0
.word 0x93407ee0
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000569
.word 0xd37df000
.word 0x8b0002a0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f4
.word 0xaa1403e3
.word 0xaa1903e0
.word 0xaa1a03e0
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90047a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf90037a0
.word 0xaa1703e0
.word 0x110006e0
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xaa1603e1
.word 0x6b16001f
.word 0x54fffb8b
.word 0xf94037a0
.word 0xf9402bb1
.word 0xf9420231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_74:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2376]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_75:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2384]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_76:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2392]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_77:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2400]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_78:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2408]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_79:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2416]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xf9402bb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xaa1303e1
.word 0xf90037a0
.word 0xb4000073
.word 0xf94037a0
bl _p_51
.word 0xf94037a0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9101a340
.word 0xf9403740
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xb50003c0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91008340
.word 0xf9401340
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb40001a0
.word 0xaa1503e0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b41
.word 0xaa1503e0
.word 0xd63f0020
.word 0x14000032
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000028
.word 0xaa1703e0
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800019
.word 0xaa1703e0
.word 0xaa1903e0
.word 0x93407f20
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000509
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f6
.word 0xaa1603e1
.word 0xaa0103e0
.word 0xf9003fa1
.word 0xf9400c30
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9403fa0
.word 0xf9003ba1
.word 0xf9402bb1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f4
.word 0xaa1903e0
.word 0x11000720
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xaa1803e1
.word 0x6b18001f
.word 0x54fffc0b
.word 0xaa1403e0
.word 0xaa1403e0
.word 0xf9402bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_7a:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2424]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_7b:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2432]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_7c:
.text
ut_125:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
ut_end:
.section __TEXT, __const
_unbox_trampoline_p:

	.long 0
LDIFF_SYM3=ut_end - ut_125
	.long LDIFF_SYM3
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_:
.file 16 "/Library/Frameworks/Xamarin.iOS.framework/Versions/10.10.0.36/src/mono/mcs/class/referencesource/mscorlib/system/runtime/compilerservices/AsyncMethodBuilder.cs"
.loc 16 360 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf90023af
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2440]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf9002fa1
.word 0xf94013a1
.word 0xf90033a1
.word 0xf940001e
.word 0xf9002ba0
.word 0xf94023a0
bl _p_137
.word 0xaa0003e3
.word 0xf9402ba0
.word 0xf9402fa1
.word 0xf94033a2
.word 0xd63f0060
.loc 16 361 0
.word 0xf94017b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_7d:
.text
ut_126:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_:
.loc 16 542 0 prologue_end
.word 0xa9b37bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xf90043af
.word 0xaa0003f8
.word 0xf9002ba1
.word 0xf9002fa2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2448]
.word 0xf90033b0
.word 0xf9400a11
.word 0xf90037b1
.word 0xf90047bf
.word 0xd2800017
.word 0xd2800016
.word 0xf94033b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90047bf
.loc 16 543 0
.word 0xf94033b1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
bl _p_138
.word 0x53001c00
.word 0xf90063a0
.word 0xf94033b1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xaa1803f5
.word 0x350000c0
.word 0xaa1503e0
.word 0xd2800000
.word 0xaa1503f4
.word 0xd2800013
.word 0x14000011
.word 0xaa1503e0
.word 0xaa1803e0
.word 0xf94043a0
.word 0xf9400000
bl _p_139
.word 0xaa0003ef
.word 0xaa1803e0
bl _p_140
.word 0xf90063a0
.word 0xf94033b1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xaa1503f4
.word 0xaa0003f3
.word 0xaa1403e0
.word 0xaa1303e0
.word 0x910223a2
.word 0xaa1403e0
.word 0xaa1303e1
bl _p_141
.word 0xf90063a0
.word 0xf94033b1
.word 0xf9413e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xaa0003f7
.loc 16 547 0
.word 0xf94033b1
.word 0xf9415631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
.word 0xf9400300
.word 0xb50004a0
.loc 16 551 0
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9418631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf94043a0
.word 0xf9400000
bl _p_139
.word 0xaa0003ef
.word 0xaa1803e0
bl _p_140
.word 0xf90067a0
.word 0xf94033b1
.word 0xf941b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94067a0
.word 0xf90063a0
.word 0xaa0003f6
.loc 16 556 0
.word 0xf94033b1
.word 0xf941d231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a3
.word 0xaa1803e0
.word 0xaa1803e0
.word 0xf9402fa0
.word 0xf9400001
.word 0xf94047a2
.word 0xaa0303e0
.word 0xaa1803e0
bl _p_142
.loc 16 559 0
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9421631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bba
.word 0xaa1703f9
.word 0xf94043a0
bl _p_143
.word 0xf9004ba0
.word 0xf94043a0
bl _p_144
.word 0xd280005e
.word 0xeb1e001f
.word 0x540000c0
.word 0xaa1a03e0
.word 0xaa1903e1
.word 0xf9404ba2
.word 0xd63f0040
.word 0x14000018
.word 0xaa1a03e0
.word 0x9101e3a0
.word 0xf9400340
.word 0xf9003fa0
.word 0xf94043a0
bl _p_145
.word 0xd2800301
.word 0xd2800301
bl _p_8
.word 0x9101e3a1
.word 0xf90063a0
.word 0x91004001
.word 0xaa0103e0
.word 0xf9403fa2
.word 0xf90067a2
.word 0xf9000022
bl _p_2
.word 0xf94063a0
.word 0xf94067a1
.word 0xaa1903e1
.word 0xf9404ba2
.word 0xd63f0040
.word 0x14000001
.loc 16 560 0
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf942ce31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000017
.word 0xf9004fa0
.word 0xf9404fa0
.word 0xf90063a0
.loc 16 563 0
.word 0xf94033b1
.word 0xf942ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a0
.word 0xd2800001
.word 0xd2800001
bl _p_146
.loc 16 564 0
.word 0xf94033b1
.word 0xf9430e31
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf9005fa0
.word 0xf9405fa0
.word 0xb4000060
.word 0xf9405fa0
bl _p_51
.word 0x14000001
.loc 16 565 0
.word 0xf94037b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9434a31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000001
.word 0xf94033b1
.word 0xf9435e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8cd7bfd
.word 0xd65f03c0

Lme_7e:
.text
ut_127:
add x0, x0, 16
b System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
System_Array_InternalEnumerator_1_T_REF__ctor_System_Array:
.loc 15 239 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9001faf
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2456]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400fa0
.word 0xf90023a0
.word 0xf9000320
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_2
.word 0xf94023a0
.loc 15 240 0
.word 0xf94013b1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x92800020
.word 0xf2bfffe0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb9000b3e
.loc 15 241 0
.word 0xf94013b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_7f:
.text
ut_128:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create:
.loc 16 444 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000ba8

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2464]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0x910123a0
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xf9002fa0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0x910123a0
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xf9002fa0
.word 0x910123a0
.word 0x9100c3a0
.word 0xf94027a0
.word 0xf9001ba0
.word 0xf9402ba0
.word 0xf9001fa0
.word 0xf9402fa0
.word 0xf90023a0
.word 0xf9400ba0
.word 0x9100c3a1
.word 0xaa0003e1
.word 0xaa0003e1
.word 0xf9003fa1
.word 0xf9401ba1
.word 0xf90043a1
.word 0xf9000001
bl _p_2
.word 0xf9403fa0
.word 0xf94043a1
.word 0x91002000
.word 0xf9401fa1
.word 0xf9003ba1
.word 0xf9000001
.word 0xf90037a0
bl _p_2
.word 0xf94037a0
.word 0xf9403ba1
.word 0x91002000
.word 0xf94023a1
.word 0xf90033a1
.word 0xf9000001
bl _p_2
.word 0xf94033a0
.word 0xf9400fb1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_80:
.text
ut_129:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine:
.loc 16 485 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2472]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_147
.loc 16 486 0
.word 0xf94013b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_81:
.text
ut_130:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task:
.loc 16 574 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2480]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800019
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400b40
.word 0xaa0003f9
.loc 16 575 0
.word 0xf94017b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb5000399
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2488]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf90027a0
bl _p_148
.word 0xf94017b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1803e1
.word 0xaa1803f9
.word 0xf90023a0
.word 0xf9000b40
.word 0x91004340
bl _p_2
.word 0xf94023a0
.loc 16 576 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf94017b1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_82:
.text
ut_131:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult:
.loc 16 590 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xf90013a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2496]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xf9401bb1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400b40
.word 0xaa0003f9
.loc 16 591 0
.word 0xf9401bb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb5000459
.loc 16 593 0
.word 0xf9401bb1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x910083a0
.word 0x910143a0
.word 0x398083a0
.word 0x390143a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2504]
.word 0xaa1a03e0
.word 0x910143a1
.word 0xf9402ba1
bl _p_149
.word 0xf90037a0
.word 0xf9401bb1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf90033a0
.word 0xf9000b40
.word 0x91004340
bl _p_2
.word 0xf94033a0
.loc 16 595 0
.word 0xf9401bb1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.word 0x14000073
.loc 16 599 0
.word 0xf9401bb1
.word 0xf9411631
.word 0xb4000051
.word 0xd63f0220
bl _p_138
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9413231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x340002a0
.loc 16 600 0
.word 0xf9401bb1
.word 0xf9414a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf940033e
bl _p_150
.word 0x93407c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9417631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a1
.word 0xd2800020
.word 0xd2800000
.word 0xd2800022
bl _p_151
.loc 16 603 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf941aa31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2512]
.word 0x39400000
.word 0x34000220
.loc 16 605 0
.word 0xf9401bb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf940033e
bl _p_150
.word 0x93407c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf941f631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
bl _p_152
.loc 16 608 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9421e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x910083a0
.word 0x910123a0
.word 0x398083a0
.word 0x390123a0
.word 0xaa1903e0
.word 0x910123a1
.word 0xf94027a1
.word 0xf940033e
bl _p_153
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9425e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x350002e0
.loc 16 610 0
.word 0xf9401bb1
.word 0xf9427631
.word 0xb4000051
.word 0xd63f0220
.word 0xd290c640
.word 0xf2a00020
.word 0xd290c640
.word 0xf2a00020
bl _p_133
bl _p_154
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf942a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a1
.word 0xd2801940
.word 0xf2a04000
.word 0xd2801940
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 16 613 0
.word 0xf9401bb1
.word 0xf942ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf942de31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_83:
.text
ut_132:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult:
.loc 16 628 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2520]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0x910103a0
.word 0x390103bf
.word 0xf94013b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400b20
.word 0xf9002ba0
.loc 16 629 0
.word 0xf94013b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xb5000220
.loc 16 631 0
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400fa0
.word 0xf9002ba0
.word 0xf9000b20
.word 0x91004320
bl _p_2
.word 0xf9402ba0
.loc 16 632 0
.word 0xf94013b1
.word 0xf940c231
.word 0xb4000051
.word 0xd63f0220
.word 0x14000017
.loc 16 636 0
.word 0xf94013b1
.word 0xf940d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x910103a0
.word 0x390103bf
.word 0x910103a0
.word 0x9100e3a0
.word 0x398103a0
.word 0x3900e3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2504]
.word 0xaa1903e0
.word 0x9100e3a1
.word 0xf9401fa1
bl _p_155
.loc 16 638 0
.word 0xf94013b1
.word 0xf9411e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9412e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_84:
.text
ut_133:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception:
.loc 16 649 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2528]
.word 0xf90027b0
.word 0xf9400a11
.word 0xf9002bb1
.word 0xd2800018
.word 0xd2800017
.word 0xf94027b1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xb500023a
.word 0xf94027b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xd28a7440
.word 0xf2a00020
.word 0xd28a7440
.word 0xf2a00020
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 16 653 0
.word 0xf94027b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400b20
.word 0xaa0003f8
.loc 16 654 0
.word 0xf94027b1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xb5000258
.loc 16 657 0
.word 0xf94027b1
.word 0xf940fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2504]
.word 0xaa1903e0
bl _p_156
.word 0xf9003ba0
.word 0xf94027b1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f8
.loc 16 661 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03f6
.word 0xaa1a03f5
.word 0xeb1f035f
.word 0x54000160
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2536]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800015
.word 0xaa1503e0
.word 0xaa1503f7
.loc 16 662 0
.word 0xf94027b1
.word 0xf9419e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xb5000215
.word 0xaa1803e0
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xf940031e
bl _p_157
.word 0x53001c00
.word 0xf9003ba0
.word 0xf94027b1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xaa0003f4
.word 0x14000017
.word 0xaa1803e0
.word 0xaa1703e0
.word 0x910183a0
.word 0xf90037a0
.word 0xaa1703e0
.word 0xf94002fe
bl _p_158
.word 0xf94037be
.word 0xf90003c0
.word 0xf94027b1
.word 0xf9421631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1803e0
.word 0x910183a1
.word 0xf94033a1
.word 0xaa1703e2
.word 0xf940031e
bl _p_159
.word 0x53001c00
.word 0xaa0003f4
.loc 16 673 0
.word 0xaa1403e0
.word 0xf94027b1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.word 0x350002f4
.loc 16 675 0
.word 0xf94027b1
.word 0xf9426231
.word 0xb4000051
.word 0xd63f0220
.word 0xd290c640
.word 0xf2a00020
.word 0xd290c640
.word 0xf2a00020
bl _p_133
bl _p_154
.word 0xf9003ba0
.word 0xf94027b1
.word 0xf9428e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xd2801940
.word 0xf2a04000
.word 0xd2801940
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 16 677 0
.word 0xf94027b1
.word 0xf942ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf942ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_85:
.text
ut_134:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult:
.loc 16 737 0 prologue_end
.word 0xa9af7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xf90013a0
.word 0xf90017a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2544]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0x9103c3a0
.word 0x3903c3bf
.word 0xd280001a
.word 0xf9401fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0x9103c3a0
.word 0x3903c3bf
.word 0x9103c3a0
.word 0x9103a3a0
.word 0x3983c3a0
.word 0x3903a3a0
.word 0x14000001
.loc 16 752 0
.word 0xf9401fb1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2560]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340008a0
.loc 16 754 0
.word 0xf9401fb1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0x9100a3a0
.word 0x910383a0
.word 0x3980a3a0
.word 0x390383a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910383a1
.word 0x91004001
.word 0x398383a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54006041
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2576]
.word 0xeb02003f
.word 0x10000011
.word 0x54005f41
.word 0x91004001
.word 0x39404000
.word 0xf90083a0
.loc 16 755 0
.word 0xf9401fb1
.word 0xf9416631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x350000e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2584]
.word 0xf9400000
.word 0xaa0003f9
.word 0x14000006

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2592]
.word 0xf9400000
.word 0xaa0003f9
.loc 16 756 0
.word 0xaa1903e0
.word 0xf9401fb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2600]
.word 0xaa1903e0
bl _p_160
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x140002cd
.loc 16 759 0
.word 0xf9401fb1
.word 0xf941ee31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2608]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9422231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x34000b20
.loc 16 764 0
.word 0xf9401fb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
.word 0x9100a3a0
.word 0x910363a0
.word 0x3980a3a0
.word 0x390363a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910363a1
.word 0x91004001
.word 0x398363a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54005561
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2616]
.word 0xeb02003f
.word 0x10000011
.word 0x54005461
.word 0x91004001
.word 0xb9801000
.word 0xaa0003fa
.loc 16 765 0
.word 0xf9401fb1
.word 0xf942c231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800120
.word 0xd280013e
.word 0x6b1e035f
.word 0x54004e8a
.word 0xaa1a03e0
.word 0x92800000
.word 0xf2bfffe0
.word 0x9280001e
.word 0xf2bffffe
.word 0x6b1e035f
.word 0x54004dab
.loc 16 768 0
.word 0xf9401fb1
.word 0xf9430231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2624]
.word 0xf9400000
.word 0xaa1a03e1
.word 0x9280001e
.word 0xf2bffffe
.word 0x4b1e0341
.word 0x93407c21
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x54005049
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400000
.word 0xf90087a0
.loc 16 769 0
.word 0xf9401fb1
.word 0xf9435a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94087a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2600]
bl _p_160
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9438231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x14000262
.loc 16 773 0
.word 0xf9401fb1
.word 0xf9439a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2632]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf943ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x910343a0
.word 0x3980a3a0
.word 0x390343a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910343a1
.word 0x91004001
.word 0x398343a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54004881
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2640]
.word 0xeb02003f
.word 0x10000011
.word 0x54004781
.word 0x91004001
.word 0xb9401000
.word 0x34003ee0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2648]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9448231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x910323a0
.word 0x3980a3a0
.word 0x390323a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910323a1
.word 0x91004001
.word 0x398323a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540042e1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2656]
.word 0xeb02003f
.word 0x10000011
.word 0x540041e1
.word 0x91004001
.word 0x39404000
.word 0x34003940

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2664]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9453631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x910303a0
.word 0x3980a3a0
.word 0x390303a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910303a1
.word 0x91004001
.word 0x398303a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54003d41
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2672]
.word 0xeb02003f
.word 0x10000011
.word 0x54003c41
.word 0x91004001
.word 0x39804000
.word 0x340033a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2680]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf945ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x9102e3a0
.word 0x3980a3a0
.word 0x3902e3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x9102e3a1
.word 0x91004001
.word 0x3982e3a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540037a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2688]
.word 0xeb02003f
.word 0x10000011
.word 0x540036a1
.word 0x91004001
.word 0x79402000
.word 0x34002e00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2696]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9469e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x34000720

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2704]
.word 0x9102a3a1
.word 0xf9400001
.word 0xf90057a1
.word 0xf9400400
.word 0xf9005ba0
.word 0x9100a3a0
.word 0x910283a0
.word 0x3980a3a0
.word 0x390283a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910283a1
.word 0x91004001
.word 0x398283a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54003101
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2712]
.word 0xeb02003f
.word 0x10000011
.word 0x54003001
.word 0x91004000
.word 0x910243a1
.word 0xf9400001
.word 0xf9004ba1
.word 0xf9400400
.word 0xf9004fa0
.word 0x9102a3a0
.word 0xf94057a0
.word 0xf9405ba1
.word 0x910243a2
.word 0xf9404ba2
.word 0xf9404fa3
bl _p_161
.word 0x53001c00
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9477e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x35002520

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2720]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf947ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x910223a0
.word 0x3980a3a0
.word 0x390223a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910223a1
.word 0x91004001
.word 0x398223a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54002921
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2728]
.word 0xeb02003f
.word 0x10000011
.word 0x54002821
.word 0x91004001
.word 0xf9400800
.word 0xb4001f80

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2736]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9486e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x910203a0
.word 0x3980a3a0
.word 0x390203a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x910203a1
.word 0x91004001
.word 0x398203a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54002381
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2744]
.word 0xeb02003f
.word 0x10000011
.word 0x54002281
.word 0x91004001
.word 0xf9400800
.word 0xb40019e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2752]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf9492231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x9101e3a0
.word 0x3980a3a0
.word 0x3901e3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x9101e3a1
.word 0x91004001
.word 0x3981e3a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54001de1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2760]
.word 0xeb02003f
.word 0x10000011
.word 0x54001ce1
.word 0x91004001
.word 0x79802000
.word 0x34001440

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2768]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf949d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x340003e0
.word 0x9100a3a0
.word 0x9101c3a0
.word 0x3980a3a0
.word 0x3901c3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0x9101c3a1
.word 0x91004001
.word 0x3981c3a2
.word 0x39000022
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54001841
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #2776]
.word 0xeb02003f
.word 0x10000011
.word 0x54001741
.word 0x91004001
.word 0x79402000
.word 0x34000ea0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2784]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf94a8a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x34000580
.word 0xd2800000
.word 0x93407c00
.word 0xf90087a0
.word 0x9100a3a0
.word 0x9101a3a0
.word 0x3980a3a0
.word 0x3901a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0xaa0003e1
.word 0xf94087a0
.word 0x9101a3a2
.word 0x91004022
.word 0x3981a3a3
.word 0x39000043
.word 0xf9400022
.word 0x3940b043
.word 0xeb1f007f
.word 0x10000011
.word 0x54001201
.word 0xf9400042
.word 0xf9400042

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x3, [x16, #2792]
.word 0xeb03005f
.word 0x10000011
.word 0x54001101
.word 0x91004022
.word 0xf9400821
bl _p_162
.word 0x53001c00
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf94b3631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x35000760

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2552]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #2800]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf94b7231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x34000960
.word 0xd2800000
.word 0x2a0003e0
.word 0xf90087a0
.word 0x9100a3a0
.word 0x910183a0
.word 0x3980a3a0
.word 0x390183a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2568]
.word 0xd2800221
.word 0xd2800221
bl _p_8
.word 0xaa0003e1
.word 0xf94087a0
.word 0x910183a2
.word 0x91004022
.word 0x398183a3
.word 0x39000043
.word 0xf9400022
.word 0x3940b043
.word 0xeb1f007f
.word 0x10000011
.word 0x54000ac1
.word 0xf9400042
.word 0xf9400042

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x3, [x16, #2808]
.word 0xeb03005f
.word 0x10000011
.word 0x540009c1
.word 0x91004022
.word 0xf9400821
bl _p_163
.word 0x53001c00
.word 0xf90083a0
.word 0xf9401fb1
.word 0xf94c1e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0x34000400
.loc 16 786 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf94c4631
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2816]
.word 0xf9400000
.word 0x1400002e
.loc 16 789 0
.word 0xf9401fb1
.word 0xf94c6a31
.word 0xb4000051
.word 0xd63f0220
.word 0x9100a3a0
.word 0x910163a0
.word 0x3980a3a0
.word 0x390163a0
.word 0x1400000a
.loc 16 791 0
.word 0xf9401fb1
.word 0xf94c8e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2816]
.word 0xf9400000
.word 0x1400001c
.loc 16 795 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf94cc231
.word 0xb4000051
.word 0xd63f0220
.word 0x9100a3a0
.word 0x910143a0
.word 0x3980a3a0
.word 0x390143a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2488]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf90083a0
.word 0x910143a1
.word 0xf9402ba1
bl _p_164
.word 0xf9401fb1
.word 0xf94d0a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94083a0
.word 0xf9401fb1
.word 0xf94d1e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8d17bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_86:
.text
ut_135:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor:
.loc 16 427 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2824]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0x9100c3a0
.word 0x3900c3bf
.word 0xf9400bb1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x9100c3a0
.word 0x3900c3bf
.word 0x9100c3a0
.word 0x9100a3a0
.word 0x3980c3a0
.word 0x3900a3a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2832]
.word 0x9100a3a0
.word 0xf94017a0
bl _p_165
.word 0xf90023a0
.word 0xf9400bb1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2816]
.word 0xf9000001
.word 0xf9400bb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_87:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor:
.file 17 "/Library/Frameworks/Xamarin.iOS.framework/Versions/10.10.0.36/src/mono/mcs/class/referencesource/mscorlib/system/threading/Tasks/Future.cs"
.loc 17 91 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2840]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_166
.loc 17 93 0
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_88:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions:
.loc 17 97 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2848]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xb98023a2
.word 0xd2800023
.word 0xd2800023
bl _p_167
.loc 17 99 0
.word 0xf94017b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_89:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult:
.loc 17 104 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2856]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0x910143a0
.word 0xf9002bbf
.word 0xf94017b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xd2800000
.word 0x910143a0
.word 0xf9002bbf
.word 0x910143a0
.word 0x910123a0
.word 0xf9402ba0
.word 0xf90027a0
.word 0xaa1a03e0
.word 0xd2800001
.word 0xd2800002
.word 0x910123a3
.word 0xf94027a3
bl _p_168
.loc 17 106 0
.word 0xf94017b1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0x910063a0
.word 0x910103a0
.word 0x398063a0
.word 0x390103a0
.word 0x910103a0
.word 0x91012340
.word 0x398103a1
.word 0x39000001
.loc 17 107 0
.word 0xf94017b1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf940f231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_8a:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken:
.loc 17 110 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xf90013a2
.word 0xf9001ba3
.word 0xf9001fa4

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2864]
.word 0xf90027b0
.word 0xf9400a11
.word 0xf9002bb1
.word 0xf94027b1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1903e0
.word 0xb98033a2
.word 0x9100e3a0
.word 0x9101a3a0
.word 0xf9401fa0
.word 0xf90037a0
.word 0xaa1803e0
.word 0xaa1903e1
.word 0x9101a3a3
.word 0xf94037a3
bl _p_168
.loc 17 112 0
.word 0xf94027b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x350001d9
.loc 17 114 0
.word 0xf94027b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0x910083a0
.word 0x910183a0
.word 0x398083a0
.word 0x390183a0
.word 0x910183a0
.word 0x91012300
.word 0x398183a1
.word 0x39000001
.loc 17 116 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_8b:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions:
.loc 17 322 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000bb7
.word 0xf9000fba
.word 0xaa0003f7
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9001ba3
.word 0xaa0403fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2872]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xb90063bf
.word 0xf94023b1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xf94013a0
.word 0xf9003ba0
.word 0xf94017a0
.word 0xf9003fa0
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_169
.word 0xf90043a0
.word 0xf94023b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xf9403fa2
.word 0xf94043a3
.word 0x9100c3a0
.word 0x910163a0
.word 0xf9401ba0
.word 0xf9002fa0
.word 0xaa1a03e0
.word 0xd2800000
.word 0xd2800000
.word 0xaa1703e0
.word 0x910163a4
.word 0xf9402fa4
.word 0xaa1a03e5
.word 0xd2800006
.word 0xd2800007
bl _p_170
.loc 17 325 0
.word 0xf94023b1
.word 0xf940f631
.word 0xb4000051
.word 0xd63f0220
.word 0xd280003e
.word 0xb90063be
.loc 17 326 0
.word 0xf94023b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0x910183a1
.word 0xaa1703e0
bl _p_171
.loc 17 327 0
.word 0xf94023b1
.word 0xf9412e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9413e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb7
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_8c:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_:
.loc 17 333 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xf9000bb4
.word 0xaa0003f4
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9001fa4
.word 0xf90023a5
.word 0xf90027a6
.word 0xf9002ba7

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2880]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xf9402fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1403e0
.word 0xf9400fa1
.word 0xf94013a2
.word 0x9100a3a0
.word 0x9101c3a0
.word 0xf94017a0
.word 0xf9003ba0
.word 0xb9803ba4
.word 0xb98043a5
.word 0xf94027a6
.word 0xaa1403e0
.word 0x9101c3a3
.word 0xf9403ba3
bl _p_172
.loc 17 336 0
.word 0xf9402fb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1403e0
.word 0xf9402ba1
.word 0xaa1403e0
bl _p_171
.loc 17 337 0
.word 0xf9402fb1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf940ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb4
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_8d:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler:
.loc 17 352 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9001ba3
.word 0xf90023a4
.word 0xaa0503f9
.word 0xf90027a6

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2888]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xf9402bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xf94013a1
.word 0xd2800002
.word 0xf94017a3
.word 0x9100c3a2
.word 0x9101a3a2
.word 0xf9401ba2
.word 0xf90037a2
.word 0xb98043a5
.word 0xaa1903e2
.word 0xf94027a7
.word 0xd2800002
.word 0x9101a3a4
.word 0xf94037a4
.word 0xaa1903e6
bl _p_173
.loc 17 354 0
.word 0xf9402bb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd281001e
.word 0xa1e0320
.word 0x340003c0
.loc 17 356 0
.word 0xf9402bb1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xd289ac80
.word 0xf2a00020
.word 0xd289ac80
.word 0xf2a00020
bl _p_133
.word 0xf9003ba0
.word 0xd289b080
.word 0xf2a00020
.word 0xd289b080
.word 0xf2a00020
bl _p_133
bl _p_154
.word 0xf9003fa0
.word 0xf9402bb1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0xf9403fa2
.word 0xd2800ea0
.word 0xf2a04000
.word 0xd2800ea0
.word 0xf2a04000
bl _mono_create_corlib_exception_2
bl _p_51
.loc 17 358 0
.word 0xf9402bb1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402bb1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_8e:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler:
.loc 17 382 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9001ba3
.word 0xf9001fa4
.word 0xf90027a5
.word 0xaa0603f9
.word 0xf9002ba7

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2896]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xf9402fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xf94013a1
.word 0xf94017a2
.word 0xf9401ba3
.word 0x9100e3a4
.word 0x9101c3a4
.word 0xf9401fa4
.word 0xf9003ba4
.word 0xb9804ba5
.word 0xaa1903e4
.word 0xf9402ba7
.word 0x9101c3a4
.word 0xf9403ba4
.word 0xaa1903e6
bl _p_173
.loc 17 384 0
.word 0xf9402fb1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd281001e
.word 0xa1e0320
.word 0x340003c0
.loc 17 386 0
.word 0xf9402fb1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0xd289ac80
.word 0xf2a00020
.word 0xd289ac80
.word 0xf2a00020
bl _p_133
.word 0xf90043a0
.word 0xd289b080
.word 0xf2a00020
.word 0xd289b080
.word 0xf2a00020
bl _p_133
bl _p_154
.word 0xf90047a0
.word 0xf9402fb1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a1
.word 0xf94047a2
.word 0xd2800ea0
.word 0xf2a04000
.word 0xd2800ea0
.word 0xf2a04000
bl _mono_create_corlib_exception_2
bl _p_51
.loc 17 388 0
.word 0xf9402fb1
.word 0xf9415231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_8f:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_:
.loc 17 395 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xf9000bb4
.word 0xf9000fb6
.word 0xa90267b8
.word 0xf9001ba0
.word 0xaa0103f6
.word 0xf9001fa2
.word 0xf90027a3
.word 0xaa0403f8
.word 0xaa0503f9
.word 0xf9002ba6

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2904]
.word 0xf9002fb0
.word 0xf9400a11
.word 0xf90033b1
.word 0xf9402fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xb5000236
.loc 17 397 0
.word 0xf9402fb1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xd289c520
.word 0xf2a00020
.word 0xd289c520
.word 0xf2a00020
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 17 399 0
.word 0xf9402fb1
.word 0xf940ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb5000239
.loc 17 401 0
.word 0xf9402fb1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0xd289c760
.word 0xf2a00020
.word 0xd289c760
.word 0xf2a00020
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 17 403 0
.word 0xf9402fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xd281001e
.word 0xa1e0300
.word 0x340003c0
.loc 17 406 0
.word 0xf9402fb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xd289ac80
.word 0xf2a00020
.word 0xd289ac80
.word 0xf2a00020
bl _p_133
.word 0xf90043a0
.word 0xd289b080
.word 0xf2a00020
.word 0xd289b080
.word 0xf2a00020
bl _p_133
bl _p_154
.word 0xf90047a0
.word 0xf9402fb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a1
.word 0xf94047a2
.word 0xd2800ea0
.word 0xf2a04000
.word 0xd2800ea0
.word 0xf2a04000
bl _mono_create_corlib_exception_2
bl _p_51
.loc 17 410 0
.word 0xf9402fb1
.word 0xf941ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xf9401ba0
.word 0xf9004ba0
.word 0x9100e3a0
.word 0x9101c3a0
.word 0xf9401fa0
.word 0xf9003ba0
.word 0xb9804ba0
.word 0xf9004fa0
.word 0xaa1803e0
.word 0xd284001e
.word 0x2a1e0300
.word 0xf90053a0
.word 0xaa1903e0
.word 0xf9402ba0
.word 0xf90057a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2488]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf9404ba2
.word 0xf9404fa4
.word 0xf94053a5
.word 0xf94057a7
.word 0xf90047a0
.word 0xaa1603e1
.word 0x9101c3a3
.word 0xf9403ba3
.word 0xaa1903e6
bl _p_174
.loc 17 412 0
.word 0xf9402fb1
.word 0xf9424a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94047a0
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xf90043a0
.word 0xaa1403e0
.word 0xd2800000
.word 0xaa1403e0
.word 0xd2800001
.word 0xf940029e
bl _p_175
.loc 17 413 0
.word 0xf9402fb1
.word 0xf9428231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xf9402fb1
.word 0xf9429631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb4
.word 0xf9400fb6
.word 0xa94267b8
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_90:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult:
.loc 17 463 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xf90013a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2912]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xd2800019
.word 0xf9401bb1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_176
.word 0x53001c00
.word 0xf9002ba0
.word 0xf9401bb1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x34000100
.word 0xf9401bb1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xd2800000
.word 0x14000069
.loc 17 471 0
.word 0xf9401bb1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800000
.word 0xf2a08000
.word 0xd2800000
.word 0xf2a0ac00
.word 0xaa1a03e0
.word 0xd2800001
.word 0xf2a08001
.word 0xd2800002
.word 0xf2a0ac02
bl _p_177
.word 0x53001c00
.word 0xf9002ba0
.word 0xf9401bb1
.word 0xf940fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0x34000980
.loc 17 474 0
.word 0xf9401bb1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0x910083a0
.word 0x910123a0
.word 0x398083a0
.word 0x390123a0
.word 0x910123a0
.word 0x91012340
.word 0x398123a1
.word 0x39000001
.loc 17 483 0
.word 0xf9401bb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xeb1f035f
.word 0x10000011
.word 0x540008a0
.word 0x91011340
.word 0xaa1a03e1
.word 0xb9804741
.word 0xd280001e
.word 0xf2a0201e
.word 0x2a1e0021
.word 0x885f7c10
.word 0x8811fc01
.word 0x35ffffd1
.word 0xd50330bf
.word 0xaa1003e0
.word 0xf9401bb1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.loc 17 485 0
.word 0xf9401bb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401f40
.word 0xaa0003f9
.loc 17 486 0
.word 0xf9401bb1
.word 0xf941be31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb4000139
.word 0xf9401bb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf940033e
bl _p_178
.loc 17 488 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9420631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_179
.loc 17 490 0
.word 0xf9401bb1
.word 0xf9422231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800020
.word 0xd2800020
.word 0x14000007
.loc 17 493 0
.word 0xf9401bb1
.word 0xf9423e31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xd2800000
.word 0xf9401bb1
.word 0xf9425631
.word 0xb4000051
.word 0xd63f0220
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801ae0
.word 0xaa1103e1
bl _p_13

Lme_91:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult:
.loc 17 507 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2920]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9401740
.word 0xb4000300
.loc 17 509 0
.word 0xf94017b1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0x910063a0
.word 0x910123a0
.word 0x398063a0
.word 0x390123a0
.word 0xaa1a03e0
.word 0x910123a1
.word 0xf94027a1
bl _p_153
.word 0x53001c00
.word 0xf94017b1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.loc 17 513 0
.word 0xf94017b1
.word 0xf940be31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000020
.loc 17 516 0
.word 0xf94017b1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0x910063a0
.word 0x910103a0
.word 0x398063a0
.word 0x390103a0
.word 0x910103a0
.word 0x91012340
.word 0x398103a1
.word 0x39000001
.loc 17 517 0
.word 0xf94017b1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0xb9804740
.word 0xd280001e
.word 0xf2a0201e
.word 0x2a1e0000
.word 0xf9002ba0
.word 0xd50330bf
.word 0xf9402ba0
.word 0xb9004740
.loc 17 519 0
.word 0xf94017b1
.word 0xf9413e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9414e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_92:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result:
.loc 17 532 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2928]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1a03e0
bl _p_180
.word 0x53001c00
.word 0xf90033a0
.word 0xf94017b1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x35000160
.word 0xaa1a03e0
.word 0x91012340
.word 0x910103a1
.word 0x39800000
.word 0x390103a0
.word 0x910103a0
.word 0x910063a0
.word 0x398103a0
.word 0x390063a0
.word 0x14000012
.word 0xaa1a03e0
.word 0xd2800020
.word 0x910123a0
.word 0xf9002ba0
.word 0xaa1a03e0
.word 0xd2800021
bl _p_181
.word 0xf9402bbe
.word 0xf90003c0
.word 0xf94017b1
.word 0xf940de31
.word 0xb4000051
.word 0xd63f0220
.word 0x910123a0
.word 0x910063a0
.word 0x398123a0
.word 0x390063a0
.word 0xf94017b1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0xf9400fa0
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_93:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess:
.loc 17 548 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf90013a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2936]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a0
.word 0x91012000
.word 0x910103a1
.word 0x39800000
.word 0x390103a0
.word 0x910103a0
.word 0x910043a0
.word 0x398103a0
.word 0x390043a0
.word 0xf94017b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_94:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool:
.loc 17 556 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf90017a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2944]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0x910163a0
.word 0xf9002fbf
.word 0xf9401bb1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_176
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x35000320
.word 0xf9401bb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x92800000
.word 0xf2bfffe0
.word 0x910163a0
.word 0xf9002fbf
.word 0x910163a0
.word 0x910143a0
.word 0xf9402fa0
.word 0xf9002ba0
.word 0xaa1903e0
.word 0x92800001
.word 0xf2bfffe1
.word 0x910143a2
.word 0xf9402ba2
bl _p_182
.word 0x53001c00
.word 0xf9401bb1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.loc 17 559 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0x3940a3a0
.word 0x340001a0
.word 0xf9401bb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_183
.word 0x53001c00
.word 0xf9401bb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.loc 17 562 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9416631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_184
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401bb1
.word 0xf9418a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x35000140
.word 0xf9401bb1
.word 0xf941a231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800020
.word 0xaa1903e0
.word 0xd2800021
bl _p_185
.loc 17 567 0
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf941d631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x91012320
.word 0x910123a1
.word 0x39800000
.word 0x390123a0
.word 0x910123a0
.word 0x910063a0
.word 0x398123a0
.word 0x390063a0
.word 0xf9401bb1
.word 0xf9420a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0xf9400fa0
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_95:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object:
.loc 17 590 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xaa0003f9
.word 0xf90013a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2952]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800018
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800018
.loc 17 600 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800020
.word 0xaa1903e0
.word 0xd2800021
bl _p_186
.word 0xf94017b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.loc 17 601 0
.word 0xf94017b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf2a08000
.word 0xd2800000
.word 0xf2a0ac00
.word 0xaa1903e0
.word 0xd2800001
.word 0xf2a08001
.word 0xd2800002
.word 0xf2a0ac02
bl _p_177
.word 0x53001c00
.word 0xf90023a0
.word 0xf94017b1
.word 0xf940ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0x340002e0
.loc 17 604 0
.word 0xf94017b1
.word 0xf9410231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf94013a1
.word 0xaa1903e0
bl _p_187
.loc 17 605 0
.word 0xf94017b1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xaa1903e0
.word 0xd2800001
bl _p_188
.loc 17 606 0
.word 0xf94017b1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800038
.loc 17 609 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9416a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
.word 0xf94017b1
.word 0xf9418231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_96:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken:
.loc 17 618 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2960]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0x910063a1
.word 0x910103a1
.word 0xf9400fa1
.word 0xf90023a1
.word 0xd2800001
.word 0x910103a1
.word 0xf94023a1
.word 0xd2800002
bl _p_159
.word 0x53001c00
.word 0xf9002ba0
.word 0xf94017b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf94017b1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_97:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object:
.loc 17 637 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xaa0003f9
.word 0xf90013a1
.word 0xf9001ba2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2968]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd2800018
.word 0xf9401fb1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800018
.loc 17 648 0
.word 0xf9401fb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xd2800000
.word 0xf2a08000
.word 0xd2800000
.word 0xf2a0ac00
.word 0xaa1903e0
.word 0xd2800001
.word 0xf2a08001
.word 0xd2800002
.word 0xf2a0ac02
bl _p_177
.word 0x53001c00
.word 0xf90033a0
.word 0xf9401fb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94033a0
.word 0x34000360
.loc 17 652 0
.word 0xf9401fb1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0x910083a0
.word 0x910143a0
.word 0xf94013a0
.word 0xf9002ba0
.word 0xf9401ba2
.word 0xaa1903e0
.word 0x910143a1
.word 0xf9402ba1
bl _p_189
.loc 17 653 0
.word 0xf9401fb1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_190
.loc 17 654 0
.word 0xf9401fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800038
.loc 17 657 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9414a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
.word 0xf9401fb1
.word 0xf9416231
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_98:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory:
.loc 17 668 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2976]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0xf9400bb1
.word 0xf9402e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2984]
.word 0xf9400000
.word 0xf9400bb1
.word 0xf9406e31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_99:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke:
.loc 17 677 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #2992]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xd2800019
.word 0xd2800018
.word 0xf9401fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9406631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400b57
.word 0xaa1703f6
.word 0xeb1f02ff
.word 0x54000160
.word 0xf94002e0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #3000]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800016
.word 0xaa1603e0
.word 0xaa1603f9
.loc 17 678 0
.word 0xf9401fb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xb4000376
.loc 17 680 0
.word 0xf9401fb1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0x910163a0
.word 0xf90037a0
.word 0xaa1903e0
.word 0xf9400f30
.word 0xd63f0200
.word 0xf94037be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf9410631
.word 0xb4000051
.word 0xd63f0220
.word 0x910163a0
.word 0x91012340
.word 0x398163a1
.word 0x39000001
.loc 17 681 0
.word 0xf9401fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0x14000036
.loc 17 683 0
.word 0xf9401fb1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400b40
.word 0xf90033a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #3008]

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x2, [x16, #3016]
bl _p_191
.word 0xaa0003f8
.loc 17 684 0
.word 0xf9401fb1
.word 0xf9417631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xb40003b8
.loc 17 686 0
.word 0xf9401fb1
.word 0xf9418e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xaa1803e0
.word 0xaa1a03e0
.word 0xf9400f41
.word 0x910143a0
.word 0xf90037a0
.word 0xaa1803e0
.word 0xf9400f10
.word 0xd63f0200
.word 0xf94037be
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf941ca31
.word 0xb4000051
.word 0xd63f0220
.word 0x910143a0
.word 0x91012340
.word 0x398143a1
.word 0x39000001
.loc 17 687 0
.word 0xf9401fb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000005
.loc 17 690 0
.word 0xf9401fb1
.word 0xf941fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9420e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_9a:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter:
.loc 17 699 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf90013a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3024]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a1
.word 0x910123a0
.word 0xf90027bf
.word 0x910123a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3032]
bl _p_192
.word 0x910123a0
.word 0x910103a0
.word 0xf94027a0
.word 0xf90023a0
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910103a0
.word 0x910043a0
.word 0xf94023a0
.word 0xf9000ba0
.word 0xf94017b1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_9b:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool:
.loc 17 709 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf90013a0
.word 0xf90017a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3040]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xf9401bb1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a1
.word 0x3940a3a2
.word 0x910163a0
.word 0xd2800000
.word 0xf9002fa0
.word 0xf90033a0
.word 0x910163a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3048]
bl _p_193
.word 0x910163a0
.word 0x910123a0
.word 0xf9402fa0
.word 0xf90027a0
.word 0xf94033a0
.word 0xf9002ba0
.word 0xf9401bb1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0x910123a0
.word 0x910043a0
.word 0xf94027a0
.word 0xf9000ba0
.word 0xf9402ba0
.word 0xf9000fa0
.word 0xf9401bb1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_9c:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor
System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor:
.loc 17 81 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3056]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0xf9400bb1
.word 0xf9402e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb1
.word 0xf9404e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3064]
.word 0xd2800501
.word 0xd2800501
bl _p_8
.word 0xf90027a0
bl _p_194
.word 0xf9400bb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2984]
.word 0xf9000001
.loc 17 87 0
.word 0xf9400bb1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3072]
.word 0xf9400000
.word 0xf90023a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000560

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3080]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf94023a1
.word 0xf9001ba1
.word 0xf9001001
.word 0xf9001fa0
.word 0x91008000
bl _p_2
.word 0xf9401ba0
.word 0xf9401fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3088]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3096]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3104]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3112]
.word 0xf9000001
.word 0xf9400bb1
.word 0xf9415e31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_9d:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor:
.file 18 "/Library/Frameworks/Xamarin.iOS.framework/Versions/10.10.0.36/src/mono/mcs/class/referencesource/mscorlib/system/threading/Tasks/FutureFactory.cs"
.loc 18 93 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3120]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0x9100e3a0
.word 0xf9001fbf
.word 0xf9400fb1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0x9100e3a1
.word 0xf9001fbf
.word 0x9100e3a1
.word 0x9100c3a1
.word 0xf9401fa1
.word 0xf9001ba1
.word 0xd2800001
.word 0xd2800001
.word 0xd2800001
.word 0x9100c3a1
.word 0xf9401ba1
.word 0xd2800002
.word 0xd2800003
.word 0xd2800004
bl _p_195
.loc 18 95 0
.word 0xf9400fb1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_9e:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler:
.loc 18 208 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xaa0003f7
.word 0xf90017a1
.word 0xaa0203f8
.word 0xaa0303f9
.word 0xf9001fa4

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3128]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xf94023b1
.word 0xf9404a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.loc 18 210 0
.word 0xf94023b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_196
.loc 18 211 0
.word 0xf94023b1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xaa1803e0
bl _p_197
.loc 18 213 0
.word 0xf94023b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0x9100a3a0
.word 0x910163a0
.word 0xf94017a0
.word 0xf9002fa0
.word 0x910163a0
.word 0x910042e1
.word 0xaa0103e0
.word 0xf9402fa2
.word 0xf90037a2
.word 0xf9000022
bl _p_2
.word 0xf94037a0
.loc 18 214 0
.word 0xf94023b1
.word 0xf940fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xf9401fa0
.word 0xf90033a0
.word 0xf9000ee0
.word 0x910062e0
bl _p_2
.word 0xf94033a0
.loc 18 215 0
.word 0xf94023b1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1803e0
.word 0xb90022f8
.loc 18 216 0
.word 0xf94023b1
.word 0xf9414231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1703e0
.word 0xaa1903e0
.word 0xb90026f9
.loc 18 217 0
.word 0xf94023b1
.word 0xf9415e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9416e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_9f:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler:
.loc 18 388 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xaa0303f9
.word 0xf9001fa4

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3136]
.word 0xf90023b0
.word 0xf9400a11
.word 0xf90027b1
.word 0xb90063bf
.word 0xf94023b1
.word 0xf9404a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd280003e
.word 0xb90063be
.loc 18 389 0
.word 0xf94023b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
bl _p_169
.word 0xf9003fa0
.word 0xf94023b1
.word 0xf940a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xf94013a1
.word 0x9100a3a2
.word 0x910163a2
.word 0xf94017a2
.word 0xf9002fa2
.word 0xaa1903e2
.word 0xd2800002
.word 0xf9401fa5
.word 0x910183a6

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #2488]
.word 0x910163a2
.word 0xf9402fa2
.word 0xaa1903e3
.word 0xd2800004
bl _p_198
.word 0xf9003ba0
.word 0xf94023b1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
.word 0xf94023b1
.word 0xf9411231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_a0:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
.loc 18 542 0 prologue_end
.word 0xa9b07bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9001ba4

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3144]
.word 0xf9001fb0
.word 0xf9400a11
.word 0xf90023b1
.word 0xf9003fbf
.word 0xf90043bf
.word 0x9101c3a0
.word 0x3901c3bf
.word 0xf9401fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9407631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9003fbf
.loc 18 543 0
.word 0xf9401fb1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf90043bf
.loc 18 544 0
.word 0xf9401fb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0x9101c3a0
.word 0x3901c3bf
.loc 18 548 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb4000419
.loc 18 550 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf940ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1803e0
.word 0x9101a3a0
.word 0xf9004fa0
.word 0xaa1903e0
.word 0xaa1803e1
.word 0xf9400f30
.word 0xd63f0200
.word 0xf9404fbe
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf9412631
.word 0xb4000051
.word 0xd63f0220
.word 0x9101a3a0
.word 0x9101c3a0
.word 0x3981a3a0
.word 0x3901c3a0
.loc 18 551 0
.word 0xf9401fb1
.word 0xf9414631
.word 0xb4000051
.word 0xd63f0220
.word 0x14000011
.loc 18 554 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9416a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a2
.word 0xaa1803e0
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9007ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9407ba0
.loc 18 556 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf941aa31
.word 0xb4000051
.word 0xd63f0220
.word 0x9400002c
.word 0x1400012e
.word 0xf90053a0
.word 0xf94053a0
.word 0xf9007ba0
.loc 18 557 0
.word 0xf9401fb1
.word 0xf941ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0xf90043a0
.word 0xf9401fb1
.word 0xf941e631
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf9006fa0
.word 0xf9406fa0
.word 0xb4000060
.word 0xf9406fa0
bl _p_51
.word 0x94000017
.word 0x14000119
.word 0xf90057a0
.word 0xf94057a0
.word 0xf9007ba0
.loc 18 558 0
.word 0xf9401fb1
.word 0xf9422231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0xf9003fa0
.word 0xf9401fb1
.word 0xf9423a31
.word 0xb4000051
.word 0xd63f0220
bl _p_50
.word 0xf90073a0
.word 0xf94073a0
.word 0xb4000060
.word 0xf94073a0
bl _p_51
.word 0x94000002
.word 0x14000104
.word 0xf9006bbe
.loc 18 561 0
.word 0xf9401fb1
.word 0xf9426e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xb4000500
.loc 18 563 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9429631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a0
.word 0xf9007ba0
.word 0xf94043a1
.word 0x910183a0
.word 0xf9004fa0
.word 0xaa0103e0
.word 0xf940003e
bl _p_158
.word 0xf9404fbe
.word 0xf90003c0
.word 0xf9401fb1
.word 0xf942ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba3
.word 0xf94043a2
.word 0xaa0303e0
.word 0x910183a1
.word 0xf94033a1
.word 0xf940007e
bl _p_159
.word 0x53001c00
.word 0xf9401fb1
.word 0xf942fe31
.word 0xb4000051
.word 0xd63f0220
.loc 18 564 0
.word 0xf9401fb1
.word 0xf9430e31
.word 0xb4000051
.word 0xd63f0220
.word 0x140000cc
.loc 18 565 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9433231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403fa0
.word 0xb4000800
.loc 18 567 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9435a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a2
.word 0xf9403fa1
.word 0xaa0203e0
.word 0xf940005e
bl _p_157
.word 0x53001c00
.word 0xf9007ba0
.loc 18 568 0
.word 0xf9401fb1
.word 0xf9438631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0x340015a0
.word 0xf9403fa0
.word 0xf90047a0
.word 0xf94047a0
.word 0xf9004ba0
.word 0xf94047a0
.word 0xeb1f001f
.word 0x540001a0
.word 0xf94047a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #3152]
.word 0xeb01001f
.word 0x54000060
.word 0xf9004bbf
.word 0x14000001
.word 0xf9404ba0
.word 0xb4001300
.loc 18 570 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9440231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a0
.word 0xf9401c00
.word 0xf9401002
.word 0xd2800000
.word 0xaa0203e0
.word 0xd2800001
.word 0xf940005e
bl _p_199
.loc 18 572 0
.word 0xf9401fb1
.word 0xf9443231
.word 0xb4000051
.word 0xd63f0220
.word 0x14000083
.loc 18 575 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9445631
.word 0xb4000051
.word 0xd63f0220
bl _p_138
.word 0x53001c00
.word 0xf9007ba0
.word 0xf9401fb1
.word 0xf9447231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
.word 0x34000320
.loc 18 576 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9449a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xf94017a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_150
.word 0x93407c00
.word 0xf9007ba0
.word 0xf9401fb1
.word 0xf944c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba1
.word 0xd2800020
.word 0xd2800000
.word 0xd2800022
bl _p_151
.loc 18 578 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf944fa31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2512]
.word 0x39400000
.word 0x340002a0
.loc 18 580 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9452e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_150
.word 0x93407c00
.word 0xf9007ba0
.word 0xf9401fb1
.word 0xf9455631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9407ba0
bl _p_152
.loc 18 582 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9457e31
.word 0xb4000051
.word 0xd63f0220
.word 0x3940c3a0
.word 0x340003a0
.loc 18 584 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf945a631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a2
.word 0x9101c3a0
.word 0x910163a0
.word 0x3981c3a0
.word 0x390163a0
.word 0xaa0203e0
.word 0x910163a1
.word 0xf9402fa1
.word 0xf940005e
bl _p_153
.word 0x53001c00
.word 0xf9401fb1
.word 0xf945e231
.word 0xb4000051
.word 0xd63f0220
.loc 18 585 0
.word 0xf9401fb1
.word 0xf945f231
.word 0xb4000051
.word 0xd63f0220
.word 0x14000013
.loc 18 588 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9461631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017a2
.word 0x9101c3a0
.word 0x910143a0
.word 0x3981c3a0
.word 0x390143a0
.word 0xaa0203e0
.word 0x910143a1
.word 0xf9402ba1
.word 0xf940005e
bl _p_200
.loc 18 593 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9465e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9406bbe
.word 0xd61f03c0
.loc 18 594 0
.word 0xf94023b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9468631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9469631
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0x910003bf
.word 0xa8d07bfd
.word 0xd65f03c0

Lme_a1:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object:
.loc 18 778 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3160]
.word 0xf9001bb0
.word 0xf9400a11
.word 0xf9001fb1
.word 0xf9401bb1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401fb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xf94013a1
.word 0xd2800002
.word 0xf94017a3
.word 0xf9400ba2
.word 0xb9802044

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3064]
.word 0xd2800002
bl _p_201
.word 0xf9002ba0
.word 0xf9401bb1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf9401bb1
.word 0xf940b231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_a2:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions
System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions:
.loc 18 0 0 prologue_end
.word 0xa9b17bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xf90013b6
.word 0xa902ebb9
.word 0xaa0003f6
.word 0xf9001fa1
.word 0xf90023a2
.word 0xaa0303f9
.word 0xaa0403fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3168]
.word 0xf90027b0
.word 0xf9400a11
.word 0xf9002bb1
.word 0xf90037bf
.word 0xd2800015
.word 0xd2800014
.word 0x910183a0
.word 0x390183bf
.word 0xf94027b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3176]
.word 0xd2800501
.word 0xd2800501
bl _p_8
.word 0xf9005ba0
bl _p_202
.word 0xf94027b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xf90037a0
.word 0xf94037a0
.word 0xf9401fa1
.word 0xf90057a1
.word 0xf9000801
.word 0x91004000
bl _p_2
.word 0xf94057a0
.word 0xf94037a0
.word 0xf94023a1
.word 0xf90053a1
.word 0xf9000c01
.word 0x91006000
bl _p_2
.word 0xf94053a0
.loc 18 816 0
.word 0xf94027b1
.word 0xf940e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xb50002b6
.loc 18 817 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd289c9e0
.word 0xf2a00020
.word 0xd289c9e0
.word 0xf2a00020
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 18 819 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9415a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9400800
.word 0xb5000300
.word 0xf94037a0
.word 0xf9400c00
.word 0xb50002a0
.loc 18 820 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9419231
.word 0xb4000051
.word 0xd63f0220
.word 0xd289cce0
.word 0xf2a00020
.word 0xd289cce0
.word 0xf2a00020
bl _p_133
.word 0xaa0003e1
.word 0xd2800e80
.word 0xf2a04000
.word 0xd2800e80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_51
.loc 18 824 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf941e231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xd2800020
.word 0xaa1a03e0
.word 0xd2800021
bl _p_203
.loc 18 826 0
.word 0xf94027b1
.word 0xf9420631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9005ba0
.word 0xaa1903e0
.word 0xaa1a03e0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2488]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf9005fa0
.word 0xaa1903e1
.word 0xaa1a03e2
bl _p_204
.word 0xf94027b1
.word 0xf9424e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xf9405fa1
.word 0xf90057a1
.word 0xf9001001
.word 0x91008000
bl _p_2
.word 0xf94057a0
.loc 18 828 0
.word 0xf94027b1
.word 0xf9427a31
.word 0xb4000051
.word 0xd63f0220
bl _p_138
.word 0x53001c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf9429631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0x34000740
.loc 18 829 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf942be31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xf94037a0
.word 0xf9401001
.word 0xaa0103e0
.word 0xf940003e
bl _p_150
.word 0x93407c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf942ee31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3184]
.word 0xf9005ba0
.word 0xaa1603e0
.word 0xaa1603e0
.word 0xf94002de
bl _p_205
.word 0xf90063a0
.word 0xf94027b1
.word 0xf9432231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94063a1
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9405430
.word 0xd63f0200
.word 0xf9005fa0
.word 0xf94027b1
.word 0xf9434a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9405ba0
.word 0xf9405fa1
bl _p_85
.word 0xf90057a0
.word 0xf94027b1
.word 0xf9436a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a1
.word 0xf94057a2
.word 0xd2800000
.word 0xd2800000
.word 0xd2800003
bl _p_206
.loc 18 831 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf943a231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2512]
.word 0x39400000
.word 0x34000240
.loc 18 833 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf943d631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9401000
bl _p_207
.word 0x53001c00
.word 0xf94027b1
.word 0xf943f631
.word 0xb4000051
.word 0xd63f0220
.word 0x14000001
.loc 18 842 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9441a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3192]
.word 0x39400000
.word 0x34001520

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3200]
.word 0xd2800401
.word 0xd2800401
bl _p_8
.word 0xf90077a0
bl _p_208
.word 0xf94027b1
.word 0xf9445e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94077a0
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xf94037a1
.word 0xf90073a1
.word 0xf9000ea1
.word 0x91006000
bl _p_2
.word 0xf94073a0
.loc 18 844 0
.word 0xf94027b1
.word 0xf9449231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1503e0
.word 0xf9006ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3208]
.word 0xd2800281
.word 0xd2800281
bl _p_8
.word 0xf9006fa0
bl _p_209
.word 0xf94027b1
.word 0xf944ca31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9406ba0
.word 0xf9406fa1
.word 0xf90067a1
.word 0xf9000aa1
.word 0x91004000
bl _p_2
.word 0xf94067a0
.loc 18 847 0
.word 0xf94027b1
.word 0xf944f631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xaa1503e0
.word 0xf90063a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54002640

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3216]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf94063a1
.word 0xf9005ba1
.word 0xf9001001
.word 0xf9005fa0
.word 0x91008000
bl _p_2
.word 0xf9405ba0
.word 0xf9405fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3224]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3232]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3240]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa1903e0
.word 0xaa1603e0
.word 0xaa1903e2
.word 0xf9400ed0
.word 0xd63f0200
.word 0xf90057a0
.word 0xf94027b1
.word 0xf945b231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94057a0
.word 0xf90053a0
.word 0xaa0003f4
.loc 18 852 0
.word 0xf94027b1
.word 0xf945ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0xaa0003e1
.word 0xb4000e80
.word 0xaa1403e0
.word 0xaa1403e0
.word 0xf9400281

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3248]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf9461a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0x34000c40
.word 0xaa1503e0
.word 0xf9400aa1
.word 0xaa0103e0
.word 0xf940003e
bl _p_210
.word 0x53001c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf9464e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0x34000aa0
.loc 18 855 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9467631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1403e0
.word 0xaa1503e0
.word 0xf9400ea0
.word 0xf9400801
.word 0xaa1503e0
.word 0xf9400ea0
.word 0xf9400c02
.word 0xaa1503e0
.word 0xf9400ea0
.word 0xf9401003
.word 0xd2800000

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3064]
.word 0xaa1403e0
.word 0xd2800004
bl _p_211
.loc 18 857 0
.word 0xf94027b1
.word 0xf946ca31
.word 0xb4000051
.word 0xd63f0220
.word 0x14000037
.loc 18 861 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf946ee31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1603e0
.word 0xf94037a0
.word 0xf9005ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54001680

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3216]
.word 0xd2800e01
.word 0xd2800e01
bl _p_8
.word 0xf9405ba1
.word 0xf90053a1
.word 0xf9001001
.word 0xf90057a0
.word 0x91008000
bl _p_2
.word 0xf94053a0
.word 0xf94057a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3256]
.word 0xf9001420

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3264]
.word 0xf9002020

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3272]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0xd2800000
.word 0x3901803f
.word 0xaa1903e0
.word 0xaa1603e0
.word 0xaa1903e2
.word 0xf9400ed0
.word 0xd63f0200
.word 0xf94027b1
.word 0xf947a631
.word 0xb4000051
.word 0xd63f0220
.loc 18 866 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf947c631
.word 0xb4000051
.word 0xd63f0220
.word 0x1400006f
.word 0xf9003ba0
.word 0xf9403ba0
.loc 18 867 0
.word 0xf94027b1
.word 0xf947e231
.word 0xb4000051
.word 0xd63f0220
.loc 18 869 0
.word 0xf94027b1
.word 0xf947f231
.word 0xb4000051
.word 0xd63f0220
bl _p_138
.word 0x53001c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf9480e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
.word 0x34000340
.loc 18 870 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9483631
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0xf94037a0
.word 0xf9401001
.word 0xaa0103e0
.word 0xf940003e
bl _p_150
.word 0x93407c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf9486631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a1
.word 0xd2800060
.word 0xd2800000
.word 0xd2800062
bl _p_151
.loc 18 872 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9489a31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2512]
.word 0x39400000
.word 0x340002c0
.loc 18 874 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf948ce31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9401001
.word 0xaa0103e0
.word 0xf940003e
bl _p_150
.word 0x93407c00
.word 0xf90053a0
.word 0xf94027b1
.word 0xf948fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94053a0
bl _p_152
.loc 18 878 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf9492231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9401002
.word 0x910183a0
.word 0x390183bf
.word 0x910183a0
.word 0x910243a0
.word 0x398183a0
.word 0x390243a0
.word 0xaa0203e0
.word 0x910243a1
.word 0xf9404ba1
.word 0xf940005e
bl _p_153
.word 0x53001c00
.word 0xf94027b1
.word 0xf9496a31
.word 0xb4000051
.word 0xd63f0220
.loc 18 879 0
.word 0xf94027b1
.word 0xf9497a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba0
bl _p_212
.loc 18 882 0
.word 0xf9402bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94027b1
.word 0xf949a231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94037a0
.word 0xf9401000
.word 0xf94027b1
.word 0xf949ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94157b4
.word 0xf94013b6
.word 0xa942ebb9
.word 0x910003bf
.word 0xa8cf7bfd
.word 0xd65f03c0
.word 0xd2800e60
.word 0xaa1103e1
bl _p_13

Lme_a3:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task:
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3280]
.word 0xf9002bb0
.word 0xf9400a11
.word 0xf9002fb1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0xd2800013
.word 0xf9402bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xf90037a0
.word 0xf94037a1
.word 0xf94037a0
.word 0xf9003ba1
.word 0xb4000060
.word 0xf9403ba0
bl _p_51
.word 0xf9403ba0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000440
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40001e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000036
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400002a
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000549
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90047a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf90043a1
.word 0xf9402bb1
.word 0xf941ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94043a0
.word 0xaa0003f3
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffbcb
.word 0xaa1303e0
.word 0xaa1303e0
.word 0xf9402bb1
.word 0xf941ea31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_a4:
.text
ut_165:
add x0, x0, 16
b System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task:
.loc 16 574 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xf90023af
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3288]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xd2800019
.word 0xf94017b1
.word 0xf9404231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400b40
.word 0xaa0003f9
.loc 16 575 0
.word 0xf94017b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xb5000419
.word 0xf94017b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf94023a0
bl _p_213
.word 0x3980b410
.word 0xb5000050
bl _p_214
.word 0xf94023a0
bl _p_213
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf9002fa0
bl _p_215
.word 0xf94017b1
.word 0xf940da31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402fa0
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1803e1
.word 0xaa1803f9
.word 0xf9002ba0
.word 0xf9000b40
.word 0x91004340
bl _p_2
.word 0xf9402ba0
.loc 16 576 0
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9412231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf94017b1
.word 0xf9413a31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_a5:
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult
System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult:
.loc 16 833 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3296]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0x910123a0
.word 0xf90027bf
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xd2800000
.word 0x910043a0
.word 0x910103a0
.word 0x398043a0
.word 0x390103a0
.word 0xd2880000
.word 0x910123a0
.word 0xf90027bf
.word 0x910123a0
.word 0x9100e3a0
.word 0xf94027a0
.word 0xf9001fa0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2488]
.word 0xd2800a01
.word 0xd2800a01
bl _p_8
.word 0xf9002ba0
.word 0xd2800001
.word 0x910103a2
.word 0xf94023a2
.word 0xd2880003
.word 0x9100e3a4
.word 0xf9401fa4
bl _p_216
.word 0xf94013b1
.word 0xf940d231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9402ba0
.word 0xf94013b1
.word 0xf940e631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_a6:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult:
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3304]
.word 0xf90033b0
.word 0xf9400a11
.word 0xf90037b1
.word 0xd2800019
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0x910263a0
.word 0x390263bf
.word 0xf94033b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000160
bl _p_130
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xaa1403e1
.word 0xaa0003f3
.word 0xb4000094
.word 0xaa1303e0
.word 0xaa1303e0
bl _p_51
.word 0xaa1303e0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9101a340
.word 0xf9403740
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xb50005c0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91008340
.word 0xf9401340
.word 0xaa0003f5
.word 0xaa1503e0
.word 0xb40002a0
.word 0xaa1503e0
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b41
.word 0x910243a0
.word 0xf90053a0
.word 0xaa1503e0
.word 0xd63f0020
.word 0xf94053be
.word 0xf90003c0
.word 0x910243a0
.word 0x910143a0
.word 0x398243a0
.word 0x390143a0
.word 0x14000044
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x9100e340
.word 0xf9401f40
.word 0xaa1a03e0
.word 0xaa1a03e0
.word 0x91004340
.word 0xf9400b40
.word 0x910223a1
.word 0xf90053a1
.word 0xd63f0000
.word 0xf94053be
.word 0xf90003c0
.word 0x910223a0
.word 0x910143a0
.word 0x398223a0
.word 0x390143a0
.word 0x14000032
.word 0xaa1703e0
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800019
.word 0xaa1703e0
.word 0xaa1903e0
.word 0x93407f20
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000669
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f6
.word 0xaa1603e1
.word 0x910203a0
.word 0xf90053a0
.word 0xaa0103e0
.word 0xf9005ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94053be
.word 0xf90003c0
.word 0xf9405ba0
.word 0xf94033b1
.word 0xf941e231
.word 0xb4000051
.word 0xd63f0220
.word 0x910203a0
.word 0x910263a0
.word 0x398203a0
.word 0x390263a0
.word 0xaa1903e0
.word 0x11000720
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xaa1803e1
.word 0x6b18001f
.word 0x54fffb8b
.word 0x910263a0
.word 0x9101e3a0
.word 0x398263a0
.word 0x3901e3a0
.word 0x9101e3a0
.word 0x910143a0
.word 0x3981e3a0
.word 0x390143a0
.word 0xf94033b1
.word 0xf9423e31
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0xf9402ba0
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_ab:
.text
ut_172:
add x0, x0, 16
b System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult:
.file 19 "/Library/Frameworks/Xamarin.iOS.framework/Versions/10.10.0.36/src/mono/mcs/class/referencesource/mscorlib/system/runtime/compilerservices/TaskAwaiter.cs"
.loc 19 317 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3312]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf90023a1
.word 0xf9000001
.word 0xaa0003e1
bl _p_2
.word 0xf94023a0
.loc 19 318 0
.word 0xf94013b1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_ac:
.text
ut_173:
add x0, x0, 16
b System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted:
.loc 19 325 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3320]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400001
.word 0xaa0103e0
.word 0xf940003e
bl _p_176
.word 0x53001c00
.word 0xf9001ba0
.word 0xf9400fb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9400fb1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_ad:
.text
ut_174:
add x0, x0, 16
b System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action:
.loc 19 336 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3328]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400000
.word 0xf9400fa1
.word 0xd2800022
.word 0xd2800022
.word 0xd2800022
.word 0xd2800023
bl _p_217
.loc 19 337 0
.word 0xf94013b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_ae:
.text
ut_175:
add x0, x0, 16
b System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action:
.loc 19 347 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3336]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400000
.word 0xf9400fa1
.word 0xd2800022
.word 0xd2800002
.word 0xd2800022
.word 0xd2800003
bl _p_217
.loc 19 348 0
.word 0xf94013b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9409631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_af:
.text
ut_176:
add x0, x0, 16
b System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult
System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult:
.loc 19 357 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3344]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400340
bl _p_218
.loc 19 358 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400341
.word 0x910103a0
.word 0xf90027a0
.word 0xaa0103e0
.word 0xf940003e
bl _p_219
.word 0xf94027be
.word 0xf90003c0
.word 0xf94017b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0x910103a0
.word 0x910063a0
.word 0x398103a0
.word 0x390063a0
.word 0xf94017b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0xf9400fa0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_b0:
.text
ut_177:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
.loc 19 466 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3352]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9003ba0
.word 0xf9400fa1
.word 0x394083a2
.word 0x910143a0
.word 0xd2800000
.word 0xf9002ba0
.word 0xf9002fa0
.word 0x910143a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3360]
bl _p_220
.word 0x910143a0
.word 0x910103a0
.word 0xf9402ba0
.word 0xf90023a0
.word 0xf9402fa0
.word 0xf90027a0
.word 0xf94017b1
.word 0xf940b631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9403ba1
.word 0x910103a0
.word 0xaa0103e0
.word 0xf94023a2
.word 0xf90037a2
.word 0xf9000022
.word 0xf90033a0
bl _p_2
.word 0xf94033a0
.word 0xf94037a1
.word 0x91002000
.word 0xf94027a1
.word 0xf9000001
.loc 19 467 0
.word 0xf94017b1
.word 0xf940fa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9410a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_b1:
.text
ut_178:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter:
.loc 19 473 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf90013a0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3368]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a0
.word 0x910103a1
.word 0xf9400001
.word 0xf90023a1
.word 0xf9400400
.word 0xf90027a0
.word 0x910103a0
.word 0x910043a0
.word 0xf94023a0
.word 0xf9000ba0
.word 0xf94027a0
.word 0xf9000fa0
.word 0xf94017b1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fa1
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_b2:
.text
ut_179:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
.loc 19 494 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3376]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0xf9400fa0
.word 0xf90023a0
.word 0xf9000300
.word 0xaa1803e0
.word 0xaa1803e0
bl _p_2
.word 0xf94023a0
.loc 19 495 0
.word 0xf94017b1
.word 0xf9408e31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1803e0
.word 0x394083a0
.word 0x39002300
.loc 19 496 0
.word 0xf94017b1
.word 0xf940aa31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf940ba31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_b3:
.text
ut_180:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted:
.loc 19 503 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3384]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400001
.word 0xaa0103e0
.word 0xf940003e
bl _p_176
.word 0x53001c00
.word 0xf9001ba0
.word 0xf9400fb1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba0
.word 0xf9400fb1
.word 0xf9409231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b4:
.text
ut_181:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action:
.loc 19 514 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3392]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400320
.word 0xf9400fa1
.word 0xaa1903e2
.word 0x39402322
.word 0xd2800023
.word 0xd2800023
bl _p_217
.loc 19 515 0
.word 0xf94013b1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b5:
.text
ut_182:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action:
.loc 19 525 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3400]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400320
.word 0xf9400fa1
.word 0xaa1903e2
.word 0x39402322
.word 0xd2800003
.word 0xd2800003
bl _p_217
.loc 19 526 0
.word 0xf94013b1
.word 0xf9408a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9409a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b6:
.text
ut_183:
add x0, x0, 16
b System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult
.text
	.align 4
	.no_dead_strip System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult
System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult:
.loc 19 535 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3408]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400340
bl _p_218
.loc 19 536 0
.word 0xf94017b1
.word 0xf9407231
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1a03e0
.word 0xf9400341
.word 0x910103a0
.word 0xf90027a0
.word 0xaa0103e0
.word 0xf940003e
bl _p_219
.word 0xf94027be
.word 0xf90003c0
.word 0xf94017b1
.word 0xf940a631
.word 0xb4000051
.word 0xd63f0220
.word 0x910103a0
.word 0x910063a0
.word 0x398103a0
.word 0x390063a0
.word 0xf94017b1
.word 0xf940c631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bba
.word 0xf9400fa0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_b7:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor
System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor:
.word 0xa9bc7bfd
.word 0x910003fd

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3416]
.word 0xf9000bb0
.word 0xf9400a11
.word 0xf9000fb1
.word 0xf9400bb1
.word 0xf9402e31
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3424]
.word 0xd2800201
.word 0xd2800201
bl _p_8
.word 0xf9001ba0
bl _p_221
.word 0xf9400bb1
.word 0xf9405e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401ba1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #3072]
.word 0xf9000001
.word 0xf9400bb1
.word 0xf9408231
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b8:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult:
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3432]
.word 0xf90033b0
.word 0xf9400a11
.word 0xf90037b1
.word 0xd2800018
.word 0xd2800017
.word 0xd2800016
.word 0xd2800015
.word 0xd2800014
.word 0x910263a0
.word 0x390263bf
.word 0xf94033b1
.word 0xf9406231
.word 0xb4000051
.word 0xd63f0220

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x0, [x16, #2248]
.word 0xb9400000
.word 0x34000140
bl _p_130
.word 0xaa0003f3
.word 0xaa1303e0
.word 0xaa1303e1
.word 0xf90057a0
.word 0xb4000073
.word 0xf94057a0
bl _p_51
.word 0xf94057a0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9101a320
.word 0xf9403720
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xb5000640
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91008320
.word 0xf9401320
.word 0xaa0003f4
.word 0xaa1403e0
.word 0xb40002e0
.word 0xaa1403e0
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b22
.word 0x910243a0
.word 0xf90053a0
.word 0xaa1403e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0xf94053be
.word 0xf90003c0
.word 0x910243a0
.word 0x910143a0
.word 0x398243a0
.word 0x390143a0
.word 0x14000048
.word 0xaa1a03e0
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x9100e320
.word 0xf9401f20
.word 0xaa1903e0
.word 0xaa1903e0
.word 0x91004320
.word 0xf9400b21
.word 0x910223a0
.word 0xf90053a0
.word 0xaa1a03e0
.word 0xd63f0020
.word 0xf94053be
.word 0xf90003c0
.word 0x910223a0
.word 0x910143a0
.word 0x398223a0
.word 0x390143a0
.word 0x14000034
.word 0xaa1603e0
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800018
.word 0xaa1603e0
.word 0xaa1803e0
.word 0x93407f00
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x540006a9
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400000
.word 0xaa0003f5
.word 0xaa1503e2
.word 0xaa1a03e0
.word 0x910203a0
.word 0xf90053a0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf9005ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94053be
.word 0xf90003c0
.word 0xf9405ba0
.word 0xf94033b1
.word 0xf941fa31
.word 0xb4000051
.word 0xd63f0220
.word 0x910203a0
.word 0x910263a0
.word 0x398203a0
.word 0x390263a0
.word 0xaa1803e0
.word 0x11000700
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x6b17001f
.word 0x54fffb4b
.word 0x910263a0
.word 0x9101e3a0
.word 0x398263a0
.word 0x3901e3a0
.word 0x9101e3a0
.word 0x910143a0
.word 0x3981e3a0
.word 0x390143a0
.word 0xf94033b1
.word 0xf9425631
.word 0xb4000051
.word 0xd63f0220
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0xf9402ba0
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd28018a0
.word 0xaa1103e1
bl _p_13

Lme_bd:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor
System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3440]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_be:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult
System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult:
.loc 18 863 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3448]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xaa1903e1
.word 0xf9400b21
.word 0xaa1903e2
.word 0xf9400f22
.word 0xaa1903e3
.word 0xf9401323
.word 0xd2800024

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3064]
.word 0xd2800024
bl _p_211
.loc 18 864 0
.word 0xf94013b1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940ae31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_bf:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor
System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3456]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_c0:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult
System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult:
.loc 18 849 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3464]
.word 0xf90013b0
.word 0xf9400a11
.word 0xf90017b1
.word 0xf94013b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xaa1903e0
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf940003e
bl _p_210
.word 0x53001c00
.word 0xf90023a0
.word 0xf94013b1
.word 0xf9408631
.word 0xb4000051
.word 0xd63f0220
.word 0xf94023a0
.word 0x340002a0
.loc 18 850 0
.word 0xf94013b1
.word 0xf9409e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fa0
.word 0xaa1903e1
.word 0xf9400f21
.word 0xf9400821
.word 0xaa1903e2
.word 0xf9400f22
.word 0xf9400c42
.word 0xaa1903e3
.word 0xf9400f23
.word 0xf9401063
.word 0xd2800024

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x15, [x16, #3064]
.word 0xd2800024
bl _p_211
.loc 18 851 0
.word 0xf94017b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf940fe31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9410e31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_c1:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1_TResult_REF__ctor
System_Threading_Tasks_Task_1_TResult_REF__ctor:
.loc 17 91 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3472]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013b1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
bl _p_166
.loc 17 93 0
.word 0xf9400fb1
.word 0xf9406a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9407a31
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_c2:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor
System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor:
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3480]
.word 0xf9000fb0
.word 0xf9400a11
.word 0xf90013b1
.word 0xf9400fb1
.word 0xf9403231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400ba0
.word 0xf9400fb1
.word 0xf9404631
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400fb1
.word 0xf9405631
.word 0xb4000051
.word 0xd63f0220
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_c3:
.text
	.align 4
	.no_dead_strip System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task:
.loc 17 87 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3488]
.word 0xf90017b0
.word 0xf9400a11
.word 0xf9001bb1
.word 0xf94017b1
.word 0xf9403a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf9401bb1
.word 0xf9400231
.word 0xb4000051
.word 0xd63f0220
.word 0xf94017b1
.word 0xf9405a31
.word 0xb4000051
.word 0xd63f0220
.word 0xf94013a1
.word 0xaa0103e0
.word 0xf940003e
bl _p_222
.word 0xaa0003f9
.word 0xf94017b1
.word 0xf9407e31
.word 0xb4000051
.word 0xd63f0220
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x1, [x16, #3496]
.word 0xeb01001f
.word 0x10000011
.word 0x54000161
.word 0xaa1903e0
.word 0xaa1903e0
.word 0xf94017b1
.word 0xf940c231
.word 0xb4000051
.word 0xd63f0220
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801920
.word 0xaa1103e1
bl _p_13

Lme_c4:
.text
	.align 3
jit_code_end:

	.byte 0,0,0,0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
bl vitasa_Application_Main_string__
bl vitasa_Application__ctor
bl vitasa_AppDelegate_get_Window
bl vitasa_AppDelegate_set_Window_UIKit_UIWindow
bl vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary
bl vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication
bl vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication
bl vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication
bl vitasa_AppDelegate_OnActivated_UIKit_UIApplication
bl vitasa_AppDelegate_WillTerminate_UIKit_UIApplication
bl vitasa_AppDelegate__ctor
bl vitasa_ViewController__ctor_intptr
bl vitasa_ViewController_ViewDidLoad
bl vitasa_ViewController_DidReceiveMemoryWarning
bl vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
bl vitasa_ViewController_get_B_GettingReady
bl vitasa_ViewController_set_B_GettingReady_UIKit_UIButton
bl vitasa_ViewController_get_B_ViewAsList
bl vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton
bl vitasa_ViewController_get_B_ViewOnMap
bl vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton
bl vitasa_ViewController_get_I_Background
bl vitasa_ViewController_set_I_Background_UIKit_UIImageView
bl vitasa_ViewController_ReleaseDesignerOutlets
bl vitasa_VC_SitesList__ctor_intptr
bl vitasa_VC_SitesList_ViewDidLoad
bl vitasa_VC_SitesList_LoadSitesFromWebService
bl vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite
bl vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
bl vitasa_VC_SitesList_get_B_Back
bl vitasa_VC_SitesList_set_B_Back_UIKit_UIButton
bl vitasa_VC_SitesList_get_TV_SitesList
bl vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView
bl vitasa_VC_SitesList_ReleaseDesignerOutlets
bl vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0
bl vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1
bl vitasa_VC_SitesMap__ctor_intptr
bl vitasa_VC_SitesMap_ViewDidLoad
bl vitasa_VC_SitesMap_LoadSitesFromWebService
bl vitasa_VC_SitesMap_PutPinsOnMap
bl vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
bl vitasa_VC_SitesMap_get_B_Back
bl vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton
bl vitasa_VC_SitesMap_get_Map_SitesMap
bl vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView
bl vitasa_VC_SitesMap_ReleaseDesignerOutlets
bl vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0
bl vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1
bl vitasa_VC_GetReady__ctor_intptr
bl vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
bl vitasa_VC_GetReady_get_B_Back
bl vitasa_VC_GetReady_set_B_Back_UIKit_UIButton
bl vitasa_VC_GetReady_get_TB_ReadyMessage
bl vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView
bl vitasa_VC_GetReady_ReleaseDesignerOutlets
bl vitasa_C_VitaSite__ctor
bl vitasa_C_VitaSite__ctor_System_Json_JsonValue
bl vitasa_C_VitaSite_ImportSites_System_Json_JsonValue
bl vitasa_C_VitaSite_FetchSitesList
bl vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite
bl vitasa_C_VitaSite__cctor
bl vitasa_VC_SiteDetails__ctor_intptr
bl vitasa_VC_SiteDetails_ViewDidLoad
bl vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
bl vitasa_VC_SiteDetails_get_B_Back
bl vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton
bl vitasa_VC_SiteDetails_get_L_Address
bl vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel
bl vitasa_VC_SiteDetails_get_L_City
bl vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel
bl vitasa_VC_SiteDetails_get_L_SiteCoordinator
bl vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel
bl vitasa_VC_SiteDetails_get_L_SiteName
bl vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel
bl vitasa_VC_SiteDetails_get_L_SiteStatus
bl vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel
bl vitasa_VC_SiteDetails_get_L_StatePlusZip
bl vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel
bl vitasa_VC_SiteDetails_ReleaseDesignerOutlets
bl vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs
bl vitasa_C_PassAroundContainer__ctor
bl vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList
bl vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint
bl vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath
bl vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath
bl vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor
bl vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext
bl vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
bl vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap
bl vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
bl vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor
bl vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext
bl vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
bl vitasa_C_VitaSite__c__DisplayClass31_0__ctor
bl vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0
bl vitasa_C_VitaSite__FetchSitesListd__31__ctor
bl vitasa_C_VitaSite__FetchSitesListd__31_MoveNext
bl vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
bl vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor
bl vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs
bl method_addresses
bl wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult
bl System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
bl System_Array_InternalArray__ICollection_get_Count
bl System_Array_InternalArray__ICollection_get_IsReadOnly
bl System_Array_InternalArray__ICollection_Clear
bl System_Array_InternalArray__ICollection_Add_T_REF_T_REF
bl System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
bl System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
bl System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
bl wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite
bl wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite
bl wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
bl wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
bl wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
bl wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
bl System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool
bl System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object
bl System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions
bl wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
bl System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
bl System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult
bl System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
bl System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
bl System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
bl System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
bl System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
bl System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult
bl System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult
bl System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor
bl System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult
bl System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor
bl System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult
bl System_Threading_Tasks_Task_1_TResult_REF__ctor
bl System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor
bl System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
method_addresses_end:

.section __TEXT, __const
	.align 3
unbox_trampolines:

	.long 125,126,127,128,129,130,131,132
	.long 133,134,135,165,172,173,174,175
	.long 176,177,178,179,180,181,182,183
unbox_trampolines_end:

	.long 0
.text
	.align 3
unbox_trampoline_addresses:
bl ut_125
bl ut_126
bl ut_127
bl ut_128
bl ut_129
bl ut_130
bl ut_131
bl ut_132
bl ut_133
bl ut_134
bl ut_135
bl ut_165
bl ut_172
bl ut_173
bl ut_174
bl ut_175
bl ut_176
bl ut_177
bl ut_178
bl ut_179
bl ut_180
bl ut_181
bl ut_182
bl ut_183

	.long 0
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 0,13,12,31,0,68,14,48,157,6,158,5,68,13,29,13,12,31,0,68,14,80,157,10,158,9,68,13,29,16,12,31
	.byte 0,68,14,80,157,10,158,9,68,13,29,68,154,8,13,12,31,0,68,14,64,157,8,158,7,68,13,29,18,12,31,0
	.byte 68,14,80,157,10,158,9,68,13,29,68,153,8,154,7,32,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,147
	.byte 18,148,17,68,149,16,150,15,68,151,14,152,13,68,153,12,26,12,31,0,68,14,96,157,12,158,11,68,13,29,68,150
	.byte 10,151,9,68,152,8,153,7,68,154,6,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,24,12,31,0
	.byte 68,14,160,1,157,20,158,19,68,13,29,68,151,18,152,17,68,153,16,154,15,16,12,31,0,68,14,80,157,10,158,9
	.byte 68,13,29,68,152,8,32,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68
	.byte 151,10,152,9,68,153,8,21,12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6,14,12,31
	.byte 0,68,14,208,1,157,26,158,25,68,13,29,27,12,31,0,68,14,128,3,157,48,158,47,68,13,29,68,149,46,150,45
	.byte 68,151,44,68,153,43,154,42,14,12,31,0,68,14,176,2,157,38,158,37,68,13,29,26,12,31,0,68,14,112,157,14
	.byte 158,13,68,13,29,68,149,12,150,11,68,151,10,152,9,68,153,8,16,12,31,0,68,14,48,157,6,158,5,68,13,29
	.byte 68,154,4,34,12,31,0,68,14,208,1,157,26,158,25,68,13,29,68,147,24,148,23,68,149,22,150,21,68,151,20,152
	.byte 19,68,153,18,154,17,27,12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,149,20,150,19,68,151,18,152,17,68
	.byte 153,16,14,12,31,0,68,14,192,1,157,24,158,23,68,13,29,24,12,31,0,68,14,160,3,157,52,158,51,68,13,29
	.byte 68,151,50,152,49,68,153,48,154,47,29,12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,149,20,150,19,68,151
	.byte 18,152,17,68,153,16,154,15,34,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150
	.byte 11,68,151,10,152,9,68,153,8,154,7,23,12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153
	.byte 10,154,9,32,12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,147,32,148,31,68,149,30,150,29,68,151,28,152
	.byte 27,68,154,26,16,12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,24,12,31,0,68,14,160,2,157,36,158
	.byte 35,68,13,29,68,151,34,152,33,68,153,32,154,31,16,12,31,0,68,14,96,157,12,158,11,68,13,29,68,152,10,32
	.byte 12,31,0,68,14,176,2,157,38,158,37,68,13,29,68,147,36,148,35,68,149,34,150,33,68,151,32,152,31,68,154,30
	.byte 34,12,31,0,68,14,144,3,157,50,158,49,68,13,29,68,147,48,148,47,68,149,46,150,45,68,151,44,152,43,68,153
	.byte 42,154,41,14,12,31,0,68,14,144,1,157,18,158,17,68,13,29,21,12,31,0,68,14,112,157,14,158,13,68,13,29
	.byte 68,152,12,153,11,68,154,10,30,12,31,0,68,14,240,1,157,30,158,29,68,13,29,68,148,28,149,27,68,150,26,68
	.byte 152,25,153,24,68,154,23,34,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13
	.byte 68,151,12,152,11,68,153,10,154,9,13,12,31,0,68,14,112,157,14,158,13,68,13,29,16,12,31,0,68,14,80,157
	.byte 10,158,9,68,13,29,68,153,8,18,12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,154,11,16,12,31,0
	.byte 68,14,96,157,12,158,11,68,13,29,68,153,10,32,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149
	.byte 13,68,150,12,151,11,68,152,10,153,9,68,154,8,19,12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,153,32
	.byte 154,31,16,12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10,18,12,31,0,68,14,112,157,14,158,13,68,13
	.byte 29,68,152,12,153,11,20,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,151,16,68,154,15,17,12,31,0,68
	.byte 14,128,1,157,16,158,15,68,13,29,68,148,14,17,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,153,14,17
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,153,16,25,12,31,0,68,14,176,1,157,22,158,21,68,13,29
	.byte 68,148,20,68,150,19,68,152,18,153,17,18,12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9,16,12
	.byte 31,0,68,14,112,157,14,158,13,68,13,29,68,154,12,18,12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.byte 153,7,13,12,31,0,68,14,96,157,12,158,11,68,13,29,26,12,31,0,68,14,112,157,14,158,13,68,13,29,68,150
	.byte 12,151,11,68,152,10,153,9,68,154,8,21,12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153
	.byte 10,19,12,31,0,68,14,128,2,157,32,158,31,68,13,29,68,152,30,153,29,27,12,31,0,68,14,240,1,157,30,158
	.byte 29,68,13,29,68,148,28,149,27,68,150,26,68,153,25,154,24,21,12,31,0,68,14,96,157,12,158,11,68,13,29,68
	.byte 152,10,153,9,68,154,8,34,12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,147,22,148,21,68,149,20,150,19
	.byte 68,151,18,152,17,68,153,16,154,15,14,12,31,0,68,14,128,1,157,16,158,15,68,13,29

.text
	.align 4
plt:
mono_aot_vitasa_plt:
	.no_dead_strip plt_UIKit_UIApplication_Main_string___string_string
plt_UIKit_UIApplication_Main_string___string_string:
_p_1:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3512]
br x16
.word 5314
	.no_dead_strip plt_wrapper_write_barrier_object_wbarrier_conc_intptr
plt_wrapper_write_barrier_object_wbarrier_conc_intptr:
_p_2:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3520]
br x16
.word 5319
	.no_dead_strip plt_UIKit_UIApplicationDelegate__ctor
plt_UIKit_UIApplicationDelegate__ctor:
_p_3:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3528]
br x16
.word 5326
	.no_dead_strip plt_UIKit_UIViewController__ctor_intptr
plt_UIKit_UIViewController__ctor_intptr:
_p_4:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3536]
br x16
.word 5331
	.no_dead_strip plt_UIKit_UIViewController_ViewDidLoad
plt_UIKit_UIViewController_ViewDidLoad:
_p_5:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3544]
br x16
.word 5336
	.no_dead_strip plt_vitasa_ViewController_get_I_Background
plt_vitasa_ViewController_get_I_Background:
_p_6:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3552]
br x16
.word 5341
	.no_dead_strip plt_UIKit_UIImage_FromBundle_string
plt_UIKit_UIImage_FromBundle_string:
_p_7:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3560]
br x16
.word 5343
	.no_dead_strip plt_wrapper_alloc_object_AllocSmall_intptr_intptr
plt_wrapper_alloc_object_AllocSmall_intptr_intptr:
_p_8:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3568]
br x16
.word 5348
	.no_dead_strip plt_vitasa_C_PassAroundContainer__ctor
plt_vitasa_C_PassAroundContainer__ctor:
_p_9:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3576]
br x16
.word 5356
	.no_dead_strip plt_UIKit_UIViewController_DidReceiveMemoryWarning
plt_UIKit_UIViewController_DidReceiveMemoryWarning:
_p_10:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3584]
br x16
.word 5358
	.no_dead_strip plt_UIKit_UIViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
plt_UIKit_UIViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject:
_p_11:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3592]
br x16
.word 5363
	.no_dead_strip plt_string_op_Equality_string_string
plt_string_op_Equality_string_string:
_p_12:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3600]
br x16
.word 5368
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_13:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3608]
br x16
.word 5373
	.no_dead_strip plt_vitasa_ViewController_get_B_GettingReady
plt_vitasa_ViewController_get_B_GettingReady:
_p_14:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3616]
br x16
.word 5408
	.no_dead_strip plt_Foundation_NSObject_Dispose
plt_Foundation_NSObject_Dispose:
_p_15:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3624]
br x16
.word 5410
	.no_dead_strip plt_vitasa_ViewController_set_B_GettingReady_UIKit_UIButton
plt_vitasa_ViewController_set_B_GettingReady_UIKit_UIButton:
_p_16:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3632]
br x16
.word 5415
	.no_dead_strip plt_vitasa_ViewController_get_B_ViewAsList
plt_vitasa_ViewController_get_B_ViewAsList:
_p_17:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3640]
br x16
.word 5417
	.no_dead_strip plt_vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton
plt_vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton:
_p_18:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3648]
br x16
.word 5419
	.no_dead_strip plt_vitasa_ViewController_get_B_ViewOnMap
plt_vitasa_ViewController_get_B_ViewOnMap:
_p_19:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3656]
br x16
.word 5421
	.no_dead_strip plt_vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton
plt_vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton:
_p_20:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3664]
br x16
.word 5423
	.no_dead_strip plt_vitasa_ViewController_set_I_Background_UIKit_UIImageView
plt_vitasa_ViewController_set_I_Background_UIKit_UIImageView:
_p_21:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3672]
br x16
.word 5425
	.no_dead_strip plt__jit_icall_ves_icall_object_new_specific
plt__jit_icall_ves_icall_object_new_specific:
_p_22:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3680]
br x16
.word 5427
	.no_dead_strip plt_vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList
plt_vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList:
_p_23:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3688]
br x16
.word 5459
	.no_dead_strip plt_vitasa_VC_SitesList_get_TV_SitesList
plt_vitasa_VC_SitesList_get_TV_SitesList:
_p_24:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3696]
br x16
.word 5461
	.no_dead_strip plt_UIKit_UITableView_set_Source_UIKit_UITableViewSource
plt_UIKit_UITableView_set_Source_UIKit_UITableViewSource:
_p_25:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3704]
br x16
.word 5463
	.no_dead_strip plt_System_DateTime_get_Now
plt_System_DateTime_get_Now:
_p_26:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3712]
br x16
.word 5468
	.no_dead_strip plt_System_DateTime_op_Subtraction_System_DateTime_System_DateTime
plt_System_DateTime_op_Subtraction_System_DateTime_System_DateTime:
_p_27:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3720]
br x16
.word 5473
	.no_dead_strip plt_System_TimeSpan_get_TotalMinutes
plt_System_TimeSpan_get_TotalMinutes:
_p_28:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3728]
br x16
.word 5478
	.no_dead_strip plt_vitasa_VC_SitesList_LoadSitesFromWebService
plt_vitasa_VC_SitesList_LoadSitesFromWebService:
_p_29:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3736]
br x16
.word 5483
	.no_dead_strip plt_System_Threading_Tasks_Task_Run_System_Func_1_System_Threading_Tasks_Task
plt_System_Threading_Tasks_Task_Run_System_Func_1_System_Threading_Tasks_Task:
_p_30:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3744]
br x16
.word 5485
	.no_dead_strip plt_string_CompareTo_string
plt_string_CompareTo_string:
_p_31:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3752]
br x16
.word 5490
	.no_dead_strip plt_vitasa_VC_SitesList_get_B_Back
plt_vitasa_VC_SitesList_get_B_Back:
_p_32:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3760]
br x16
.word 5495
	.no_dead_strip plt_vitasa_VC_SitesList_set_B_Back_UIKit_UIButton
plt_vitasa_VC_SitesList_set_B_Back_UIKit_UIButton:
_p_33:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3768]
br x16
.word 5497
	.no_dead_strip plt_vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView
plt_vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView:
_p_34:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3776]
br x16
.word 5499
	.no_dead_strip plt_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor
plt_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor:
_p_35:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3784]
br x16
.word 5501
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Create
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Create:
_p_36:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3792]
br x16
.word 5503
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Start_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Start_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_:
_p_37:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3800]
br x16
.word 5508
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_get_Task
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_get_Task:
_p_38:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3808]
br x16
.word 5520
	.no_dead_strip plt_vitasa_VC_SitesMap_get_Map_SitesMap
plt_vitasa_VC_SitesMap_get_Map_SitesMap:
_p_39:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3816]
br x16
.word 5525
	.no_dead_strip plt_CoreLocation_CLLocationManager__ctor
plt_CoreLocation_CLLocationManager__ctor:
_p_40:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3824]
br x16
.word 5527
	.no_dead_strip plt_CoreLocation_CLLocationCoordinate2D__ctor_double_double
plt_CoreLocation_CLLocationCoordinate2D__ctor_double_double:
_p_41:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3832]
br x16
.word 5532
	.no_dead_strip plt_MapKit_MKCoordinateRegion_FromDistance_CoreLocation_CLLocationCoordinate2D_double_double
plt_MapKit_MKCoordinateRegion_FromDistance_CoreLocation_CLLocationCoordinate2D_double_double:
_p_42:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3840]
br x16
.word 5537
	.no_dead_strip plt_vitasa_VC_SitesMap_LoadSitesFromWebService
plt_vitasa_VC_SitesMap_LoadSitesFromWebService:
_p_43:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3848]
br x16
.word 5542
	.no_dead_strip plt_vitasa_VC_SitesMap_PutPinsOnMap
plt_vitasa_VC_SitesMap_PutPinsOnMap:
_p_44:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3856]
br x16
.word 5544
	.no_dead_strip plt_vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap
plt_vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap:
_p_45:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3864]
br x16
.word 5546
	.no_dead_strip plt_MapKit_MKMapView_set_Delegate_MapKit_IMKMapViewDelegate
plt_MapKit_MKMapView_set_Delegate_MapKit_IMKMapViewDelegate:
_p_46:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3872]
br x16
.word 5548
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_GetEnumerator
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_GetEnumerator:
_p_47:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3880]
br x16
.word 5553
	.no_dead_strip plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_get_Current
plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_get_Current:
_p_48:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3888]
br x16
.word 5564
	.no_dead_strip plt_System_Convert_ToDouble_string
plt_System_Convert_ToDouble_string:
_p_49:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3896]
br x16
.word 5575
	.no_dead_strip plt__jit_icall_mono_thread_get_undeniable_exception
plt__jit_icall_mono_thread_get_undeniable_exception:
_p_50:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3904]
br x16
.word 5580
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_51:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3912]
br x16
.word 5619
	.no_dead_strip plt_MapKit_MKPointAnnotation__ctor
plt_MapKit_MKPointAnnotation__ctor:
_p_52:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3920]
br x16
.word 5647
	.no_dead_strip plt_wrapper_alloc_object_AllocVector_intptr_intptr
plt_wrapper_alloc_object_AllocVector_intptr_intptr:
_p_53:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3928]
br x16
.word 5652
	.no_dead_strip plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_MoveNext
plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_MoveNext:
_p_54:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3936]
br x16
.word 5660
	.no_dead_strip plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_Dispose
plt_System_Collections_Generic_List_1_Enumerator_vitasa_C_VitaSite_Dispose:
_p_55:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3944]
br x16
.word 5671
	.no_dead_strip plt_vitasa_VC_SitesMap_get_B_Back
plt_vitasa_VC_SitesMap_get_B_Back:
_p_56:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3952]
br x16
.word 5691
	.no_dead_strip plt_vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton
plt_vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton:
_p_57:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3960]
br x16
.word 5693
	.no_dead_strip plt_vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView
plt_vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView:
_p_58:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3968]
br x16
.word 5695
	.no_dead_strip plt_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor
plt_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor:
_p_59:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3976]
br x16
.word 5697
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Start_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_Start_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_:
_p_60:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3984]
br x16
.word 5699
	.no_dead_strip plt_vitasa_VC_GetReady_get_B_Back
plt_vitasa_VC_GetReady_get_B_Back:
_p_61:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #3992]
br x16
.word 5711
	.no_dead_strip plt_vitasa_VC_GetReady_set_B_Back_UIKit_UIButton
plt_vitasa_VC_GetReady_set_B_Back_UIKit_UIButton:
_p_62:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4000]
br x16
.word 5713
	.no_dead_strip plt_vitasa_VC_GetReady_get_TB_ReadyMessage
plt_vitasa_VC_GetReady_get_TB_ReadyMessage:
_p_63:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4008]
br x16
.word 5715
	.no_dead_strip plt_vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView
plt_vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView:
_p_64:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4016]
br x16
.word 5717
	.no_dead_strip plt_System_Json_JsonValue_op_Implicit_System_Json_JsonValue
plt_System_Json_JsonValue_op_Implicit_System_Json_JsonValue:
_p_65:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4024]
br x16
.word 5719
	.no_dead_strip plt_System_Json_JsonValue_op_Implicit_System_Json_JsonValue_0
plt_System_Json_JsonValue_op_Implicit_System_Json_JsonValue_0:
_p_66:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4032]
br x16
.word 5724
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite__ctor
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite__ctor:
_p_67:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4040]
br x16
.word 5729
	.no_dead_strip plt_vitasa_C_VitaSite__ctor_System_Json_JsonValue
plt_vitasa_C_VitaSite__ctor_System_Json_JsonValue:
_p_68:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4048]
br x16
.word 5740
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_Add_vitasa_C_VitaSite
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_Add_vitasa_C_VitaSite:
_p_69:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4056]
br x16
.word 5742
	.no_dead_strip plt_vitasa_C_VitaSite__FetchSitesListd__31__ctor
plt_vitasa_C_VitaSite__FetchSitesListd__31__ctor:
_p_70:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4064]
br x16
.word 5753
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_Create
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_Create:
_p_71:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4072]
br x16
.word 5755
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_Start_vitasa_C_VitaSite__FetchSitesListd__31_vitasa_C_VitaSite__FetchSitesListd__31_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_Start_vitasa_C_VitaSite__FetchSitesListd__31_vitasa_C_VitaSite__FetchSitesListd__31_:
_p_72:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4080]
br x16
.word 5766
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_get_Task
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_get_Task:
_p_73:
adrp x16, mono_aot_vitasa_got@PAGE+0
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #4088]
br x16
.word 5778
	.no_dead_strip plt_vitasa_C_VitaSite__ctor
plt_vitasa_C_VitaSite__ctor:
_p_74:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #0]
br x16
.word 5789
	.no_dead_strip plt__jit_icall_mono_helper_ldstr
plt__jit_icall_mono_helper_ldstr:
_p_75:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #8]
br x16
.word 5791
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_B_Back
plt_vitasa_VC_SiteDetails_get_B_Back:
_p_76:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #16]
br x16
.word 5811
	.no_dead_strip plt_UIKit_UIControl_add_TouchUpInside_System_EventHandler
plt_UIKit_UIControl_add_TouchUpInside_System_EventHandler:
_p_77:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #24]
br x16
.word 5813
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_SiteName
plt_vitasa_VC_SiteDetails_get_L_SiteName:
_p_78:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #32]
br x16
.word 5818
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_Address
plt_vitasa_VC_SiteDetails_get_L_Address:
_p_79:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #40]
br x16
.word 5820
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_City
plt_vitasa_VC_SiteDetails_get_L_City:
_p_80:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #48]
br x16
.word 5822
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_StatePlusZip
plt_vitasa_VC_SiteDetails_get_L_StatePlusZip:
_p_81:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #56]
br x16
.word 5824
	.no_dead_strip plt_string_Concat_string_string_string
plt_string_Concat_string_string_string:
_p_82:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #64]
br x16
.word 5826
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_SiteCoordinator
plt_vitasa_VC_SiteDetails_get_L_SiteCoordinator:
_p_83:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #72]
br x16
.word 5831
	.no_dead_strip plt_vitasa_VC_SiteDetails_get_L_SiteStatus
plt_vitasa_VC_SiteDetails_get_L_SiteStatus:
_p_84:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #80]
br x16
.word 5833
	.no_dead_strip plt_string_Concat_string_string
plt_string_Concat_string_string:
_p_85:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #88]
br x16
.word 5835
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton
plt_vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton:
_p_86:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #96]
br x16
.word 5840
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel:
_p_87:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #104]
br x16
.word 5842
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel:
_p_88:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #112]
br x16
.word 5844
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel:
_p_89:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #120]
br x16
.word 5846
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel:
_p_90:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #128]
br x16
.word 5848
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel:
_p_91:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #136]
br x16
.word 5850
	.no_dead_strip plt_vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel
plt_vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel:
_p_92:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #144]
br x16
.word 5852
	.no_dead_strip plt_UIKit_UITableViewSource__ctor
plt_UIKit_UITableViewSource__ctor:
_p_93:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #152]
br x16
.word 5854
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_get_Count
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_get_Count:
_p_94:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #160]
br x16
.word 5859
	.no_dead_strip plt_UIKit_UITableViewCell__ctor_UIKit_UITableViewCellStyle_string
plt_UIKit_UITableViewCell__ctor_UIKit_UITableViewCellStyle_string:
_p_95:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #168]
br x16
.word 5870
	.no_dead_strip plt_Foundation_NSIndexPath_get_Row
plt_Foundation_NSIndexPath_get_Row:
_p_96:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #176]
br x16
.word 5875
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_get_Item_int
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_get_Item_int:
_p_97:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #184]
br x16
.word 5880
	.no_dead_strip plt_string_Concat_string__
plt_string_Concat_string__:
_p_98:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #192]
br x16
.word 5891
	.no_dead_strip plt_vitasa_C_VitaSite_FetchSitesList
plt_vitasa_C_VitaSite_FetchSitesList:
_p_99:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #200]
br x16
.word 5896
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Json_JsonValue_GetAwaiter
plt_System_Threading_Tasks_Task_1_System_Json_JsonValue_GetAwaiter:
_p_100:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #208]
br x16
.word 5898
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_get_IsCompleted
plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_get_IsCompleted:
_p_101:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #216]
br x16
.word 5909
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_:
_p_102:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #224]
br x16
.word 5920
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_GetResult
plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_GetResult:
_p_103:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #232]
br x16
.word 5932
	.no_dead_strip plt_vitasa_C_VitaSite_ImportSites_System_Json_JsonValue
plt_vitasa_C_VitaSite_ImportSites_System_Json_JsonValue:
_p_104:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #240]
br x16
.word 5943
	.no_dead_strip plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_Sort_System_Comparison_1_vitasa_C_VitaSite
plt_System_Collections_Generic_List_1_vitasa_C_VitaSite_Sort_System_Comparison_1_vitasa_C_VitaSite:
_p_105:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #248]
br x16
.word 5945
	.no_dead_strip plt_UIKit_UIApplication_get_SharedApplication
plt_UIKit_UIApplication_get_SharedApplication:
_p_106:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #256]
br x16
.word 5956
	.no_dead_strip plt_Foundation_NSObject_InvokeOnMainThread_System_Action
plt_Foundation_NSObject_InvokeOnMainThread_System_Action:
_p_107:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #264]
br x16
.word 5961
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_SetException_System_Exception
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_SetException_System_Exception:
_p_108:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #272]
br x16
.word 5966
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_SetResult
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_SetResult:
_p_109:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #280]
br x16
.word 5971
	.no_dead_strip plt_MapKit_MKMapViewDelegate__ctor
plt_MapKit_MKMapViewDelegate__ctor:
_p_110:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #288]
br x16
.word 5976
	.no_dead_strip plt_vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor
plt_vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor:
_p_111:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #296]
br x16
.word 5981
	.no_dead_strip plt_MapKit_MKAnnotation_Extensions_GetTitle_MapKit_IMKAnnotation
plt_MapKit_MKAnnotation_Extensions_GetTitle_MapKit_IMKAnnotation:
_p_112:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #304]
br x16
.word 5983
	.no_dead_strip plt_MapKit_MKPinAnnotationView__ctor_MapKit_IMKAnnotation_string
plt_MapKit_MKPinAnnotationView__ctor_MapKit_IMKAnnotation_string:
_p_113:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #312]
br x16
.word 5988
	.no_dead_strip plt_System_Console_WriteLine_string
plt_System_Console_WriteLine_string:
_p_114:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #320]
br x16
.word 5993
	.no_dead_strip plt_UIKit_UIButton_FromType_UIKit_UIButtonType
plt_UIKit_UIButton_FromType_UIKit_UIButtonType:
_p_115:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #328]
br x16
.word 5998
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_:
_p_116:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #336]
br x16
.word 6003
	.no_dead_strip plt_System_Json_JsonValue_Load_System_IO_Stream
plt_System_Json_JsonValue_Load_System_IO_Stream:
_p_117:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #344]
br x16
.word 6015
	.no_dead_strip plt_System_Uri__ctor_string
plt_System_Uri__ctor_string:
_p_118:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #352]
br x16
.word 6020
	.no_dead_strip plt_System_Net_WebRequest_Create_System_Uri
plt_System_Net_WebRequest_Create_System_Uri:
_p_119:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #360]
br x16
.word 6025
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Net_WebResponse_GetAwaiter
plt_System_Threading_Tasks_Task_1_System_Net_WebResponse_GetAwaiter:
_p_120:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #368]
br x16
.word 6030
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_get_IsCompleted
plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_get_IsCompleted:
_p_121:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #376]
br x16
.word 6041
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_vitasa_C_VitaSite__FetchSitesListd__31_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse__vitasa_C_VitaSite__FetchSitesListd__31_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_vitasa_C_VitaSite__FetchSitesListd__31_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse__vitasa_C_VitaSite__FetchSitesListd__31_:
_p_122:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #384]
br x16
.word 6052
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_GetResult
plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Net_WebResponse_GetResult:
_p_123:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #392]
br x16
.word 6064
	.no_dead_strip plt_vitasa_C_VitaSite__c__DisplayClass31_0__ctor
plt_vitasa_C_VitaSite__c__DisplayClass31_0__ctor:
_p_124:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #400]
br x16
.word 6075
	.no_dead_strip plt_System_Threading_Tasks_Task_Run_System_Json_JsonValue_System_Func_1_System_Json_JsonValue
plt_System_Threading_Tasks_Task_Run_System_Json_JsonValue_System_Func_1_System_Json_JsonValue:
_p_125:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #408]
br x16
.word 6077
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_C_VitaSite__FetchSitesListd__31_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_C_VitaSite__FetchSitesListd__31_
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_AwaitUnsafeOnCompleted_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue_vitasa_C_VitaSite__FetchSitesListd__31_System_Runtime_CompilerServices_TaskAwaiter_1_System_Json_JsonValue__vitasa_C_VitaSite__FetchSitesListd__31_:
_p_126:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #416]
br x16
.word 6089
	.no_dead_strip plt_System_Json_JsonValue_Parse_string
plt_System_Json_JsonValue_Parse_string:
_p_127:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #424]
br x16
.word 6101
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_SetException_System_Exception
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_SetException_System_Exception:
_p_128:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #432]
br x16
.word 6106
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_SetResult_System_Json_JsonValue
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Json_JsonValue_SetResult_System_Json_JsonValue:
_p_129:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #440]
br x16
.word 6117
	.no_dead_strip plt__jit_icall_mono_thread_interruption_checkpoint
plt__jit_icall_mono_thread_interruption_checkpoint:
_p_130:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #448]
br x16
.word 6128
	.no_dead_strip plt__rgctx_fetch_0
plt__rgctx_fetch_0:
_p_131:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #456]
br x16
.word 6194
	.no_dead_strip plt_System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
plt_System_Array_InternalEnumerator_1_T_REF__ctor_System_Array:
_p_132:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #464]
br x16
.word 6202
	.no_dead_strip plt__jit_icall_mono_helper_ldstr_mscorlib
plt__jit_icall_mono_helper_ldstr_mscorlib:
_p_133:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #472]
br x16
.word 6221
	.no_dead_strip plt_Locale_GetText_string
plt_Locale_GetText_string:
_p_134:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #480]
br x16
.word 6250
	.no_dead_strip plt__rgctx_fetch_1
plt__rgctx_fetch_1:
_p_135:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #488]
br x16
.word 6274
	.no_dead_strip plt_System_Array_Copy_System_Array_int_System_Array_int_int
plt_System_Array_Copy_System_Array_int_System_Array_int_int:
_p_136:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #496]
br x16
.word 6298
	.no_dead_strip plt__rgctx_fetch_2
plt__rgctx_fetch_2:
_p_137:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #504]
br x16
.word 6325
	.no_dead_strip plt_System_Threading_Tasks_AsyncCausalityTracer_get_LoggingOn
plt_System_Threading_Tasks_AsyncCausalityTracer_get_LoggingOn:
_p_138:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #512]
br x16
.word 6355
	.no_dead_strip plt__rgctx_fetch_3
plt__rgctx_fetch_3:
_p_139:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #520]
br x16
.word 6384
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task:
_p_140:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #528]
br x16
.word 6392
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_GetCompletionAction_System_Threading_Tasks_Task_System_Runtime_CompilerServices_AsyncMethodBuilderCore_MoveNextRunner_
plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_GetCompletionAction_System_Threading_Tasks_Task_System_Runtime_CompilerServices_AsyncMethodBuilderCore_MoveNextRunner_:
_p_141:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #536]
br x16
.word 6411
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_PostBoxInitialization_System_Runtime_CompilerServices_IAsyncStateMachine_System_Runtime_CompilerServices_AsyncMethodBuilderCore_MoveNextRunner_System_Threading_Tasks_Task
plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_PostBoxInitialization_System_Runtime_CompilerServices_IAsyncStateMachine_System_Runtime_CompilerServices_AsyncMethodBuilderCore_MoveNextRunner_System_Threading_Tasks_Task:
_p_142:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #544]
br x16
.word 6416
	.no_dead_strip plt__rgctx_fetch_4
plt__rgctx_fetch_4:
_p_143:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #552]
br x16
.word 6421
	.no_dead_strip plt__rgctx_fetch_5
plt__rgctx_fetch_5:
_p_144:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #560]
br x16
.word 6435
	.no_dead_strip plt__rgctx_fetch_6
plt__rgctx_fetch_6:
_p_145:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #568]
br x16
.word 6449
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_ThrowAsync_System_Exception_System_Threading_SynchronizationContext
plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_ThrowAsync_System_Exception_System_Threading_SynchronizationContext:
_p_146:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #576]
br x16
.word 6457
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
plt_System_Runtime_CompilerServices_AsyncMethodBuilderCore_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine:
_p_147:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #584]
br x16
.word 6462
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor:
_p_148:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #592]
br x16
.word 6467
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult:
_p_149:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #600]
br x16
.word 6487
	.no_dead_strip plt_System_Threading_Tasks_Task_get_Id
plt_System_Threading_Tasks_Task_get_Id:
_p_150:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #608]
br x16
.word 6507
	.no_dead_strip plt_System_Threading_Tasks_AsyncCausalityTracer_TraceOperationCompletion_System_Threading_Tasks_CausalityTraceLevel_int_System_Threading_Tasks_AsyncCausalityStatus
plt_System_Threading_Tasks_AsyncCausalityTracer_TraceOperationCompletion_System_Threading_Tasks_CausalityTraceLevel_int_System_Threading_Tasks_AsyncCausalityStatus:
_p_151:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #616]
br x16
.word 6512
	.no_dead_strip plt_System_Threading_Tasks_Task_RemoveFromActiveTasks_int
plt_System_Threading_Tasks_Task_RemoveFromActiveTasks_int:
_p_152:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #624]
br x16
.word 6517
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult:
_p_153:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #632]
br x16
.word 6522
	.no_dead_strip plt_System_Environment_GetResourceString_string
plt_System_Environment_GetResourceString_string:
_p_154:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #640]
br x16
.word 6542
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult:
_p_155:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #648]
br x16
.word 6547
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
plt_System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task:
_p_156:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #656]
br x16
.word 6567
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object:
_p_157:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #664]
br x16
.word 6587
	.no_dead_strip plt_System_OperationCanceledException_get_CancellationToken
plt_System_OperationCanceledException_get_CancellationToken:
_p_158:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #672]
br x16
.word 6607
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object:
_p_159:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #680]
br x16
.word 6612
	.no_dead_strip plt_System_Runtime_CompilerServices_JitHelpers_UnsafeCast_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_object
plt_System_Runtime_CompilerServices_JitHelpers_UnsafeCast_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_object:
_p_160:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #688]
br x16
.word 6632
	.no_dead_strip plt_System_Decimal_op_Equality_System_Decimal_System_Decimal
plt_System_Decimal_op_Equality_System_Decimal_System_Decimal:
_p_161:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #696]
br x16
.word 6652
	.no_dead_strip plt_intptr_op_Equality_intptr_intptr
plt_intptr_op_Equality_intptr_intptr:
_p_162:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #704]
br x16
.word 6657
	.no_dead_strip plt_uintptr_op_Equality_uintptr_uintptr
plt_uintptr_op_Equality_uintptr_uintptr:
_p_163:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #712]
br x16
.word 6662
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult:
_p_164:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #720]
br x16
.word 6667
	.no_dead_strip plt_System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult
plt_System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult:
_p_165:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #728]
br x16
.word 6687
	.no_dead_strip plt_System_Threading_Tasks_Task__ctor
plt_System_Threading_Tasks_Task__ctor:
_p_166:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #736]
br x16
.word 6708
	.no_dead_strip plt_System_Threading_Tasks_Task__ctor_object_System_Threading_Tasks_TaskCreationOptions_bool
plt_System_Threading_Tasks_Task__ctor_object_System_Threading_Tasks_TaskCreationOptions_bool:
_p_167:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #744]
br x16
.word 6713
	.no_dead_strip plt_System_Threading_Tasks_Task__ctor_bool_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
plt_System_Threading_Tasks_Task__ctor_bool_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken:
_p_168:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #752]
br x16
.word 6718
	.no_dead_strip plt_System_Threading_Tasks_Task_InternalCurrentIfAttached_System_Threading_Tasks_TaskCreationOptions
plt_System_Threading_Tasks_Task_InternalCurrentIfAttached_System_Threading_Tasks_TaskCreationOptions:
_p_169:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #760]
br x16
.word 6723
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler:
_p_170:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #768]
br x16
.word 6728
	.no_dead_strip plt_System_Threading_Tasks_Task_PossiblyCaptureContext_System_Threading_StackCrawlMark_
plt_System_Threading_Tasks_Task_PossiblyCaptureContext_System_Threading_StackCrawlMark_:
_p_171:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #776]
br x16
.word 6748
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler:
_p_172:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #784]
br x16
.word 6753
	.no_dead_strip plt_System_Threading_Tasks_Task__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
plt_System_Threading_Tasks_Task__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler:
_p_173:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #792]
br x16
.word 6773
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_:
_p_174:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #800]
br x16
.word 6778
	.no_dead_strip plt_System_Threading_Tasks_Task_ScheduleAndStart_bool
plt_System_Threading_Tasks_Task_ScheduleAndStart_bool:
_p_175:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #808]
br x16
.word 6798
	.no_dead_strip plt_System_Threading_Tasks_Task_get_IsCompleted
plt_System_Threading_Tasks_Task_get_IsCompleted:
_p_176:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #816]
br x16
.word 6803
	.no_dead_strip plt_System_Threading_Tasks_Task_AtomicStateUpdate_int_int
plt_System_Threading_Tasks_Task_AtomicStateUpdate_int_int:
_p_177:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #824]
br x16
.word 6808
	.no_dead_strip plt_System_Threading_Tasks_Task_ContingentProperties_SetCompleted
plt_System_Threading_Tasks_Task_ContingentProperties_SetCompleted:
_p_178:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #832]
br x16
.word 6813
	.no_dead_strip plt_System_Threading_Tasks_Task_FinishStageThree
plt_System_Threading_Tasks_Task_FinishStageThree:
_p_179:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #840]
br x16
.word 6818
	.no_dead_strip plt_System_Threading_Tasks_Task_get_IsWaitNotificationEnabledOrNotRanToCompletion
plt_System_Threading_Tasks_Task_get_IsWaitNotificationEnabledOrNotRanToCompletion:
_p_180:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #848]
br x16
.word 6823
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool:
_p_181:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #856]
br x16
.word 6828
	.no_dead_strip plt_System_Threading_Tasks_Task_InternalWait_int_System_Threading_CancellationToken
plt_System_Threading_Tasks_Task_InternalWait_int_System_Threading_CancellationToken:
_p_182:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #864]
br x16
.word 6848
	.no_dead_strip plt_System_Threading_Tasks_Task_NotifyDebuggerOfWaitCompletionIfNecessary
plt_System_Threading_Tasks_Task_NotifyDebuggerOfWaitCompletionIfNecessary:
_p_183:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #872]
br x16
.word 6853
	.no_dead_strip plt_System_Threading_Tasks_Task_get_IsRanToCompletion
plt_System_Threading_Tasks_Task_get_IsRanToCompletion:
_p_184:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #880]
br x16
.word 6858
	.no_dead_strip plt_System_Threading_Tasks_Task_ThrowIfExceptional_bool
plt_System_Threading_Tasks_Task_ThrowIfExceptional_bool:
_p_185:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #888]
br x16
.word 6863
	.no_dead_strip plt_System_Threading_Tasks_Task_EnsureContingentPropertiesInitialized_bool
plt_System_Threading_Tasks_Task_EnsureContingentPropertiesInitialized_bool:
_p_186:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #896]
br x16
.word 6868
	.no_dead_strip plt_System_Threading_Tasks_Task_AddException_object
plt_System_Threading_Tasks_Task_AddException_object:
_p_187:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #904]
br x16
.word 6873
	.no_dead_strip plt_System_Threading_Tasks_Task_Finish_bool
plt_System_Threading_Tasks_Task_Finish_bool:
_p_188:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #912]
br x16
.word 6878
	.no_dead_strip plt_System_Threading_Tasks_Task_RecordInternalCancellationRequest_System_Threading_CancellationToken_object
plt_System_Threading_Tasks_Task_RecordInternalCancellationRequest_System_Threading_CancellationToken_object:
_p_189:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #920]
br x16
.word 6883
	.no_dead_strip plt_System_Threading_Tasks_Task_CancellationCleanupLogic
plt_System_Threading_Tasks_Task_CancellationCleanupLogic:
_p_190:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #928]
br x16
.word 6888
	.no_dead_strip plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr
plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr:
_p_191:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #936]
br x16
.word 6893
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
plt_System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult:
_p_192:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #944]
br x16
.word 6901
	.no_dead_strip plt_System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
plt_System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
_p_193:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #952]
br x16
.word 6921
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor
plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor:
_p_194:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #960]
br x16
.word 6941
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler
plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler:
_p_195:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #968]
br x16
.word 6961
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_CheckMultiTaskContinuationOptions_System_Threading_Tasks_TaskContinuationOptions
plt_System_Threading_Tasks_TaskFactory_CheckMultiTaskContinuationOptions_System_Threading_Tasks_TaskContinuationOptions:
_p_196:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #976]
br x16
.word 6981
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_CheckCreationOptions_System_Threading_Tasks_TaskCreationOptions
plt_System_Threading_Tasks_TaskFactory_CheckCreationOptions_System_Threading_Tasks_TaskCreationOptions:
_p_197:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #984]
br x16
.word 6986
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_:
_p_198:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #992]
br x16
.word 6991
	.no_dead_strip plt_System_Threading_Tasks_TaskExceptionHolder_MarkAsHandled_bool
plt_System_Threading_Tasks_TaskExceptionHolder_MarkAsHandled_bool:
_p_199:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1000]
br x16
.word 7011
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult:
_p_200:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1008]
br x16
.word 7016
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions
plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions:
_p_201:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1016]
br x16
.word 7036
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor
plt_System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor:
_p_202:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1024]
br x16
.word 7056
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_CheckFromAsyncOptions_System_Threading_Tasks_TaskCreationOptions_bool
plt_System_Threading_Tasks_TaskFactory_CheckFromAsyncOptions_System_Threading_Tasks_TaskCreationOptions_bool:
_p_203:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1032]
br x16
.word 7076
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions:
_p_204:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1040]
br x16
.word 7081
	.no_dead_strip plt_System_Delegate_get_Method
plt_System_Delegate_get_Method:
_p_205:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1048]
br x16
.word 7101
	.no_dead_strip plt_System_Threading_Tasks_AsyncCausalityTracer_TraceOperationCreation_System_Threading_Tasks_CausalityTraceLevel_int_string_ulong
plt_System_Threading_Tasks_AsyncCausalityTracer_TraceOperationCreation_System_Threading_Tasks_CausalityTraceLevel_int_string_ulong:
_p_206:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1056]
br x16
.word 7106
	.no_dead_strip plt_System_Threading_Tasks_Task_AddToActiveTasks_System_Threading_Tasks_Task
plt_System_Threading_Tasks_Task_AddToActiveTasks_System_Threading_Tasks_Task:
_p_207:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1064]
br x16
.word 7111
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor
plt_System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor:
_p_208:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1072]
br x16
.word 7116
	.no_dead_strip plt_System_Threading_AtomicBoolean__ctor
plt_System_Threading_AtomicBoolean__ctor:
_p_209:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1080]
br x16
.word 7136
	.no_dead_strip plt_System_Threading_AtomicBoolean_TryRelaxedSet
plt_System_Threading_AtomicBoolean_TryRelaxedSet:
_p_210:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1088]
br x16
.word 7141
	.no_dead_strip plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
plt_System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
_p_211:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1096]
br x16
.word 7146
	.no_dead_strip plt__jit_icall_mono_arch_rethrow_exception
plt__jit_icall_mono_arch_rethrow_exception:
_p_212:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1104]
br x16
.word 7166
	.no_dead_strip plt__rgctx_fetch_7
plt__rgctx_fetch_7:
_p_213:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1112]
br x16
.word 7223
	.no_dead_strip plt__jit_icall_mono_generic_class_init
plt__jit_icall_mono_generic_class_init:
_p_214:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1120]
br x16
.word 7231
	.no_dead_strip plt_System_Threading_Tasks_Task_1_TResult_REF__ctor
plt_System_Threading_Tasks_Task_1_TResult_REF__ctor:
_p_215:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1128]
br x16
.word 7257
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken:
_p_216:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1136]
br x16
.word 7276
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_OnCompletedInternal_System_Threading_Tasks_Task_System_Action_bool_bool
plt_System_Runtime_CompilerServices_TaskAwaiter_OnCompletedInternal_System_Threading_Tasks_Task_System_Action_bool_bool:
_p_217:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1144]
br x16
.word 7296
	.no_dead_strip plt_System_Runtime_CompilerServices_TaskAwaiter_ValidateEnd_System_Threading_Tasks_Task
plt_System_Runtime_CompilerServices_TaskAwaiter_ValidateEnd_System_Threading_Tasks_Task:
_p_218:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1152]
br x16
.word 7301
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess:
_p_219:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1160]
br x16
.word 7306
	.no_dead_strip plt_System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
plt_System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool:
_p_220:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1168]
br x16
.word 7326
	.no_dead_strip plt_System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor
plt_System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor:
_p_221:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1176]
br x16
.word 7346
	.no_dead_strip plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_get_Result
plt_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_get_Result:
_p_222:
adrp x16, mono_aot_vitasa_got@PAGE+4096
add x16, x16, mono_aot_vitasa_got@PAGEOFF
ldr x16, [x16, #1184]
br x16
.word 7366
plt_end:
.section __DATA, __bss
	.align 3
.lcomm mono_aot_vitasa_got, 5288
got_end:
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 1, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.section __TEXT, __const
	.align 2
name_0:
	.asciz "_unbox_trampoline_p"
.data
	.align 3
globals:
	.align 3
	.quad Lglobals_hash
	.align 3
	.quad name_0
	.align 3
	.quad _unbox_trampoline_p

	.long 0,0
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "2A9F3018-1B98-4C51-9730-408E99FC86F6"
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "vitasa"
.data
	.align 3
_mono_aot_file_info:

	.long 139,0
	.align 3
	.quad mono_aot_vitasa_got
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad jit_code_start
	.align 3
	.quad jit_code_end
	.align 3
	.quad method_addresses
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad mem_end
	.align 3
	.quad assembly_guid
	.align 3
	.quad runtime_version
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad globals
	.align 3
	.quad assembly_name
	.align 3
	.quad plt
	.align 3
	.quad plt_end
	.align 3
	.quad unwind_info
	.align 3
	.quad unbox_trampolines
	.align 3
	.quad unbox_trampolines_end
	.align 3
	.quad unbox_trampoline_addresses

	.long 438,5288,223,197,70,391195135,0,40877
	.long 128,8,8,10,0,26,45840,4952
	.long 4520,3320,0,4088,4464,3496,0,2544
	.long 280,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0
	.byte 208,37,18,96,142,18,150,126,82,255,175,2,94,175,118,152
	.globl _mono_aot_module_vitasa_info
	.align 3
_mono_aot_module_vitasa_info:
	.align 3
	.quad _mono_aot_file_info
.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.Application:Main"
	.asciz "vitasa_Application_Main_string__"

	.byte 1,9
	.quad vitasa_Application_Main_string__
	.quad Lme_0

	.byte 2,118,16,3
	.asciz "args"

LDIFF_SYM4=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM4
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM5=Lfde0_end - Lfde0_start
	.long LDIFF_SYM5
Lfde0_start:

	.long 0
	.align 3
	.quad vitasa_Application_Main_string__

LDIFF_SYM6=Lme_0 - vitasa_Application_Main_string__
	.long LDIFF_SYM6
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde0_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 16,7
	.asciz "System_Object"

LDIFF_SYM7=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM7
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM8=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM9=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM9
LTDIE_0:

	.byte 5
	.asciz "vitasa_Application"

	.byte 16,16
LDIFF_SYM10=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 2,35,0,0,7
	.asciz "vitasa_Application"

LDIFF_SYM11=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM11
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM12=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM12
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM13=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM13
	.byte 2
	.asciz "vitasa.Application:.ctor"
	.asciz "vitasa_Application__ctor"

	.byte 0,0
	.quad vitasa_Application__ctor
	.quad Lme_1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM14=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM14
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM15=Lfde1_end - Lfde1_start
	.long LDIFF_SYM15
Lfde1_start:

	.long 0
	.align 3
	.quad vitasa_Application__ctor

LDIFF_SYM16=Lme_1 - vitasa_Application__ctor
	.long LDIFF_SYM16
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde1_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_5:

	.byte 8
	.asciz "_Flags"

	.byte 1
LDIFF_SYM17=LDIE_U1 - Ldebug_info_start
	.long LDIFF_SYM17
	.byte 9
	.asciz "Disposed"

	.byte 1,9
	.asciz "NativeRef"

	.byte 2,9
	.asciz "IsDirectBinding"

	.byte 4,9
	.asciz "RegisteredToggleRef"

	.byte 8,9
	.asciz "InFinalizerQueue"

	.byte 16,9
	.asciz "HasManagedRef"

	.byte 32,0,7
	.asciz "_Flags"

LDIFF_SYM18=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM18
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM19=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM19
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM20=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM20
LTDIE_4:

	.byte 5
	.asciz "Foundation_NSObject"

	.byte 40,16
LDIFF_SYM21=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM21
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM22=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM22
	.byte 2,35,16,6
	.asciz "class_handle"

LDIFF_SYM23=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM23
	.byte 2,35,24,6
	.asciz "flags"

LDIFF_SYM24=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM24
	.byte 2,35,32,0,7
	.asciz "Foundation_NSObject"

LDIFF_SYM25=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM25
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM26=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM26
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM27=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM27
LTDIE_3:

	.byte 5
	.asciz "UIKit_UIApplicationDelegate"

	.byte 40,16
LDIFF_SYM28=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,35,0,0,7
	.asciz "UIKit_UIApplicationDelegate"

LDIFF_SYM29=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM29
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM30=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM30
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM31=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM31
LTDIE_8:

	.byte 5
	.asciz "UIKit_UIResponder"

	.byte 40,16
LDIFF_SYM32=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM32
	.byte 2,35,0,0,7
	.asciz "UIKit_UIResponder"

LDIFF_SYM33=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM33
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM34=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM34
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM35=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM35
LTDIE_7:

	.byte 5
	.asciz "UIKit_UIView"

	.byte 48,16
LDIFF_SYM36=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM36
	.byte 2,35,0,6
	.asciz "__mt_PreferredFocusedView_var"

LDIFF_SYM37=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM37
	.byte 2,35,40,0,7
	.asciz "UIKit_UIView"

LDIFF_SYM38=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM38
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM39=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM39
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM40=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM40
LTDIE_6:

	.byte 5
	.asciz "UIKit_UIWindow"

	.byte 48,16
LDIFF_SYM41=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM41
	.byte 2,35,0,0,7
	.asciz "UIKit_UIWindow"

LDIFF_SYM42=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM42
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM43=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM43
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM44=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM44
LTDIE_2:

	.byte 5
	.asciz "vitasa_AppDelegate"

	.byte 48,16
LDIFF_SYM45=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 2,35,0,6
	.asciz "<Window>k__BackingField"

LDIFF_SYM46=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM46
	.byte 2,35,40,0,7
	.asciz "vitasa_AppDelegate"

LDIFF_SYM47=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM47
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM48=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM48
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM49=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM49
	.byte 2
	.asciz "vitasa.AppDelegate:get_Window"
	.asciz "vitasa_AppDelegate_get_Window"

	.byte 2,15
	.quad vitasa_AppDelegate_get_Window
	.quad Lme_2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM50=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM50
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM51=Lfde2_end - Lfde2_start
	.long LDIFF_SYM51
Lfde2_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_get_Window

LDIFF_SYM52=Lme_2 - vitasa_AppDelegate_get_Window
	.long LDIFF_SYM52
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde2_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:set_Window"
	.asciz "vitasa_AppDelegate_set_Window_UIKit_UIWindow"

	.byte 2,16
	.quad vitasa_AppDelegate_set_Window_UIKit_UIWindow
	.quad Lme_3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM53=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM53
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM54=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM54
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM55=Lfde3_end - Lfde3_start
	.long LDIFF_SYM55
Lfde3_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_set_Window_UIKit_UIWindow

LDIFF_SYM56=Lme_3 - vitasa_AppDelegate_set_Window_UIKit_UIWindow
	.long LDIFF_SYM56
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde3_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_9:

	.byte 5
	.asciz "UIKit_UIApplication"

	.byte 40,16
LDIFF_SYM57=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM57
	.byte 2,35,0,0,7
	.asciz "UIKit_UIApplication"

LDIFF_SYM58=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM58
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM59=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM59
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM60=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM60
LTDIE_10:

	.byte 5
	.asciz "Foundation_NSDictionary"

	.byte 40,16
LDIFF_SYM61=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM61
	.byte 2,35,0,0,7
	.asciz "Foundation_NSDictionary"

LDIFF_SYM62=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM62
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM63=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM63
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM64=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM64
LTDIE_12:

	.byte 5
	.asciz "System_ValueType"

	.byte 16,16
LDIFF_SYM65=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM65
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM66=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM66
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM67=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM67
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM68=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM68
LTDIE_11:

	.byte 5
	.asciz "System_Boolean"

	.byte 17,16
LDIFF_SYM69=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM69
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM70=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 2,35,16,0,7
	.asciz "System_Boolean"

LDIFF_SYM71=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM71
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM72=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM72
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM73=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM73
	.byte 2
	.asciz "vitasa.AppDelegate:FinishedLaunching"
	.asciz "vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary"

	.byte 2,20
	.quad vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary
	.quad Lme_4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM74=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,141,24,3
	.asciz "application"

LDIFF_SYM75=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,141,32,3
	.asciz "launchOptions"

LDIFF_SYM76=LTDIE_10_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM76
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM77=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM77
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM78=Lfde4_end - Lfde4_start
	.long LDIFF_SYM78
Lfde4_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary

LDIFF_SYM79=Lme_4 - vitasa_AppDelegate_FinishedLaunching_UIKit_UIApplication_Foundation_NSDictionary
	.long LDIFF_SYM79
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,154,8
	.align 3
Lfde4_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:OnResignActivation"
	.asciz "vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication"

	.byte 2,28
	.quad vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication
	.quad Lme_5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM80=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 2,141,16,3
	.asciz "application"

LDIFF_SYM81=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM81
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM82=Lfde5_end - Lfde5_start
	.long LDIFF_SYM82
Lfde5_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication

LDIFF_SYM83=Lme_5 - vitasa_AppDelegate_OnResignActivation_UIKit_UIApplication
	.long LDIFF_SYM83
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde5_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:DidEnterBackground"
	.asciz "vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication"

	.byte 2,36
	.quad vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication
	.quad Lme_6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM84=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM84
	.byte 2,141,16,3
	.asciz "application"

LDIFF_SYM85=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM85
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM86=Lfde6_end - Lfde6_start
	.long LDIFF_SYM86
Lfde6_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication

LDIFF_SYM87=Lme_6 - vitasa_AppDelegate_DidEnterBackground_UIKit_UIApplication
	.long LDIFF_SYM87
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde6_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:WillEnterForeground"
	.asciz "vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication"

	.byte 2,42
	.quad vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication
	.quad Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM88=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM88
	.byte 2,141,16,3
	.asciz "application"

LDIFF_SYM89=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM89
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM90=Lfde7_end - Lfde7_start
	.long LDIFF_SYM90
Lfde7_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication

LDIFF_SYM91=Lme_7 - vitasa_AppDelegate_WillEnterForeground_UIKit_UIApplication
	.long LDIFF_SYM91
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde7_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:OnActivated"
	.asciz "vitasa_AppDelegate_OnActivated_UIKit_UIApplication"

	.byte 2,48
	.quad vitasa_AppDelegate_OnActivated_UIKit_UIApplication
	.quad Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM92=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,141,16,3
	.asciz "application"

LDIFF_SYM93=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM94=Lfde8_end - Lfde8_start
	.long LDIFF_SYM94
Lfde8_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_OnActivated_UIKit_UIApplication

LDIFF_SYM95=Lme_8 - vitasa_AppDelegate_OnActivated_UIKit_UIApplication
	.long LDIFF_SYM95
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:WillTerminate"
	.asciz "vitasa_AppDelegate_WillTerminate_UIKit_UIApplication"

	.byte 2,54
	.quad vitasa_AppDelegate_WillTerminate_UIKit_UIApplication
	.quad Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM96=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM96
	.byte 2,141,16,3
	.asciz "application"

LDIFF_SYM97=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM97
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM98=Lfde9_end - Lfde9_start
	.long LDIFF_SYM98
Lfde9_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate_WillTerminate_UIKit_UIApplication

LDIFF_SYM99=Lme_9 - vitasa_AppDelegate_WillTerminate_UIKit_UIApplication
	.long LDIFF_SYM99
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde9_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.AppDelegate:.ctor"
	.asciz "vitasa_AppDelegate__ctor"

	.byte 0,0
	.quad vitasa_AppDelegate__ctor
	.quad Lme_a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM100=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM100
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM101=Lfde10_end - Lfde10_start
	.long LDIFF_SYM101
Lfde10_start:

	.long 0
	.align 3
	.quad vitasa_AppDelegate__ctor

LDIFF_SYM102=Lme_a - vitasa_AppDelegate__ctor
	.long LDIFF_SYM102
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde10_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_14:

	.byte 5
	.asciz "UIKit_UIViewController"

	.byte 48,16
LDIFF_SYM103=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM103
	.byte 2,35,0,6
	.asciz "__mt_PreferredFocusedView_var"

LDIFF_SYM104=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM104
	.byte 2,35,40,0,7
	.asciz "UIKit_UIViewController"

LDIFF_SYM105=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM105
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM106=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM106
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM107=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM107
LTDIE_17:

	.byte 5
	.asciz "System_Int32"

	.byte 20,16
LDIFF_SYM108=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM108
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM109=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM109
	.byte 2,35,16,0,7
	.asciz "System_Int32"

LDIFF_SYM110=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM110
LTDIE_17_POINTER:

	.byte 13
LDIFF_SYM111=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM111
LTDIE_17_REFERENCE:

	.byte 14
LDIFF_SYM112=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM112
LTDIE_16:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 32,16
LDIFF_SYM113=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM113
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM114=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM114
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM115=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM115
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM116=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM116
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM117=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM117
LTDIE_16_POINTER:

	.byte 13
LDIFF_SYM118=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM118
LTDIE_16_REFERENCE:

	.byte 14
LDIFF_SYM119=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM119
LTDIE_18:

	.byte 5
	.asciz "vitasa_C_VitaSite"

	.byte 128,1,16
LDIFF_SYM120=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM120
	.byte 2,35,0,6
	.asciz "SiteName"

LDIFF_SYM121=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM121
	.byte 2,35,16,6
	.asciz "SiteSlug"

LDIFF_SYM122=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM122
	.byte 2,35,24,6
	.asciz "SiteStreet"

LDIFF_SYM123=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM123
	.byte 2,35,32,6
	.asciz "SiteCity"

LDIFF_SYM124=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM124
	.byte 2,35,40,6
	.asciz "SiteState"

LDIFF_SYM125=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM125
	.byte 2,35,48,6
	.asciz "SiteZip"

LDIFF_SYM126=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM126
	.byte 2,35,56,6
	.asciz "SiteLatitude"

LDIFF_SYM127=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM127
	.byte 2,35,64,6
	.asciz "SiteLongitude"

LDIFF_SYM128=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM128
	.byte 2,35,72,6
	.asciz "SiteOpenTime"

LDIFF_SYM129=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM129
	.byte 2,35,80,6
	.asciz "SiteCloseTime"

LDIFF_SYM130=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM130
	.byte 2,35,88,6
	.asciz "SiteDays"

LDIFF_SYM131=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM131
	.byte 2,35,96,6
	.asciz "SiteCoordinator"

LDIFF_SYM132=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM132
	.byte 2,35,104,6
	.asciz "SiteType"

LDIFF_SYM133=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM133
	.byte 2,35,112,6
	.asciz "SiteIsOpen"

LDIFF_SYM134=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM134
	.byte 2,35,120,0,7
	.asciz "vitasa_C_VitaSite"

LDIFF_SYM135=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM135
LTDIE_18_POINTER:

	.byte 13
LDIFF_SYM136=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM136
LTDIE_18_REFERENCE:

	.byte 14
LDIFF_SYM137=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM137
LTDIE_15:

	.byte 5
	.asciz "vitasa_C_PassAroundContainer"

	.byte 40,16
LDIFF_SYM138=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM138
	.byte 2,35,0,6
	.asciz "Sites"

LDIFF_SYM139=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM139
	.byte 2,35,16,6
	.asciz "TimeStampWhenSitesLoaded"

LDIFF_SYM140=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM140
	.byte 2,35,32,6
	.asciz "SelectedSite"

LDIFF_SYM141=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM141
	.byte 2,35,24,0,7
	.asciz "vitasa_C_PassAroundContainer"

LDIFF_SYM142=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM142
LTDIE_15_POINTER:

	.byte 13
LDIFF_SYM143=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM143
LTDIE_15_REFERENCE:

	.byte 14
LDIFF_SYM144=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM144
LTDIE_20:

	.byte 5
	.asciz "UIKit_UIControl"

	.byte 48,16
LDIFF_SYM145=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM145
	.byte 2,35,0,0,7
	.asciz "UIKit_UIControl"

LDIFF_SYM146=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM146
LTDIE_20_POINTER:

	.byte 13
LDIFF_SYM147=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM147
LTDIE_20_REFERENCE:

	.byte 14
LDIFF_SYM148=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM148
LTDIE_19:

	.byte 5
	.asciz "UIKit_UIButton"

	.byte 48,16
LDIFF_SYM149=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM149
	.byte 2,35,0,0,7
	.asciz "UIKit_UIButton"

LDIFF_SYM150=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM150
LTDIE_19_POINTER:

	.byte 13
LDIFF_SYM151=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM151
LTDIE_19_REFERENCE:

	.byte 14
LDIFF_SYM152=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM152
LTDIE_21:

	.byte 5
	.asciz "UIKit_UIImageView"

	.byte 48,16
LDIFF_SYM153=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM153
	.byte 2,35,0,0,7
	.asciz "UIKit_UIImageView"

LDIFF_SYM154=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM154
LTDIE_21_POINTER:

	.byte 13
LDIFF_SYM155=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM155
LTDIE_21_REFERENCE:

	.byte 14
LDIFF_SYM156=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM156
LTDIE_13:

	.byte 5
	.asciz "vitasa_ViewController"

	.byte 88,16
LDIFF_SYM157=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM157
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM158=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM158
	.byte 2,35,48,6
	.asciz "<B_GettingReady>k__BackingField"

LDIFF_SYM159=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM159
	.byte 2,35,56,6
	.asciz "<B_ViewAsList>k__BackingField"

LDIFF_SYM160=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM160
	.byte 2,35,64,6
	.asciz "<B_ViewOnMap>k__BackingField"

LDIFF_SYM161=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM161
	.byte 2,35,72,6
	.asciz "<I_Background>k__BackingField"

LDIFF_SYM162=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM162
	.byte 2,35,80,0,7
	.asciz "vitasa_ViewController"

LDIFF_SYM163=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM163
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM164=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM164
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM165=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 2
	.asciz "vitasa.ViewController:.ctor"
	.asciz "vitasa_ViewController__ctor_intptr"

	.byte 3,11
	.quad vitasa_ViewController__ctor_intptr
	.quad Lme_b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM166=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM166
	.byte 2,141,16,3
	.asciz "handle"

LDIFF_SYM167=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM167
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM168=Lfde11_end - Lfde11_start
	.long LDIFF_SYM168
Lfde11_start:

	.long 0
	.align 3
	.quad vitasa_ViewController__ctor_intptr

LDIFF_SYM169=Lme_b - vitasa_ViewController__ctor_intptr
	.long LDIFF_SYM169
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde11_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:ViewDidLoad"
	.asciz "vitasa_ViewController_ViewDidLoad"

	.byte 3,17
	.quad vitasa_ViewController_ViewDidLoad
	.quad Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM170=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM170
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM171=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM171
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM172=Lfde12_end - Lfde12_start
	.long LDIFF_SYM172
Lfde12_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_ViewDidLoad

LDIFF_SYM173=Lme_c - vitasa_ViewController_ViewDidLoad
	.long LDIFF_SYM173
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde12_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:DidReceiveMemoryWarning"
	.asciz "vitasa_ViewController_DidReceiveMemoryWarning"

	.byte 3,30
	.quad vitasa_ViewController_DidReceiveMemoryWarning
	.quad Lme_d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM174=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM174
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM175=Lfde13_end - Lfde13_start
	.long LDIFF_SYM175
Lfde13_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_DidReceiveMemoryWarning

LDIFF_SYM176=Lme_d - vitasa_ViewController_DidReceiveMemoryWarning
	.long LDIFF_SYM176
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde13_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_22:

	.byte 5
	.asciz "UIKit_UIStoryboardSegue"

	.byte 40,16
LDIFF_SYM177=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM177
	.byte 2,35,0,0,7
	.asciz "UIKit_UIStoryboardSegue"

LDIFF_SYM178=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM178
LTDIE_22_POINTER:

	.byte 13
LDIFF_SYM179=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM179
LTDIE_22_REFERENCE:

	.byte 14
LDIFF_SYM180=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM180
LTDIE_26:

	.byte 5
	.asciz "UIKit_UIScrollViewDelegate"

	.byte 40,16
LDIFF_SYM181=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM181
	.byte 2,35,0,0,7
	.asciz "UIKit_UIScrollViewDelegate"

LDIFF_SYM182=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM182
LTDIE_26_POINTER:

	.byte 13
LDIFF_SYM183=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM183
LTDIE_26_REFERENCE:

	.byte 14
LDIFF_SYM184=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM184
LTDIE_25:

	.byte 5
	.asciz "UIKit_UITableViewSource"

	.byte 40,16
LDIFF_SYM185=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM185
	.byte 2,35,0,0,7
	.asciz "UIKit_UITableViewSource"

LDIFF_SYM186=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM186
LTDIE_25_POINTER:

	.byte 13
LDIFF_SYM187=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM187
LTDIE_25_REFERENCE:

	.byte 14
LDIFF_SYM188=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM188
LTDIE_24:

	.byte 5
	.asciz "_C_SitesTableSource"

	.byte 56,16
LDIFF_SYM189=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM189
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM190=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM190
	.byte 2,35,40,6
	.asciz "ourVC"

LDIFF_SYM191=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM191
	.byte 2,35,48,0,7
	.asciz "_C_SitesTableSource"

LDIFF_SYM192=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM192
LTDIE_24_POINTER:

	.byte 13
LDIFF_SYM193=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM193
LTDIE_24_REFERENCE:

	.byte 14
LDIFF_SYM194=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM194
LTDIE_28:

	.byte 5
	.asciz "UIKit_UIScrollView"

	.byte 56,16
LDIFF_SYM195=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM195
	.byte 2,35,0,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM196=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM196
	.byte 2,35,48,0,7
	.asciz "UIKit_UIScrollView"

LDIFF_SYM197=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM197
LTDIE_28_POINTER:

	.byte 13
LDIFF_SYM198=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM198
LTDIE_28_REFERENCE:

	.byte 14
LDIFF_SYM199=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM199
LTDIE_27:

	.byte 5
	.asciz "UIKit_UITableView"

	.byte 72,16
LDIFF_SYM200=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM200
	.byte 2,35,0,6
	.asciz "__mt_WeakDataSource_var"

LDIFF_SYM201=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM201
	.byte 2,35,56,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM202=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM202
	.byte 2,35,64,0,7
	.asciz "UIKit_UITableView"

LDIFF_SYM203=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM203
LTDIE_27_POINTER:

	.byte 13
LDIFF_SYM204=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM204
LTDIE_27_REFERENCE:

	.byte 14
LDIFF_SYM205=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM205
LTDIE_23:

	.byte 5
	.asciz "vitasa_VC_SitesList"

	.byte 80,16
LDIFF_SYM206=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM206
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM207=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM207
	.byte 2,35,48,6
	.asciz "SitesTableDataSource"

LDIFF_SYM208=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM208
	.byte 2,35,56,6
	.asciz "<B_Back>k__BackingField"

LDIFF_SYM209=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM209
	.byte 2,35,64,6
	.asciz "<TV_SitesList>k__BackingField"

LDIFF_SYM210=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM210
	.byte 2,35,72,0,7
	.asciz "vitasa_VC_SitesList"

LDIFF_SYM211=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM211
LTDIE_23_POINTER:

	.byte 13
LDIFF_SYM212=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM212
LTDIE_23_REFERENCE:

	.byte 14
LDIFF_SYM213=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM213
LTDIE_31:

	.byte 5
	.asciz "MapKit_MKMapViewDelegate"

	.byte 40,16
LDIFF_SYM214=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM214
	.byte 2,35,0,0,7
	.asciz "MapKit_MKMapViewDelegate"

LDIFF_SYM215=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM215
LTDIE_31_POINTER:

	.byte 13
LDIFF_SYM216=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM216
LTDIE_31_REFERENCE:

	.byte 14
LDIFF_SYM217=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM217
LTDIE_30:

	.byte 5
	.asciz "_MapDelegate"

	.byte 72,16
LDIFF_SYM218=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM218
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM219=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM219
	.byte 2,35,40,6
	.asciz "detailButton"

LDIFF_SYM220=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM220
	.byte 2,35,48,6
	.asciz "ourVC"

LDIFF_SYM221=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM221
	.byte 2,35,56,6
	.asciz "pId"

LDIFF_SYM222=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM222
	.byte 2,35,64,0,7
	.asciz "_MapDelegate"

LDIFF_SYM223=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM223
LTDIE_30_POINTER:

	.byte 13
LDIFF_SYM224=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM224
LTDIE_30_REFERENCE:

	.byte 14
LDIFF_SYM225=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM225
LTDIE_32:

	.byte 5
	.asciz "MapKit_MKMapView"

	.byte 56,16
LDIFF_SYM226=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 2,35,0,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM227=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM227
	.byte 2,35,48,0,7
	.asciz "MapKit_MKMapView"

LDIFF_SYM228=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM228
LTDIE_32_POINTER:

	.byte 13
LDIFF_SYM229=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM229
LTDIE_32_REFERENCE:

	.byte 14
LDIFF_SYM230=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM230
LTDIE_29:

	.byte 5
	.asciz "vitasa_VC_SitesMap"

	.byte 80,16
LDIFF_SYM231=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM231
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM232=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM232
	.byte 2,35,48,6
	.asciz "mapDelegate"

LDIFF_SYM233=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM233
	.byte 2,35,56,6
	.asciz "<B_Back>k__BackingField"

LDIFF_SYM234=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM234
	.byte 2,35,64,6
	.asciz "<Map_SitesMap>k__BackingField"

LDIFF_SYM235=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM235
	.byte 2,35,72,0,7
	.asciz "vitasa_VC_SitesMap"

LDIFF_SYM236=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM236
LTDIE_29_POINTER:

	.byte 13
LDIFF_SYM237=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM237
LTDIE_29_REFERENCE:

	.byte 14
LDIFF_SYM238=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM238
LTDIE_34:

	.byte 5
	.asciz "UIKit_UITextView"

	.byte 72,16
LDIFF_SYM239=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM239
	.byte 2,35,0,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM240=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM240
	.byte 2,35,56,6
	.asciz "__mt_WeakInputDelegate_var"

LDIFF_SYM241=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM241
	.byte 2,35,64,0,7
	.asciz "UIKit_UITextView"

LDIFF_SYM242=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM242
LTDIE_34_POINTER:

	.byte 13
LDIFF_SYM243=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM243
LTDIE_34_REFERENCE:

	.byte 14
LDIFF_SYM244=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM244
LTDIE_33:

	.byte 5
	.asciz "vitasa_VC_GetReady"

	.byte 72,16
LDIFF_SYM245=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM245
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM246=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM246
	.byte 2,35,48,6
	.asciz "<B_Back>k__BackingField"

LDIFF_SYM247=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM247
	.byte 2,35,56,6
	.asciz "<TB_ReadyMessage>k__BackingField"

LDIFF_SYM248=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM248
	.byte 2,35,64,0,7
	.asciz "vitasa_VC_GetReady"

LDIFF_SYM249=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM249
LTDIE_33_POINTER:

	.byte 13
LDIFF_SYM250=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM250
LTDIE_33_REFERENCE:

	.byte 14
LDIFF_SYM251=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM251
	.byte 2
	.asciz "vitasa.ViewController:PrepareForSegue"
	.asciz "vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject"

	.byte 3,36
	.quad vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.quad Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM252=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM252
	.byte 1,104,3
	.asciz "segue"

LDIFF_SYM253=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM253
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM254=LTDIE_4_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM254
	.byte 3,141,200,0,11
	.asciz "V_0"

LDIFF_SYM255=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM255
	.byte 1,103,11
	.asciz "siteDetails"

LDIFF_SYM256=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM256
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM257=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM257
	.byte 1,101,11
	.asciz "vc"

LDIFF_SYM258=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM258
	.byte 1,100,11
	.asciz "V_4"

LDIFF_SYM259=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM259
	.byte 1,99,11
	.asciz "vc"

LDIFF_SYM260=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM260
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM261=Lfde14_end - Lfde14_start
	.long LDIFF_SYM261
Lfde14_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject

LDIFF_SYM262=Lme_e - vitasa_ViewController_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.long LDIFF_SYM262
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,147,18,148,17,68,149,16,150,15,68,151,14,152,13,68,153,12
	.align 3
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:get_B_GettingReady"
	.asciz "vitasa_ViewController_get_B_GettingReady"

	.byte 4,18
	.quad vitasa_ViewController_get_B_GettingReady
	.quad Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM263=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM263
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM264=Lfde15_end - Lfde15_start
	.long LDIFF_SYM264
Lfde15_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_get_B_GettingReady

LDIFF_SYM265=Lme_f - vitasa_ViewController_get_B_GettingReady
	.long LDIFF_SYM265
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde15_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:set_B_GettingReady"
	.asciz "vitasa_ViewController_set_B_GettingReady_UIKit_UIButton"

	.byte 4,18
	.quad vitasa_ViewController_set_B_GettingReady_UIKit_UIButton
	.quad Lme_10

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM266=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM266
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM267=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM267
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM268=Lfde16_end - Lfde16_start
	.long LDIFF_SYM268
Lfde16_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_set_B_GettingReady_UIKit_UIButton

LDIFF_SYM269=Lme_10 - vitasa_ViewController_set_B_GettingReady_UIKit_UIButton
	.long LDIFF_SYM269
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:get_B_ViewAsList"
	.asciz "vitasa_ViewController_get_B_ViewAsList"

	.byte 4,22
	.quad vitasa_ViewController_get_B_ViewAsList
	.quad Lme_11

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM270=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM270
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM271=Lfde17_end - Lfde17_start
	.long LDIFF_SYM271
Lfde17_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_get_B_ViewAsList

LDIFF_SYM272=Lme_11 - vitasa_ViewController_get_B_ViewAsList
	.long LDIFF_SYM272
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:set_B_ViewAsList"
	.asciz "vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton"

	.byte 4,22
	.quad vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton
	.quad Lme_12

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM273=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM273
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM274=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM274
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM275=Lfde18_end - Lfde18_start
	.long LDIFF_SYM275
Lfde18_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton

LDIFF_SYM276=Lme_12 - vitasa_ViewController_set_B_ViewAsList_UIKit_UIButton
	.long LDIFF_SYM276
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde18_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:get_B_ViewOnMap"
	.asciz "vitasa_ViewController_get_B_ViewOnMap"

	.byte 4,26
	.quad vitasa_ViewController_get_B_ViewOnMap
	.quad Lme_13

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM277=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM277
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM278=Lfde19_end - Lfde19_start
	.long LDIFF_SYM278
Lfde19_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_get_B_ViewOnMap

LDIFF_SYM279=Lme_13 - vitasa_ViewController_get_B_ViewOnMap
	.long LDIFF_SYM279
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde19_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:set_B_ViewOnMap"
	.asciz "vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton"

	.byte 4,26
	.quad vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton
	.quad Lme_14

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM280=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM280
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM281=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM281
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM282=Lfde20_end - Lfde20_start
	.long LDIFF_SYM282
Lfde20_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton

LDIFF_SYM283=Lme_14 - vitasa_ViewController_set_B_ViewOnMap_UIKit_UIButton
	.long LDIFF_SYM283
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde20_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:get_I_Background"
	.asciz "vitasa_ViewController_get_I_Background"

	.byte 4,30
	.quad vitasa_ViewController_get_I_Background
	.quad Lme_15

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM284=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM284
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM285=Lfde21_end - Lfde21_start
	.long LDIFF_SYM285
Lfde21_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_get_I_Background

LDIFF_SYM286=Lme_15 - vitasa_ViewController_get_I_Background
	.long LDIFF_SYM286
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde21_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:set_I_Background"
	.asciz "vitasa_ViewController_set_I_Background_UIKit_UIImageView"

	.byte 4,30
	.quad vitasa_ViewController_set_I_Background_UIKit_UIImageView
	.quad Lme_16

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM287=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM287
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM288=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM288
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM289=Lfde22_end - Lfde22_start
	.long LDIFF_SYM289
Lfde22_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_set_I_Background_UIKit_UIImageView

LDIFF_SYM290=Lme_16 - vitasa_ViewController_set_I_Background_UIKit_UIImageView
	.long LDIFF_SYM290
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde22_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.ViewController:ReleaseDesignerOutlets"
	.asciz "vitasa_ViewController_ReleaseDesignerOutlets"

	.byte 4,33
	.quad vitasa_ViewController_ReleaseDesignerOutlets
	.quad Lme_17

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM291=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM291
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM292=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM292
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM293=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM293
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM294=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM294
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM295=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM295
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM296=Lfde23_end - Lfde23_start
	.long LDIFF_SYM296
Lfde23_start:

	.long 0
	.align 3
	.quad vitasa_ViewController_ReleaseDesignerOutlets

LDIFF_SYM297=Lme_17 - vitasa_ViewController_ReleaseDesignerOutlets
	.long LDIFF_SYM297
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,150,10,151,9,68,152,8,153,7,68,154,6
	.align 3
Lfde23_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:.ctor"
	.asciz "vitasa_VC_SitesList__ctor_intptr"

	.byte 5,14
	.quad vitasa_VC_SitesList__ctor_intptr
	.quad Lme_18

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM298=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM298
	.byte 1,105,3
	.asciz "handle"

LDIFF_SYM299=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM299
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM300=Lfde24_end - Lfde24_start
	.long LDIFF_SYM300
Lfde24_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList__ctor_intptr

LDIFF_SYM301=Lme_18 - vitasa_VC_SitesList__ctor_intptr
	.long LDIFF_SYM301
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde24_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:ViewDidLoad"
	.asciz "vitasa_VC_SitesList_ViewDidLoad"

	.byte 5,21
	.quad vitasa_VC_SitesList_ViewDidLoad
	.quad Lme_19

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM302=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM302
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM303=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM303
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM304=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM304
	.byte 1,104,11
	.asciz "ts"

LDIFF_SYM305=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM305
	.byte 3,141,224,0,11
	.asciz "V_3"

LDIFF_SYM306=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM306
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM307=Lfde25_end - Lfde25_start
	.long LDIFF_SYM307
Lfde25_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_ViewDidLoad

LDIFF_SYM308=Lme_19 - vitasa_VC_SitesList_ViewDidLoad
	.long LDIFF_SYM308
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,151,18,152,17,68,153,16,154,15
	.align 3
Lfde25_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:LoadSitesFromWebService"
	.asciz "vitasa_VC_SitesList_LoadSitesFromWebService"

	.byte 5,51
	.quad vitasa_VC_SitesList_LoadSitesFromWebService
	.quad Lme_1a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM309=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM309
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM310=Lfde26_end - Lfde26_start
	.long LDIFF_SYM310
Lfde26_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_LoadSitesFromWebService

LDIFF_SYM311=Lme_1a - vitasa_VC_SitesList_LoadSitesFromWebService
	.long LDIFF_SYM311
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde26_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:CompareSitesByNameAscending"
	.asciz "vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite"

	.byte 5,75
	.quad vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite
	.quad Lme_1b

	.byte 2,118,16,3
	.asciz "s1"

LDIFF_SYM312=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM312
	.byte 2,141,24,3
	.asciz "s2"

LDIFF_SYM313=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM313
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM314=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM314
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM315=Lfde27_end - Lfde27_start
	.long LDIFF_SYM315
Lfde27_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite

LDIFF_SYM316=Lme_1b - vitasa_VC_SitesList_CompareSitesByNameAscending_vitasa_C_VitaSite_vitasa_C_VitaSite
	.long LDIFF_SYM316
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.align 3
Lfde27_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_36:

	.byte 5
	.asciz "UIKit_UILabel"

	.byte 48,16
LDIFF_SYM317=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM317
	.byte 2,35,0,0,7
	.asciz "UIKit_UILabel"

LDIFF_SYM318=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM318
LTDIE_36_POINTER:

	.byte 13
LDIFF_SYM319=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM319
LTDIE_36_REFERENCE:

	.byte 14
LDIFF_SYM320=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM320
LTDIE_35:

	.byte 5
	.asciz "vitasa_VC_SiteDetails"

	.byte 120,16
LDIFF_SYM321=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM321
	.byte 2,35,0,6
	.asciz "PassAroundContainer"

LDIFF_SYM322=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM322
	.byte 2,35,48,6
	.asciz "CameFromList"

LDIFF_SYM323=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM323
	.byte 2,35,112,6
	.asciz "<B_Back>k__BackingField"

LDIFF_SYM324=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM324
	.byte 2,35,56,6
	.asciz "<L_Address>k__BackingField"

LDIFF_SYM325=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM325
	.byte 2,35,64,6
	.asciz "<L_City>k__BackingField"

LDIFF_SYM326=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM326
	.byte 2,35,72,6
	.asciz "<L_SiteCoordinator>k__BackingField"

LDIFF_SYM327=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM327
	.byte 2,35,80,6
	.asciz "<L_SiteName>k__BackingField"

LDIFF_SYM328=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM328
	.byte 2,35,88,6
	.asciz "<L_SiteStatus>k__BackingField"

LDIFF_SYM329=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM329
	.byte 2,35,96,6
	.asciz "<L_StatePlusZip>k__BackingField"

LDIFF_SYM330=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM330
	.byte 2,35,104,0,7
	.asciz "vitasa_VC_SiteDetails"

LDIFF_SYM331=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM331
LTDIE_35_POINTER:

	.byte 13
LDIFF_SYM332=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM332
LTDIE_35_REFERENCE:

	.byte 14
LDIFF_SYM333=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM333
	.byte 2
	.asciz "vitasa.VC_SitesList:PrepareForSegue"
	.asciz "vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject"

	.byte 5,127
	.quad vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.quad Lme_1c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM334=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM334
	.byte 3,141,200,0,3
	.asciz "segue"

LDIFF_SYM335=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM335
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM336=LTDIE_4_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM336
	.byte 3,141,208,0,11
	.asciz "V_0"

LDIFF_SYM337=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM337
	.byte 1,103,11
	.asciz "siteDetails"

LDIFF_SYM338=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM338
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM339=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM339
	.byte 1,101,11
	.asciz "vc"

LDIFF_SYM340=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM340
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM341=Lfde28_end - Lfde28_start
	.long LDIFF_SYM341
Lfde28_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject

LDIFF_SYM342=Lme_1c - vitasa_VC_SitesList_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.long LDIFF_SYM342
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.align 3
Lfde28_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:get_B_Back"
	.asciz "vitasa_VC_SitesList_get_B_Back"

	.byte 6,19
	.quad vitasa_VC_SitesList_get_B_Back
	.quad Lme_1d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM343=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM343
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM344=Lfde29_end - Lfde29_start
	.long LDIFF_SYM344
Lfde29_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_get_B_Back

LDIFF_SYM345=Lme_1d - vitasa_VC_SitesList_get_B_Back
	.long LDIFF_SYM345
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde29_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:set_B_Back"
	.asciz "vitasa_VC_SitesList_set_B_Back_UIKit_UIButton"

	.byte 6,19
	.quad vitasa_VC_SitesList_set_B_Back_UIKit_UIButton
	.quad Lme_1e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM346=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM346
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM347=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM347
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM348=Lfde30_end - Lfde30_start
	.long LDIFF_SYM348
Lfde30_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_set_B_Back_UIKit_UIButton

LDIFF_SYM349=Lme_1e - vitasa_VC_SitesList_set_B_Back_UIKit_UIButton
	.long LDIFF_SYM349
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde30_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:get_TV_SitesList"
	.asciz "vitasa_VC_SitesList_get_TV_SitesList"

	.byte 6,23
	.quad vitasa_VC_SitesList_get_TV_SitesList
	.quad Lme_1f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM350=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM350
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM351=Lfde31_end - Lfde31_start
	.long LDIFF_SYM351
Lfde31_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_get_TV_SitesList

LDIFF_SYM352=Lme_1f - vitasa_VC_SitesList_get_TV_SitesList
	.long LDIFF_SYM352
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde31_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:set_TV_SitesList"
	.asciz "vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView"

	.byte 6,23
	.quad vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView
	.quad Lme_20

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM353=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM353
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM354=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM354
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM355=Lfde32_end - Lfde32_start
	.long LDIFF_SYM355
Lfde32_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView

LDIFF_SYM356=Lme_20 - vitasa_VC_SitesList_set_TV_SitesList_UIKit_UITableView
	.long LDIFF_SYM356
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde32_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:ReleaseDesignerOutlets"
	.asciz "vitasa_VC_SitesList_ReleaseDesignerOutlets"

	.byte 6,26
	.quad vitasa_VC_SitesList_ReleaseDesignerOutlets
	.quad Lme_21

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM357=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM357
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM358=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM358
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM359=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM359
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM360=Lfde33_end - Lfde33_start
	.long LDIFF_SYM360
Lfde33_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_ReleaseDesignerOutlets

LDIFF_SYM361=Lme_21 - vitasa_VC_SitesList_ReleaseDesignerOutlets
	.long LDIFF_SYM361
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde33_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_38:

	.byte 5
	.asciz "System_Json_JsonValue"

	.byte 16,16
LDIFF_SYM362=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM362
	.byte 2,35,0,0,7
	.asciz "System_Json_JsonValue"

LDIFF_SYM363=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM363
LTDIE_38_POINTER:

	.byte 13
LDIFF_SYM364=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM364
LTDIE_38_REFERENCE:

	.byte 14
LDIFF_SYM365=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM365
LTDIE_37:

	.byte 5
	.asciz "_<<LoadSitesFromWebService>b__4_0>d"

	.byte 80,16
LDIFF_SYM366=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM366
	.byte 2,35,0,6
	.asciz "<>1__state"

LDIFF_SYM367=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM367
	.byte 2,35,72,6
	.asciz "<>t__builder"

LDIFF_SYM368=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM368
	.byte 2,35,16,6
	.asciz "<>4__this"

LDIFF_SYM369=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM369
	.byte 2,35,40,6
	.asciz "<jv>5__1"

LDIFF_SYM370=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM370
	.byte 2,35,48,6
	.asciz "<>s__2"

LDIFF_SYM371=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM371
	.byte 2,35,56,6
	.asciz "<>u__1"

LDIFF_SYM372=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM372
	.byte 2,35,64,0,7
	.asciz "_<<LoadSitesFromWebService>b__4_0>d"

LDIFF_SYM373=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM373
LTDIE_37_POINTER:

	.byte 13
LDIFF_SYM374=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM374
LTDIE_37_REFERENCE:

	.byte 14
LDIFF_SYM375=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM375
	.byte 2
	.asciz "vitasa.VC_SitesList:<LoadSitesFromWebService>b__4_0"
	.asciz "vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0"

	.byte 0,0
	.quad vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0
	.quad Lme_22

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM376=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM376
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM377=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM377
	.byte 3,141,248,0,11
	.asciz "V_1"

LDIFF_SYM378=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM378
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM379=Lfde34_end - Lfde34_start
	.long LDIFF_SYM379
Lfde34_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0

LDIFF_SYM380=Lme_22 - vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_0
	.long LDIFF_SYM380
	.long 0
	.byte 12,31,0,68,14,208,1,157,26,158,25,68,13,29
	.align 3
Lfde34_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList:<LoadSitesFromWebService>b__4_1"
	.asciz "vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1"

	.byte 5,68
	.quad vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1
	.quad Lme_23

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM381=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM381
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM382=Lfde35_end - Lfde35_start
	.long LDIFF_SYM382
Lfde35_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1

LDIFF_SYM383=Lme_23 - vitasa_VC_SitesList__LoadSitesFromWebServiceb__4_1
	.long LDIFF_SYM383
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde35_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:.ctor"
	.asciz "vitasa_VC_SitesMap__ctor_intptr"

	.byte 7,16
	.quad vitasa_VC_SitesMap__ctor_intptr
	.quad Lme_24

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM384=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM384
	.byte 1,105,3
	.asciz "handle"

LDIFF_SYM385=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM385
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM386=Lfde36_end - Lfde36_start
	.long LDIFF_SYM386
Lfde36_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap__ctor_intptr

LDIFF_SYM387=Lme_24 - vitasa_VC_SitesMap__ctor_intptr
	.long LDIFF_SYM387
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde36_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_39:

	.byte 5
	.asciz "CoreLocation_CLLocationManager"

	.byte 40,16
LDIFF_SYM388=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM388
	.byte 2,35,0,0,7
	.asciz "CoreLocation_CLLocationManager"

LDIFF_SYM389=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM389
LTDIE_39_POINTER:

	.byte 13
LDIFF_SYM390=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM390
LTDIE_39_REFERENCE:

	.byte 14
LDIFF_SYM391=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM391
LTDIE_40:

	.byte 5
	.asciz "CoreLocation_CLLocation"

	.byte 40,16
LDIFF_SYM392=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM392
	.byte 2,35,0,0,7
	.asciz "CoreLocation_CLLocation"

LDIFF_SYM393=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM393
LTDIE_40_POINTER:

	.byte 13
LDIFF_SYM394=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM394
LTDIE_40_REFERENCE:

	.byte 14
LDIFF_SYM395=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM395
	.byte 2
	.asciz "vitasa.VC_SitesMap:ViewDidLoad"
	.asciz "vitasa_VC_SitesMap_ViewDidLoad"

	.byte 7,23
	.quad vitasa_VC_SitesMap_ViewDidLoad
	.quad Lme_25

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM396=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM396
	.byte 1,106,11
	.asciz "locationManager"

LDIFF_SYM397=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM397
	.byte 1,105,11
	.asciz "loc"

LDIFF_SYM398=LTDIE_40_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM398
	.byte 3,141,160,2,11
	.asciz "mapCenter"

LDIFF_SYM399=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM399
	.byte 3,141,144,2,11
	.asciz "mapRegion"

LDIFF_SYM400=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM400
	.byte 3,141,240,1,11
	.asciz "V_4"

LDIFF_SYM401=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM401
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM402=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM402
	.byte 1,102,11
	.asciz "ts"

LDIFF_SYM403=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM403
	.byte 3,141,232,1,11
	.asciz "V_7"

LDIFF_SYM404=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM404
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM405=Lfde37_end - Lfde37_start
	.long LDIFF_SYM405
Lfde37_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_ViewDidLoad

LDIFF_SYM406=Lme_25 - vitasa_VC_SitesMap_ViewDidLoad
	.long LDIFF_SYM406
	.long 0
	.byte 12,31,0,68,14,128,3,157,48,158,47,68,13,29,68,149,46,150,45,68,151,44,68,153,43,154,42
	.align 3
Lfde37_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:LoadSitesFromWebService"
	.asciz "vitasa_VC_SitesMap_LoadSitesFromWebService"

	.byte 7,69
	.quad vitasa_VC_SitesMap_LoadSitesFromWebService
	.quad Lme_26

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM407=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM407
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM408=Lfde38_end - Lfde38_start
	.long LDIFF_SYM408
Lfde38_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_LoadSitesFromWebService

LDIFF_SYM409=Lme_26 - vitasa_VC_SitesMap_LoadSitesFromWebService
	.long LDIFF_SYM409
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde38_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_41:

	.byte 5
	.asciz "System_Double"

	.byte 24,16
LDIFF_SYM410=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM410
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM411=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM411
	.byte 2,35,16,0,7
	.asciz "System_Double"

LDIFF_SYM412=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM412
LTDIE_41_POINTER:

	.byte 13
LDIFF_SYM413=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM413
LTDIE_41_REFERENCE:

	.byte 14
LDIFF_SYM414=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM414
LTDIE_43:

	.byte 5
	.asciz "MapKit_MKShape"

	.byte 40,16
LDIFF_SYM415=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM415
	.byte 2,35,0,0,7
	.asciz "MapKit_MKShape"

LDIFF_SYM416=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM416
LTDIE_43_POINTER:

	.byte 13
LDIFF_SYM417=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM417
LTDIE_43_REFERENCE:

	.byte 14
LDIFF_SYM418=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM418
LTDIE_42:

	.byte 5
	.asciz "MapKit_MKPointAnnotation"

	.byte 40,16
LDIFF_SYM419=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM419
	.byte 2,35,0,0,7
	.asciz "MapKit_MKPointAnnotation"

LDIFF_SYM420=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM420
LTDIE_42_POINTER:

	.byte 13
LDIFF_SYM421=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM421
LTDIE_42_REFERENCE:

	.byte 14
LDIFF_SYM422=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM422
	.byte 2
	.asciz "vitasa.VC_SitesMap:PutPinsOnMap"
	.asciz "vitasa_VC_SitesMap_PutPinsOnMap"

	.byte 7,93
	.quad vitasa_VC_SitesMap_PutPinsOnMap
	.quad Lme_27

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM423=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM423
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM424=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM424
	.byte 3,141,232,0,11
	.asciz "vs"

LDIFF_SYM425=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM425
	.byte 3,141,128,1,11
	.asciz "latitude"

LDIFF_SYM426=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM426
	.byte 3,141,136,1,11
	.asciz "longitude"

LDIFF_SYM427=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM427
	.byte 3,141,144,1,11
	.asciz "conversionOK"

LDIFF_SYM428=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM428
	.byte 3,141,152,1,11
	.asciz "V_5"

LDIFF_SYM429=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM429
	.byte 3,141,160,1,11
	.asciz "pa"

LDIFF_SYM430=LTDIE_42_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM430
	.byte 3,141,168,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM431=Lfde39_end - Lfde39_start
	.long LDIFF_SYM431
Lfde39_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_PutPinsOnMap

LDIFF_SYM432=Lme_27 - vitasa_VC_SitesMap_PutPinsOnMap
	.long LDIFF_SYM432
	.long 0
	.byte 12,31,0,68,14,176,2,157,38,158,37,68,13,29
	.align 3
Lfde39_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:PrepareForSegue"
	.asciz "vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject"

	.byte 7,123
	.quad vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.quad Lme_28

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM433=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM433
	.byte 3,141,200,0,3
	.asciz "segue"

LDIFF_SYM434=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM434
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM435=LTDIE_4_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM435
	.byte 3,141,208,0,11
	.asciz "V_0"

LDIFF_SYM436=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM436
	.byte 1,103,11
	.asciz "siteDetails"

LDIFF_SYM437=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM437
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM438=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM438
	.byte 1,101,11
	.asciz "vc"

LDIFF_SYM439=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM439
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM440=Lfde40_end - Lfde40_start
	.long LDIFF_SYM440
Lfde40_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject

LDIFF_SYM441=Lme_28 - vitasa_VC_SitesMap_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.long LDIFF_SYM441
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.align 3
Lfde40_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:get_B_Back"
	.asciz "vitasa_VC_SitesMap_get_B_Back"

	.byte 8,19
	.quad vitasa_VC_SitesMap_get_B_Back
	.quad Lme_29

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM442=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM442
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM443=Lfde41_end - Lfde41_start
	.long LDIFF_SYM443
Lfde41_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_get_B_Back

LDIFF_SYM444=Lme_29 - vitasa_VC_SitesMap_get_B_Back
	.long LDIFF_SYM444
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde41_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:set_B_Back"
	.asciz "vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton"

	.byte 8,19
	.quad vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton
	.quad Lme_2a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM445=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM445
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM446=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM446
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM447=Lfde42_end - Lfde42_start
	.long LDIFF_SYM447
Lfde42_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton

LDIFF_SYM448=Lme_2a - vitasa_VC_SitesMap_set_B_Back_UIKit_UIButton
	.long LDIFF_SYM448
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde42_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:get_Map_SitesMap"
	.asciz "vitasa_VC_SitesMap_get_Map_SitesMap"

	.byte 8,23
	.quad vitasa_VC_SitesMap_get_Map_SitesMap
	.quad Lme_2b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM449=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM449
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM450=Lfde43_end - Lfde43_start
	.long LDIFF_SYM450
Lfde43_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_get_Map_SitesMap

LDIFF_SYM451=Lme_2b - vitasa_VC_SitesMap_get_Map_SitesMap
	.long LDIFF_SYM451
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde43_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:set_Map_SitesMap"
	.asciz "vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView"

	.byte 8,23
	.quad vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView
	.quad Lme_2c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM452=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM452
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM453=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM453
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM454=Lfde44_end - Lfde44_start
	.long LDIFF_SYM454
Lfde44_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView

LDIFF_SYM455=Lme_2c - vitasa_VC_SitesMap_set_Map_SitesMap_MapKit_MKMapView
	.long LDIFF_SYM455
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde44_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:ReleaseDesignerOutlets"
	.asciz "vitasa_VC_SitesMap_ReleaseDesignerOutlets"

	.byte 8,26
	.quad vitasa_VC_SitesMap_ReleaseDesignerOutlets
	.quad Lme_2d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM456=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM456
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM457=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM457
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM458=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM458
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM459=Lfde45_end - Lfde45_start
	.long LDIFF_SYM459
Lfde45_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_ReleaseDesignerOutlets

LDIFF_SYM460=Lme_2d - vitasa_VC_SitesMap_ReleaseDesignerOutlets
	.long LDIFF_SYM460
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde45_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_44:

	.byte 5
	.asciz "_<<LoadSitesFromWebService>b__4_0>d"

	.byte 80,16
LDIFF_SYM461=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM461
	.byte 2,35,0,6
	.asciz "<>1__state"

LDIFF_SYM462=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM462
	.byte 2,35,72,6
	.asciz "<>t__builder"

LDIFF_SYM463=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM463
	.byte 2,35,16,6
	.asciz "<>4__this"

LDIFF_SYM464=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM464
	.byte 2,35,40,6
	.asciz "<jv>5__1"

LDIFF_SYM465=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM465
	.byte 2,35,48,6
	.asciz "<>s__2"

LDIFF_SYM466=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM466
	.byte 2,35,56,6
	.asciz "<>u__1"

LDIFF_SYM467=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM467
	.byte 2,35,64,0,7
	.asciz "_<<LoadSitesFromWebService>b__4_0>d"

LDIFF_SYM468=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM468
LTDIE_44_POINTER:

	.byte 13
LDIFF_SYM469=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM469
LTDIE_44_REFERENCE:

	.byte 14
LDIFF_SYM470=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM470
	.byte 2
	.asciz "vitasa.VC_SitesMap:<LoadSitesFromWebService>b__4_0"
	.asciz "vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0"

	.byte 0,0
	.quad vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0
	.quad Lme_2e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM471=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM471
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM472=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM472
	.byte 3,141,248,0,11
	.asciz "V_1"

LDIFF_SYM473=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM473
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM474=Lfde46_end - Lfde46_start
	.long LDIFF_SYM474
Lfde46_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0

LDIFF_SYM475=Lme_2e - vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_0
	.long LDIFF_SYM475
	.long 0
	.byte 12,31,0,68,14,208,1,157,26,158,25,68,13,29
	.align 3
Lfde46_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap:<LoadSitesFromWebService>b__4_1"
	.asciz "vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1"

	.byte 7,86
	.quad vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1
	.quad Lme_2f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM476=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM476
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM477=Lfde47_end - Lfde47_start
	.long LDIFF_SYM477
Lfde47_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1

LDIFF_SYM478=Lme_2f - vitasa_VC_SitesMap__LoadSitesFromWebServiceb__4_1
	.long LDIFF_SYM478
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde47_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:.ctor"
	.asciz "vitasa_VC_GetReady__ctor_intptr"

	.byte 9,12
	.quad vitasa_VC_GetReady__ctor_intptr
	.quad Lme_30

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM479=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM479
	.byte 2,141,16,3
	.asciz "handle"

LDIFF_SYM480=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM480
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM481=Lfde48_end - Lfde48_start
	.long LDIFF_SYM481
Lfde48_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady__ctor_intptr

LDIFF_SYM482=Lme_30 - vitasa_VC_GetReady__ctor_intptr
	.long LDIFF_SYM482
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde48_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:PrepareForSegue"
	.asciz "vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject"

	.byte 9,17
	.quad vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.quad Lme_31

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM483=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM483
	.byte 1,104,3
	.asciz "segue"

LDIFF_SYM484=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM484
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM485=LTDIE_4_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM485
	.byte 2,141,56,11
	.asciz "V_0"

LDIFF_SYM486=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM486
	.byte 1,103,11
	.asciz "siteDetails"

LDIFF_SYM487=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM487
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM488=Lfde49_end - Lfde49_start
	.long LDIFF_SYM488
Lfde49_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject

LDIFF_SYM489=Lme_31 - vitasa_VC_GetReady_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.long LDIFF_SYM489
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,149,12,150,11,68,151,10,152,9,68,153,8
	.align 3
Lfde49_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:get_B_Back"
	.asciz "vitasa_VC_GetReady_get_B_Back"

	.byte 10,19
	.quad vitasa_VC_GetReady_get_B_Back
	.quad Lme_32

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM490=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM490
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM491=Lfde50_end - Lfde50_start
	.long LDIFF_SYM491
Lfde50_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_get_B_Back

LDIFF_SYM492=Lme_32 - vitasa_VC_GetReady_get_B_Back
	.long LDIFF_SYM492
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde50_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:set_B_Back"
	.asciz "vitasa_VC_GetReady_set_B_Back_UIKit_UIButton"

	.byte 10,19
	.quad vitasa_VC_GetReady_set_B_Back_UIKit_UIButton
	.quad Lme_33

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM493=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM493
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM494=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM494
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM495=Lfde51_end - Lfde51_start
	.long LDIFF_SYM495
Lfde51_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_set_B_Back_UIKit_UIButton

LDIFF_SYM496=Lme_33 - vitasa_VC_GetReady_set_B_Back_UIKit_UIButton
	.long LDIFF_SYM496
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde51_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:get_TB_ReadyMessage"
	.asciz "vitasa_VC_GetReady_get_TB_ReadyMessage"

	.byte 10,23
	.quad vitasa_VC_GetReady_get_TB_ReadyMessage
	.quad Lme_34

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM497=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM497
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM498=Lfde52_end - Lfde52_start
	.long LDIFF_SYM498
Lfde52_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_get_TB_ReadyMessage

LDIFF_SYM499=Lme_34 - vitasa_VC_GetReady_get_TB_ReadyMessage
	.long LDIFF_SYM499
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde52_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:set_TB_ReadyMessage"
	.asciz "vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView"

	.byte 10,23
	.quad vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView
	.quad Lme_35

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM500=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM500
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM501=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM501
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM502=Lfde53_end - Lfde53_start
	.long LDIFF_SYM502
Lfde53_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView

LDIFF_SYM503=Lme_35 - vitasa_VC_GetReady_set_TB_ReadyMessage_UIKit_UITextView
	.long LDIFF_SYM503
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde53_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_GetReady:ReleaseDesignerOutlets"
	.asciz "vitasa_VC_GetReady_ReleaseDesignerOutlets"

	.byte 10,26
	.quad vitasa_VC_GetReady_ReleaseDesignerOutlets
	.quad Lme_36

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM504=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM504
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM505=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM505
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM506=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM506
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM507=Lfde54_end - Lfde54_start
	.long LDIFF_SYM507
Lfde54_start:

	.long 0
	.align 3
	.quad vitasa_VC_GetReady_ReleaseDesignerOutlets

LDIFF_SYM508=Lme_36 - vitasa_VC_GetReady_ReleaseDesignerOutlets
	.long LDIFF_SYM508
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde54_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite:.ctor"
	.asciz "vitasa_C_VitaSite__ctor"

	.byte 11,12
	.quad vitasa_C_VitaSite__ctor
	.quad Lme_37

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM509=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM509
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM510=Lfde55_end - Lfde55_start
	.long LDIFF_SYM510
Lfde55_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__ctor

LDIFF_SYM511=Lme_37 - vitasa_C_VitaSite__ctor
	.long LDIFF_SYM511
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde55_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite:.ctor"
	.asciz "vitasa_C_VitaSite__ctor_System_Json_JsonValue"

	.byte 11,12
	.quad vitasa_C_VitaSite__ctor_System_Json_JsonValue
	.quad Lme_38

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM512=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM512
	.byte 1,105,3
	.asciz "j"

LDIFF_SYM513=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM513
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM514=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM514
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM515=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM515
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM516=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM516
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM517=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM517
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM518=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM518
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM519=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM519
	.byte 1,99,11
	.asciz "V_6"

LDIFF_SYM520=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM520
	.byte 3,141,232,0,11
	.asciz "V_7"

LDIFF_SYM521=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM521
	.byte 3,141,240,0,11
	.asciz "V_8"

LDIFF_SYM522=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM522
	.byte 3,141,248,0,11
	.asciz "V_9"

LDIFF_SYM523=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM523
	.byte 3,141,128,1,11
	.asciz "V_10"

LDIFF_SYM524=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM524
	.byte 3,141,136,1,11
	.asciz "V_11"

LDIFF_SYM525=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM525
	.byte 3,141,144,1,11
	.asciz "V_12"

LDIFF_SYM526=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM526
	.byte 3,141,152,1,11
	.asciz "V_13"

LDIFF_SYM527=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM527
	.byte 3,141,160,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM528=Lfde56_end - Lfde56_start
	.long LDIFF_SYM528
Lfde56_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__ctor_System_Json_JsonValue

LDIFF_SYM529=Lme_38 - vitasa_C_VitaSite__ctor_System_Json_JsonValue
	.long LDIFF_SYM529
	.long 0
	.byte 12,31,0,68,14,208,1,157,26,158,25,68,13,29,68,147,24,148,23,68,149,22,150,21,68,151,20,152,19,68,153,18
	.byte 154,17
	.align 3
Lfde56_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_45:

	.byte 17
	.asciz "System_Collections_IEnumerator"

	.byte 16,7
	.asciz "System_Collections_IEnumerator"

LDIFF_SYM530=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM530
LTDIE_45_POINTER:

	.byte 13
LDIFF_SYM531=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM531
LTDIE_45_REFERENCE:

	.byte 14
LDIFF_SYM532=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM532
LTDIE_46:

	.byte 17
	.asciz "System_IDisposable"

	.byte 16,7
	.asciz "System_IDisposable"

LDIFF_SYM533=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM533
LTDIE_46_POINTER:

	.byte 13
LDIFF_SYM534=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM534
LTDIE_46_REFERENCE:

	.byte 14
LDIFF_SYM535=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM535
	.byte 2
	.asciz "vitasa.C_VitaSite:ImportSites"
	.asciz "vitasa_C_VitaSite_ImportSites_System_Json_JsonValue"

	.byte 11,106
	.quad vitasa_C_VitaSite_ImportSites_System_Json_JsonValue
	.quad Lme_39

	.byte 2,118,16,3
	.asciz "json"

LDIFF_SYM536=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM536
	.byte 2,141,56,11
	.asciz "res"

LDIFF_SYM537=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM537
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM538=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM538
	.byte 3,141,216,0,11
	.asciz "j"

LDIFF_SYM539=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM539
	.byte 1,104,11
	.asciz "vs"

LDIFF_SYM540=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM540
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM541=LTDIE_46_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM541
	.byte 3,141,224,0,11
	.asciz "V_5"

LDIFF_SYM542=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM542
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM543=Lfde57_end - Lfde57_start
	.long LDIFF_SYM543
Lfde57_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite_ImportSites_System_Json_JsonValue

LDIFF_SYM544=Lme_39 - vitasa_C_VitaSite_ImportSites_System_Json_JsonValue
	.long LDIFF_SYM544
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,149,20,150,19,68,151,18,152,17,68,153,16
	.align 3
Lfde57_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_50:

	.byte 5
	.asciz "System_MarshalByRefObject"

	.byte 24,16
LDIFF_SYM545=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM545
	.byte 2,35,0,6
	.asciz "_identity"

LDIFF_SYM546=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM546
	.byte 2,35,16,0,7
	.asciz "System_MarshalByRefObject"

LDIFF_SYM547=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM547
LTDIE_50_POINTER:

	.byte 13
LDIFF_SYM548=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM548
LTDIE_50_REFERENCE:

	.byte 14
LDIFF_SYM549=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM549
LTDIE_51:

	.byte 8
	.asciz "System_Net_Security_AuthenticationLevel"

	.byte 4
LDIFF_SYM550=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM550
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "MutualAuthRequested"

	.byte 1,9
	.asciz "MutualAuthRequired"

	.byte 2,0,7
	.asciz "System_Net_Security_AuthenticationLevel"

LDIFF_SYM551=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM551
LTDIE_51_POINTER:

	.byte 13
LDIFF_SYM552=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM552
LTDIE_51_REFERENCE:

	.byte 14
LDIFF_SYM553=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM553
LTDIE_52:

	.byte 8
	.asciz "System_Security_Principal_TokenImpersonationLevel"

	.byte 4
LDIFF_SYM554=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM554
	.byte 9
	.asciz "Anonymous"

	.byte 1,9
	.asciz "Delegation"

	.byte 4,9
	.asciz "Identification"

	.byte 2,9
	.asciz "Impersonation"

	.byte 3,9
	.asciz "None"

	.byte 0,0,7
	.asciz "System_Security_Principal_TokenImpersonationLevel"

LDIFF_SYM555=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM555
LTDIE_52_POINTER:

	.byte 13
LDIFF_SYM556=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM556
LTDIE_52_REFERENCE:

	.byte 14
LDIFF_SYM557=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM557
LTDIE_49:

	.byte 5
	.asciz "System_Net_WebRequest"

	.byte 32,16
LDIFF_SYM558=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM558
	.byte 2,35,0,6
	.asciz "m_AuthenticationLevel"

LDIFF_SYM559=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM559
	.byte 2,35,24,6
	.asciz "m_ImpersonationLevel"

LDIFF_SYM560=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM560
	.byte 2,35,28,0,7
	.asciz "System_Net_WebRequest"

LDIFF_SYM561=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM561
LTDIE_49_POINTER:

	.byte 13
LDIFF_SYM562=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM562
LTDIE_49_REFERENCE:

	.byte 14
LDIFF_SYM563=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM563
LTDIE_55:

	.byte 8
	.asciz "System_UriSyntaxFlags"

	.byte 4
LDIFF_SYM564=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM564
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "MustHaveAuthority"

	.byte 1,9
	.asciz "OptionalAuthority"

	.byte 2,9
	.asciz "MayHaveUserInfo"

	.byte 4,9
	.asciz "MayHavePort"

	.byte 8,9
	.asciz "MayHavePath"

	.byte 16,9
	.asciz "MayHaveQuery"

	.byte 32,9
	.asciz "MayHaveFragment"

	.byte 192,0,9
	.asciz "AllowEmptyHost"

	.byte 128,1,9
	.asciz "AllowUncHost"

	.byte 128,2,9
	.asciz "AllowDnsHost"

	.byte 128,4,9
	.asciz "AllowIPv4Host"

	.byte 128,8,9
	.asciz "AllowIPv6Host"

	.byte 128,16,9
	.asciz "AllowAnInternetHost"

	.byte 128,28,9
	.asciz "AllowAnyOtherHost"

	.byte 128,32,9
	.asciz "FileLikeUri"

	.byte 128,192,0,9
	.asciz "MailToLikeUri"

	.byte 128,128,1,9
	.asciz "V1_UnknownUri"

	.byte 128,128,4,9
	.asciz "SimpleUserSyntax"

	.byte 128,128,8,9
	.asciz "BuiltInSyntax"

	.byte 128,128,16,9
	.asciz "ParserSchemeOnly"

	.byte 128,128,32,9
	.asciz "AllowDOSPath"

	.byte 128,128,192,0,9
	.asciz "PathIsRooted"

	.byte 128,128,128,1,9
	.asciz "ConvertPathSlashes"

	.byte 128,128,128,2,9
	.asciz "CompressPath"

	.byte 128,128,128,4,9
	.asciz "CanonicalizeAsFilePath"

	.byte 128,128,128,8,9
	.asciz "UnEscapeDotsAndSlashes"

	.byte 128,128,128,16,9
	.asciz "AllowIdn"

	.byte 128,128,128,32,9
	.asciz "AllowIriParsing"

	.byte 128,128,128,128,1,0,7
	.asciz "System_UriSyntaxFlags"

LDIFF_SYM565=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM565
LTDIE_55_POINTER:

	.byte 13
LDIFF_SYM566=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM566
LTDIE_55_REFERENCE:

	.byte 14
LDIFF_SYM567=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM567
LTDIE_54:

	.byte 5
	.asciz "System_UriParser"

	.byte 40,16
LDIFF_SYM568=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM568
	.byte 2,35,0,6
	.asciz "m_Flags"

LDIFF_SYM569=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM569
	.byte 2,35,24,6
	.asciz "m_UpdatableFlags"

LDIFF_SYM570=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM570
	.byte 2,35,28,6
	.asciz "m_UpdatableFlagsUsed"

LDIFF_SYM571=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM571
	.byte 2,35,32,6
	.asciz "m_Port"

LDIFF_SYM572=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM572
	.byte 2,35,36,6
	.asciz "m_Scheme"

LDIFF_SYM573=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM573
	.byte 2,35,16,0,7
	.asciz "System_UriParser"

LDIFF_SYM574=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM574
LTDIE_54_POINTER:

	.byte 13
LDIFF_SYM575=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM575
LTDIE_54_REFERENCE:

	.byte 14
LDIFF_SYM576=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM576
LTDIE_56:

	.byte 8
	.asciz "_Flags"

	.byte 8
LDIFF_SYM577=LDIE_U8 - Ldebug_info_start
	.long LDIFF_SYM577
	.byte 9
	.asciz "Zero"

	.byte 0,9
	.asciz "SchemeNotCanonical"

	.byte 1,9
	.asciz "UserNotCanonical"

	.byte 2,9
	.asciz "HostNotCanonical"

	.byte 4,9
	.asciz "PortNotCanonical"

	.byte 8,9
	.asciz "PathNotCanonical"

	.byte 16,9
	.asciz "QueryNotCanonical"

	.byte 32,9
	.asciz "FragmentNotCanonical"

	.byte 192,0,9
	.asciz "CannotDisplayCanonical"

	.byte 255,0,9
	.asciz "E_UserNotCanonical"

	.byte 128,1,9
	.asciz "E_HostNotCanonical"

	.byte 128,2,9
	.asciz "E_PortNotCanonical"

	.byte 128,4,9
	.asciz "E_PathNotCanonical"

	.byte 128,8,9
	.asciz "E_QueryNotCanonical"

	.byte 128,16,9
	.asciz "E_FragmentNotCanonical"

	.byte 128,32,9
	.asciz "E_CannotDisplayCanonical"

	.byte 128,63,9
	.asciz "ShouldBeCompressed"

	.byte 128,192,0,9
	.asciz "FirstSlashAbsent"

	.byte 128,128,1,9
	.asciz "BackslashInPath"

	.byte 128,128,2,9
	.asciz "IndexMask"

	.byte 255,255,3,9
	.asciz "HostTypeMask"

	.byte 128,128,28,9
	.asciz "HostNotParsed"

	.byte 0,9
	.asciz "IPv6HostType"

	.byte 128,128,4,9
	.asciz "IPv4HostType"

	.byte 128,128,8,9
	.asciz "DnsHostType"

	.byte 128,128,12,9
	.asciz "UncHostType"

	.byte 128,128,16,9
	.asciz "BasicHostType"

	.byte 128,128,20,9
	.asciz "UnusedHostType"

	.byte 128,128,24,9
	.asciz "UnknownHostType"

	.byte 128,128,28,9
	.asciz "UserEscaped"

	.byte 128,128,32,9
	.asciz "AuthorityFound"

	.byte 128,128,192,0,9
	.asciz "HasUserInfo"

	.byte 128,128,128,1,9
	.asciz "LoopbackHost"

	.byte 128,128,128,2,9
	.asciz "NotDefaultPort"

	.byte 128,128,128,4,9
	.asciz "UserDrivenParsing"

	.byte 128,128,128,8,9
	.asciz "CanonicalDnsHost"

	.byte 128,128,128,16,9
	.asciz "ErrorOrParsingRecursion"

	.byte 128,128,128,32,9
	.asciz "DosPath"

	.byte 128,128,128,192,0,9
	.asciz "UncPath"

	.byte 128,128,128,128,1,9
	.asciz "ImplicitFile"

	.byte 128,128,128,128,2,9
	.asciz "MinimalUriInfoSet"

	.byte 128,128,128,128,4,9
	.asciz "AllUriInfoSet"

	.byte 128,128,128,128,8,9
	.asciz "IdnHost"

	.byte 128,128,128,128,16,9
	.asciz "HasUnicode"

	.byte 128,128,128,128,32,9
	.asciz "HostUnicodeNormalized"

	.byte 128,128,128,128,192,0,9
	.asciz "RestUnicodeNormalized"

	.byte 128,128,128,128,128,1,9
	.asciz "UnicodeHost"

	.byte 128,128,128,128,128,2,9
	.asciz "IntranetUri"

	.byte 128,128,128,128,128,4,9
	.asciz "UseOrigUncdStrOffset"

	.byte 128,128,128,128,128,8,9
	.asciz "UserIriCanonical"

	.byte 128,128,128,128,128,16,9
	.asciz "PathIriCanonical"

	.byte 128,128,128,128,128,32,9
	.asciz "QueryIriCanonical"

	.byte 128,128,128,128,128,192,0,9
	.asciz "FragmentIriCanonical"

	.byte 128,128,128,128,128,128,1,9
	.asciz "IriCanonical"

	.byte 128,128,128,128,128,240,1,9
	.asciz "CompressedSlashes"

	.byte 128,128,128,128,128,128,4,0,7
	.asciz "_Flags"

LDIFF_SYM578=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM578
LTDIE_56_POINTER:

	.byte 13
LDIFF_SYM579=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM579
LTDIE_56_REFERENCE:

	.byte 14
LDIFF_SYM580=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM580
LTDIE_58:

	.byte 5
	.asciz "_MoreInfo"

	.byte 64,16
LDIFF_SYM581=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM581
	.byte 2,35,0,6
	.asciz "Path"

LDIFF_SYM582=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM582
	.byte 2,35,16,6
	.asciz "Query"

LDIFF_SYM583=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM583
	.byte 2,35,24,6
	.asciz "Fragment"

LDIFF_SYM584=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM584
	.byte 2,35,32,6
	.asciz "AbsoluteUri"

LDIFF_SYM585=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM585
	.byte 2,35,40,6
	.asciz "Hash"

LDIFF_SYM586=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM586
	.byte 2,35,56,6
	.asciz "RemoteUrl"

LDIFF_SYM587=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM587
	.byte 2,35,48,0,7
	.asciz "_MoreInfo"

LDIFF_SYM588=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM588
LTDIE_58_POINTER:

	.byte 13
LDIFF_SYM589=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM589
LTDIE_58_REFERENCE:

	.byte 14
LDIFF_SYM590=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM590
LTDIE_57:

	.byte 5
	.asciz "_UriInfo"

	.byte 72,16
LDIFF_SYM591=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM591
	.byte 2,35,0,6
	.asciz "Host"

LDIFF_SYM592=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM592
	.byte 2,35,16,6
	.asciz "ScopeId"

LDIFF_SYM593=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM593
	.byte 2,35,24,6
	.asciz "String"

LDIFF_SYM594=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM594
	.byte 2,35,32,6
	.asciz "Offset"

LDIFF_SYM595=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM595
	.byte 2,35,56,6
	.asciz "DnsSafeHost"

LDIFF_SYM596=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM596
	.byte 2,35,40,6
	.asciz "MoreInfo"

LDIFF_SYM597=LTDIE_58_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM597
	.byte 2,35,48,0,7
	.asciz "_UriInfo"

LDIFF_SYM598=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM598
LTDIE_57_POINTER:

	.byte 13
LDIFF_SYM599=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM599
LTDIE_57_REFERENCE:

	.byte 14
LDIFF_SYM600=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM600
LTDIE_53:

	.byte 5
	.asciz "System_Uri"

	.byte 72,16
LDIFF_SYM601=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM601
	.byte 2,35,0,6
	.asciz "m_String"

LDIFF_SYM602=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM602
	.byte 2,35,16,6
	.asciz "m_originalUnicodeString"

LDIFF_SYM603=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM603
	.byte 2,35,24,6
	.asciz "m_Syntax"

LDIFF_SYM604=LTDIE_54_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM604
	.byte 2,35,32,6
	.asciz "m_DnsSafeHost"

LDIFF_SYM605=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM605
	.byte 2,35,40,6
	.asciz "m_Flags"

LDIFF_SYM606=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM606
	.byte 2,35,56,6
	.asciz "m_Info"

LDIFF_SYM607=LTDIE_57_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM607
	.byte 2,35,48,6
	.asciz "m_iriParsing"

LDIFF_SYM608=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM608
	.byte 2,35,64,0,7
	.asciz "System_Uri"

LDIFF_SYM609=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM609
LTDIE_53_POINTER:

	.byte 13
LDIFF_SYM610=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM610
LTDIE_53_REFERENCE:

	.byte 14
LDIFF_SYM611=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM611
LTDIE_61:

	.byte 5
	.asciz "System_Collections_ArrayList"

	.byte 32,16
LDIFF_SYM612=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM612
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM613=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM613
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM614=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM614
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM615=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM615
	.byte 2,35,28,0,7
	.asciz "System_Collections_ArrayList"

LDIFF_SYM616=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM616
LTDIE_61_POINTER:

	.byte 13
LDIFF_SYM617=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM617
LTDIE_61_REFERENCE:

	.byte 14
LDIFF_SYM618=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM618
LTDIE_60:

	.byte 5
	.asciz "System_Collections_CollectionBase"

	.byte 24,16
LDIFF_SYM619=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM619
	.byte 2,35,0,6
	.asciz "list"

LDIFF_SYM620=LTDIE_61_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM620
	.byte 2,35,16,0,7
	.asciz "System_Collections_CollectionBase"

LDIFF_SYM621=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM621
LTDIE_60_POINTER:

	.byte 13
LDIFF_SYM622=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM622
LTDIE_60_REFERENCE:

	.byte 14
LDIFF_SYM623=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM623
LTDIE_59:

	.byte 5
	.asciz "System_Security_Cryptography_X509Certificates_X509CertificateCollection"

	.byte 24,16
LDIFF_SYM624=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM624
	.byte 2,35,0,0,7
	.asciz "System_Security_Cryptography_X509Certificates_X509CertificateCollection"

LDIFF_SYM625=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM625
LTDIE_59_POINTER:

	.byte 13
LDIFF_SYM626=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM626
LTDIE_59_REFERENCE:

	.byte 14
LDIFF_SYM627=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM627
LTDIE_62:

	.byte 5
	.asciz "System_Int64"

	.byte 24,16
LDIFF_SYM628=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM628
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM629=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM629
	.byte 2,35,16,0,7
	.asciz "System_Int64"

LDIFF_SYM630=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM630
LTDIE_62_POINTER:

	.byte 13
LDIFF_SYM631=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM631
LTDIE_62_REFERENCE:

	.byte 14
LDIFF_SYM632=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM632
LTDIE_68:

	.byte 5
	.asciz "System_Reflection_MemberInfo"

	.byte 16,16
LDIFF_SYM633=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM633
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MemberInfo"

LDIFF_SYM634=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM634
LTDIE_68_POINTER:

	.byte 13
LDIFF_SYM635=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM635
LTDIE_68_REFERENCE:

	.byte 14
LDIFF_SYM636=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM636
LTDIE_67:

	.byte 5
	.asciz "System_Reflection_MethodBase"

	.byte 16,16
LDIFF_SYM637=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM637
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodBase"

LDIFF_SYM638=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM638
LTDIE_67_POINTER:

	.byte 13
LDIFF_SYM639=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM639
LTDIE_67_REFERENCE:

	.byte 14
LDIFF_SYM640=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM640
LTDIE_66:

	.byte 5
	.asciz "System_Reflection_MethodInfo"

	.byte 16,16
LDIFF_SYM641=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM641
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodInfo"

LDIFF_SYM642=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM642
LTDIE_66_POINTER:

	.byte 13
LDIFF_SYM643=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM643
LTDIE_66_REFERENCE:

	.byte 14
LDIFF_SYM644=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM644
LTDIE_70:

	.byte 5
	.asciz "System_Type"

	.byte 24,16
LDIFF_SYM645=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM645
	.byte 2,35,0,6
	.asciz "_impl"

LDIFF_SYM646=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM646
	.byte 2,35,16,0,7
	.asciz "System_Type"

LDIFF_SYM647=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM647
LTDIE_70_POINTER:

	.byte 13
LDIFF_SYM648=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM648
LTDIE_70_REFERENCE:

	.byte 14
LDIFF_SYM649=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM649
LTDIE_69:

	.byte 5
	.asciz "System_DelegateData"

	.byte 40,16
LDIFF_SYM650=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM650
	.byte 2,35,0,6
	.asciz "target_type"

LDIFF_SYM651=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM651
	.byte 2,35,16,6
	.asciz "method_name"

LDIFF_SYM652=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM652
	.byte 2,35,24,6
	.asciz "curried_first_arg"

LDIFF_SYM653=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM653
	.byte 2,35,32,0,7
	.asciz "System_DelegateData"

LDIFF_SYM654=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM654
LTDIE_69_POINTER:

	.byte 13
LDIFF_SYM655=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM655
LTDIE_69_REFERENCE:

	.byte 14
LDIFF_SYM656=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM656
LTDIE_65:

	.byte 5
	.asciz "System_Delegate"

	.byte 104,16
LDIFF_SYM657=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM657
	.byte 2,35,0,6
	.asciz "method_ptr"

LDIFF_SYM658=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM658
	.byte 2,35,16,6
	.asciz "invoke_impl"

LDIFF_SYM659=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM659
	.byte 2,35,24,6
	.asciz "m_target"

LDIFF_SYM660=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM660
	.byte 2,35,32,6
	.asciz "method"

LDIFF_SYM661=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM661
	.byte 2,35,40,6
	.asciz "delegate_trampoline"

LDIFF_SYM662=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM662
	.byte 2,35,48,6
	.asciz "extra_arg"

LDIFF_SYM663=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM663
	.byte 2,35,56,6
	.asciz "method_code"

LDIFF_SYM664=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM664
	.byte 2,35,64,6
	.asciz "method_info"

LDIFF_SYM665=LTDIE_66_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM665
	.byte 2,35,72,6
	.asciz "original_method_info"

LDIFF_SYM666=LTDIE_66_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM666
	.byte 2,35,80,6
	.asciz "data"

LDIFF_SYM667=LTDIE_69_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM667
	.byte 2,35,88,6
	.asciz "method_is_virtual"

LDIFF_SYM668=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM668
	.byte 2,35,96,0,7
	.asciz "System_Delegate"

LDIFF_SYM669=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM669
LTDIE_65_POINTER:

	.byte 13
LDIFF_SYM670=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM670
LTDIE_65_REFERENCE:

	.byte 14
LDIFF_SYM671=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM671
LTDIE_64:

	.byte 5
	.asciz "System_MulticastDelegate"

	.byte 112,16
LDIFF_SYM672=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM672
	.byte 2,35,0,6
	.asciz "delegates"

LDIFF_SYM673=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM673
	.byte 2,35,104,0,7
	.asciz "System_MulticastDelegate"

LDIFF_SYM674=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM674
LTDIE_64_POINTER:

	.byte 13
LDIFF_SYM675=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM675
LTDIE_64_REFERENCE:

	.byte 14
LDIFF_SYM676=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM676
LTDIE_63:

	.byte 5
	.asciz "System_Net_HttpContinueDelegate"

	.byte 112,16
LDIFF_SYM677=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM677
	.byte 2,35,0,0,7
	.asciz "System_Net_HttpContinueDelegate"

LDIFF_SYM678=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM678
LTDIE_63_POINTER:

	.byte 13
LDIFF_SYM679=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM679
LTDIE_63_REFERENCE:

	.byte 14
LDIFF_SYM680=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM680
LTDIE_73:

	.byte 5
	.asciz "System_Single"

	.byte 20,16
LDIFF_SYM681=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM681
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM682=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM682
	.byte 2,35,16,0,7
	.asciz "System_Single"

LDIFF_SYM683=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM683
LTDIE_73_POINTER:

	.byte 13
LDIFF_SYM684=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM684
LTDIE_73_REFERENCE:

	.byte 14
LDIFF_SYM685=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM685
LTDIE_74:

	.byte 17
	.asciz "System_Collections_ICollection"

	.byte 16,7
	.asciz "System_Collections_ICollection"

LDIFF_SYM686=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM686
LTDIE_74_POINTER:

	.byte 13
LDIFF_SYM687=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM687
LTDIE_74_REFERENCE:

	.byte 14
LDIFF_SYM688=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM688
LTDIE_75:

	.byte 17
	.asciz "System_Collections_IEqualityComparer"

	.byte 16,7
	.asciz "System_Collections_IEqualityComparer"

LDIFF_SYM689=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM689
LTDIE_75_POINTER:

	.byte 13
LDIFF_SYM690=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM690
LTDIE_75_REFERENCE:

	.byte 14
LDIFF_SYM691=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM691
LTDIE_72:

	.byte 5
	.asciz "System_Collections_Hashtable"

	.byte 80,16
LDIFF_SYM692=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM692
	.byte 2,35,0,6
	.asciz "buckets"

LDIFF_SYM693=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM693
	.byte 2,35,16,6
	.asciz "count"

LDIFF_SYM694=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM694
	.byte 2,35,56,6
	.asciz "occupancy"

LDIFF_SYM695=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM695
	.byte 2,35,60,6
	.asciz "loadsize"

LDIFF_SYM696=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM696
	.byte 2,35,64,6
	.asciz "loadFactor"

LDIFF_SYM697=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM697
	.byte 2,35,68,6
	.asciz "version"

LDIFF_SYM698=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM698
	.byte 2,35,72,6
	.asciz "isWriterInProgress"

LDIFF_SYM699=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM699
	.byte 2,35,76,6
	.asciz "keys"

LDIFF_SYM700=LTDIE_74_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM700
	.byte 2,35,24,6
	.asciz "values"

LDIFF_SYM701=LTDIE_74_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM701
	.byte 2,35,32,6
	.asciz "_keycomparer"

LDIFF_SYM702=LTDIE_75_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM702
	.byte 2,35,40,6
	.asciz "_syncRoot"

LDIFF_SYM703=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM703
	.byte 2,35,48,0,7
	.asciz "System_Collections_Hashtable"

LDIFF_SYM704=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM704
LTDIE_72_POINTER:

	.byte 13
LDIFF_SYM705=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM705
LTDIE_72_REFERENCE:

	.byte 14
LDIFF_SYM706=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM706
LTDIE_71:

	.byte 5
	.asciz "System_Net_CookieContainer"

	.byte 48,16
LDIFF_SYM707=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM707
	.byte 2,35,0,6
	.asciz "m_domainTable"

LDIFF_SYM708=LTDIE_72_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM708
	.byte 2,35,16,6
	.asciz "m_maxCookieSize"

LDIFF_SYM709=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM709
	.byte 2,35,32,6
	.asciz "m_maxCookies"

LDIFF_SYM710=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM710
	.byte 2,35,36,6
	.asciz "m_maxCookiesPerDomain"

LDIFF_SYM711=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM711
	.byte 2,35,40,6
	.asciz "m_count"

LDIFF_SYM712=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM712
	.byte 2,35,44,6
	.asciz "m_fqdnMyDomain"

LDIFF_SYM713=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM713
	.byte 2,35,24,0,7
	.asciz "System_Net_CookieContainer"

LDIFF_SYM714=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM714
LTDIE_71_POINTER:

	.byte 13
LDIFF_SYM715=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM715
LTDIE_71_REFERENCE:

	.byte 14
LDIFF_SYM716=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM716
LTDIE_76:

	.byte 17
	.asciz "System_Net_ICredentials"

	.byte 16,7
	.asciz "System_Net_ICredentials"

LDIFF_SYM717=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM717
LTDIE_76_POINTER:

	.byte 13
LDIFF_SYM718=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM718
LTDIE_76_REFERENCE:

	.byte 14
LDIFF_SYM719=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM719
LTDIE_80:

	.byte 5
	.asciz "_NameObjectEntry"

	.byte 32,16
LDIFF_SYM720=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM720
	.byte 2,35,0,6
	.asciz "Key"

LDIFF_SYM721=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM721
	.byte 2,35,16,6
	.asciz "Value"

LDIFF_SYM722=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM722
	.byte 2,35,24,0,7
	.asciz "_NameObjectEntry"

LDIFF_SYM723=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM723
LTDIE_80_POINTER:

	.byte 13
LDIFF_SYM724=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM724
LTDIE_80_REFERENCE:

	.byte 14
LDIFF_SYM725=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM725
LTDIE_83:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM726=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM726
LTDIE_83_POINTER:

	.byte 13
LDIFF_SYM727=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM727
LTDIE_83_REFERENCE:

	.byte 14
LDIFF_SYM728=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM728
LTDIE_84:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM729=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM729
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM730=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM730
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM731=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM731
LTDIE_84_POINTER:

	.byte 13
LDIFF_SYM732=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM732
LTDIE_84_REFERENCE:

	.byte 14
LDIFF_SYM733=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM733
LTDIE_85:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM734=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM734
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM735=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM735
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM736=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM736
LTDIE_85_POINTER:

	.byte 13
LDIFF_SYM737=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM737
LTDIE_85_REFERENCE:

	.byte 14
LDIFF_SYM738=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM738
LTDIE_82:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 72,16
LDIFF_SYM739=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM739
	.byte 2,35,0,6
	.asciz "buckets"

LDIFF_SYM740=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM740
	.byte 2,35,16,6
	.asciz "entries"

LDIFF_SYM741=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM741
	.byte 2,35,24,6
	.asciz "count"

LDIFF_SYM742=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM742
	.byte 2,35,56,6
	.asciz "version"

LDIFF_SYM743=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM743
	.byte 2,35,60,6
	.asciz "freeList"

LDIFF_SYM744=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM744
	.byte 2,35,64,6
	.asciz "freeCount"

LDIFF_SYM745=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM745
	.byte 2,35,68,6
	.asciz "comparer"

LDIFF_SYM746=LTDIE_83_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM746
	.byte 2,35,32,6
	.asciz "keys"

LDIFF_SYM747=LTDIE_84_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM747
	.byte 2,35,40,6
	.asciz "values"

LDIFF_SYM748=LTDIE_85_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM748
	.byte 2,35,48,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM749=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM749
LTDIE_82_POINTER:

	.byte 13
LDIFF_SYM750=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM750
LTDIE_82_REFERENCE:

	.byte 14
LDIFF_SYM751=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM751
LTDIE_86:

	.byte 17
	.asciz "System_Runtime_Serialization_IFormatterConverter"

	.byte 16,7
	.asciz "System_Runtime_Serialization_IFormatterConverter"

LDIFF_SYM752=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM752
LTDIE_86_POINTER:

	.byte 13
LDIFF_SYM753=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM753
LTDIE_86_REFERENCE:

	.byte 14
LDIFF_SYM754=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM754
LTDIE_81:

	.byte 5
	.asciz "System_Runtime_Serialization_SerializationInfo"

	.byte 88,16
LDIFF_SYM755=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM755
	.byte 2,35,0,6
	.asciz "m_members"

LDIFF_SYM756=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM756
	.byte 2,35,16,6
	.asciz "m_data"

LDIFF_SYM757=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM757
	.byte 2,35,24,6
	.asciz "m_types"

LDIFF_SYM758=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM758
	.byte 2,35,32,6
	.asciz "m_nameToIndex"

LDIFF_SYM759=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM759
	.byte 2,35,40,6
	.asciz "m_currMember"

LDIFF_SYM760=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM760
	.byte 2,35,80,6
	.asciz "m_converter"

LDIFF_SYM761=LTDIE_86_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM761
	.byte 2,35,48,6
	.asciz "m_fullTypeName"

LDIFF_SYM762=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM762
	.byte 2,35,56,6
	.asciz "m_assemName"

LDIFF_SYM763=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM763
	.byte 2,35,64,6
	.asciz "objectType"

LDIFF_SYM764=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM764
	.byte 2,35,72,6
	.asciz "isFullTypeNameSetExplicit"

LDIFF_SYM765=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM765
	.byte 2,35,84,6
	.asciz "isAssemblyNameSetExplicit"

LDIFF_SYM766=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM766
	.byte 2,35,85,6
	.asciz "requireSameTokenInPartialTrust"

LDIFF_SYM767=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM767
	.byte 2,35,86,0,7
	.asciz "System_Runtime_Serialization_SerializationInfo"

LDIFF_SYM768=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM768
LTDIE_81_POINTER:

	.byte 13
LDIFF_SYM769=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM769
LTDIE_81_REFERENCE:

	.byte 14
LDIFF_SYM770=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM770
LTDIE_79:

	.byte 5
	.asciz "System_Collections_Specialized_NameObjectCollectionBase"

	.byte 64,16
LDIFF_SYM771=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM771
	.byte 2,35,0,6
	.asciz "_readOnly"

LDIFF_SYM772=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM772
	.byte 2,35,56,6
	.asciz "_entriesArray"

LDIFF_SYM773=LTDIE_61_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM773
	.byte 2,35,16,6
	.asciz "_keyComparer"

LDIFF_SYM774=LTDIE_75_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM774
	.byte 2,35,24,6
	.asciz "_entriesTable"

LDIFF_SYM775=LTDIE_72_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM775
	.byte 2,35,32,6
	.asciz "_nullKeyEntry"

LDIFF_SYM776=LTDIE_80_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM776
	.byte 2,35,40,6
	.asciz "_serializationInfo"

LDIFF_SYM777=LTDIE_81_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM777
	.byte 2,35,48,6
	.asciz "_version"

LDIFF_SYM778=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM778
	.byte 2,35,60,0,7
	.asciz "System_Collections_Specialized_NameObjectCollectionBase"

LDIFF_SYM779=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM779
LTDIE_79_POINTER:

	.byte 13
LDIFF_SYM780=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM780
LTDIE_79_REFERENCE:

	.byte 14
LDIFF_SYM781=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM781
LTDIE_78:

	.byte 5
	.asciz "System_Collections_Specialized_NameValueCollection"

	.byte 80,16
LDIFF_SYM782=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM782
	.byte 2,35,0,6
	.asciz "_all"

LDIFF_SYM783=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM783
	.byte 2,35,64,6
	.asciz "_allKeys"

LDIFF_SYM784=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM784
	.byte 2,35,72,0,7
	.asciz "System_Collections_Specialized_NameValueCollection"

LDIFF_SYM785=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM785
LTDIE_78_POINTER:

	.byte 13
LDIFF_SYM786=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM786
LTDIE_78_REFERENCE:

	.byte 14
LDIFF_SYM787=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM787
LTDIE_87:

	.byte 8
	.asciz "System_Net_WebHeaderCollectionType"

	.byte 2
LDIFF_SYM788=LDIE_U2 - Ldebug_info_start
	.long LDIFF_SYM788
	.byte 9
	.asciz "Unknown"

	.byte 0,9
	.asciz "WebRequest"

	.byte 1,9
	.asciz "WebResponse"

	.byte 2,9
	.asciz "HttpWebRequest"

	.byte 3,9
	.asciz "HttpWebResponse"

	.byte 4,9
	.asciz "HttpListenerRequest"

	.byte 5,9
	.asciz "HttpListenerResponse"

	.byte 6,9
	.asciz "FtpWebRequest"

	.byte 7,9
	.asciz "FtpWebResponse"

	.byte 8,9
	.asciz "FileWebRequest"

	.byte 9,9
	.asciz "FileWebResponse"

	.byte 10,0,7
	.asciz "System_Net_WebHeaderCollectionType"

LDIFF_SYM789=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM789
LTDIE_87_POINTER:

	.byte 13
LDIFF_SYM790=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM790
LTDIE_87_REFERENCE:

	.byte 14
LDIFF_SYM791=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM791
LTDIE_77:

	.byte 5
	.asciz "System_Net_WebHeaderCollection"

	.byte 104,16
LDIFF_SYM792=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM792
	.byte 2,35,0,6
	.asciz "m_CommonHeaders"

LDIFF_SYM793=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM793
	.byte 2,35,80,6
	.asciz "m_NumCommonHeaders"

LDIFF_SYM794=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM794
	.byte 2,35,96,6
	.asciz "m_InnerCollection"

LDIFF_SYM795=LTDIE_78_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM795
	.byte 2,35,88,6
	.asciz "m_Type"

LDIFF_SYM796=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM796
	.byte 2,35,100,0,7
	.asciz "System_Net_WebHeaderCollection"

LDIFF_SYM797=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM797
LTDIE_77_POINTER:

	.byte 13
LDIFF_SYM798=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM798
LTDIE_77_REFERENCE:

	.byte 14
LDIFF_SYM799=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM799
LTDIE_88:

	.byte 5
	.asciz "System_Version"

	.byte 32,16
LDIFF_SYM800=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM800
	.byte 2,35,0,6
	.asciz "_Major"

LDIFF_SYM801=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM801
	.byte 2,35,16,6
	.asciz "_Minor"

LDIFF_SYM802=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM802
	.byte 2,35,20,6
	.asciz "_Build"

LDIFF_SYM803=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM803
	.byte 2,35,24,6
	.asciz "_Revision"

LDIFF_SYM804=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM804
	.byte 2,35,28,0,7
	.asciz "System_Version"

LDIFF_SYM805=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM805
LTDIE_88_POINTER:

	.byte 13
LDIFF_SYM806=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM806
LTDIE_88_REFERENCE:

	.byte 14
LDIFF_SYM807=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM807
LTDIE_89:

	.byte 17
	.asciz "System_Net_IWebProxy"

	.byte 16,7
	.asciz "System_Net_IWebProxy"

LDIFF_SYM808=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM808
LTDIE_89_POINTER:

	.byte 13
LDIFF_SYM809=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM809
LTDIE_89_REFERENCE:

	.byte 14
LDIFF_SYM810=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM810
LTDIE_91:

	.byte 5
	.asciz "System_Net_IPHostEntry"

	.byte 48,16
LDIFF_SYM811=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM811
	.byte 2,35,0,6
	.asciz "hostName"

LDIFF_SYM812=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM812
	.byte 2,35,16,6
	.asciz "aliases"

LDIFF_SYM813=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM813
	.byte 2,35,24,6
	.asciz "addressList"

LDIFF_SYM814=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM814
	.byte 2,35,32,6
	.asciz "isTrustedHost"

LDIFF_SYM815=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM815
	.byte 2,35,40,0,7
	.asciz "System_Net_IPHostEntry"

LDIFF_SYM816=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM816
LTDIE_91_POINTER:

	.byte 13
LDIFF_SYM817=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM817
LTDIE_91_REFERENCE:

	.byte 14
LDIFF_SYM818=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM818
LTDIE_93:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM819=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM819
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM820=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM820
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM821=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM821
LTDIE_93_POINTER:

	.byte 13
LDIFF_SYM822=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM822
LTDIE_93_REFERENCE:

	.byte 14
LDIFF_SYM823=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM823
LTDIE_94:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM824=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM824
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM825=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM825
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM826=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM826
LTDIE_94_POINTER:

	.byte 13
LDIFF_SYM827=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM827
LTDIE_94_REFERENCE:

	.byte 14
LDIFF_SYM828=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM828
LTDIE_92:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 72,16
LDIFF_SYM829=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM829
	.byte 2,35,0,6
	.asciz "buckets"

LDIFF_SYM830=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM830
	.byte 2,35,16,6
	.asciz "entries"

LDIFF_SYM831=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM831
	.byte 2,35,24,6
	.asciz "count"

LDIFF_SYM832=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM832
	.byte 2,35,56,6
	.asciz "version"

LDIFF_SYM833=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM833
	.byte 2,35,60,6
	.asciz "freeList"

LDIFF_SYM834=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM834
	.byte 2,35,64,6
	.asciz "freeCount"

LDIFF_SYM835=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM835
	.byte 2,35,68,6
	.asciz "comparer"

LDIFF_SYM836=LTDIE_83_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM836
	.byte 2,35,32,6
	.asciz "keys"

LDIFF_SYM837=LTDIE_93_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM837
	.byte 2,35,40,6
	.asciz "values"

LDIFF_SYM838=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM838
	.byte 2,35,48,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM839=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM839
LTDIE_92_POINTER:

	.byte 13
LDIFF_SYM840=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM840
LTDIE_92_REFERENCE:

	.byte 14
LDIFF_SYM841=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM841
LTDIE_95:

	.byte 5
	.asciz "System_Net_BindIPEndPoint"

	.byte 112,16
LDIFF_SYM842=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM842
	.byte 2,35,0,0,7
	.asciz "System_Net_BindIPEndPoint"

LDIFF_SYM843=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM843
LTDIE_95_POINTER:

	.byte 13
LDIFF_SYM844=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM844
LTDIE_95_REFERENCE:

	.byte 14
LDIFF_SYM845=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM845
LTDIE_97:

	.byte 5
	.asciz "System_Threading_TimerCallback"

	.byte 112,16
LDIFF_SYM846=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM846
	.byte 2,35,0,0,7
	.asciz "System_Threading_TimerCallback"

LDIFF_SYM847=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM847
LTDIE_97_POINTER:

	.byte 13
LDIFF_SYM848=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM848
LTDIE_97_REFERENCE:

	.byte 14
LDIFF_SYM849=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM849
LTDIE_96:

	.byte 5
	.asciz "System_Threading_Timer"

	.byte 72,16
LDIFF_SYM850=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM850
	.byte 2,35,0,6
	.asciz "callback"

LDIFF_SYM851=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM851
	.byte 2,35,24,6
	.asciz "state"

LDIFF_SYM852=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM852
	.byte 2,35,32,6
	.asciz "due_time_ms"

LDIFF_SYM853=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM853
	.byte 2,35,40,6
	.asciz "period_ms"

LDIFF_SYM854=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM854
	.byte 2,35,48,6
	.asciz "next_run"

LDIFF_SYM855=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM855
	.byte 2,35,56,6
	.asciz "disposed"

LDIFF_SYM856=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM856
	.byte 2,35,64,0,7
	.asciz "System_Threading_Timer"

LDIFF_SYM857=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM857
LTDIE_96_POINTER:

	.byte 13
LDIFF_SYM858=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM858
LTDIE_96_REFERENCE:

	.byte 14
LDIFF_SYM859=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM859
LTDIE_90:

	.byte 5
	.asciz "System_Net_ServicePoint"

	.byte 136,1,16
LDIFF_SYM860=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM860
	.byte 2,35,0,6
	.asciz "uri"

LDIFF_SYM861=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM861
	.byte 2,35,16,6
	.asciz "connectionLimit"

LDIFF_SYM862=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM862
	.byte 2,35,88,6
	.asciz "maxIdleTime"

LDIFF_SYM863=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM863
	.byte 2,35,92,6
	.asciz "currentConnections"

LDIFF_SYM864=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM864
	.byte 2,35,96,6
	.asciz "idleSince"

LDIFF_SYM865=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM865
	.byte 2,35,104,6
	.asciz "lastDnsResolve"

LDIFF_SYM866=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM866
	.byte 2,35,112,6
	.asciz "protocolVersion"

LDIFF_SYM867=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM867
	.byte 2,35,24,6
	.asciz "host"

LDIFF_SYM868=LTDIE_91_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM868
	.byte 2,35,32,6
	.asciz "usesProxy"

LDIFF_SYM869=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM869
	.byte 2,35,120,6
	.asciz "groups"

LDIFF_SYM870=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM870
	.byte 2,35,40,6
	.asciz "sendContinue"

LDIFF_SYM871=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM871
	.byte 2,35,121,6
	.asciz "useConnect"

LDIFF_SYM872=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM872
	.byte 2,35,122,6
	.asciz "hostE"

LDIFF_SYM873=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM873
	.byte 2,35,48,6
	.asciz "useNagle"

LDIFF_SYM874=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM874
	.byte 2,35,123,6
	.asciz "endPointCallback"

LDIFF_SYM875=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM875
	.byte 2,35,56,6
	.asciz "tcp_keepalive"

LDIFF_SYM876=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM876
	.byte 2,35,124,6
	.asciz "tcp_keepalive_time"

LDIFF_SYM877=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM877
	.byte 3,35,128,1,6
	.asciz "tcp_keepalive_interval"

LDIFF_SYM878=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM878
	.byte 3,35,132,1,6
	.asciz "idleTimer"

LDIFF_SYM879=LTDIE_96_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM879
	.byte 2,35,64,6
	.asciz "m_ServerCertificateOrBytes"

LDIFF_SYM880=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM880
	.byte 2,35,72,6
	.asciz "m_ClientCertificateOrBytes"

LDIFF_SYM881=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM881
	.byte 2,35,80,0,7
	.asciz "System_Net_ServicePoint"

LDIFF_SYM882=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM882
LTDIE_90_POINTER:

	.byte 13
LDIFF_SYM883=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM883
LTDIE_90_REFERENCE:

	.byte 14
LDIFF_SYM884=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM884
LTDIE_103:

	.byte 5
	.asciz "System_Threading_Tasks_TaskScheduler"

	.byte 20,16
LDIFF_SYM885=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM885
	.byte 2,35,0,6
	.asciz "m_taskSchedulerId"

LDIFF_SYM886=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM886
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_TaskScheduler"

LDIFF_SYM887=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM887
LTDIE_103_POINTER:

	.byte 13
LDIFF_SYM888=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM888
LTDIE_103_REFERENCE:

	.byte 14
LDIFF_SYM889=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM889
LTDIE_106:

	.byte 5
	.asciz "System_Threading_SynchronizationContext"

	.byte 16,16
LDIFF_SYM890=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM890
	.byte 2,35,0,0,7
	.asciz "System_Threading_SynchronizationContext"

LDIFF_SYM891=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM891
LTDIE_106_POINTER:

	.byte 13
LDIFF_SYM892=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM892
LTDIE_106_REFERENCE:

	.byte 14
LDIFF_SYM893=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM893
LTDIE_108:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

	.byte 16,16
LDIFF_SYM894=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM894
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

LDIFF_SYM895=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM895
LTDIE_108_POINTER:

	.byte 13
LDIFF_SYM896=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM896
LTDIE_108_REFERENCE:

	.byte 14
LDIFF_SYM897=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM897
LTDIE_109:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

	.byte 16,16
LDIFF_SYM898=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM898
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

LDIFF_SYM899=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM899
LTDIE_109_POINTER:

	.byte 13
LDIFF_SYM900=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM900
LTDIE_109_REFERENCE:

	.byte 14
LDIFF_SYM901=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM901
LTDIE_107:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

	.byte 56,16
LDIFF_SYM902=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM902
	.byte 2,35,0,6
	.asciz "m_Datastore"

LDIFF_SYM903=LTDIE_72_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM903
	.byte 2,35,16,6
	.asciz "m_RemotingData"

LDIFF_SYM904=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM904
	.byte 2,35,24,6
	.asciz "m_SecurityData"

LDIFF_SYM905=LTDIE_109_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM905
	.byte 2,35,32,6
	.asciz "m_HostContext"

LDIFF_SYM906=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM906
	.byte 2,35,40,6
	.asciz "m_IsCorrelationMgr"

LDIFF_SYM907=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM907
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

LDIFF_SYM908=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM908
LTDIE_107_POINTER:

	.byte 13
LDIFF_SYM909=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM909
LTDIE_107_REFERENCE:

	.byte 14
LDIFF_SYM910=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM910
LTDIE_110:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

	.byte 16,16
LDIFF_SYM911=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM911
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

LDIFF_SYM912=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM912
LTDIE_110_POINTER:

	.byte 13
LDIFF_SYM913=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM913
LTDIE_110_REFERENCE:

	.byte 14
LDIFF_SYM914=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM914
LTDIE_111:

	.byte 8
	.asciz "_Flags"

	.byte 4
LDIFF_SYM915=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM915
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "IsNewCapture"

	.byte 1,9
	.asciz "IsFlowSuppressed"

	.byte 2,9
	.asciz "IsPreAllocatedDefault"

	.byte 4,0,7
	.asciz "_Flags"

LDIFF_SYM916=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM916
LTDIE_111_POINTER:

	.byte 13
LDIFF_SYM917=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM917
LTDIE_111_REFERENCE:

	.byte 14
LDIFF_SYM918=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM918
LTDIE_113:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM919=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM919
LTDIE_113_POINTER:

	.byte 13
LDIFF_SYM920=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM920
LTDIE_113_REFERENCE:

	.byte 14
LDIFF_SYM921=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM921
LTDIE_114:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM922=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM922
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM923=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM923
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM924=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM924
LTDIE_114_POINTER:

	.byte 13
LDIFF_SYM925=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM925
LTDIE_114_REFERENCE:

	.byte 14
LDIFF_SYM926=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM926
LTDIE_115:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM927=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM927
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM928=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM928
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM929=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM929
LTDIE_115_POINTER:

	.byte 13
LDIFF_SYM930=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM930
LTDIE_115_REFERENCE:

	.byte 14
LDIFF_SYM931=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM931
LTDIE_112:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 72,16
LDIFF_SYM932=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM932
	.byte 2,35,0,6
	.asciz "buckets"

LDIFF_SYM933=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM933
	.byte 2,35,16,6
	.asciz "entries"

LDIFF_SYM934=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM934
	.byte 2,35,24,6
	.asciz "count"

LDIFF_SYM935=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM935
	.byte 2,35,56,6
	.asciz "version"

LDIFF_SYM936=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM936
	.byte 2,35,60,6
	.asciz "freeList"

LDIFF_SYM937=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM937
	.byte 2,35,64,6
	.asciz "freeCount"

LDIFF_SYM938=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM938
	.byte 2,35,68,6
	.asciz "comparer"

LDIFF_SYM939=LTDIE_113_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM939
	.byte 2,35,32,6
	.asciz "keys"

LDIFF_SYM940=LTDIE_114_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM940
	.byte 2,35,40,6
	.asciz "values"

LDIFF_SYM941=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM941
	.byte 2,35,48,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM942=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM942
LTDIE_112_POINTER:

	.byte 13
LDIFF_SYM943=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM943
LTDIE_112_REFERENCE:

	.byte 14
LDIFF_SYM944=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM944
LTDIE_116:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 32,16
LDIFF_SYM945=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM945
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM946=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM946
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM947=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM947
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM948=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM948
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM949=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM949
LTDIE_116_POINTER:

	.byte 13
LDIFF_SYM950=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM950
LTDIE_116_REFERENCE:

	.byte 14
LDIFF_SYM951=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM951
LTDIE_105:

	.byte 5
	.asciz "System_Threading_ExecutionContext"

	.byte 72,16
LDIFF_SYM952=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM952
	.byte 2,35,0,6
	.asciz "_syncContext"

LDIFF_SYM953=LTDIE_106_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM953
	.byte 2,35,16,6
	.asciz "_syncContextNoFlow"

LDIFF_SYM954=LTDIE_106_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM954
	.byte 2,35,24,6
	.asciz "_logicalCallContext"

LDIFF_SYM955=LTDIE_107_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM955
	.byte 2,35,32,6
	.asciz "_illogicalCallContext"

LDIFF_SYM956=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM956
	.byte 2,35,40,6
	.asciz "_flags"

LDIFF_SYM957=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM957
	.byte 2,35,64,6
	.asciz "_localValues"

LDIFF_SYM958=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM958
	.byte 2,35,48,6
	.asciz "_localChangeNotifications"

LDIFF_SYM959=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM959
	.byte 2,35,56,0,7
	.asciz "System_Threading_ExecutionContext"

LDIFF_SYM960=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM960
LTDIE_105_POINTER:

	.byte 13
LDIFF_SYM961=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM961
LTDIE_105_REFERENCE:

	.byte 14
LDIFF_SYM962=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM962
LTDIE_124:

	.byte 5
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

	.byte 16,16
LDIFF_SYM963=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM963
	.byte 2,35,0,0,7
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

LDIFF_SYM964=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM964
LTDIE_124_POINTER:

	.byte 13
LDIFF_SYM965=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM965
LTDIE_124_REFERENCE:

	.byte 14
LDIFF_SYM966=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM966
LTDIE_123:

	.byte 5
	.asciz "System_Runtime_InteropServices_SafeHandle"

	.byte 32,16
LDIFF_SYM967=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM967
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM968=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM968
	.byte 2,35,16,6
	.asciz "_state"

LDIFF_SYM969=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM969
	.byte 2,35,24,6
	.asciz "_ownsHandle"

LDIFF_SYM970=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM970
	.byte 2,35,28,6
	.asciz "_fullyInitialized"

LDIFF_SYM971=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM971
	.byte 2,35,29,0,7
	.asciz "System_Runtime_InteropServices_SafeHandle"

LDIFF_SYM972=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM972
LTDIE_123_POINTER:

	.byte 13
LDIFF_SYM973=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM973
LTDIE_123_REFERENCE:

	.byte 14
LDIFF_SYM974=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM974
LTDIE_122:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

	.byte 32,16
LDIFF_SYM975=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM975
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

LDIFF_SYM976=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM976
LTDIE_122_POINTER:

	.byte 13
LDIFF_SYM977=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM977
LTDIE_122_REFERENCE:

	.byte 14
LDIFF_SYM978=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM978
LTDIE_121:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

	.byte 32,16
LDIFF_SYM979=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM979
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

LDIFF_SYM980=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM980
LTDIE_121_POINTER:

	.byte 13
LDIFF_SYM981=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM981
LTDIE_121_REFERENCE:

	.byte 14
LDIFF_SYM982=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM982
LTDIE_120:

	.byte 5
	.asciz "System_Threading_WaitHandle"

	.byte 48,16
LDIFF_SYM983=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM983
	.byte 2,35,0,6
	.asciz "waitHandle"

LDIFF_SYM984=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM984
	.byte 2,35,24,6
	.asciz "safeWaitHandle"

LDIFF_SYM985=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM985
	.byte 2,35,32,6
	.asciz "hasThreadAffinity"

LDIFF_SYM986=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM986
	.byte 2,35,40,0,7
	.asciz "System_Threading_WaitHandle"

LDIFF_SYM987=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM987
LTDIE_120_POINTER:

	.byte 13
LDIFF_SYM988=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM988
LTDIE_120_REFERENCE:

	.byte 14
LDIFF_SYM989=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM989
LTDIE_119:

	.byte 5
	.asciz "System_Threading_EventWaitHandle"

	.byte 48,16
LDIFF_SYM990=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM990
	.byte 2,35,0,0,7
	.asciz "System_Threading_EventWaitHandle"

LDIFF_SYM991=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM991
LTDIE_119_POINTER:

	.byte 13
LDIFF_SYM992=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM992
LTDIE_119_REFERENCE:

	.byte 14
LDIFF_SYM993=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM993
LTDIE_118:

	.byte 5
	.asciz "System_Threading_ManualResetEvent"

	.byte 48,16
LDIFF_SYM994=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM994
	.byte 2,35,0,0,7
	.asciz "System_Threading_ManualResetEvent"

LDIFF_SYM995=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM995
LTDIE_118_POINTER:

	.byte 13
LDIFF_SYM996=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM996
LTDIE_118_REFERENCE:

	.byte 14
LDIFF_SYM997=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM997
LTDIE_117:

	.byte 5
	.asciz "System_Threading_ManualResetEventSlim"

	.byte 40,16
LDIFF_SYM998=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM998
	.byte 2,35,0,6
	.asciz "m_lock"

LDIFF_SYM999=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM999
	.byte 2,35,16,6
	.asciz "m_eventObj"

LDIFF_SYM1000=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1000
	.byte 2,35,24,6
	.asciz "m_combinedState"

LDIFF_SYM1001=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1001
	.byte 2,35,32,0,7
	.asciz "System_Threading_ManualResetEventSlim"

LDIFF_SYM1002=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM1002
LTDIE_117_POINTER:

	.byte 13
LDIFF_SYM1003=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM1003
LTDIE_117_REFERENCE:

	.byte 14
LDIFF_SYM1004=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM1004
LTDIE_126:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 32,16
LDIFF_SYM1005=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1005
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1006=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1006
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1007=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1007
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1008=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1008
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1009=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1009
LTDIE_126_POINTER:

	.byte 13
LDIFF_SYM1010=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1010
LTDIE_126_REFERENCE:

	.byte 14
LDIFF_SYM1011=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1011
LTDIE_129:

	.byte 17
	.asciz "System_Collections_IDictionary"

	.byte 16,7
	.asciz "System_Collections_IDictionary"

LDIFF_SYM1012=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1012
LTDIE_129_POINTER:

	.byte 13
LDIFF_SYM1013=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1013
LTDIE_129_REFERENCE:

	.byte 14
LDIFF_SYM1014=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1014
LTDIE_131:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM1015=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1015
LTDIE_131_POINTER:

	.byte 13
LDIFF_SYM1016=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1016
LTDIE_131_REFERENCE:

	.byte 14
LDIFF_SYM1017=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1017
LTDIE_133:

	.byte 5
	.asciz "System_Reflection_TypeInfo"

	.byte 24,16
LDIFF_SYM1018=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM1018
	.byte 2,35,0,0,7
	.asciz "System_Reflection_TypeInfo"

LDIFF_SYM1019=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1019
LTDIE_133_POINTER:

	.byte 13
LDIFF_SYM1020=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1020
LTDIE_133_REFERENCE:

	.byte 14
LDIFF_SYM1021=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1021
LTDIE_137:

	.byte 5
	.asciz "System_Reflection_ConstructorInfo"

	.byte 16,16
LDIFF_SYM1022=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM1022
	.byte 2,35,0,0,7
	.asciz "System_Reflection_ConstructorInfo"

LDIFF_SYM1023=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1023
LTDIE_137_POINTER:

	.byte 13
LDIFF_SYM1024=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1024
LTDIE_137_REFERENCE:

	.byte 14
LDIFF_SYM1025=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1025
LTDIE_136:

	.byte 5
	.asciz "System_Reflection_RuntimeConstructorInfo"

	.byte 16,16
LDIFF_SYM1026=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1026
	.byte 2,35,0,0,7
	.asciz "System_Reflection_RuntimeConstructorInfo"

LDIFF_SYM1027=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1027
LTDIE_136_POINTER:

	.byte 13
LDIFF_SYM1028=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1028
LTDIE_136_REFERENCE:

	.byte 14
LDIFF_SYM1029=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1029
LTDIE_135:

	.byte 5
	.asciz "System_Reflection_MonoCMethod"

	.byte 40,16
LDIFF_SYM1030=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1030
	.byte 2,35,0,6
	.asciz "mhandle"

LDIFF_SYM1031=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1031
	.byte 2,35,16,6
	.asciz "name"

LDIFF_SYM1032=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1032
	.byte 2,35,24,6
	.asciz "reftype"

LDIFF_SYM1033=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1033
	.byte 2,35,32,0,7
	.asciz "System_Reflection_MonoCMethod"

LDIFF_SYM1034=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1034
LTDIE_135_POINTER:

	.byte 13
LDIFF_SYM1035=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1035
LTDIE_135_REFERENCE:

	.byte 14
LDIFF_SYM1036=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1036
LTDIE_134:

	.byte 5
	.asciz "System_MonoTypeInfo"

	.byte 32,16
LDIFF_SYM1037=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1037
	.byte 2,35,0,6
	.asciz "full_name"

LDIFF_SYM1038=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1038
	.byte 2,35,16,6
	.asciz "default_ctor"

LDIFF_SYM1039=LTDIE_135_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1039
	.byte 2,35,24,0,7
	.asciz "System_MonoTypeInfo"

LDIFF_SYM1040=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1040
LTDIE_134_POINTER:

	.byte 13
LDIFF_SYM1041=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1041
LTDIE_134_REFERENCE:

	.byte 14
LDIFF_SYM1042=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1042
LTDIE_132:

	.byte 5
	.asciz "System_RuntimeType"

	.byte 48,16
LDIFF_SYM1043=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1043
	.byte 2,35,0,6
	.asciz "type_info"

LDIFF_SYM1044=LTDIE_134_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1044
	.byte 2,35,24,6
	.asciz "GenericCache"

LDIFF_SYM1045=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1045
	.byte 2,35,32,6
	.asciz "m_serializationCtor"

LDIFF_SYM1046=LTDIE_136_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1046
	.byte 2,35,40,0,7
	.asciz "System_RuntimeType"

LDIFF_SYM1047=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1047
LTDIE_132_POINTER:

	.byte 13
LDIFF_SYM1048=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1048
LTDIE_132_REFERENCE:

	.byte 14
LDIFF_SYM1049=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1049
LTDIE_138:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM1050=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1050
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM1051=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1051
LTDIE_138_POINTER:

	.byte 13
LDIFF_SYM1052=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1052
LTDIE_138_REFERENCE:

	.byte 14
LDIFF_SYM1053=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1053
LTDIE_130:

	.byte 5
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

	.byte 56,16
LDIFF_SYM1054=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1054
	.byte 2,35,0,6
	.asciz "m_serializedStates"

LDIFF_SYM1055=LTDIE_131_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1055
	.byte 2,35,16,6
	.asciz "m_savedSerializationInfo"

LDIFF_SYM1056=LTDIE_81_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1056
	.byte 2,35,24,6
	.asciz "m_realObject"

LDIFF_SYM1057=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1057
	.byte 2,35,32,6
	.asciz "m_realType"

LDIFF_SYM1058=LTDIE_132_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1058
	.byte 2,35,40,6
	.asciz "SerializeObjectState"

LDIFF_SYM1059=LTDIE_138_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1059
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

LDIFF_SYM1060=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1060
LTDIE_130_POINTER:

	.byte 13
LDIFF_SYM1061=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1061
LTDIE_130_REFERENCE:

	.byte 14
LDIFF_SYM1062=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1062
LTDIE_128:

	.byte 5
	.asciz "System_Exception"

	.byte 136,1,16
LDIFF_SYM1063=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1063
	.byte 2,35,0,6
	.asciz "_className"

LDIFF_SYM1064=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1064
	.byte 2,35,16,6
	.asciz "_message"

LDIFF_SYM1065=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1065
	.byte 2,35,24,6
	.asciz "_data"

LDIFF_SYM1066=LTDIE_129_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1066
	.byte 2,35,32,6
	.asciz "_innerException"

LDIFF_SYM1067=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1067
	.byte 2,35,40,6
	.asciz "_helpURL"

LDIFF_SYM1068=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1068
	.byte 2,35,48,6
	.asciz "_stackTrace"

LDIFF_SYM1069=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1069
	.byte 2,35,56,6
	.asciz "_stackTraceString"

LDIFF_SYM1070=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1070
	.byte 2,35,64,6
	.asciz "_remoteStackTraceString"

LDIFF_SYM1071=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1071
	.byte 2,35,72,6
	.asciz "_remoteStackIndex"

LDIFF_SYM1072=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1072
	.byte 2,35,80,6
	.asciz "_dynamicMethods"

LDIFF_SYM1073=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1073
	.byte 2,35,88,6
	.asciz "_HResult"

LDIFF_SYM1074=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1074
	.byte 2,35,96,6
	.asciz "_source"

LDIFF_SYM1075=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1075
	.byte 2,35,104,6
	.asciz "_safeSerializationManager"

LDIFF_SYM1076=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1076
	.byte 2,35,112,6
	.asciz "captured_traces"

LDIFF_SYM1077=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1077
	.byte 2,35,120,6
	.asciz "native_trace_ips"

LDIFF_SYM1078=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1078
	.byte 3,35,128,1,0,7
	.asciz "System_Exception"

LDIFF_SYM1079=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1079
LTDIE_128_POINTER:

	.byte 13
LDIFF_SYM1080=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1080
LTDIE_128_REFERENCE:

	.byte 14
LDIFF_SYM1081=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1081
LTDIE_127:

	.byte 5
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

	.byte 32,16
LDIFF_SYM1082=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1082
	.byte 2,35,0,6
	.asciz "m_Exception"

LDIFF_SYM1083=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1083
	.byte 2,35,16,6
	.asciz "m_stackTrace"

LDIFF_SYM1084=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1084
	.byte 2,35,24,0,7
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

LDIFF_SYM1085=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1085
LTDIE_127_POINTER:

	.byte 13
LDIFF_SYM1086=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1086
LTDIE_127_REFERENCE:

	.byte 14
LDIFF_SYM1087=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1087
LTDIE_125:

	.byte 5
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

	.byte 48,16
LDIFF_SYM1088=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1088
	.byte 2,35,0,6
	.asciz "m_task"

LDIFF_SYM1089=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1089
	.byte 2,35,16,6
	.asciz "m_faultExceptions"

LDIFF_SYM1090=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1090
	.byte 2,35,24,6
	.asciz "m_cancellationException"

LDIFF_SYM1091=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1091
	.byte 2,35,32,6
	.asciz "m_isHandled"

LDIFF_SYM1092=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1092
	.byte 2,35,40,0,7
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

LDIFF_SYM1093=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1093
LTDIE_125_POINTER:

	.byte 13
LDIFF_SYM1094=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1094
LTDIE_125_REFERENCE:

	.byte 14
LDIFF_SYM1095=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1095
LTDIE_139:

	.byte 5
	.asciz "System_Threading_Tasks_Shared`1"

	.byte 40,16
LDIFF_SYM1096=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1096
	.byte 2,35,0,6
	.asciz "Value"

LDIFF_SYM1097=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1097
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_Shared`1"

LDIFF_SYM1098=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1098
LTDIE_139_POINTER:

	.byte 13
LDIFF_SYM1099=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1099
LTDIE_139_REFERENCE:

	.byte 14
LDIFF_SYM1100=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1100
LTDIE_140:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 32,16
LDIFF_SYM1101=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1101
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1102=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1102
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1103=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1103
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1104=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1104
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1105=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1105
LTDIE_140_POINTER:

	.byte 13
LDIFF_SYM1106=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1106
LTDIE_140_REFERENCE:

	.byte 14
LDIFF_SYM1107=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1107
LTDIE_104:

	.byte 5
	.asciz "_ContingentProperties"

	.byte 72,16
LDIFF_SYM1108=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1108
	.byte 2,35,0,6
	.asciz "m_capturedContext"

LDIFF_SYM1109=LTDIE_105_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1109
	.byte 2,35,16,6
	.asciz "m_completionEvent"

LDIFF_SYM1110=LTDIE_117_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1110
	.byte 2,35,24,6
	.asciz "m_exceptionsHolder"

LDIFF_SYM1111=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1111
	.byte 2,35,32,6
	.asciz "m_cancellationToken"

LDIFF_SYM1112=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1112
	.byte 2,35,40,6
	.asciz "m_cancellationRegistration"

LDIFF_SYM1113=LTDIE_139_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1113
	.byte 2,35,48,6
	.asciz "m_internalCancellationRequested"

LDIFF_SYM1114=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1114
	.byte 2,35,64,6
	.asciz "m_completionCountdown"

LDIFF_SYM1115=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1115
	.byte 2,35,68,6
	.asciz "m_exceptionalChildren"

LDIFF_SYM1116=LTDIE_140_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1116
	.byte 2,35,56,0,7
	.asciz "_ContingentProperties"

LDIFF_SYM1117=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM1117
LTDIE_104_POINTER:

	.byte 13
LDIFF_SYM1118=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM1118
LTDIE_104_REFERENCE:

	.byte 14
LDIFF_SYM1119=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM1119
LTDIE_102:

	.byte 5
	.asciz "System_Threading_Tasks_Task"

	.byte 72,16
LDIFF_SYM1120=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1120
	.byte 2,35,0,6
	.asciz "m_taskId"

LDIFF_SYM1121=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1121
	.byte 2,35,64,6
	.asciz "m_action"

LDIFF_SYM1122=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1122
	.byte 2,35,16,6
	.asciz "m_stateObject"

LDIFF_SYM1123=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1123
	.byte 2,35,24,6
	.asciz "m_taskScheduler"

LDIFF_SYM1124=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1124
	.byte 2,35,32,6
	.asciz "m_parent"

LDIFF_SYM1125=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1125
	.byte 2,35,40,6
	.asciz "m_stateFlags"

LDIFF_SYM1126=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1126
	.byte 2,35,68,6
	.asciz "m_continuationObject"

LDIFF_SYM1127=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1127
	.byte 2,35,48,6
	.asciz "m_contingentProperties"

LDIFF_SYM1128=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1128
	.byte 2,35,56,0,7
	.asciz "System_Threading_Tasks_Task"

LDIFF_SYM1129=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1129
LTDIE_102_POINTER:

	.byte 13
LDIFF_SYM1130=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1130
LTDIE_102_REFERENCE:

	.byte 14
LDIFF_SYM1131=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1131
LTDIE_101:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1132=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1132
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1133=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1133
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1134=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM1134
LTDIE_101_POINTER:

	.byte 13
LDIFF_SYM1135=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM1135
LTDIE_101_REFERENCE:

	.byte 14
LDIFF_SYM1136=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM1136
LTDIE_141:

	.byte 5
	.asciz "System_AsyncCallback"

	.byte 112,16
LDIFF_SYM1137=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1137
	.byte 2,35,0,0,7
	.asciz "System_AsyncCallback"

LDIFF_SYM1138=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1138
LTDIE_141_POINTER:

	.byte 13
LDIFF_SYM1139=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1139
LTDIE_141_REFERENCE:

	.byte 14
LDIFF_SYM1140=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1140
LTDIE_100:

	.byte 5
	.asciz "_ReadWriteTask"

	.byte 128,1,16
LDIFF_SYM1141=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM1141
	.byte 2,35,0,6
	.asciz "_isRead"

LDIFF_SYM1142=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1142
	.byte 2,35,112,6
	.asciz "_stream"

LDIFF_SYM1143=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1143
	.byte 2,35,80,6
	.asciz "_buffer"

LDIFF_SYM1144=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1144
	.byte 2,35,88,6
	.asciz "_offset"

LDIFF_SYM1145=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1145
	.byte 2,35,116,6
	.asciz "_count"

LDIFF_SYM1146=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1146
	.byte 2,35,120,6
	.asciz "_callback"

LDIFF_SYM1147=LTDIE_141_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1147
	.byte 2,35,96,6
	.asciz "_context"

LDIFF_SYM1148=LTDIE_105_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1148
	.byte 2,35,104,0,7
	.asciz "_ReadWriteTask"

LDIFF_SYM1149=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM1149
LTDIE_100_POINTER:

	.byte 13
LDIFF_SYM1150=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM1150
LTDIE_100_REFERENCE:

	.byte 14
LDIFF_SYM1151=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM1151
LTDIE_144:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1152=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1152
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1153=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1153
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1154=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1154
LTDIE_144_POINTER:

	.byte 13
LDIFF_SYM1155=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1155
LTDIE_144_REFERENCE:

	.byte 14
LDIFF_SYM1156=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1156
LTDIE_143:

	.byte 5
	.asciz "_TaskNode"

	.byte 96,16
LDIFF_SYM1157=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1157
	.byte 2,35,0,6
	.asciz "Prev"

LDIFF_SYM1158=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1158
	.byte 2,35,80,6
	.asciz "Next"

LDIFF_SYM1159=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1159
	.byte 2,35,88,0,7
	.asciz "_TaskNode"

LDIFF_SYM1160=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1160
LTDIE_143_POINTER:

	.byte 13
LDIFF_SYM1161=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1161
LTDIE_143_REFERENCE:

	.byte 14
LDIFF_SYM1162=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1162
LTDIE_142:

	.byte 5
	.asciz "System_Threading_SemaphoreSlim"

	.byte 64,16
LDIFF_SYM1163=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1163
	.byte 2,35,0,6
	.asciz "m_currentCount"

LDIFF_SYM1164=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1164
	.byte 2,35,48,6
	.asciz "m_maxCount"

LDIFF_SYM1165=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1165
	.byte 2,35,52,6
	.asciz "m_waitCount"

LDIFF_SYM1166=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1166
	.byte 2,35,56,6
	.asciz "m_lockObj"

LDIFF_SYM1167=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1167
	.byte 2,35,16,6
	.asciz "m_waitHandle"

LDIFF_SYM1168=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1168
	.byte 2,35,24,6
	.asciz "m_asyncHead"

LDIFF_SYM1169=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1169
	.byte 2,35,32,6
	.asciz "m_asyncTail"

LDIFF_SYM1170=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1170
	.byte 2,35,40,0,7
	.asciz "System_Threading_SemaphoreSlim"

LDIFF_SYM1171=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1171
LTDIE_142_POINTER:

	.byte 13
LDIFF_SYM1172=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1172
LTDIE_142_REFERENCE:

	.byte 14
LDIFF_SYM1173=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1173
LTDIE_99:

	.byte 5
	.asciz "System_IO_Stream"

	.byte 40,16
LDIFF_SYM1174=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM1174
	.byte 2,35,0,6
	.asciz "_activeReadWriteTask"

LDIFF_SYM1175=LTDIE_100_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1175
	.byte 2,35,24,6
	.asciz "_asyncActiveSemaphore"

LDIFF_SYM1176=LTDIE_142_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1176
	.byte 2,35,32,0,7
	.asciz "System_IO_Stream"

LDIFF_SYM1177=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1177
LTDIE_99_POINTER:

	.byte 13
LDIFF_SYM1178=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1178
LTDIE_99_REFERENCE:

	.byte 14
LDIFF_SYM1179=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1179
LTDIE_147:

	.byte 8
	.asciz "System_Net_Sockets_AddressFamily"

	.byte 4
LDIFF_SYM1180=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1180
	.byte 9
	.asciz "Unknown"

	.byte 255,255,255,255,15,9
	.asciz "Unspecified"

	.byte 0,9
	.asciz "Unix"

	.byte 1,9
	.asciz "InterNetwork"

	.byte 2,9
	.asciz "ImpLink"

	.byte 3,9
	.asciz "Pup"

	.byte 4,9
	.asciz "Chaos"

	.byte 5,9
	.asciz "NS"

	.byte 6,9
	.asciz "Ipx"

	.byte 6,9
	.asciz "Iso"

	.byte 7,9
	.asciz "Osi"

	.byte 7,9
	.asciz "Ecma"

	.byte 8,9
	.asciz "DataKit"

	.byte 9,9
	.asciz "Ccitt"

	.byte 10,9
	.asciz "Sna"

	.byte 11,9
	.asciz "DecNet"

	.byte 12,9
	.asciz "DataLink"

	.byte 13,9
	.asciz "Lat"

	.byte 14,9
	.asciz "HyperChannel"

	.byte 15,9
	.asciz "AppleTalk"

	.byte 16,9
	.asciz "NetBios"

	.byte 17,9
	.asciz "VoiceView"

	.byte 18,9
	.asciz "FireFox"

	.byte 19,9
	.asciz "Banyan"

	.byte 21,9
	.asciz "Atm"

	.byte 22,9
	.asciz "InterNetworkV6"

	.byte 23,9
	.asciz "Cluster"

	.byte 24,9
	.asciz "Ieee12844"

	.byte 25,9
	.asciz "Irda"

	.byte 26,9
	.asciz "NetworkDesigners"

	.byte 28,9
	.asciz "Max"

	.byte 29,0,7
	.asciz "System_Net_Sockets_AddressFamily"

LDIFF_SYM1181=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1181
LTDIE_147_POINTER:

	.byte 13
LDIFF_SYM1182=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1182
LTDIE_147_REFERENCE:

	.byte 14
LDIFF_SYM1183=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1183
LTDIE_148:

	.byte 8
	.asciz "System_Net_Sockets_SocketType"

	.byte 4
LDIFF_SYM1184=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1184
	.byte 9
	.asciz "Stream"

	.byte 1,9
	.asciz "Dgram"

	.byte 2,9
	.asciz "Raw"

	.byte 3,9
	.asciz "Rdm"

	.byte 4,9
	.asciz "Seqpacket"

	.byte 5,9
	.asciz "Unknown"

	.byte 255,255,255,255,15,0,7
	.asciz "System_Net_Sockets_SocketType"

LDIFF_SYM1185=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1185
LTDIE_148_POINTER:

	.byte 13
LDIFF_SYM1186=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1186
LTDIE_148_REFERENCE:

	.byte 14
LDIFF_SYM1187=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1187
LTDIE_149:

	.byte 8
	.asciz "System_Net_Sockets_ProtocolType"

	.byte 4
LDIFF_SYM1188=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1188
	.byte 9
	.asciz "IP"

	.byte 0,9
	.asciz "IPv6HopByHopOptions"

	.byte 0,9
	.asciz "Icmp"

	.byte 1,9
	.asciz "Igmp"

	.byte 2,9
	.asciz "Ggp"

	.byte 3,9
	.asciz "IPv4"

	.byte 4,9
	.asciz "Tcp"

	.byte 6,9
	.asciz "Pup"

	.byte 12,9
	.asciz "Udp"

	.byte 17,9
	.asciz "Idp"

	.byte 22,9
	.asciz "IPv6"

	.byte 41,9
	.asciz "IPv6RoutingHeader"

	.byte 43,9
	.asciz "IPv6FragmentHeader"

	.byte 44,9
	.asciz "IPSecEncapsulatingSecurityPayload"

	.byte 50,9
	.asciz "IPSecAuthenticationHeader"

	.byte 51,9
	.asciz "IcmpV6"

	.byte 58,9
	.asciz "IPv6NoNextHeader"

	.byte 59,9
	.asciz "IPv6DestinationOptions"

	.byte 60,9
	.asciz "ND"

	.byte 205,0,9
	.asciz "Raw"

	.byte 255,1,9
	.asciz "Unspecified"

	.byte 0,9
	.asciz "Ipx"

	.byte 232,7,9
	.asciz "Spx"

	.byte 232,9,9
	.asciz "SpxII"

	.byte 233,9,9
	.asciz "Unknown"

	.byte 255,255,255,255,15,0,7
	.asciz "System_Net_Sockets_ProtocolType"

LDIFF_SYM1189=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1189
LTDIE_149_POINTER:

	.byte 13
LDIFF_SYM1190=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1190
LTDIE_149_REFERENCE:

	.byte 14
LDIFF_SYM1191=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1191
LTDIE_151:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 32,16
LDIFF_SYM1192=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1192
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1193=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1193
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1194=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1194
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1195=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1195
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1196=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1196
LTDIE_151_POINTER:

	.byte 13
LDIFF_SYM1197=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1197
LTDIE_151_REFERENCE:

	.byte 14
LDIFF_SYM1198=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1198
LTDIE_153:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM1199=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1199
LTDIE_153_POINTER:

	.byte 13
LDIFF_SYM1200=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1200
LTDIE_153_REFERENCE:

	.byte 14
LDIFF_SYM1201=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1201
LTDIE_154:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM1202=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1202
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM1203=LTDIE_152_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1203
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM1204=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1204
LTDIE_154_POINTER:

	.byte 13
LDIFF_SYM1205=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1205
LTDIE_154_REFERENCE:

	.byte 14
LDIFF_SYM1206=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1206
LTDIE_155:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM1207=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1207
	.byte 2,35,0,6
	.asciz "dictionary"

LDIFF_SYM1208=LTDIE_152_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1208
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM1209=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1209
LTDIE_155_POINTER:

	.byte 13
LDIFF_SYM1210=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1210
LTDIE_155_REFERENCE:

	.byte 14
LDIFF_SYM1211=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1211
LTDIE_152:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 72,16
LDIFF_SYM1212=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1212
	.byte 2,35,0,6
	.asciz "buckets"

LDIFF_SYM1213=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1213
	.byte 2,35,16,6
	.asciz "entries"

LDIFF_SYM1214=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1214
	.byte 2,35,24,6
	.asciz "count"

LDIFF_SYM1215=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1215
	.byte 2,35,56,6
	.asciz "version"

LDIFF_SYM1216=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1216
	.byte 2,35,60,6
	.asciz "freeList"

LDIFF_SYM1217=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1217
	.byte 2,35,64,6
	.asciz "freeCount"

LDIFF_SYM1218=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1218
	.byte 2,35,68,6
	.asciz "comparer"

LDIFF_SYM1219=LTDIE_153_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1219
	.byte 2,35,32,6
	.asciz "keys"

LDIFF_SYM1220=LTDIE_154_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1220
	.byte 2,35,40,6
	.asciz "values"

LDIFF_SYM1221=LTDIE_155_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1221
	.byte 2,35,48,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM1222=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1222
LTDIE_152_POINTER:

	.byte 13
LDIFF_SYM1223=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1223
LTDIE_152_REFERENCE:

	.byte 14
LDIFF_SYM1224=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1224
LTDIE_150:

	.byte 5
	.asciz "System_Net_Sockets_SafeSocketHandle"

	.byte 56,16
LDIFF_SYM1225=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM1225
	.byte 2,35,0,6
	.asciz "blocking_threads"

LDIFF_SYM1226=LTDIE_151_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1226
	.byte 2,35,32,6
	.asciz "threads_stacktraces"

LDIFF_SYM1227=LTDIE_152_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1227
	.byte 2,35,40,6
	.asciz "in_cleanup"

LDIFF_SYM1228=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1228
	.byte 2,35,48,0,7
	.asciz "System_Net_Sockets_SafeSocketHandle"

LDIFF_SYM1229=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1229
LTDIE_150_POINTER:

	.byte 13
LDIFF_SYM1230=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1230
LTDIE_150_REFERENCE:

	.byte 14
LDIFF_SYM1231=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1231
LTDIE_156:

	.byte 5
	.asciz "System_Net_EndPoint"

	.byte 16,16
LDIFF_SYM1232=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1232
	.byte 2,35,0,0,7
	.asciz "System_Net_EndPoint"

LDIFF_SYM1233=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1233
LTDIE_156_POINTER:

	.byte 13
LDIFF_SYM1234=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1234
LTDIE_156_REFERENCE:

	.byte 14
LDIFF_SYM1235=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1235
LTDIE_146:

	.byte 5
	.asciz "System_Net_Sockets_Socket"

	.byte 80,16
LDIFF_SYM1236=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1236
	.byte 2,35,0,6
	.asciz "is_closed"

LDIFF_SYM1237=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1237
	.byte 2,35,48,6
	.asciz "is_listening"

LDIFF_SYM1238=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1238
	.byte 2,35,49,6
	.asciz "useOverlappedIO"

LDIFF_SYM1239=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1239
	.byte 2,35,50,6
	.asciz "linger_timeout"

LDIFF_SYM1240=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1240
	.byte 2,35,52,6
	.asciz "addressFamily"

LDIFF_SYM1241=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1241
	.byte 2,35,56,6
	.asciz "socketType"

LDIFF_SYM1242=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1242
	.byte 2,35,60,6
	.asciz "protocolType"

LDIFF_SYM1243=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1243
	.byte 2,35,64,6
	.asciz "m_Handle"

LDIFF_SYM1244=LTDIE_150_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1244
	.byte 2,35,16,6
	.asciz "seed_endpoint"

LDIFF_SYM1245=LTDIE_156_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1245
	.byte 2,35,24,6
	.asciz "ReadSem"

LDIFF_SYM1246=LTDIE_142_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1246
	.byte 2,35,32,6
	.asciz "WriteSem"

LDIFF_SYM1247=LTDIE_142_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1247
	.byte 2,35,40,6
	.asciz "is_blocking"

LDIFF_SYM1248=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1248
	.byte 2,35,68,6
	.asciz "is_bound"

LDIFF_SYM1249=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1249
	.byte 2,35,69,6
	.asciz "is_connected"

LDIFF_SYM1250=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1250
	.byte 2,35,70,6
	.asciz "m_IntCleanedUp"

LDIFF_SYM1251=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1251
	.byte 2,35,72,6
	.asciz "connect_in_progress"

LDIFF_SYM1252=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1252
	.byte 2,35,76,0,7
	.asciz "System_Net_Sockets_Socket"

LDIFF_SYM1253=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1253
LTDIE_146_POINTER:

	.byte 13
LDIFF_SYM1254=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1254
LTDIE_146_REFERENCE:

	.byte 14
LDIFF_SYM1255=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1255
LTDIE_157:

	.byte 17
	.asciz "System_Net_IWebConnectionState"

	.byte 16,7
	.asciz "System_Net_IWebConnectionState"

LDIFF_SYM1256=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1256
LTDIE_157_POINTER:

	.byte 13
LDIFF_SYM1257=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1257
LTDIE_157_REFERENCE:

	.byte 14
LDIFF_SYM1258=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1258
LTDIE_158:

	.byte 8
	.asciz "System_Net_WebExceptionStatus"

	.byte 4
LDIFF_SYM1259=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1259
	.byte 9
	.asciz "Success"

	.byte 0,9
	.asciz "NameResolutionFailure"

	.byte 1,9
	.asciz "ConnectFailure"

	.byte 2,9
	.asciz "ReceiveFailure"

	.byte 3,9
	.asciz "SendFailure"

	.byte 4,9
	.asciz "PipelineFailure"

	.byte 5,9
	.asciz "RequestCanceled"

	.byte 6,9
	.asciz "ProtocolError"

	.byte 7,9
	.asciz "ConnectionClosed"

	.byte 8,9
	.asciz "TrustFailure"

	.byte 9,9
	.asciz "SecureChannelFailure"

	.byte 10,9
	.asciz "ServerProtocolViolation"

	.byte 11,9
	.asciz "KeepAliveFailure"

	.byte 12,9
	.asciz "Pending"

	.byte 13,9
	.asciz "Timeout"

	.byte 14,9
	.asciz "ProxyNameResolutionFailure"

	.byte 15,9
	.asciz "UnknownError"

	.byte 16,9
	.asciz "MessageLengthLimitExceeded"

	.byte 17,9
	.asciz "CacheEntryNotFound"

	.byte 18,9
	.asciz "RequestProhibitedByCachePolicy"

	.byte 19,9
	.asciz "RequestProhibitedByProxy"

	.byte 20,0,7
	.asciz "System_Net_WebExceptionStatus"

LDIFF_SYM1260=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1260
LTDIE_158_POINTER:

	.byte 13
LDIFF_SYM1261=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1261
LTDIE_158_REFERENCE:

	.byte 14
LDIFF_SYM1262=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1262
LTDIE_159:

	.byte 5
	.asciz "System_Threading_WaitCallback"

	.byte 112,16
LDIFF_SYM1263=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1263
	.byte 2,35,0,0,7
	.asciz "System_Threading_WaitCallback"

LDIFF_SYM1264=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1264
LTDIE_159_POINTER:

	.byte 13
LDIFF_SYM1265=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1265
LTDIE_159_REFERENCE:

	.byte 14
LDIFF_SYM1266=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1266
LTDIE_160:

	.byte 5
	.asciz "System_EventHandler"

	.byte 112,16
LDIFF_SYM1267=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1267
	.byte 2,35,0,0,7
	.asciz "System_EventHandler"

LDIFF_SYM1268=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1268
LTDIE_160_POINTER:

	.byte 13
LDIFF_SYM1269=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1269
LTDIE_160_REFERENCE:

	.byte 14
LDIFF_SYM1270=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1270
LTDIE_161:

	.byte 5
	.asciz "_AbortHelper"

	.byte 24,16
LDIFF_SYM1271=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1271
	.byte 2,35,0,6
	.asciz "Connection"

LDIFF_SYM1272=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1272
	.byte 2,35,16,0,7
	.asciz "_AbortHelper"

LDIFF_SYM1273=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1273
LTDIE_161_POINTER:

	.byte 13
LDIFF_SYM1274=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1274
LTDIE_161_REFERENCE:

	.byte 14
LDIFF_SYM1275=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1275
LTDIE_163:

	.byte 8
	.asciz "System_Net_ReadState"

	.byte 4
LDIFF_SYM1276=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1276
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "Status"

	.byte 1,9
	.asciz "Headers"

	.byte 2,9
	.asciz "Content"

	.byte 3,9
	.asciz "Aborted"

	.byte 4,0,7
	.asciz "System_Net_ReadState"

LDIFF_SYM1277=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1277
LTDIE_163_POINTER:

	.byte 13
LDIFF_SYM1278=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1278
LTDIE_163_REFERENCE:

	.byte 14
LDIFF_SYM1279=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1279
LTDIE_162:

	.byte 5
	.asciz "System_Net_WebConnectionData"

	.byte 80,16
LDIFF_SYM1280=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1280
	.byte 2,35,0,6
	.asciz "_request"

LDIFF_SYM1281=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1281
	.byte 2,35,16,6
	.asciz "StatusCode"

LDIFF_SYM1282=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1282
	.byte 2,35,72,6
	.asciz "StatusDescription"

LDIFF_SYM1283=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1283
	.byte 2,35,24,6
	.asciz "Headers"

LDIFF_SYM1284=LTDIE_77_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1284
	.byte 2,35,32,6
	.asciz "Version"

LDIFF_SYM1285=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1285
	.byte 2,35,40,6
	.asciz "ProxyVersion"

LDIFF_SYM1286=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1286
	.byte 2,35,48,6
	.asciz "stream"

LDIFF_SYM1287=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1287
	.byte 2,35,56,6
	.asciz "Challenge"

LDIFF_SYM1288=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1288
	.byte 2,35,64,6
	.asciz "_readState"

LDIFF_SYM1289=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1289
	.byte 2,35,76,0,7
	.asciz "System_Net_WebConnectionData"

LDIFF_SYM1290=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1290
LTDIE_162_POINTER:

	.byte 13
LDIFF_SYM1291=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1291
LTDIE_162_REFERENCE:

	.byte 14
LDIFF_SYM1292=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1292
LTDIE_165:

	.byte 8
	.asciz "_State"

	.byte 4
LDIFF_SYM1293=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1293
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "PartialSize"

	.byte 1,9
	.asciz "Body"

	.byte 2,9
	.asciz "BodyFinished"

	.byte 3,9
	.asciz "Trailer"

	.byte 4,0,7
	.asciz "_State"

LDIFF_SYM1294=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1294
LTDIE_165_POINTER:

	.byte 13
LDIFF_SYM1295=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1295
LTDIE_165_REFERENCE:

	.byte 14
LDIFF_SYM1296=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1296
LTDIE_166:

	.byte 5
	.asciz "System_Text_StringBuilder"

	.byte 48,16
LDIFF_SYM1297=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1297
	.byte 2,35,0,6
	.asciz "m_ChunkChars"

LDIFF_SYM1298=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1298
	.byte 2,35,16,6
	.asciz "m_ChunkPrevious"

LDIFF_SYM1299=LTDIE_166_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1299
	.byte 2,35,24,6
	.asciz "m_ChunkLength"

LDIFF_SYM1300=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1300
	.byte 2,35,32,6
	.asciz "m_ChunkOffset"

LDIFF_SYM1301=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1301
	.byte 2,35,36,6
	.asciz "m_MaxCapacity"

LDIFF_SYM1302=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1302
	.byte 2,35,40,0,7
	.asciz "System_Text_StringBuilder"

LDIFF_SYM1303=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1303
LTDIE_166_POINTER:

	.byte 13
LDIFF_SYM1304=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1304
LTDIE_166_REFERENCE:

	.byte 14
LDIFF_SYM1305=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1305
LTDIE_164:

	.byte 5
	.asciz "System_Net_ChunkStream"

	.byte 64,16
LDIFF_SYM1306=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1306
	.byte 2,35,0,6
	.asciz "headers"

LDIFF_SYM1307=LTDIE_77_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1307
	.byte 2,35,16,6
	.asciz "chunkSize"

LDIFF_SYM1308=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1308
	.byte 2,35,40,6
	.asciz "chunkRead"

LDIFF_SYM1309=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1309
	.byte 2,35,44,6
	.asciz "totalWritten"

LDIFF_SYM1310=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1310
	.byte 2,35,48,6
	.asciz "state"

LDIFF_SYM1311=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1311
	.byte 2,35,52,6
	.asciz "saved"

LDIFF_SYM1312=LTDIE_166_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1312
	.byte 2,35,24,6
	.asciz "sawCR"

LDIFF_SYM1313=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1313
	.byte 2,35,56,6
	.asciz "gotit"

LDIFF_SYM1314=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1314
	.byte 2,35,57,6
	.asciz "trailerState"

LDIFF_SYM1315=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1315
	.byte 2,35,60,6
	.asciz "chunks"

LDIFF_SYM1316=LTDIE_61_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1316
	.byte 2,35,32,0,7
	.asciz "System_Net_ChunkStream"

LDIFF_SYM1317=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1317
LTDIE_164_POINTER:

	.byte 13
LDIFF_SYM1318=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1318
LTDIE_164_REFERENCE:

	.byte 14
LDIFF_SYM1319=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1319
LTDIE_167:

	.byte 5
	.asciz "System_Collections_Queue"

	.byte 48,16
LDIFF_SYM1320=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1320
	.byte 2,35,0,6
	.asciz "_array"

LDIFF_SYM1321=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1321
	.byte 2,35,16,6
	.asciz "_head"

LDIFF_SYM1322=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1322
	.byte 2,35,24,6
	.asciz "_tail"

LDIFF_SYM1323=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1323
	.byte 2,35,28,6
	.asciz "_size"

LDIFF_SYM1324=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1324
	.byte 2,35,32,6
	.asciz "_growFactor"

LDIFF_SYM1325=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1325
	.byte 2,35,36,6
	.asciz "_version"

LDIFF_SYM1326=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1326
	.byte 2,35,40,0,7
	.asciz "System_Collections_Queue"

LDIFF_SYM1327=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1327
LTDIE_167_POINTER:

	.byte 13
LDIFF_SYM1328=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1328
LTDIE_167_REFERENCE:

	.byte 14
LDIFF_SYM1329=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1329
LTDIE_169:

	.byte 5
	.asciz "System_Security_SecureString"

	.byte 32,16
LDIFF_SYM1330=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1330
	.byte 2,35,0,6
	.asciz "length"

LDIFF_SYM1331=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1331
	.byte 2,35,24,6
	.asciz "disposed"

LDIFF_SYM1332=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1332
	.byte 2,35,28,6
	.asciz "data"

LDIFF_SYM1333=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1333
	.byte 2,35,16,0,7
	.asciz "System_Security_SecureString"

LDIFF_SYM1334=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1334
LTDIE_169_POINTER:

	.byte 13
LDIFF_SYM1335=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1335
LTDIE_169_REFERENCE:

	.byte 14
LDIFF_SYM1336=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1336
LTDIE_168:

	.byte 5
	.asciz "System_Net_NetworkCredential"

	.byte 40,16
LDIFF_SYM1337=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1337
	.byte 2,35,0,6
	.asciz "m_domain"

LDIFF_SYM1338=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1338
	.byte 2,35,16,6
	.asciz "m_userName"

LDIFF_SYM1339=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1339
	.byte 2,35,24,6
	.asciz "m_password"

LDIFF_SYM1340=LTDIE_169_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1340
	.byte 2,35,32,0,7
	.asciz "System_Net_NetworkCredential"

LDIFF_SYM1341=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1341
LTDIE_168_POINTER:

	.byte 13
LDIFF_SYM1342=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1342
LTDIE_168_REFERENCE:

	.byte 14
LDIFF_SYM1343=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1343
LTDIE_170:

	.byte 8
	.asciz "_NtlmAuthState"

	.byte 4
LDIFF_SYM1344=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1344
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "Challenge"

	.byte 1,9
	.asciz "Response"

	.byte 2,0,7
	.asciz "_NtlmAuthState"

LDIFF_SYM1345=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1345
LTDIE_170_POINTER:

	.byte 13
LDIFF_SYM1346=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1346
LTDIE_170_REFERENCE:

	.byte 14
LDIFF_SYM1347=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1347
LTDIE_172:

	.byte 17
	.asciz "Mono_Net_Security_IMonoTlsProvider"

	.byte 16,7
	.asciz "Mono_Net_Security_IMonoTlsProvider"

LDIFF_SYM1348=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1348
LTDIE_172_POINTER:

	.byte 13
LDIFF_SYM1349=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1349
LTDIE_172_REFERENCE:

	.byte 14
LDIFF_SYM1350=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1350
LTDIE_173:

	.byte 5
	.asciz "System_Net_Sockets_NetworkStream"

	.byte 72,16
LDIFF_SYM1351=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1351
	.byte 2,35,0,6
	.asciz "m_StreamSocket"

LDIFF_SYM1352=LTDIE_146_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1352
	.byte 2,35,40,6
	.asciz "m_Readable"

LDIFF_SYM1353=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1353
	.byte 2,35,48,6
	.asciz "m_Writeable"

LDIFF_SYM1354=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1354
	.byte 2,35,49,6
	.asciz "m_OwnsSocket"

LDIFF_SYM1355=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1355
	.byte 2,35,50,6
	.asciz "m_CloseTimeout"

LDIFF_SYM1356=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1356
	.byte 2,35,52,6
	.asciz "m_CleanedUp"

LDIFF_SYM1357=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1357
	.byte 2,35,56,6
	.asciz "m_CurrentReadTimeout"

LDIFF_SYM1358=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1358
	.byte 2,35,60,6
	.asciz "m_CurrentWriteTimeout"

LDIFF_SYM1359=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1359
	.byte 2,35,64,0,7
	.asciz "System_Net_Sockets_NetworkStream"

LDIFF_SYM1360=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1360
LTDIE_173_POINTER:

	.byte 13
LDIFF_SYM1361=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1361
LTDIE_173_REFERENCE:

	.byte 14
LDIFF_SYM1362=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1362
LTDIE_174:

	.byte 17
	.asciz "Mono_Net_Security_IMonoSslStream"

	.byte 16,7
	.asciz "Mono_Net_Security_IMonoSslStream"

LDIFF_SYM1363=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1363
LTDIE_174_POINTER:

	.byte 13
LDIFF_SYM1364=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1364
LTDIE_174_REFERENCE:

	.byte 14
LDIFF_SYM1365=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1365
LTDIE_176:

	.byte 5
	.asciz "Mono_Security_Interface_MonoRemoteCertificateValidationCallback"

	.byte 112,16
LDIFF_SYM1366=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1366
	.byte 2,35,0,0,7
	.asciz "Mono_Security_Interface_MonoRemoteCertificateValidationCallback"

LDIFF_SYM1367=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1367
LTDIE_176_POINTER:

	.byte 13
LDIFF_SYM1368=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1368
LTDIE_176_REFERENCE:

	.byte 14
LDIFF_SYM1369=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1369
LTDIE_177:

	.byte 5
	.asciz "Mono_Security_Interface_MonoLocalCertificateSelectionCallback"

	.byte 112,16
LDIFF_SYM1370=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1370
	.byte 2,35,0,0,7
	.asciz "Mono_Security_Interface_MonoLocalCertificateSelectionCallback"

LDIFF_SYM1371=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1371
LTDIE_177_POINTER:

	.byte 13
LDIFF_SYM1372=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1372
LTDIE_177_REFERENCE:

	.byte 14
LDIFF_SYM1373=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1373
LTDIE_178:

	.byte 17
	.asciz "Mono_Security_Interface_ICertificateValidator"

	.byte 16,7
	.asciz "Mono_Security_Interface_ICertificateValidator"

LDIFF_SYM1374=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1374
LTDIE_178_POINTER:

	.byte 13
LDIFF_SYM1375=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1375
LTDIE_178_REFERENCE:

	.byte 14
LDIFF_SYM1376=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1376
LTDIE_175:

	.byte 5
	.asciz "Mono_Security_Interface_MonoTlsSettings"

	.byte 80,16
LDIFF_SYM1377=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1377
	.byte 2,35,0,6
	.asciz "<RemoteCertificateValidationCallback>k__BackingField"

LDIFF_SYM1378=LTDIE_176_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1378
	.byte 2,35,16,6
	.asciz "<ClientCertificateSelectionCallback>k__BackingField"

LDIFF_SYM1379=LTDIE_177_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1379
	.byte 2,35,24,6
	.asciz "<TrustAnchors>k__BackingField"

LDIFF_SYM1380=LTDIE_59_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1380
	.byte 2,35,32,6
	.asciz "<UserSettings>k__BackingField"

LDIFF_SYM1381=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1381
	.byte 2,35,40,6
	.asciz "<EnabledProtocols>k__BackingField"

LDIFF_SYM1382=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1382
	.byte 2,35,64,6
	.asciz "<EnabledCiphers>k__BackingField"

LDIFF_SYM1383=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1383
	.byte 2,35,48,6
	.asciz "cloned"

LDIFF_SYM1384=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1384
	.byte 2,35,72,6
	.asciz "checkCertName"

LDIFF_SYM1385=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1385
	.byte 2,35,73,6
	.asciz "checkCertRevocationStatus"

LDIFF_SYM1386=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1386
	.byte 2,35,74,6
	.asciz "useServicePointManagerCallback"

LDIFF_SYM1387=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1387
	.byte 2,35,75,6
	.asciz "skipSystemValidators"

LDIFF_SYM1388=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1388
	.byte 2,35,77,6
	.asciz "callbackNeedsChain"

LDIFF_SYM1389=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1389
	.byte 2,35,78,6
	.asciz "certificateValidator"

LDIFF_SYM1390=LTDIE_178_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1390
	.byte 2,35,56,0,7
	.asciz "Mono_Security_Interface_MonoTlsSettings"

LDIFF_SYM1391=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1391
LTDIE_175_POINTER:

	.byte 13
LDIFF_SYM1392=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1392
LTDIE_175_REFERENCE:

	.byte 14
LDIFF_SYM1393=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1393
LTDIE_171:

	.byte 5
	.asciz "Mono_Net_Security_MonoTlsStream"

	.byte 64,16
LDIFF_SYM1394=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1394
	.byte 2,35,0,6
	.asciz "provider"

LDIFF_SYM1395=LTDIE_172_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1395
	.byte 2,35,16,6
	.asciz "networkStream"

LDIFF_SYM1396=LTDIE_173_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1396
	.byte 2,35,24,6
	.asciz "request"

LDIFF_SYM1397=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1397
	.byte 2,35,32,6
	.asciz "sslStream"

LDIFF_SYM1398=LTDIE_174_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1398
	.byte 2,35,40,6
	.asciz "status"

LDIFF_SYM1399=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1399
	.byte 2,35,56,6
	.asciz "<CertificateValidationFailed>k__BackingField"

LDIFF_SYM1400=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1400
	.byte 2,35,60,6
	.asciz "settings"

LDIFF_SYM1401=LTDIE_175_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1401
	.byte 2,35,48,0,7
	.asciz "Mono_Net_Security_MonoTlsStream"

LDIFF_SYM1402=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1402
LTDIE_171_POINTER:

	.byte 13
LDIFF_SYM1403=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1403
LTDIE_171_REFERENCE:

	.byte 14
LDIFF_SYM1404=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1404
LTDIE_145:

	.byte 5
	.asciz "System_Net_WebConnection"

	.byte 176,1,16
LDIFF_SYM1405=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1405
	.byte 2,35,0,6
	.asciz "sPoint"

LDIFF_SYM1406=LTDIE_90_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1406
	.byte 2,35,16,6
	.asciz "nstream"

LDIFF_SYM1407=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1407
	.byte 2,35,24,6
	.asciz "socket"

LDIFF_SYM1408=LTDIE_146_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1408
	.byte 2,35,32,6
	.asciz "socketLock"

LDIFF_SYM1409=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1409
	.byte 2,35,40,6
	.asciz "state"

LDIFF_SYM1410=LTDIE_157_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1410
	.byte 2,35,48,6
	.asciz "status"

LDIFF_SYM1411=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1411
	.byte 3,35,152,1,6
	.asciz "initConn"

LDIFF_SYM1412=LTDIE_159_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1412
	.byte 2,35,56,6
	.asciz "keepAlive"

LDIFF_SYM1413=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1413
	.byte 3,35,156,1,6
	.asciz "buffer"

LDIFF_SYM1414=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1414
	.byte 2,35,64,6
	.asciz "abortHandler"

LDIFF_SYM1415=LTDIE_160_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1415
	.byte 2,35,72,6
	.asciz "abortHelper"

LDIFF_SYM1416=LTDIE_161_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1416
	.byte 2,35,80,6
	.asciz "Data"

LDIFF_SYM1417=LTDIE_162_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1417
	.byte 2,35,88,6
	.asciz "chunkedRead"

LDIFF_SYM1418=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1418
	.byte 3,35,157,1,6
	.asciz "chunkStream"

LDIFF_SYM1419=LTDIE_164_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1419
	.byte 2,35,96,6
	.asciz "queue"

LDIFF_SYM1420=LTDIE_167_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1420
	.byte 2,35,104,6
	.asciz "reused"

LDIFF_SYM1421=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1421
	.byte 3,35,158,1,6
	.asciz "position"

LDIFF_SYM1422=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1422
	.byte 3,35,160,1,6
	.asciz "priority_request"

LDIFF_SYM1423=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1423
	.byte 2,35,112,6
	.asciz "ntlm_credentials"

LDIFF_SYM1424=LTDIE_168_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1424
	.byte 2,35,120,6
	.asciz "ntlm_authenticated"

LDIFF_SYM1425=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1425
	.byte 3,35,164,1,6
	.asciz "unsafe_sharing"

LDIFF_SYM1426=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1426
	.byte 3,35,165,1,6
	.asciz "connect_ntlm_auth_state"

LDIFF_SYM1427=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1427
	.byte 3,35,168,1,6
	.asciz "connect_request"

LDIFF_SYM1428=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1428
	.byte 3,35,128,1,6
	.asciz "connect_exception"

LDIFF_SYM1429=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1429
	.byte 3,35,136,1,6
	.asciz "tlsStream"

LDIFF_SYM1430=LTDIE_171_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1430
	.byte 3,35,144,1,0,7
	.asciz "System_Net_WebConnection"

LDIFF_SYM1431=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1431
LTDIE_145_POINTER:

	.byte 13
LDIFF_SYM1432=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1432
LTDIE_145_REFERENCE:

	.byte 14
LDIFF_SYM1433=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1433
LTDIE_179:

	.byte 5
	.asciz "System_IO_MemoryStream"

	.byte 80,16
LDIFF_SYM1434=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1434
	.byte 2,35,0,6
	.asciz "_buffer"

LDIFF_SYM1435=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1435
	.byte 2,35,40,6
	.asciz "_origin"

LDIFF_SYM1436=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1436
	.byte 2,35,56,6
	.asciz "_position"

LDIFF_SYM1437=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1437
	.byte 2,35,60,6
	.asciz "_length"

LDIFF_SYM1438=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1438
	.byte 2,35,64,6
	.asciz "_capacity"

LDIFF_SYM1439=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1439
	.byte 2,35,68,6
	.asciz "_expandable"

LDIFF_SYM1440=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1440
	.byte 2,35,72,6
	.asciz "_writable"

LDIFF_SYM1441=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1441
	.byte 2,35,73,6
	.asciz "_exposable"

LDIFF_SYM1442=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1442
	.byte 2,35,74,6
	.asciz "_isOpen"

LDIFF_SYM1443=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1443
	.byte 2,35,75,6
	.asciz "_lastReadTask"

LDIFF_SYM1444=LTDIE_101_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1444
	.byte 2,35,48,0,7
	.asciz "System_IO_MemoryStream"

LDIFF_SYM1445=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1445
LTDIE_179_POINTER:

	.byte 13
LDIFF_SYM1446=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1446
LTDIE_179_REFERENCE:

	.byte 14
LDIFF_SYM1447=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1447
LTDIE_98:

	.byte 5
	.asciz "System_Net_WebConnectionStream"

	.byte 176,1,16
LDIFF_SYM1448=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM1448
	.byte 2,35,0,6
	.asciz "isRead"

LDIFF_SYM1449=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1449
	.byte 2,35,104,6
	.asciz "cnc"

LDIFF_SYM1450=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1450
	.byte 2,35,40,6
	.asciz "request"

LDIFF_SYM1451=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1451
	.byte 2,35,48,6
	.asciz "readBuffer"

LDIFF_SYM1452=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1452
	.byte 2,35,56,6
	.asciz "readBufferOffset"

LDIFF_SYM1453=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1453
	.byte 2,35,108,6
	.asciz "readBufferSize"

LDIFF_SYM1454=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1454
	.byte 2,35,112,6
	.asciz "stream_length"

LDIFF_SYM1455=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1455
	.byte 2,35,116,6
	.asciz "contentLength"

LDIFF_SYM1456=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM1456
	.byte 2,35,120,6
	.asciz "totalRead"

LDIFF_SYM1457=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM1457
	.byte 3,35,128,1,6
	.asciz "totalWritten"

LDIFF_SYM1458=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM1458
	.byte 3,35,136,1,6
	.asciz "nextReadCalled"

LDIFF_SYM1459=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1459
	.byte 3,35,144,1,6
	.asciz "pendingReads"

LDIFF_SYM1460=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1460
	.byte 3,35,148,1,6
	.asciz "pendingWrites"

LDIFF_SYM1461=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1461
	.byte 3,35,152,1,6
	.asciz "pending"

LDIFF_SYM1462=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1462
	.byte 2,35,64,6
	.asciz "allowBuffering"

LDIFF_SYM1463=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1463
	.byte 3,35,156,1,6
	.asciz "sendChunked"

LDIFF_SYM1464=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1464
	.byte 3,35,157,1,6
	.asciz "writeBuffer"

LDIFF_SYM1465=LTDIE_179_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1465
	.byte 2,35,72,6
	.asciz "requestWritten"

LDIFF_SYM1466=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1466
	.byte 3,35,158,1,6
	.asciz "headers"

LDIFF_SYM1467=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1467
	.byte 2,35,80,6
	.asciz "disposed"

LDIFF_SYM1468=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1468
	.byte 3,35,159,1,6
	.asciz "headersSent"

LDIFF_SYM1469=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1469
	.byte 3,35,160,1,6
	.asciz "locker"

LDIFF_SYM1470=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1470
	.byte 2,35,88,6
	.asciz "initRead"

LDIFF_SYM1471=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1471
	.byte 3,35,161,1,6
	.asciz "read_eof"

LDIFF_SYM1472=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1472
	.byte 3,35,162,1,6
	.asciz "complete_request_written"

LDIFF_SYM1473=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1473
	.byte 3,35,163,1,6
	.asciz "read_timeout"

LDIFF_SYM1474=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1474
	.byte 3,35,164,1,6
	.asciz "write_timeout"

LDIFF_SYM1475=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1475
	.byte 3,35,168,1,6
	.asciz "cb_wrapper"

LDIFF_SYM1476=LTDIE_141_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1476
	.byte 2,35,96,6
	.asciz "IgnoreIOErrors"

LDIFF_SYM1477=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1477
	.byte 3,35,172,1,6
	.asciz "<GetResponseOnClose>k__BackingField"

LDIFF_SYM1478=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1478
	.byte 3,35,173,1,0,7
	.asciz "System_Net_WebConnectionStream"

LDIFF_SYM1479=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM1479
LTDIE_98_POINTER:

	.byte 13
LDIFF_SYM1480=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM1480
LTDIE_98_REFERENCE:

	.byte 14
LDIFF_SYM1481=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM1481
LTDIE_181:

	.byte 5
	.asciz "System_Net_WebResponse"

	.byte 24,16
LDIFF_SYM1482=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM1482
	.byte 2,35,0,0,7
	.asciz "System_Net_WebResponse"

LDIFF_SYM1483=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1483
LTDIE_181_POINTER:

	.byte 13
LDIFF_SYM1484=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1484
LTDIE_181_REFERENCE:

	.byte 14
LDIFF_SYM1485=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1485
LTDIE_182:

	.byte 5
	.asciz "System_Net_CookieCollection"

	.byte 48,16
LDIFF_SYM1486=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1486
	.byte 2,35,0,6
	.asciz "m_version"

LDIFF_SYM1487=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1487
	.byte 2,35,24,6
	.asciz "m_list"

LDIFF_SYM1488=LTDIE_61_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1488
	.byte 2,35,16,6
	.asciz "m_TimeStamp"

LDIFF_SYM1489=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1489
	.byte 2,35,32,6
	.asciz "m_has_other_versions"

LDIFF_SYM1490=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1490
	.byte 2,35,40,6
	.asciz "m_IsReadOnly"

LDIFF_SYM1491=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1491
	.byte 2,35,41,0,7
	.asciz "System_Net_CookieCollection"

LDIFF_SYM1492=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1492
LTDIE_182_POINTER:

	.byte 13
LDIFF_SYM1493=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1493
LTDIE_182_REFERENCE:

	.byte 14
LDIFF_SYM1494=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1494
LTDIE_183:

	.byte 8
	.asciz "System_Net_HttpStatusCode"

	.byte 4
LDIFF_SYM1495=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1495
	.byte 9
	.asciz "Continue"

	.byte 228,0,9
	.asciz "SwitchingProtocols"

	.byte 229,0,9
	.asciz "OK"

	.byte 200,1,9
	.asciz "Created"

	.byte 201,1,9
	.asciz "Accepted"

	.byte 202,1,9
	.asciz "NonAuthoritativeInformation"

	.byte 203,1,9
	.asciz "NoContent"

	.byte 204,1,9
	.asciz "ResetContent"

	.byte 205,1,9
	.asciz "PartialContent"

	.byte 206,1,9
	.asciz "MultipleChoices"

	.byte 172,2,9
	.asciz "Ambiguous"

	.byte 172,2,9
	.asciz "MovedPermanently"

	.byte 173,2,9
	.asciz "Moved"

	.byte 173,2,9
	.asciz "Found"

	.byte 174,2,9
	.asciz "Redirect"

	.byte 174,2,9
	.asciz "SeeOther"

	.byte 175,2,9
	.asciz "RedirectMethod"

	.byte 175,2,9
	.asciz "NotModified"

	.byte 176,2,9
	.asciz "UseProxy"

	.byte 177,2,9
	.asciz "Unused"

	.byte 178,2,9
	.asciz "TemporaryRedirect"

	.byte 179,2,9
	.asciz "RedirectKeepVerb"

	.byte 179,2,9
	.asciz "BadRequest"

	.byte 144,3,9
	.asciz "Unauthorized"

	.byte 145,3,9
	.asciz "PaymentRequired"

	.byte 146,3,9
	.asciz "Forbidden"

	.byte 147,3,9
	.asciz "NotFound"

	.byte 148,3,9
	.asciz "MethodNotAllowed"

	.byte 149,3,9
	.asciz "NotAcceptable"

	.byte 150,3,9
	.asciz "ProxyAuthenticationRequired"

	.byte 151,3,9
	.asciz "RequestTimeout"

	.byte 152,3,9
	.asciz "Conflict"

	.byte 153,3,9
	.asciz "Gone"

	.byte 154,3,9
	.asciz "LengthRequired"

	.byte 155,3,9
	.asciz "PreconditionFailed"

	.byte 156,3,9
	.asciz "RequestEntityTooLarge"

	.byte 157,3,9
	.asciz "RequestUriTooLong"

	.byte 158,3,9
	.asciz "UnsupportedMediaType"

	.byte 159,3,9
	.asciz "RequestedRangeNotSatisfiable"

	.byte 160,3,9
	.asciz "ExpectationFailed"

	.byte 161,3,9
	.asciz "UpgradeRequired"

	.byte 170,3,9
	.asciz "InternalServerError"

	.byte 244,3,9
	.asciz "NotImplemented"

	.byte 245,3,9
	.asciz "BadGateway"

	.byte 246,3,9
	.asciz "ServiceUnavailable"

	.byte 247,3,9
	.asciz "GatewayTimeout"

	.byte 248,3,9
	.asciz "HttpVersionNotSupported"

	.byte 249,3,0,7
	.asciz "System_Net_HttpStatusCode"

LDIFF_SYM1496=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1496
LTDIE_183_POINTER:

	.byte 13
LDIFF_SYM1497=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1497
LTDIE_183_REFERENCE:

	.byte 14
LDIFF_SYM1498=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1498
LTDIE_180:

	.byte 5
	.asciz "System_Net_HttpWebResponse"

	.byte 120,16
LDIFF_SYM1499=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1499
	.byte 2,35,0,6
	.asciz "uri"

LDIFF_SYM1500=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1500
	.byte 2,35,24,6
	.asciz "webHeaders"

LDIFF_SYM1501=LTDIE_77_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1501
	.byte 2,35,32,6
	.asciz "cookieCollection"

LDIFF_SYM1502=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1502
	.byte 2,35,40,6
	.asciz "method"

LDIFF_SYM1503=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1503
	.byte 2,35,48,6
	.asciz "version"

LDIFF_SYM1504=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1504
	.byte 2,35,56,6
	.asciz "statusCode"

LDIFF_SYM1505=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1505
	.byte 2,35,96,6
	.asciz "statusDescription"

LDIFF_SYM1506=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1506
	.byte 2,35,64,6
	.asciz "contentLength"

LDIFF_SYM1507=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM1507
	.byte 2,35,104,6
	.asciz "contentType"

LDIFF_SYM1508=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1508
	.byte 2,35,72,6
	.asciz "cookie_container"

LDIFF_SYM1509=LTDIE_71_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1509
	.byte 2,35,80,6
	.asciz "disposed"

LDIFF_SYM1510=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1510
	.byte 2,35,112,6
	.asciz "stream"

LDIFF_SYM1511=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1511
	.byte 2,35,88,0,7
	.asciz "System_Net_HttpWebResponse"

LDIFF_SYM1512=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1512
LTDIE_180_POINTER:

	.byte 13
LDIFF_SYM1513=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1513
LTDIE_180_REFERENCE:

	.byte 14
LDIFF_SYM1514=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1514
LTDIE_186:

	.byte 5
	.asciz "System_Net_SimpleAsyncCallback"

	.byte 112,16
LDIFF_SYM1515=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1515
	.byte 2,35,0,0,7
	.asciz "System_Net_SimpleAsyncCallback"

LDIFF_SYM1516=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1516
LTDIE_186_POINTER:

	.byte 13
LDIFF_SYM1517=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1517
LTDIE_186_REFERENCE:

	.byte 14
LDIFF_SYM1518=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1518
LTDIE_185:

	.byte 5
	.asciz "System_Net_SimpleAsyncResult"

	.byte 64,16
LDIFF_SYM1519=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1519
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM1520=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1520
	.byte 2,35,16,6
	.asciz "synch"

LDIFF_SYM1521=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1521
	.byte 2,35,56,6
	.asciz "isCompleted"

LDIFF_SYM1522=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1522
	.byte 2,35,57,6
	.asciz "cb"

LDIFF_SYM1523=LTDIE_186_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1523
	.byte 2,35,24,6
	.asciz "state"

LDIFF_SYM1524=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1524
	.byte 2,35,32,6
	.asciz "callbackDone"

LDIFF_SYM1525=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1525
	.byte 2,35,58,6
	.asciz "exc"

LDIFF_SYM1526=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1526
	.byte 2,35,40,6
	.asciz "locker"

LDIFF_SYM1527=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1527
	.byte 2,35,48,6
	.asciz "user_read_synch"

LDIFF_SYM1528=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1528
	.byte 2,35,59,0,7
	.asciz "System_Net_SimpleAsyncResult"

LDIFF_SYM1529=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1529
LTDIE_185_POINTER:

	.byte 13
LDIFF_SYM1530=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1530
LTDIE_185_REFERENCE:

	.byte 14
LDIFF_SYM1531=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1531
LTDIE_187:

	.byte 17
	.asciz "System_IAsyncResult"

	.byte 16,7
	.asciz "System_IAsyncResult"

LDIFF_SYM1532=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1532
LTDIE_187_POINTER:

	.byte 13
LDIFF_SYM1533=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1533
LTDIE_187_REFERENCE:

	.byte 14
LDIFF_SYM1534=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1534
LTDIE_184:

	.byte 5
	.asciz "System_Net_WebAsyncResult"

	.byte 120,16
LDIFF_SYM1535=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1535
	.byte 2,35,0,6
	.asciz "nbytes"

LDIFF_SYM1536=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1536
	.byte 2,35,104,6
	.asciz "innerAsyncResult"

LDIFF_SYM1537=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1537
	.byte 2,35,64,6
	.asciz "response"

LDIFF_SYM1538=LTDIE_180_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1538
	.byte 2,35,72,6
	.asciz "writeStream"

LDIFF_SYM1539=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1539
	.byte 2,35,80,6
	.asciz "buffer"

LDIFF_SYM1540=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1540
	.byte 2,35,88,6
	.asciz "offset"

LDIFF_SYM1541=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1541
	.byte 2,35,108,6
	.asciz "size"

LDIFF_SYM1542=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1542
	.byte 2,35,112,6
	.asciz "EndCalled"

LDIFF_SYM1543=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1543
	.byte 2,35,116,6
	.asciz "AsyncWriteAll"

LDIFF_SYM1544=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1544
	.byte 2,35,117,6
	.asciz "AsyncObject"

LDIFF_SYM1545=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1545
	.byte 2,35,96,0,7
	.asciz "System_Net_WebAsyncResult"

LDIFF_SYM1546=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1546
LTDIE_184_POINTER:

	.byte 13
LDIFF_SYM1547=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1547
LTDIE_184_REFERENCE:

	.byte 14
LDIFF_SYM1548=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1548
LTDIE_188:

	.byte 8
	.asciz "System_Net_DecompressionMethods"

	.byte 4
LDIFF_SYM1549=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1549
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "GZip"

	.byte 1,9
	.asciz "Deflate"

	.byte 2,0,7
	.asciz "System_Net_DecompressionMethods"

LDIFF_SYM1550=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1550
LTDIE_188_POINTER:

	.byte 13
LDIFF_SYM1551=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1551
LTDIE_188_REFERENCE:

	.byte 14
LDIFF_SYM1552=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1552
LTDIE_190:

	.byte 5
	.asciz "System_Net_Security_RemoteCertificateValidationCallback"

	.byte 112,16
LDIFF_SYM1553=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1553
	.byte 2,35,0,0,7
	.asciz "System_Net_Security_RemoteCertificateValidationCallback"

LDIFF_SYM1554=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1554
LTDIE_190_POINTER:

	.byte 13
LDIFF_SYM1555=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1555
LTDIE_190_REFERENCE:

	.byte 14
LDIFF_SYM1556=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1556
LTDIE_189:

	.byte 5
	.asciz "System_Net_ServerCertValidationCallback"

	.byte 32,16
LDIFF_SYM1557=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1557
	.byte 2,35,0,6
	.asciz "m_ValidationCallback"

LDIFF_SYM1558=LTDIE_190_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1558
	.byte 2,35,16,6
	.asciz "m_Context"

LDIFF_SYM1559=LTDIE_105_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1559
	.byte 2,35,24,0,7
	.asciz "System_Net_ServerCertValidationCallback"

LDIFF_SYM1560=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1560
LTDIE_189_POINTER:

	.byte 13
LDIFF_SYM1561=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1561
LTDIE_189_REFERENCE:

	.byte 14
LDIFF_SYM1562=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1562
LTDIE_191:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1563=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1563
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1564=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1564
LTDIE_191_POINTER:

	.byte 13
LDIFF_SYM1565=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1565
LTDIE_191_REFERENCE:

	.byte 14
LDIFF_SYM1566=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1566
LTDIE_48:

	.byte 5
	.asciz "System_Net_HttpWebRequest"

	.byte 248,2,16
LDIFF_SYM1567=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM1567
	.byte 2,35,0,6
	.asciz "requestUri"

LDIFF_SYM1568=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1568
	.byte 2,35,32,6
	.asciz "actualUri"

LDIFF_SYM1569=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1569
	.byte 2,35,40,6
	.asciz "hostChanged"

LDIFF_SYM1570=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1570
	.byte 3,35,176,2,6
	.asciz "allowAutoRedirect"

LDIFF_SYM1571=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1571
	.byte 3,35,177,2,6
	.asciz "allowBuffering"

LDIFF_SYM1572=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1572
	.byte 3,35,178,2,6
	.asciz "certificates"

LDIFF_SYM1573=LTDIE_59_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1573
	.byte 2,35,48,6
	.asciz "connectionGroup"

LDIFF_SYM1574=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1574
	.byte 2,35,56,6
	.asciz "haveContentLength"

LDIFF_SYM1575=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1575
	.byte 3,35,179,2,6
	.asciz "contentLength"

LDIFF_SYM1576=LDIE_I8 - Ldebug_info_start
	.long LDIFF_SYM1576
	.byte 3,35,184,2,6
	.asciz "continueDelegate"

LDIFF_SYM1577=LTDIE_63_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1577
	.byte 2,35,64,6
	.asciz "cookieContainer"

LDIFF_SYM1578=LTDIE_71_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1578
	.byte 2,35,72,6
	.asciz "credentials"

LDIFF_SYM1579=LTDIE_76_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1579
	.byte 2,35,80,6
	.asciz "haveResponse"

LDIFF_SYM1580=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1580
	.byte 3,35,192,2,6
	.asciz "haveRequest"

LDIFF_SYM1581=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1581
	.byte 3,35,193,2,6
	.asciz "requestSent"

LDIFF_SYM1582=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1582
	.byte 3,35,194,2,6
	.asciz "webHeaders"

LDIFF_SYM1583=LTDIE_77_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1583
	.byte 2,35,88,6
	.asciz "keepAlive"

LDIFF_SYM1584=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1584
	.byte 3,35,195,2,6
	.asciz "maxAutoRedirect"

LDIFF_SYM1585=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1585
	.byte 3,35,196,2,6
	.asciz "mediaType"

LDIFF_SYM1586=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1586
	.byte 2,35,96,6
	.asciz "method"

LDIFF_SYM1587=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1587
	.byte 2,35,104,6
	.asciz "initialMethod"

LDIFF_SYM1588=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1588
	.byte 2,35,112,6
	.asciz "pipelined"

LDIFF_SYM1589=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1589
	.byte 3,35,200,2,6
	.asciz "preAuthenticate"

LDIFF_SYM1590=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1590
	.byte 3,35,201,2,6
	.asciz "usedPreAuth"

LDIFF_SYM1591=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1591
	.byte 3,35,202,2,6
	.asciz "version"

LDIFF_SYM1592=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1592
	.byte 2,35,120,6
	.asciz "force_version"

LDIFF_SYM1593=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1593
	.byte 3,35,203,2,6
	.asciz "actualVersion"

LDIFF_SYM1594=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1594
	.byte 3,35,128,1,6
	.asciz "proxy"

LDIFF_SYM1595=LTDIE_89_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1595
	.byte 3,35,136,1,6
	.asciz "sendChunked"

LDIFF_SYM1596=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1596
	.byte 3,35,204,2,6
	.asciz "servicePoint"

LDIFF_SYM1597=LTDIE_90_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1597
	.byte 3,35,144,1,6
	.asciz "timeout"

LDIFF_SYM1598=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1598
	.byte 3,35,208,2,6
	.asciz "writeStream"

LDIFF_SYM1599=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1599
	.byte 3,35,152,1,6
	.asciz "webResponse"

LDIFF_SYM1600=LTDIE_180_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1600
	.byte 3,35,160,1,6
	.asciz "asyncWrite"

LDIFF_SYM1601=LTDIE_184_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1601
	.byte 3,35,168,1,6
	.asciz "asyncRead"

LDIFF_SYM1602=LTDIE_184_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1602
	.byte 3,35,176,1,6
	.asciz "abortHandler"

LDIFF_SYM1603=LTDIE_160_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1603
	.byte 3,35,184,1,6
	.asciz "aborted"

LDIFF_SYM1604=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1604
	.byte 3,35,212,2,6
	.asciz "gotRequestStream"

LDIFF_SYM1605=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1605
	.byte 3,35,216,2,6
	.asciz "redirects"

LDIFF_SYM1606=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1606
	.byte 3,35,220,2,6
	.asciz "expectContinue"

LDIFF_SYM1607=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1607
	.byte 3,35,224,2,6
	.asciz "bodyBuffer"

LDIFF_SYM1608=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1608
	.byte 3,35,192,1,6
	.asciz "bodyBufferLength"

LDIFF_SYM1609=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1609
	.byte 3,35,228,2,6
	.asciz "getResponseCalled"

LDIFF_SYM1610=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1610
	.byte 3,35,232,2,6
	.asciz "saved_exc"

LDIFF_SYM1611=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1611
	.byte 3,35,200,1,6
	.asciz "locker"

LDIFF_SYM1612=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1612
	.byte 3,35,208,1,6
	.asciz "finished_reading"

LDIFF_SYM1613=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1613
	.byte 3,35,233,2,6
	.asciz "WebConnection"

LDIFF_SYM1614=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1614
	.byte 3,35,216,1,6
	.asciz "auto_decomp"

LDIFF_SYM1615=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1615
	.byte 3,35,236,2,6
	.asciz "readWriteTimeout"

LDIFF_SYM1616=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1616
	.byte 3,35,240,2,6
	.asciz "tlsProvider"

LDIFF_SYM1617=LTDIE_172_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1617
	.byte 3,35,224,1,6
	.asciz "tlsSettings"

LDIFF_SYM1618=LTDIE_175_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1618
	.byte 3,35,232,1,6
	.asciz "certValidationCallback"

LDIFF_SYM1619=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1619
	.byte 3,35,240,1,6
	.asciz "auth_state"

LDIFF_SYM1620=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1620
	.byte 3,35,248,1,6
	.asciz "proxy_auth_state"

LDIFF_SYM1621=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1621
	.byte 3,35,136,2,6
	.asciz "host"

LDIFF_SYM1622=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1622
	.byte 3,35,152,2,6
	.asciz "ResendContentFactory"

LDIFF_SYM1623=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1623
	.byte 3,35,160,2,6
	.asciz "<ThrowOnError>k__BackingField"

LDIFF_SYM1624=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1624
	.byte 3,35,244,2,6
	.asciz "unsafe_auth_blah"

LDIFF_SYM1625=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1625
	.byte 3,35,245,2,6
	.asciz "<ReuseConnection>k__BackingField"

LDIFF_SYM1626=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1626
	.byte 3,35,246,2,6
	.asciz "StoredConnection"

LDIFF_SYM1627=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1627
	.byte 3,35,168,2,0,7
	.asciz "System_Net_HttpWebRequest"

LDIFF_SYM1628=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM1628
LTDIE_48_POINTER:

	.byte 13
LDIFF_SYM1629=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM1629
LTDIE_48_REFERENCE:

	.byte 14
LDIFF_SYM1630=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM1630
LTDIE_192:

	.byte 5
	.asciz "_<>c__DisplayClass31_0"

	.byte 24,16
LDIFF_SYM1631=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1631
	.byte 2,35,0,6
	.asciz "stream"

LDIFF_SYM1632=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1632
	.byte 2,35,16,0,7
	.asciz "_<>c__DisplayClass31_0"

LDIFF_SYM1633=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1633
LTDIE_192_POINTER:

	.byte 13
LDIFF_SYM1634=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1634
LTDIE_192_REFERENCE:

	.byte 14
LDIFF_SYM1635=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1635
LTDIE_47:

	.byte 5
	.asciz "_<FetchSitesList>d__31"

	.byte 136,1,16
LDIFF_SYM1636=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1636
	.byte 2,35,0,6
	.asciz "<>1__state"

LDIFF_SYM1637=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1637
	.byte 3,35,128,1,6
	.asciz "<>t__builder"

LDIFF_SYM1638=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1638
	.byte 2,35,16,6
	.asciz "<vitaCoreUrl>5__1"

LDIFF_SYM1639=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1639
	.byte 2,35,40,6
	.asciz "<request>5__2"

LDIFF_SYM1640=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1640
	.byte 2,35,48,6
	.asciz "<response>5__3"

LDIFF_SYM1641=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1641
	.byte 2,35,56,6
	.asciz "<>s__4"

LDIFF_SYM1642=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1642
	.byte 2,35,64,6
	.asciz "<>8__5"

LDIFF_SYM1643=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1643
	.byte 2,35,72,6
	.asciz "<jsonDoc>5__6"

LDIFF_SYM1644=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1644
	.byte 2,35,80,6
	.asciz "<jv>5__7"

LDIFF_SYM1645=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1645
	.byte 2,35,88,6
	.asciz "<>s__8"

LDIFF_SYM1646=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1646
	.byte 2,35,96,6
	.asciz "<e>5__9"

LDIFF_SYM1647=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1647
	.byte 2,35,104,6
	.asciz "<>u__1"

LDIFF_SYM1648=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1648
	.byte 2,35,112,6
	.asciz "<>u__2"

LDIFF_SYM1649=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1649
	.byte 2,35,120,0,7
	.asciz "_<FetchSitesList>d__31"

LDIFF_SYM1650=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM1650
LTDIE_47_POINTER:

	.byte 13
LDIFF_SYM1651=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM1651
LTDIE_47_REFERENCE:

	.byte 14
LDIFF_SYM1652=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM1652
	.byte 2
	.asciz "vitasa.C_VitaSite:FetchSitesList"
	.asciz "vitasa_C_VitaSite_FetchSitesList"

	.byte 0,0
	.quad vitasa_C_VitaSite_FetchSitesList
	.quad Lme_3a

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM1653=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1653
	.byte 3,141,240,0,11
	.asciz "V_1"

LDIFF_SYM1654=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1654
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1655=Lfde58_end - Lfde58_start
	.long LDIFF_SYM1655
Lfde58_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite_FetchSitesList

LDIFF_SYM1656=Lme_3a - vitasa_C_VitaSite_FetchSitesList
	.long LDIFF_SYM1656
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29
	.align 3
Lfde58_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite:AddDummySites"
	.asciz "vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite"

	.byte 11,157,1
	.quad vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite
	.quad Lme_3b

	.byte 2,118,16,3
	.asciz "SitesList"

LDIFF_SYM1657=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1657
	.byte 1,106,11
	.asciz "s0"

LDIFF_SYM1658=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1658
	.byte 1,105,11
	.asciz "s1"

LDIFF_SYM1659=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1659
	.byte 1,104,11
	.asciz "s2"

LDIFF_SYM1660=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1660
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1661=Lfde59_end - Lfde59_start
	.long LDIFF_SYM1661
Lfde59_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite

LDIFF_SYM1662=Lme_3b - vitasa_C_VitaSite_AddDummySites_System_Collections_Generic_List_1_vitasa_C_VitaSite
	.long LDIFF_SYM1662
	.long 0
	.byte 12,31,0,68,14,160,3,157,52,158,51,68,13,29,68,151,50,152,49,68,153,48,154,47
	.align 3
Lfde59_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite:.cctor"
	.asciz "vitasa_C_VitaSite__cctor"

	.byte 11,27
	.quad vitasa_C_VitaSite__cctor
	.quad Lme_3c

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1663=Lfde60_end - Lfde60_start
	.long LDIFF_SYM1663
Lfde60_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__cctor

LDIFF_SYM1664=Lme_3c - vitasa_C_VitaSite__cctor
	.long LDIFF_SYM1664
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde60_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:.ctor"
	.asciz "vitasa_VC_SiteDetails__ctor_intptr"

	.byte 12,11
	.quad vitasa_VC_SiteDetails__ctor_intptr
	.quad Lme_3d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1665=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1665
	.byte 1,105,3
	.asciz "handle"

LDIFF_SYM1666=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1666
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1667=Lfde61_end - Lfde61_start
	.long LDIFF_SYM1667
Lfde61_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails__ctor_intptr

LDIFF_SYM1668=Lme_3d - vitasa_VC_SiteDetails__ctor_intptr
	.long LDIFF_SYM1668
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde61_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:ViewDidLoad"
	.asciz "vitasa_VC_SiteDetails_ViewDidLoad"

	.byte 12,19
	.quad vitasa_VC_SiteDetails_ViewDidLoad
	.quad Lme_3e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1669=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1669
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1670=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1670
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM1671=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1671
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1672=Lfde62_end - Lfde62_start
	.long LDIFF_SYM1672
Lfde62_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_ViewDidLoad

LDIFF_SYM1673=Lme_3e - vitasa_VC_SiteDetails_ViewDidLoad
	.long LDIFF_SYM1673
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,149,20,150,19,68,151,18,152,17,68,153,16,154,15
	.align 3
Lfde62_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:PrepareForSegue"
	.asciz "vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject"

	.byte 12,50
	.quad vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.quad Lme_3f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1674=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1674
	.byte 3,141,200,0,3
	.asciz "segue"

LDIFF_SYM1675=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1675
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM1676=LTDIE_4_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1676
	.byte 3,141,208,0,11
	.asciz "V_0"

LDIFF_SYM1677=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1677
	.byte 1,103,11
	.asciz "siteDetails"

LDIFF_SYM1678=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1678
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM1679=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1679
	.byte 1,101,11
	.asciz "sitesList"

LDIFF_SYM1680=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1680
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1681=Lfde63_end - Lfde63_start
	.long LDIFF_SYM1681
Lfde63_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject

LDIFF_SYM1682=Lme_3f - vitasa_VC_SiteDetails_PrepareForSegue_UIKit_UIStoryboardSegue_Foundation_NSObject
	.long LDIFF_SYM1682
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.align 3
Lfde63_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_B_Back"
	.asciz "vitasa_VC_SiteDetails_get_B_Back"

	.byte 13,19
	.quad vitasa_VC_SiteDetails_get_B_Back
	.quad Lme_40

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1683=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1683
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1684=Lfde64_end - Lfde64_start
	.long LDIFF_SYM1684
Lfde64_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_B_Back

LDIFF_SYM1685=Lme_40 - vitasa_VC_SiteDetails_get_B_Back
	.long LDIFF_SYM1685
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde64_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_B_Back"
	.asciz "vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton"

	.byte 13,19
	.quad vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton
	.quad Lme_41

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1686=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1686
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1687=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1687
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1688=Lfde65_end - Lfde65_start
	.long LDIFF_SYM1688
Lfde65_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton

LDIFF_SYM1689=Lme_41 - vitasa_VC_SiteDetails_set_B_Back_UIKit_UIButton
	.long LDIFF_SYM1689
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde65_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_Address"
	.asciz "vitasa_VC_SiteDetails_get_L_Address"

	.byte 13,23
	.quad vitasa_VC_SiteDetails_get_L_Address
	.quad Lme_42

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1690=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1690
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1691=Lfde66_end - Lfde66_start
	.long LDIFF_SYM1691
Lfde66_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_Address

LDIFF_SYM1692=Lme_42 - vitasa_VC_SiteDetails_get_L_Address
	.long LDIFF_SYM1692
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde66_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_Address"
	.asciz "vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel"

	.byte 13,23
	.quad vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel
	.quad Lme_43

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1693=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1693
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1694=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1694
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1695=Lfde67_end - Lfde67_start
	.long LDIFF_SYM1695
Lfde67_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel

LDIFF_SYM1696=Lme_43 - vitasa_VC_SiteDetails_set_L_Address_UIKit_UILabel
	.long LDIFF_SYM1696
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde67_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_City"
	.asciz "vitasa_VC_SiteDetails_get_L_City"

	.byte 13,27
	.quad vitasa_VC_SiteDetails_get_L_City
	.quad Lme_44

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1697=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1697
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1698=Lfde68_end - Lfde68_start
	.long LDIFF_SYM1698
Lfde68_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_City

LDIFF_SYM1699=Lme_44 - vitasa_VC_SiteDetails_get_L_City
	.long LDIFF_SYM1699
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde68_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_City"
	.asciz "vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel"

	.byte 13,27
	.quad vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel
	.quad Lme_45

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1700=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1700
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1701=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1701
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1702=Lfde69_end - Lfde69_start
	.long LDIFF_SYM1702
Lfde69_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel

LDIFF_SYM1703=Lme_45 - vitasa_VC_SiteDetails_set_L_City_UIKit_UILabel
	.long LDIFF_SYM1703
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde69_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_SiteCoordinator"
	.asciz "vitasa_VC_SiteDetails_get_L_SiteCoordinator"

	.byte 13,31
	.quad vitasa_VC_SiteDetails_get_L_SiteCoordinator
	.quad Lme_46

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1704=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1704
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1705=Lfde70_end - Lfde70_start
	.long LDIFF_SYM1705
Lfde70_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_SiteCoordinator

LDIFF_SYM1706=Lme_46 - vitasa_VC_SiteDetails_get_L_SiteCoordinator
	.long LDIFF_SYM1706
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde70_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_SiteCoordinator"
	.asciz "vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel"

	.byte 13,31
	.quad vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel
	.quad Lme_47

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1707=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1707
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1708=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1708
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1709=Lfde71_end - Lfde71_start
	.long LDIFF_SYM1709
Lfde71_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel

LDIFF_SYM1710=Lme_47 - vitasa_VC_SiteDetails_set_L_SiteCoordinator_UIKit_UILabel
	.long LDIFF_SYM1710
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde71_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_SiteName"
	.asciz "vitasa_VC_SiteDetails_get_L_SiteName"

	.byte 13,35
	.quad vitasa_VC_SiteDetails_get_L_SiteName
	.quad Lme_48

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1711=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1711
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1712=Lfde72_end - Lfde72_start
	.long LDIFF_SYM1712
Lfde72_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_SiteName

LDIFF_SYM1713=Lme_48 - vitasa_VC_SiteDetails_get_L_SiteName
	.long LDIFF_SYM1713
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde72_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_SiteName"
	.asciz "vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel"

	.byte 13,35
	.quad vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel
	.quad Lme_49

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1714=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1714
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1715=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1715
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1716=Lfde73_end - Lfde73_start
	.long LDIFF_SYM1716
Lfde73_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel

LDIFF_SYM1717=Lme_49 - vitasa_VC_SiteDetails_set_L_SiteName_UIKit_UILabel
	.long LDIFF_SYM1717
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde73_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_SiteStatus"
	.asciz "vitasa_VC_SiteDetails_get_L_SiteStatus"

	.byte 13,39
	.quad vitasa_VC_SiteDetails_get_L_SiteStatus
	.quad Lme_4a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1718=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1718
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1719=Lfde74_end - Lfde74_start
	.long LDIFF_SYM1719
Lfde74_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_SiteStatus

LDIFF_SYM1720=Lme_4a - vitasa_VC_SiteDetails_get_L_SiteStatus
	.long LDIFF_SYM1720
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde74_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_SiteStatus"
	.asciz "vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel"

	.byte 13,39
	.quad vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel
	.quad Lme_4b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1721=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1721
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1722=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1722
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1723=Lfde75_end - Lfde75_start
	.long LDIFF_SYM1723
Lfde75_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel

LDIFF_SYM1724=Lme_4b - vitasa_VC_SiteDetails_set_L_SiteStatus_UIKit_UILabel
	.long LDIFF_SYM1724
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde75_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:get_L_StatePlusZip"
	.asciz "vitasa_VC_SiteDetails_get_L_StatePlusZip"

	.byte 13,43
	.quad vitasa_VC_SiteDetails_get_L_StatePlusZip
	.quad Lme_4c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1725=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1725
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1726=Lfde76_end - Lfde76_start
	.long LDIFF_SYM1726
Lfde76_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_get_L_StatePlusZip

LDIFF_SYM1727=Lme_4c - vitasa_VC_SiteDetails_get_L_StatePlusZip
	.long LDIFF_SYM1727
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde76_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:set_L_StatePlusZip"
	.asciz "vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel"

	.byte 13,43
	.quad vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel
	.quad Lme_4d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1728=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1728
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1729=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1729
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1730=Lfde77_end - Lfde77_start
	.long LDIFF_SYM1730
Lfde77_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel

LDIFF_SYM1731=Lme_4d - vitasa_VC_SiteDetails_set_L_StatePlusZip_UIKit_UILabel
	.long LDIFF_SYM1731
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde77_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SiteDetails:ReleaseDesignerOutlets"
	.asciz "vitasa_VC_SiteDetails_ReleaseDesignerOutlets"

	.byte 13,46
	.quad vitasa_VC_SiteDetails_ReleaseDesignerOutlets
	.quad Lme_4e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1732=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1732
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1733=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1733
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM1734=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1734
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1735=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1735
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1736=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1736
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1737=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1737
	.byte 1,101,11
	.asciz "V_5"

LDIFF_SYM1738=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1738
	.byte 1,100,11
	.asciz "V_6"

LDIFF_SYM1739=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1739
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1740=Lfde78_end - Lfde78_start
	.long LDIFF_SYM1740
Lfde78_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails_ReleaseDesignerOutlets

LDIFF_SYM1741=Lme_4e - vitasa_VC_SiteDetails_ReleaseDesignerOutlets
	.long LDIFF_SYM1741
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde78_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_193:

	.byte 5
	.asciz "System_EventArgs"

	.byte 16,16
LDIFF_SYM1742=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1742
	.byte 2,35,0,0,7
	.asciz "System_EventArgs"

LDIFF_SYM1743=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1743
LTDIE_193_POINTER:

	.byte 13
LDIFF_SYM1744=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1744
LTDIE_193_REFERENCE:

	.byte 14
LDIFF_SYM1745=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1745
	.byte 2
	.asciz "vitasa.VC_SiteDetails:<ViewDidLoad>b__3_0"
	.asciz "vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs"

	.byte 12,29
	.quad vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs
	.quad Lme_4f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1746=LTDIE_35_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1746
	.byte 1,106,3
	.asciz "sender"

LDIFF_SYM1747=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1747
	.byte 2,141,32,3
	.asciz "e"

LDIFF_SYM1748=LTDIE_193_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1748
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM1749=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1749
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1750=Lfde79_end - Lfde79_start
	.long LDIFF_SYM1750
Lfde79_start:

	.long 0
	.align 3
	.quad vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs

LDIFF_SYM1751=Lme_4f - vitasa_VC_SiteDetails__ViewDidLoadb__3_0_object_System_EventArgs
	.long LDIFF_SYM1751
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde79_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_PassAroundContainer:.ctor"
	.asciz "vitasa_C_PassAroundContainer__ctor"

	.byte 14,21
	.quad vitasa_C_PassAroundContainer__ctor
	.quad Lme_50

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1752=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1752
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1753=Lfde80_end - Lfde80_start
	.long LDIFF_SYM1753
Lfde80_start:

	.long 0
	.align 3
	.quad vitasa_C_PassAroundContainer__ctor

LDIFF_SYM1754=Lme_50 - vitasa_C_PassAroundContainer__ctor
	.long LDIFF_SYM1754
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde80_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList/C_SitesTableSource:.ctor"
	.asciz "vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList"

	.byte 5,82
	.quad vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList
	.quad Lme_51

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1755=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1755
	.byte 1,104,3
	.asciz "pac"

LDIFF_SYM1756=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1756
	.byte 2,141,24,3
	.asciz "vc"

LDIFF_SYM1757=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1757
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1758=Lfde81_end - Lfde81_start
	.long LDIFF_SYM1758
Lfde81_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList

LDIFF_SYM1759=Lme_51 - vitasa_VC_SitesList_C_SitesTableSource__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesList
	.long LDIFF_SYM1759
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.align 3
Lfde81_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList/C_SitesTableSource:RowsInSection"
	.asciz "vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint"

	.byte 5,94
	.quad vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint
	.quad Lme_52

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1760=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1760
	.byte 1,106,3
	.asciz "tableview"

LDIFF_SYM1761=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1761
	.byte 2,141,48,3
	.asciz "section"

LDIFF_SYM1762=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1762
	.byte 2,141,56,11
	.asciz "count"

LDIFF_SYM1763=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1763
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM1764=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1764
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1765=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1765
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1766=Lfde82_end - Lfde82_start
	.long LDIFF_SYM1766
Lfde82_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint

LDIFF_SYM1767=Lme_52 - vitasa_VC_SitesList_C_SitesTableSource_RowsInSection_UIKit_UITableView_System_nint
	.long LDIFF_SYM1767
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10,154,9
	.align 3
Lfde82_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_194:

	.byte 5
	.asciz "Foundation_NSIndexPath"

	.byte 40,16
LDIFF_SYM1768=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1768
	.byte 2,35,0,0,7
	.asciz "Foundation_NSIndexPath"

LDIFF_SYM1769=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1769
LTDIE_194_POINTER:

	.byte 13
LDIFF_SYM1770=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1770
LTDIE_194_REFERENCE:

	.byte 14
LDIFF_SYM1771=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1771
LTDIE_195:

	.byte 5
	.asciz "UIKit_UITableViewCell"

	.byte 48,16
LDIFF_SYM1772=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM1772
	.byte 2,35,0,0,7
	.asciz "UIKit_UITableViewCell"

LDIFF_SYM1773=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1773
LTDIE_195_POINTER:

	.byte 13
LDIFF_SYM1774=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1774
LTDIE_195_REFERENCE:

	.byte 14
LDIFF_SYM1775=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1775
	.byte 2
	.asciz "vitasa.VC_SitesList/C_SitesTableSource:GetCell"
	.asciz "vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath"

	.byte 5,102
	.quad vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath
	.quad Lme_53

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1776=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1776
	.byte 3,141,200,0,3
	.asciz "tableView"

LDIFF_SYM1777=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1777
	.byte 3,141,208,0,3
	.asciz "indexPath"

LDIFF_SYM1778=LTDIE_194_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1778
	.byte 3,141,216,0,11
	.asciz "cell"

LDIFF_SYM1779=LTDIE_195_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1779
	.byte 1,103,11
	.asciz "site"

LDIFF_SYM1780=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1780
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM1781=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1781
	.byte 1,101,11
	.asciz "V_3"

LDIFF_SYM1782=LTDIE_195_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1782
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1783=Lfde83_end - Lfde83_start
	.long LDIFF_SYM1783
Lfde83_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath

LDIFF_SYM1784=Lme_53 - vitasa_VC_SitesList_C_SitesTableSource_GetCell_UIKit_UITableView_Foundation_NSIndexPath
	.long LDIFF_SYM1784
	.long 0
	.byte 12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,147,32,148,31,68,149,30,150,29,68,151,28,152,27,68,154,26
	.align 3
Lfde83_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList/C_SitesTableSource:RowSelected"
	.asciz "vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath"

	.byte 5,117
	.quad vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath
	.quad Lme_54

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1785=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1785
	.byte 1,105,3
	.asciz "tableView"

LDIFF_SYM1786=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1786
	.byte 2,141,24,3
	.asciz "indexPath"

LDIFF_SYM1787=LTDIE_194_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1787
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1788=Lfde84_end - Lfde84_start
	.long LDIFF_SYM1788
Lfde84_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath

LDIFF_SYM1789=Lme_54 - vitasa_VC_SitesList_C_SitesTableSource_RowSelected_UIKit_UITableView_Foundation_NSIndexPath
	.long LDIFF_SYM1789
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12
	.align 3
Lfde84_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList/<<LoadSitesFromWebService>b__4_0>d:.ctor"
	.asciz "vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor"

	.byte 0,0
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor
	.quad Lme_55

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1790=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1790
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1791=Lfde85_end - Lfde85_start
	.long LDIFF_SYM1791
Lfde85_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor

LDIFF_SYM1792=Lme_55 - vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d__ctor
	.long LDIFF_SYM1792
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde85_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesList/<<LoadSitesFromWebService>b__4_0>d:MoveNext"
	.asciz "vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext"

	.byte 5,0
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext
	.quad Lme_56

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1793=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1793
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1794=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1794
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM1795=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1795
	.byte 3,141,240,0,11
	.asciz "V_2"

LDIFF_SYM1796=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1796
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1797=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1797
	.byte 3,141,248,0,11
	.asciz "V_4"

LDIFF_SYM1798=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1798
	.byte 3,141,128,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1799=Lfde86_end - Lfde86_start
	.long LDIFF_SYM1799
Lfde86_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext

LDIFF_SYM1800=Lme_56 - vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_MoveNext
	.long LDIFF_SYM1800
	.long 0
	.byte 12,31,0,68,14,160,2,157,36,158,35,68,13,29,68,151,34,152,33,68,153,32,154,31
	.align 3
Lfde86_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_196:

	.byte 17
	.asciz "System_Runtime_CompilerServices_IAsyncStateMachine"

	.byte 16,7
	.asciz "System_Runtime_CompilerServices_IAsyncStateMachine"

LDIFF_SYM1801=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1801
LTDIE_196_POINTER:

	.byte 13
LDIFF_SYM1802=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1802
LTDIE_196_REFERENCE:

	.byte 14
LDIFF_SYM1803=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1803
	.byte 2
	.asciz "vitasa.VC_SitesList/<<LoadSitesFromWebService>b__4_0>d:SetStateMachine"
	.asciz "vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine"

	.byte 0,0
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.quad Lme_57

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1804=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1804
	.byte 2,141,16,3
	.asciz "stateMachine"

LDIFF_SYM1805=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1805
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1806=Lfde87_end - Lfde87_start
	.long LDIFF_SYM1806
Lfde87_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine

LDIFF_SYM1807=Lme_57 - vitasa_VC_SitesList___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.long LDIFF_SYM1807
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde87_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/MapDelegate:.ctor"
	.asciz "vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap"

	.byte 7,143,1
	.quad vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap
	.quad Lme_58

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1808=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1808
	.byte 1,104,3
	.asciz "pac"

LDIFF_SYM1809=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1809
	.byte 2,141,24,3
	.asciz "cv"

LDIFF_SYM1810=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1810
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1811=Lfde88_end - Lfde88_start
	.long LDIFF_SYM1811
Lfde88_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap

LDIFF_SYM1812=Lme_58 - vitasa_VC_SitesMap_MapDelegate__ctor_vitasa_C_PassAroundContainer_vitasa_VC_SitesMap
	.long LDIFF_SYM1812
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,152,10
	.align 3
Lfde88_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_197:

	.byte 17
	.asciz "MapKit_IMKAnnotation"

	.byte 16,7
	.asciz "MapKit_IMKAnnotation"

LDIFF_SYM1813=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1813
LTDIE_197_POINTER:

	.byte 13
LDIFF_SYM1814=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1814
LTDIE_197_REFERENCE:

	.byte 14
LDIFF_SYM1815=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1815
LTDIE_198:

	.byte 5
	.asciz "_<>c__DisplayClass5_0"

	.byte 32,16
LDIFF_SYM1816=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1816
	.byte 2,35,0,6
	.asciz "ourSite"

LDIFF_SYM1817=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1817
	.byte 2,35,16,6
	.asciz "<>4__this"

LDIFF_SYM1818=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1818
	.byte 2,35,24,0,7
	.asciz "_<>c__DisplayClass5_0"

LDIFF_SYM1819=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1819
LTDIE_198_POINTER:

	.byte 13
LDIFF_SYM1820=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1820
LTDIE_198_REFERENCE:

	.byte 14
LDIFF_SYM1821=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1821
LTDIE_199:

	.byte 5
	.asciz "MapKit_MKAnnotationView"

	.byte 48,16
LDIFF_SYM1822=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM1822
	.byte 2,35,0,0,7
	.asciz "MapKit_MKAnnotationView"

LDIFF_SYM1823=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1823
LTDIE_199_POINTER:

	.byte 13
LDIFF_SYM1824=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1824
LTDIE_199_REFERENCE:

	.byte 14
LDIFF_SYM1825=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1825
	.byte 2
	.asciz "vitasa.VC_SitesMap/MapDelegate:GetViewForAnnotation"
	.asciz "vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation"

	.byte 7,0
	.quad vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
	.quad Lme_59

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1826=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1826
	.byte 1,104,3
	.asciz "mapView"

LDIFF_SYM1827=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1827
	.byte 3,141,200,0,3
	.asciz "annotation"

LDIFF_SYM1828=LTDIE_197_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1828
	.byte 3,141,208,0,11
	.asciz "CS$<>8__locals0"

LDIFF_SYM1829=LTDIE_198_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1829
	.byte 1,103,11
	.asciz "thisWhich"

LDIFF_SYM1830=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1830
	.byte 1,102,11
	.asciz "pinView"

LDIFF_SYM1831=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1831
	.byte 1,101,11
	.asciz "V_3"

LDIFF_SYM1832=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1832
	.byte 1,100,11
	.asciz "V_4"

LDIFF_SYM1833=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1833
	.byte 3,141,160,1,11
	.asciz "V_5"

LDIFF_SYM1834=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1834
	.byte 3,141,168,1,11
	.asciz "V_6"

LDIFF_SYM1835=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1835
	.byte 3,141,176,1,11
	.asciz "V_7"

LDIFF_SYM1836=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1836
	.byte 3,141,136,1,11
	.asciz "s"

LDIFF_SYM1837=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1837
	.byte 1,99,11
	.asciz "V_9"

LDIFF_SYM1838=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1838
	.byte 1,106,11
	.asciz "V_10"

LDIFF_SYM1839=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1839
	.byte 3,141,184,1,11
	.asciz "V_11"

LDIFF_SYM1840=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1840
	.byte 3,141,192,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1841=Lfde89_end - Lfde89_start
	.long LDIFF_SYM1841
Lfde89_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation

LDIFF_SYM1842=Lme_59 - vitasa_VC_SitesMap_MapDelegate_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
	.long LDIFF_SYM1842
	.long 0
	.byte 12,31,0,68,14,176,2,157,38,158,37,68,13,29,68,147,36,148,35,68,149,34,150,33,68,151,32,152,31,68,154,30
	.align 3
Lfde89_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/<<LoadSitesFromWebService>b__4_0>d:.ctor"
	.asciz "vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor"

	.byte 0,0
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor
	.quad Lme_5a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1843=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1843
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1844=Lfde90_end - Lfde90_start
	.long LDIFF_SYM1844
Lfde90_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor

LDIFF_SYM1845=Lme_5a - vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d__ctor
	.long LDIFF_SYM1845
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde90_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/<<LoadSitesFromWebService>b__4_0>d:MoveNext"
	.asciz "vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext"

	.byte 7,0
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext
	.quad Lme_5b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1846=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1846
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1847=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1847
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM1848=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1848
	.byte 3,141,240,0,11
	.asciz "V_2"

LDIFF_SYM1849=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1849
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1850=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1850
	.byte 3,141,248,0,11
	.asciz "V_4"

LDIFF_SYM1851=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1851
	.byte 3,141,128,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1852=Lfde91_end - Lfde91_start
	.long LDIFF_SYM1852
Lfde91_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext

LDIFF_SYM1853=Lme_5b - vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_MoveNext
	.long LDIFF_SYM1853
	.long 0
	.byte 12,31,0,68,14,160,2,157,36,158,35,68,13,29,68,151,34,152,33,68,153,32,154,31
	.align 3
Lfde91_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/<<LoadSitesFromWebService>b__4_0>d:SetStateMachine"
	.asciz "vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine"

	.byte 0,0
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.quad Lme_5c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1854=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1854
	.byte 2,141,16,3
	.asciz "stateMachine"

LDIFF_SYM1855=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1855
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1856=Lfde92_end - Lfde92_start
	.long LDIFF_SYM1856
Lfde92_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine

LDIFF_SYM1857=Lme_5c - vitasa_VC_SitesMap___LoadSitesFromWebServiceb__4_0d_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.long LDIFF_SYM1857
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde92_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite/<>c__DisplayClass31_0:.ctor"
	.asciz "vitasa_C_VitaSite__c__DisplayClass31_0__ctor"

	.byte 0,0
	.quad vitasa_C_VitaSite__c__DisplayClass31_0__ctor
	.quad Lme_5d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1858=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1858
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1859=Lfde93_end - Lfde93_start
	.long LDIFF_SYM1859
Lfde93_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__c__DisplayClass31_0__ctor

LDIFF_SYM1860=Lme_5d - vitasa_C_VitaSite__c__DisplayClass31_0__ctor
	.long LDIFF_SYM1860
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde93_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite/<>c__DisplayClass31_0:<FetchSitesList>b__0"
	.asciz "vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0"

	.byte 11,137,1
	.quad vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0
	.quad Lme_5e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1861=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1861
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1862=Lfde94_end - Lfde94_start
	.long LDIFF_SYM1862
Lfde94_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0

LDIFF_SYM1863=Lme_5e - vitasa_C_VitaSite__c__DisplayClass31_0__FetchSitesListb__0
	.long LDIFF_SYM1863
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde94_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite/<FetchSitesList>d__31:.ctor"
	.asciz "vitasa_C_VitaSite__FetchSitesListd__31__ctor"

	.byte 0,0
	.quad vitasa_C_VitaSite__FetchSitesListd__31__ctor
	.quad Lme_5f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1864=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1864
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1865=Lfde95_end - Lfde95_start
	.long LDIFF_SYM1865
Lfde95_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__FetchSitesListd__31__ctor

LDIFF_SYM1866=Lme_5f - vitasa_C_VitaSite__FetchSitesListd__31__ctor
	.long LDIFF_SYM1866
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde95_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite/<FetchSitesList>d__31:MoveNext"
	.asciz "vitasa_C_VitaSite__FetchSitesListd__31_MoveNext"

	.byte 11,0
	.quad vitasa_C_VitaSite__FetchSitesListd__31_MoveNext
	.quad Lme_60

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1867=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1867
	.byte 3,141,208,0,11
	.asciz "V_0"

LDIFF_SYM1868=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1868
	.byte 3,141,176,1,11
	.asciz "V_1"

LDIFF_SYM1869=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1869
	.byte 3,141,184,1,11
	.asciz "V_2"

LDIFF_SYM1870=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1870
	.byte 3,141,168,1,11
	.asciz "V_3"

LDIFF_SYM1871=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1871
	.byte 1,106,11
	.asciz "V_4"

LDIFF_SYM1872=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1872
	.byte 3,141,192,1,11
	.asciz "V_5"

LDIFF_SYM1873=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1873
	.byte 3,141,160,1,11
	.asciz "V_6"

LDIFF_SYM1874=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1874
	.byte 1,105,11
	.asciz "V_7"

LDIFF_SYM1875=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1875
	.byte 1,104,11
	.asciz "V_8"

LDIFF_SYM1876=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1876
	.byte 3,141,200,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1877=Lfde96_end - Lfde96_start
	.long LDIFF_SYM1877
Lfde96_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__FetchSitesListd__31_MoveNext

LDIFF_SYM1878=Lme_60 - vitasa_C_VitaSite__FetchSitesListd__31_MoveNext
	.long LDIFF_SYM1878
	.long 0
	.byte 12,31,0,68,14,144,3,157,50,158,49,68,13,29,68,147,48,148,47,68,149,46,150,45,68,151,44,152,43,68,153,42
	.byte 154,41
	.align 3
Lfde96_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.C_VitaSite/<FetchSitesList>d__31:SetStateMachine"
	.asciz "vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine"

	.byte 0,0
	.quad vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.quad Lme_61

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1879=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1879
	.byte 2,141,16,3
	.asciz "stateMachine"

LDIFF_SYM1880=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1880
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1881=Lfde97_end - Lfde97_start
	.long LDIFF_SYM1881
Lfde97_start:

	.long 0
	.align 3
	.quad vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine

LDIFF_SYM1882=Lme_61 - vitasa_C_VitaSite__FetchSitesListd__31_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.long LDIFF_SYM1882
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde97_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/MapDelegate/<>c__DisplayClass5_0:.ctor"
	.asciz "vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor"

	.byte 0,0
	.quad vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor
	.quad Lme_62

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1883=LTDIE_198_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1883
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1884=Lfde98_end - Lfde98_start
	.long LDIFF_SYM1884
Lfde98_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor

LDIFF_SYM1885=Lme_62 - vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__ctor
	.long LDIFF_SYM1885
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde98_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "vitasa.VC_SitesMap/MapDelegate/<>c__DisplayClass5_0:<GetViewForAnnotation>b__0"
	.asciz "vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs"

	.byte 7,195,1
	.quad vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs
	.quad Lme_63

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1886=LTDIE_198_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1886
	.byte 1,106,3
	.asciz "s"

LDIFF_SYM1887=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1887
	.byte 2,141,24,3
	.asciz "e"

LDIFF_SYM1888=LTDIE_193_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1888
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1889=Lfde99_end - Lfde99_start
	.long LDIFF_SYM1889
Lfde99_start:

	.long 0
	.align 3
	.quad vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs

LDIFF_SYM1890=Lme_63 - vitasa_VC_SitesMap_MapDelegate__c__DisplayClass5_0__GetViewForAnnotationb__0_object_System_EventArgs
	.long LDIFF_SYM1890
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,154,8
	.align 3
Lfde99_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_200:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM1891=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1891
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM1892=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1892
LTDIE_200_POINTER:

	.byte 13
LDIFF_SYM1893=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1893
LTDIE_200_REFERENCE:

	.byte 14
LDIFF_SYM1894=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1894
LTDIE_201:

	.byte 5
	.asciz "System_Array"

	.byte 16,16
LDIFF_SYM1895=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1895
	.byte 2,35,0,0,7
	.asciz "System_Array"

LDIFF_SYM1896=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1896
LTDIE_201_POINTER:

	.byte 13
LDIFF_SYM1897=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1897
LTDIE_201_REFERENCE:

	.byte 14
LDIFF_SYM1898=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1898
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Threading.Tasks.Task>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult
	.quad Lme_65

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1899=LTDIE_200_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1899
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1900=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1900
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM1901=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1901
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1902=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1902
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1903=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1903
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1904=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1904
	.byte 1,101,11
	.asciz "V_5"

LDIFF_SYM1905=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1905
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1906=Lfde100_end - Lfde100_start
	.long LDIFF_SYM1906
Lfde100_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult

LDIFF_SYM1907=Lme_65 - wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_Task_invoke_TResult
	.long LDIFF_SYM1907
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde100_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__IEnumerable_GetEnumerator<T_REF>"
	.asciz "System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF"

	.byte 15,78
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
	.quad Lme_66

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1908=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1908
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1909=Lfde101_end - Lfde101_start
	.long LDIFF_SYM1909
Lfde101_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF

LDIFF_SYM1910=Lme_66 - System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
	.long LDIFF_SYM1910
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde101_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_get_Count"
	.asciz "System_Array_InternalArray__ICollection_get_Count"

	.byte 15,68
	.quad System_Array_InternalArray__ICollection_get_Count
	.quad Lme_67

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1911=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1911
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1912=Lfde102_end - Lfde102_start
	.long LDIFF_SYM1912
Lfde102_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_get_Count

LDIFF_SYM1913=Lme_67 - System_Array_InternalArray__ICollection_get_Count
	.long LDIFF_SYM1913
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde102_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_get_IsReadOnly"
	.asciz "System_Array_InternalArray__ICollection_get_IsReadOnly"

	.byte 15,73
	.quad System_Array_InternalArray__ICollection_get_IsReadOnly
	.quad Lme_68

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1914=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1914
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1915=Lfde103_end - Lfde103_start
	.long LDIFF_SYM1915
Lfde103_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_get_IsReadOnly

LDIFF_SYM1916=Lme_68 - System_Array_InternalArray__ICollection_get_IsReadOnly
	.long LDIFF_SYM1916
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde103_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Clear"
	.asciz "System_Array_InternalArray__ICollection_Clear"

	.byte 15,83
	.quad System_Array_InternalArray__ICollection_Clear
	.quad Lme_69

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1917=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1917
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1918=Lfde104_end - Lfde104_start
	.long LDIFF_SYM1918
Lfde104_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Clear

LDIFF_SYM1919=Lme_69 - System_Array_InternalArray__ICollection_Clear
	.long LDIFF_SYM1919
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde104_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Add<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Add_T_REF_T_REF"

	.byte 15,88
	.quad System_Array_InternalArray__ICollection_Add_T_REF_T_REF
	.quad Lme_6a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1920=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1920
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM1921=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1921
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1922=Lfde105_end - Lfde105_start
	.long LDIFF_SYM1922
Lfde105_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Add_T_REF_T_REF

LDIFF_SYM1923=Lme_6a - System_Array_InternalArray__ICollection_Add_T_REF_T_REF
	.long LDIFF_SYM1923
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde105_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Remove<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Remove_T_REF_T_REF"

	.byte 15,93
	.quad System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
	.quad Lme_6b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1924=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1924
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM1925=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1925
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1926=Lfde106_end - Lfde106_start
	.long LDIFF_SYM1926
Lfde106_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Remove_T_REF_T_REF

LDIFF_SYM1927=Lme_6b - System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
	.long LDIFF_SYM1927
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde106_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Contains<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Contains_T_REF_T_REF"

	.byte 15,98
	.quad System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
	.quad Lme_6c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1928=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1928
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM1929=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1929
	.byte 2,141,40,11
	.asciz "length"

LDIFF_SYM1930=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1930
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM1931=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1931
	.byte 1,104,11
	.asciz "value"

LDIFF_SYM1932=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1932
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1933=Lfde107_end - Lfde107_start
	.long LDIFF_SYM1933
Lfde107_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Contains_T_REF_T_REF

LDIFF_SYM1934=Lme_6c - System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
	.long LDIFF_SYM1934
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12,153,11,68,154,10
	.align 3
Lfde107_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_CopyTo<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int"

	.byte 15,123
	.quad System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
	.quad Lme_6d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1935=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1935
	.byte 1,104,3
	.asciz "array"

LDIFF_SYM1936=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1936
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM1937=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1937
	.byte 3,141,192,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1938=Lfde108_end - Lfde108_start
	.long LDIFF_SYM1938
Lfde108_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int

LDIFF_SYM1939=Lme_6d - System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
	.long LDIFF_SYM1939
	.long 0
	.byte 12,31,0,68,14,240,1,157,30,158,29,68,13,29,68,148,28,149,27,68,150,26,68,152,25,153,24,68,154,23
	.align 3
Lfde108_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_202:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 112,16
LDIFF_SYM1940=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1940
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM1941=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1941
LTDIE_202_POINTER:

	.byte 13
LDIFF_SYM1942=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1942
LTDIE_202_REFERENCE:

	.byte 14
LDIFF_SYM1943=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1943
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<vitasa.C_VitaSite>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite
	.quad Lme_6e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1944=LTDIE_202_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1944
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1945=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1945
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1946=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1946
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1947=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1947
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1948=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1948
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM1949=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1949
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1950=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1950
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM1951=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1951
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1952=Lfde109_end - Lfde109_start
	.long LDIFF_SYM1952
Lfde109_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite

LDIFF_SYM1953=Lme_6e - wrapper_delegate_invoke_System_Predicate_1_vitasa_C_VitaSite_invoke_bool_T_vitasa_C_VitaSite
	.long LDIFF_SYM1953
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde109_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_203:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 112,16
LDIFF_SYM1954=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1954
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM1955=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1955
LTDIE_203_POINTER:

	.byte 13
LDIFF_SYM1956=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1956
LTDIE_203_REFERENCE:

	.byte 14
LDIFF_SYM1957=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1957
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<vitasa.C_VitaSite>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite
	.quad Lme_6f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1958=LTDIE_203_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1958
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1959=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1959
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1960=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1960
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1961=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1961
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1962=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1962
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM1963=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1963
	.byte 1,101,11
	.asciz "V_3"

LDIFF_SYM1964=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1964
	.byte 1,100,11
	.asciz "V_4"

LDIFF_SYM1965=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1965
	.byte 1,99,11
	.asciz "V_5"

LDIFF_SYM1966=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1966
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1967=Lfde110_end - Lfde110_start
	.long LDIFF_SYM1967
Lfde110_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite

LDIFF_SYM1968=Lme_6f - wrapper_delegate_invoke_System_Comparison_1_vitasa_C_VitaSite_invoke_int_T_T_vitasa_C_VitaSite_vitasa_C_VitaSite
	.long LDIFF_SYM1968
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde110_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_204:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1969=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1969
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1970=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1970
LTDIE_204_POINTER:

	.byte 13
LDIFF_SYM1971=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1971
LTDIE_204_REFERENCE:

	.byte 14
LDIFF_SYM1972=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1972
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Json.JsonValue>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object
	.quad Lme_70

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1973=LTDIE_204_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1973
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1974=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1974
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1975=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1975
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1976=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1976
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1977=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1977
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM1978=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1978
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1979=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1979
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM1980=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1980
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1981=Lfde111_end - Lfde111_start
	.long LDIFF_SYM1981
Lfde111_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object

LDIFF_SYM1982=Lme_70 - wrapper_delegate_invoke_System_Func_2_object_System_Json_JsonValue_invoke_TResult_T_object
	.long LDIFF_SYM1982
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde111_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_205:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM1983=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1983
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM1984=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1984
LTDIE_205_POINTER:

	.byte 13
LDIFF_SYM1985=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1985
LTDIE_205_REFERENCE:

	.byte 14
LDIFF_SYM1986=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1986
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Json.JsonValue>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult
	.quad Lme_71

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1987=LTDIE_205_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1987
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1988=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1988
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM1989=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1989
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1990=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1990
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1991=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1991
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1992=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1992
	.byte 1,101,11
	.asciz "V_5"

LDIFF_SYM1993=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1993
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1994=Lfde112_end - Lfde112_start
	.long LDIFF_SYM1994
Lfde112_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult

LDIFF_SYM1995=Lme_71 - wrapper_delegate_invoke_System_Func_1_System_Json_JsonValue_invoke_TResult
	.long LDIFF_SYM1995
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde112_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_206:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1996=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM1996
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1997=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1997
LTDIE_206_POINTER:

	.byte 13
LDIFF_SYM1998=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1998
LTDIE_206_REFERENCE:

	.byte 14
LDIFF_SYM1999=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1999
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Json.JsonValue>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult
	.quad Lme_72

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2000=LTDIE_206_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2000
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2001=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2001
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2002=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2002
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2003=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2003
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2004=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2004
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2005=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2005
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2006=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2006
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2007=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2007
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2008=Lfde113_end - Lfde113_start
	.long LDIFF_SYM2008
Lfde113_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2009=Lme_72 - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Json_JsonValue_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2009
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde113_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_207:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM2010=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2010
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM2011=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2011
LTDIE_207_POINTER:

	.byte 13
LDIFF_SYM2012=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2012
LTDIE_207_REFERENCE:

	.byte 14
LDIFF_SYM2013=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2013
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.IAsyncResult>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.quad Lme_73

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2014=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2014
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2015=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2015
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2016=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2016
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2017=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2017
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2018=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2018
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2019=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2019
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2020=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2020
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2021=Lfde114_end - Lfde114_start
	.long LDIFF_SYM2021
Lfde114_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult

LDIFF_SYM2022=Lme_73 - wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.long LDIFF_SYM2022
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde114_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_208:

	.byte 5
	.asciz "System_Func`3"

	.byte 112,16
LDIFF_SYM2023=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2023
	.byte 2,35,0,0,7
	.asciz "System_Func`3"

LDIFF_SYM2024=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2024
LTDIE_208_POINTER:

	.byte 13
LDIFF_SYM2025=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2025
LTDIE_208_REFERENCE:

	.byte 14
LDIFF_SYM2026=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2026
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`3<System.AsyncCallback,_object,_System.IAsyncResult>:invoke_TResult_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.quad Lme_74

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2027=LTDIE_208_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2027
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2028=LTDIE_141_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2028
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM2029=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2029
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2030=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2030
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2031=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2031
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM2032=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2032
	.byte 1,101,11
	.asciz "V_3"

LDIFF_SYM2033=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2033
	.byte 1,100,11
	.asciz "V_4"

LDIFF_SYM2034=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2034
	.byte 1,99,11
	.asciz "V_5"

LDIFF_SYM2035=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2035
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2036=Lfde115_end - Lfde115_start
	.long LDIFF_SYM2036
Lfde115_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object

LDIFF_SYM2037=Lme_74 - wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.long LDIFF_SYM2037
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde115_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_209:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2038=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2038
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2039=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2039
LTDIE_209_POINTER:

	.byte 13
LDIFF_SYM2040=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2040
LTDIE_209_REFERENCE:

	.byte 14
LDIFF_SYM2041=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2041
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Threading.Tasks.Task>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object
	.quad Lme_75

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2042=LTDIE_209_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2042
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2043=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2043
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2044=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2044
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2045=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2045
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2046=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2046
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2047=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2047
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2048=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2048
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2049=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2049
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2050=Lfde116_end - Lfde116_start
	.long LDIFF_SYM2050
Lfde116_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object

LDIFF_SYM2051=Lme_75 - wrapper_delegate_invoke_System_Func_2_object_System_Threading_Tasks_Task_invoke_TResult_T_object
	.long LDIFF_SYM2051
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde116_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_210:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2052=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2052
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2053=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2053
LTDIE_210_POINTER:

	.byte 13
LDIFF_SYM2054=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2054
LTDIE_210_REFERENCE:

	.byte 14
LDIFF_SYM2055=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2055
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Threading.Tasks.Task>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult
	.quad Lme_76

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2056=LTDIE_210_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2056
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2057=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2057
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2058=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2058
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2059=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2059
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2060=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2060
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2061=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2061
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2062=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2062
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2063=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2063
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2064=Lfde117_end - Lfde117_start
	.long LDIFF_SYM2064
Lfde117_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2065=Lme_76 - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_Task_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2065
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde117_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_211:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2066=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2066
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2067=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2067
LTDIE_211_POINTER:

	.byte 13
LDIFF_SYM2068=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2068
LTDIE_211_REFERENCE:

	.byte 14
LDIFF_SYM2069=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2069
LTDIE_212:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2070=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2070
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2071=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2071
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2072=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM2072
LTDIE_212_POINTER:

	.byte 13
LDIFF_SYM2073=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM2073
LTDIE_212_REFERENCE:

	.byte 14
LDIFF_SYM2074=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM2074
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.Threading.Tasks.Task`1<System.Threading.Tasks.Task>,_System.Threading.Tasks.Task`1<System.Threading.Tasks.Task>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.quad Lme_77

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2075=LTDIE_211_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2075
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2076=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2076
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2077=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2077
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2078=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2078
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2079=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2079
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2080=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2080
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2081=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2081
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2082=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2082
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2083=Lfde118_end - Lfde118_start
	.long LDIFF_SYM2083
Lfde118_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task

LDIFF_SYM2084=Lme_77 - wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.long LDIFF_SYM2084
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde118_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_213:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2085=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2085
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2086=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM2086
LTDIE_213_POINTER:

	.byte 13
LDIFF_SYM2087=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM2087
LTDIE_213_REFERENCE:

	.byte 14
LDIFF_SYM2088=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM2088
LTDIE_214:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2089=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2089
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2090=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2090
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2091=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM2091
LTDIE_214_POINTER:

	.byte 13
LDIFF_SYM2092=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM2092
LTDIE_214_REFERENCE:

	.byte 14
LDIFF_SYM2093=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM2093
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.Threading.Tasks.Task`1<System.Threading.Tasks.Task>,_System.Threading.Tasks.Task`1<System.Json.JsonValue>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.quad Lme_78

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2094=LTDIE_213_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2094
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2095=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2095
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2096=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2096
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2097=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2097
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2098=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2098
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2099=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2099
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2100=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2100
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2101=LTDIE_214_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2101
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2102=Lfde119_end - Lfde119_start
	.long LDIFF_SYM2102
Lfde119_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task

LDIFF_SYM2103=Lme_78 - wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Json_JsonValue_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.long LDIFF_SYM2103
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde119_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_215:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2104=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2104
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2105=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM2105
LTDIE_215_POINTER:

	.byte 13
LDIFF_SYM2106=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM2106
LTDIE_215_REFERENCE:

	.byte 14
LDIFF_SYM2107=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM2107
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Net.WebResponse>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object
	.quad Lme_79

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2108=LTDIE_215_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2108
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2109=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2109
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2110=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2110
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2111=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2111
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2112=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2112
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2113=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2113
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2114=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2114
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2115=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2115
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2116=Lfde120_end - Lfde120_start
	.long LDIFF_SYM2116
Lfde120_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object

LDIFF_SYM2117=Lme_79 - wrapper_delegate_invoke_System_Func_2_object_System_Net_WebResponse_invoke_TResult_T_object
	.long LDIFF_SYM2117
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde120_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_216:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM2118=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2118
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM2119=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM2119
LTDIE_216_POINTER:

	.byte 13
LDIFF_SYM2120=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM2120
LTDIE_216_REFERENCE:

	.byte 14
LDIFF_SYM2121=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM2121
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Net.WebResponse>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult
	.quad Lme_7a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2122=LTDIE_216_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2122
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2123=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2123
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM2124=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2124
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2125=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2125
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM2126=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2126
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2127=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2127
	.byte 1,101,11
	.asciz "V_5"

LDIFF_SYM2128=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2128
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2129=Lfde121_end - Lfde121_start
	.long LDIFF_SYM2129
Lfde121_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult

LDIFF_SYM2130=Lme_7a - wrapper_delegate_invoke_System_Func_1_System_Net_WebResponse_invoke_TResult
	.long LDIFF_SYM2130
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde121_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_217:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2131=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2131
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2132=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM2132
LTDIE_217_POINTER:

	.byte 13
LDIFF_SYM2133=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM2133
LTDIE_217_REFERENCE:

	.byte 14
LDIFF_SYM2134=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM2134
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Net.WebResponse>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult
	.quad Lme_7b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2135=LTDIE_217_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2135
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2136=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2136
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2137=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2137
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2138=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2138
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2139=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2139
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2140=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2140
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2141=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2141
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2142=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2142
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2143=Lfde122_end - Lfde122_start
	.long LDIFF_SYM2143
Lfde122_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2144=Lme_7b - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Net_WebResponse_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2144
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde122_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_218:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2145=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2145
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2146=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM2146
LTDIE_218_POINTER:

	.byte 13
LDIFF_SYM2147=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM2147
LTDIE_218_REFERENCE:

	.byte 14
LDIFF_SYM2148=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM2148
LTDIE_219:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2149=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2149
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2150=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2150
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2151=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM2151
LTDIE_219_POINTER:

	.byte 13
LDIFF_SYM2152=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM2152
LTDIE_219_REFERENCE:

	.byte 14
LDIFF_SYM2153=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM2153
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.Threading.Tasks.Task`1<System.Threading.Tasks.Task>,_System.Threading.Tasks.Task`1<System.Net.WebResponse>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.quad Lme_7c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2154=LTDIE_218_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2154
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2155=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2155
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2156=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2156
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2157=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2157
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2158=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2158
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2159=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2159
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2160=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2160
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2161=LTDIE_219_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2161
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2162=Lfde123_end - Lfde123_start
	.long LDIFF_SYM2162
Lfde123_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task

LDIFF_SYM2163=Lme_7c - wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Net_WebResponse_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.long LDIFF_SYM2163
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde123_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_220:

	.byte 5
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder"

	.byte 40,16
LDIFF_SYM2164=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2164
	.byte 2,35,0,6
	.asciz "m_builder"

LDIFF_SYM2165=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2165
	.byte 2,35,0,0,7
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder"

LDIFF_SYM2166=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM2166
LTDIE_220_POINTER:

	.byte 13
LDIFF_SYM2167=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM2167
LTDIE_220_REFERENCE:

	.byte 14
LDIFF_SYM2168=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM2168
	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder:AwaitUnsafeOnCompleted<TAwaiter_INST,_TStateMachine_REF>"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_"

	.byte 16,232,2
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
	.quad Lme_7d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2169=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2169
	.byte 2,141,16,3
	.asciz "awaiter"

LDIFF_SYM2170=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2170
	.byte 2,141,24,3
	.asciz "stateMachine"

LDIFF_SYM2171=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2171
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2172=Lfde124_end - Lfde124_start
	.long LDIFF_SYM2172
Lfde124_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_

LDIFF_SYM2173=Lme_7d - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
	.long LDIFF_SYM2173
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde124_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_222:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2174=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2174
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2175=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2175
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2176=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM2176
LTDIE_222_POINTER:

	.byte 13
LDIFF_SYM2177=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM2177
LTDIE_222_REFERENCE:

	.byte 14
LDIFF_SYM2178=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM2178
LTDIE_221:

	.byte 5
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder`1"

	.byte 40,16
LDIFF_SYM2179=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2179
	.byte 2,35,0,6
	.asciz "m_coreState"

LDIFF_SYM2180=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2180
	.byte 2,35,16,6
	.asciz "m_task"

LDIFF_SYM2181=LTDIE_222_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2181
	.byte 2,35,32,0,7
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder`1"

LDIFF_SYM2182=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM2182
LTDIE_221_POINTER:

	.byte 13
LDIFF_SYM2183=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM2183
LTDIE_221_REFERENCE:

	.byte 14
LDIFF_SYM2184=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM2184
LTDIE_223:

	.byte 5
	.asciz "_MoveNextRunner"

	.byte 32,16
LDIFF_SYM2185=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2185
	.byte 2,35,0,6
	.asciz "m_context"

LDIFF_SYM2186=LTDIE_105_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2186
	.byte 2,35,16,6
	.asciz "m_stateMachine"

LDIFF_SYM2187=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2187
	.byte 2,35,24,0,7
	.asciz "_MoveNextRunner"

LDIFF_SYM2188=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM2188
LTDIE_223_POINTER:

	.byte 13
LDIFF_SYM2189=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM2189
LTDIE_223_REFERENCE:

	.byte 14
LDIFF_SYM2190=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM2190
LTDIE_224:

	.byte 5
	.asciz "System_Action"

	.byte 112,16
LDIFF_SYM2191=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2191
	.byte 2,35,0,0,7
	.asciz "System_Action"

LDIFF_SYM2192=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM2192
LTDIE_224_POINTER:

	.byte 13
LDIFF_SYM2193=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM2193
LTDIE_224_REFERENCE:

	.byte 14
LDIFF_SYM2194=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM2194
	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<TResult_REF>:AwaitUnsafeOnCompleted<TAwaiter_INST,_TStateMachine_REF>"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_"

	.byte 16,158,4
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
	.quad Lme_7e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2195=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2195
	.byte 1,104,3
	.asciz "awaiter"

LDIFF_SYM2196=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2196
	.byte 3,141,208,0,3
	.asciz "stateMachine"

LDIFF_SYM2197=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2197
	.byte 3,141,216,0,11
	.asciz "runnerToInitialize"

LDIFF_SYM2198=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2198
	.byte 3,141,136,1,11
	.asciz "continuation"

LDIFF_SYM2199=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2199
	.byte 1,103,11
	.asciz "builtTask"

LDIFF_SYM2200=LTDIE_222_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2200
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2201=Lfde125_end - Lfde125_start
	.long LDIFF_SYM2201
Lfde125_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_

LDIFF_SYM2202=Lme_7e - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_AwaitUnsafeOnCompleted_TAwaiter_INST_TStateMachine_REF_TAwaiter_INST__TStateMachine_REF_
	.long LDIFF_SYM2202
	.long 0
	.byte 12,31,0,68,14,208,1,157,26,158,25,68,13,29,68,147,24,148,23,68,149,22,150,21,68,151,20,152,19,68,153,18
	.byte 154,17
	.align 3
Lfde125_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_225:

	.byte 5
	.asciz "_InternalEnumerator`1"

	.byte 32,16
LDIFF_SYM2203=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2203
	.byte 2,35,0,6
	.asciz "array"

LDIFF_SYM2204=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2204
	.byte 2,35,16,6
	.asciz "idx"

LDIFF_SYM2205=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2205
	.byte 2,35,24,0,7
	.asciz "_InternalEnumerator`1"

LDIFF_SYM2206=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM2206
LTDIE_225_POINTER:

	.byte 13
LDIFF_SYM2207=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM2207
LTDIE_225_REFERENCE:

	.byte 14
LDIFF_SYM2208=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM2208
	.byte 2
	.asciz "System.Array/InternalEnumerator`1<T_REF>:.ctor"
	.asciz "System_Array_InternalEnumerator_1_T_REF__ctor_System_Array"

	.byte 15,239,1
	.quad System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
	.quad Lme_7f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2209=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2209
	.byte 1,105,3
	.asciz "array"

LDIFF_SYM2210=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2210
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2211=Lfde126_end - Lfde126_start
	.long LDIFF_SYM2211
Lfde126_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_T_REF__ctor_System_Array

LDIFF_SYM2212=Lme_7f - System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
	.long LDIFF_SYM2212
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8
	.align 3
Lfde126_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:Create"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create"

	.byte 16,188,3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create
	.quad Lme_80

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM2213=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2213
	.byte 3,141,200,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2214=Lfde127_end - Lfde127_start
	.long LDIFF_SYM2214
Lfde127_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create

LDIFF_SYM2215=Lme_80 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_Create
	.long LDIFF_SYM2215
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde127_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_227:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2216=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2216
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2217=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2217
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2218=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM2218
LTDIE_227_POINTER:

	.byte 13
LDIFF_SYM2219=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM2219
LTDIE_227_REFERENCE:

	.byte 14
LDIFF_SYM2220=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM2220
LTDIE_226:

	.byte 5
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder`1"

	.byte 40,16
LDIFF_SYM2221=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2221
	.byte 2,35,0,6
	.asciz "m_coreState"

LDIFF_SYM2222=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2222
	.byte 2,35,16,6
	.asciz "m_task"

LDIFF_SYM2223=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2223
	.byte 2,35,32,0,7
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder`1"

LDIFF_SYM2224=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM2224
LTDIE_226_POINTER:

	.byte 13
LDIFF_SYM2225=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM2225
LTDIE_226_REFERENCE:

	.byte 14
LDIFF_SYM2226=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM2226
	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:SetStateMachine"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine"

	.byte 16,229,3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.quad Lme_81

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2227=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2227
	.byte 2,141,16,3
	.asciz "stateMachine"

LDIFF_SYM2228=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2228
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2229=Lfde128_end - Lfde128_start
	.long LDIFF_SYM2229
Lfde128_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine

LDIFF_SYM2230=Lme_81 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetStateMachine_System_Runtime_CompilerServices_IAsyncStateMachine
	.long LDIFF_SYM2230
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde128_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:get_Task"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task"

	.byte 16,190,4
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
	.quad Lme_82

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2231=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2231
	.byte 1,106,11
	.asciz "task"

LDIFF_SYM2232=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2232
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2233=Lfde129_end - Lfde129_start
	.long LDIFF_SYM2233
Lfde129_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task

LDIFF_SYM2234=Lme_82 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_get_Task
	.long LDIFF_SYM2234
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde129_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:SetResult"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult"

	.byte 16,206,4
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
	.quad Lme_83

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2235=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2235
	.byte 1,106,3
	.asciz "result"

LDIFF_SYM2236=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2236
	.byte 2,141,32,11
	.asciz "task"

LDIFF_SYM2237=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2237
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2238=Lfde130_end - Lfde130_start
	.long LDIFF_SYM2238
Lfde130_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2239=Lme_83 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2239
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,154,11
	.align 3
Lfde130_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:SetResult"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult"

	.byte 16,244,4
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
	.quad Lme_84

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2240=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2240
	.byte 1,105,3
	.asciz "completedTask"

LDIFF_SYM2241=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2241
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM2242=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2242
	.byte 3,141,192,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2243=Lfde131_end - Lfde131_start
	.long LDIFF_SYM2243
Lfde131_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2244=Lme_84 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2244
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10
	.align 3
Lfde131_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_229:

	.byte 5
	.asciz "System_SystemException"

	.byte 136,1,16
LDIFF_SYM2245=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM2245
	.byte 2,35,0,0,7
	.asciz "System_SystemException"

LDIFF_SYM2246=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM2246
LTDIE_229_POINTER:

	.byte 13
LDIFF_SYM2247=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM2247
LTDIE_229_REFERENCE:

	.byte 14
LDIFF_SYM2248=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM2248
LTDIE_228:

	.byte 5
	.asciz "System_OperationCanceledException"

	.byte 144,1,16
LDIFF_SYM2249=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM2249
	.byte 2,35,0,6
	.asciz "_cancellationToken"

LDIFF_SYM2250=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2250
	.byte 3,35,136,1,0,7
	.asciz "System_OperationCanceledException"

LDIFF_SYM2251=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM2251
LTDIE_228_POINTER:

	.byte 13
LDIFF_SYM2252=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM2252
LTDIE_228_REFERENCE:

	.byte 14
LDIFF_SYM2253=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM2253
	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:SetException"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception"

	.byte 16,137,5
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception
	.quad Lme_85

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2254=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2254
	.byte 1,105,3
	.asciz "exception"

LDIFF_SYM2255=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2255
	.byte 1,106,11
	.asciz "task"

LDIFF_SYM2256=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2256
	.byte 1,104,11
	.asciz "oce"

LDIFF_SYM2257=LTDIE_228_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2257
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2258=Lfde132_end - Lfde132_start
	.long LDIFF_SYM2258
Lfde132_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception

LDIFF_SYM2259=Lme_85 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_SetException_System_Exception
	.long LDIFF_SYM2259
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde132_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:GetTaskForResult"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult"

	.byte 16,225,5
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
	.quad Lme_86

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2260=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2260
	.byte 2,141,32,3
	.asciz "result"

LDIFF_SYM2261=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2261
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM2262=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2262
	.byte 3,141,240,1,11
	.asciz "value"

LDIFF_SYM2263=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2263
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2264=Lfde133_end - Lfde133_start
	.long LDIFF_SYM2264
Lfde133_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2265=Lme_86 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult_GetTaskForResult_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2265
	.long 0
	.byte 12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,153,32,154,31
	.align 3
Lfde133_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<System.Threading.Tasks.VoidTaskResult>:.cctor"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor"

	.byte 16,171,3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor
	.quad Lme_87

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM2266=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2266
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2267=Lfde134_end - Lfde134_start
	.long LDIFF_SYM2267
Lfde134_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor

LDIFF_SYM2268=Lme_87 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_System_Threading_Tasks_VoidTaskResult__cctor
	.long LDIFF_SYM2268
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde134_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor"

	.byte 17,91
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor
	.quad Lme_88

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2269=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2269
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2270=Lfde135_end - Lfde135_start
	.long LDIFF_SYM2270
Lfde135_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor

LDIFF_SYM2271=Lme_88 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor
	.long LDIFF_SYM2271
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde135_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_230:

	.byte 8
	.asciz "System_Threading_Tasks_TaskCreationOptions"

	.byte 4
LDIFF_SYM2272=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2272
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "PreferFairness"

	.byte 1,9
	.asciz "LongRunning"

	.byte 2,9
	.asciz "AttachedToParent"

	.byte 4,9
	.asciz "DenyChildAttach"

	.byte 8,9
	.asciz "HideScheduler"

	.byte 16,9
	.asciz "RunContinuationsAsynchronously"

	.byte 192,0,0,7
	.asciz "System_Threading_Tasks_TaskCreationOptions"

LDIFF_SYM2273=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2273
LTDIE_230_POINTER:

	.byte 13
LDIFF_SYM2274=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2274
LTDIE_230_REFERENCE:

	.byte 14
LDIFF_SYM2275=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2275
	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions"

	.byte 17,97
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions
	.quad Lme_89

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2276=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2276
	.byte 2,141,16,3
	.asciz "state"

LDIFF_SYM2277=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2277
	.byte 2,141,24,3
	.asciz "options"

LDIFF_SYM2278=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2278
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2279=Lfde136_end - Lfde136_start
	.long LDIFF_SYM2279
Lfde136_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions

LDIFF_SYM2280=Lme_89 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_object_System_Threading_Tasks_TaskCreationOptions
	.long LDIFF_SYM2280
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde136_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult"

	.byte 17,104
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult
	.quad Lme_8a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2281=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2281
	.byte 1,106,3
	.asciz "result"

LDIFF_SYM2282=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2282
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM2283=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2283
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2284=Lfde137_end - Lfde137_start
	.long LDIFF_SYM2284
Lfde137_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2285=Lme_8a - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2285
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10
	.align 3
Lfde137_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken"

	.byte 17,110
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
	.quad Lme_8b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2286=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2286
	.byte 1,104,3
	.asciz "canceled"

LDIFF_SYM2287=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2287
	.byte 1,105,3
	.asciz "result"

LDIFF_SYM2288=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2288
	.byte 2,141,32,3
	.asciz "creationOptions"

LDIFF_SYM2289=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2289
	.byte 2,141,48,3
	.asciz "ct"

LDIFF_SYM2290=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2290
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2291=Lfde138_end - Lfde138_start
	.long LDIFF_SYM2291
Lfde138_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken

LDIFF_SYM2292=Lme_8b - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_bool_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_TaskCreationOptions_System_Threading_CancellationToken
	.long LDIFF_SYM2292
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12,153,11
	.align 3
Lfde138_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_231:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2293=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2293
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2294=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM2294
LTDIE_231_POINTER:

	.byte 13
LDIFF_SYM2295=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM2295
LTDIE_231_REFERENCE:

	.byte 14
LDIFF_SYM2296=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM2296
LTDIE_232:

	.byte 8
	.asciz "System_Threading_StackCrawlMark"

	.byte 4
LDIFF_SYM2297=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2297
	.byte 9
	.asciz "LookForMe"

	.byte 0,9
	.asciz "LookForMyCaller"

	.byte 1,9
	.asciz "LookForMyCallersCaller"

	.byte 2,9
	.asciz "LookForThread"

	.byte 3,0,7
	.asciz "System_Threading_StackCrawlMark"

LDIFF_SYM2298=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM2298
LTDIE_232_POINTER:

	.byte 13
LDIFF_SYM2299=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM2299
LTDIE_232_REFERENCE:

	.byte 14
LDIFF_SYM2300=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM2300
	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions"

	.byte 17,194,2
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions
	.quad Lme_8c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2301=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2301
	.byte 1,103,3
	.asciz "function"

LDIFF_SYM2302=LTDIE_231_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2302
	.byte 2,141,32,3
	.asciz "state"

LDIFF_SYM2303=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2303
	.byte 2,141,40,3
	.asciz "cancellationToken"

LDIFF_SYM2304=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2304
	.byte 2,141,48,3
	.asciz "creationOptions"

LDIFF_SYM2305=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2305
	.byte 1,106,11
	.asciz "stackMark"

LDIFF_SYM2306=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM2306
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2307=Lfde139_end - Lfde139_start
	.long LDIFF_SYM2307
Lfde139_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions

LDIFF_SYM2308=Lme_8c - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_2_object_System_Threading_Tasks_VoidTaskResult_object_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions
	.long LDIFF_SYM2308
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,151,16,68,154,15
	.align 3
Lfde139_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_233:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM2309=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2309
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM2310=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2310
LTDIE_233_POINTER:

	.byte 13
LDIFF_SYM2311=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2311
LTDIE_233_REFERENCE:

	.byte 14
LDIFF_SYM2312=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2312
LTDIE_234:

	.byte 8
	.asciz "System_Threading_Tasks_InternalTaskOptions"

	.byte 4
LDIFF_SYM2313=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2313
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "InternalOptionsMask"

	.byte 128,254,3,9
	.asciz "ChildReplica"

	.byte 128,2,9
	.asciz "ContinuationTask"

	.byte 128,4,9
	.asciz "PromiseTask"

	.byte 128,8,9
	.asciz "SelfReplicating"

	.byte 128,16,9
	.asciz "LazyCancellation"

	.byte 128,32,9
	.asciz "QueuedByRuntime"

	.byte 128,192,0,9
	.asciz "DoNotDispose"

	.byte 128,128,1,0,7
	.asciz "System_Threading_Tasks_InternalTaskOptions"

LDIFF_SYM2314=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2314
LTDIE_234_POINTER:

	.byte 13
LDIFF_SYM2315=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2315
LTDIE_234_REFERENCE:

	.byte 14
LDIFF_SYM2316=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2316
LTDIE_235:

	.byte 8
	.asciz "System_Threading_StackCrawlMark"

	.byte 4
LDIFF_SYM2317=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2317
	.byte 9
	.asciz "LookForMe"

	.byte 0,9
	.asciz "LookForMyCaller"

	.byte 1,9
	.asciz "LookForMyCallersCaller"

	.byte 2,9
	.asciz "LookForThread"

	.byte 3,0,7
	.asciz "System_Threading_StackCrawlMark"

LDIFF_SYM2318=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2318
LTDIE_235_POINTER:

	.byte 13
LDIFF_SYM2319=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2319
LTDIE_235_REFERENCE:

	.byte 14
LDIFF_SYM2320=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2320
	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_"

	.byte 17,205,2
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
	.quad Lme_8d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2321=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2321
	.byte 1,100,3
	.asciz "valueSelector"

LDIFF_SYM2322=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2322
	.byte 2,141,24,3
	.asciz "parent"

LDIFF_SYM2323=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2323
	.byte 2,141,32,3
	.asciz "cancellationToken"

LDIFF_SYM2324=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2324
	.byte 2,141,40,3
	.asciz "creationOptions"

LDIFF_SYM2325=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2325
	.byte 2,141,56,3
	.asciz "internalOptions"

LDIFF_SYM2326=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2326
	.byte 3,141,192,0,3
	.asciz "scheduler"

LDIFF_SYM2327=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2327
	.byte 3,141,200,0,3
	.asciz "stackMark"

LDIFF_SYM2328=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2328
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2329=Lfde140_end - Lfde140_start
	.long LDIFF_SYM2329
Lfde140_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_

LDIFF_SYM2330=Lme_8d - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
	.long LDIFF_SYM2330
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14
	.align 3
Lfde140_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler"

	.byte 17,224,2
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
	.quad Lme_8e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2331=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2331
	.byte 2,141,24,3
	.asciz "valueSelector"

LDIFF_SYM2332=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2332
	.byte 2,141,32,3
	.asciz "parent"

LDIFF_SYM2333=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2333
	.byte 2,141,40,3
	.asciz "cancellationToken"

LDIFF_SYM2334=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2334
	.byte 2,141,48,3
	.asciz "creationOptions"

LDIFF_SYM2335=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2335
	.byte 3,141,192,0,3
	.asciz "internalOptions"

LDIFF_SYM2336=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2336
	.byte 1,105,3
	.asciz "scheduler"

LDIFF_SYM2337=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2337
	.byte 3,141,200,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2338=Lfde141_end - Lfde141_start
	.long LDIFF_SYM2338
Lfde141_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler

LDIFF_SYM2339=Lme_8e - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
	.long LDIFF_SYM2339
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,153,14
	.align 3
Lfde141_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler"

	.byte 17,254,2
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
	.quad Lme_8f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2340=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2340
	.byte 2,141,24,3
	.asciz "valueSelector"

LDIFF_SYM2341=LTDIE_65_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2341
	.byte 2,141,32,3
	.asciz "state"

LDIFF_SYM2342=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2342
	.byte 2,141,40,3
	.asciz "parent"

LDIFF_SYM2343=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2343
	.byte 2,141,48,3
	.asciz "cancellationToken"

LDIFF_SYM2344=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2344
	.byte 2,141,56,3
	.asciz "creationOptions"

LDIFF_SYM2345=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2345
	.byte 3,141,200,0,3
	.asciz "internalOptions"

LDIFF_SYM2346=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2346
	.byte 1,105,3
	.asciz "scheduler"

LDIFF_SYM2347=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2347
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2348=Lfde142_end - Lfde142_start
	.long LDIFF_SYM2348
Lfde142_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler

LDIFF_SYM2349=Lme_8f - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Delegate_object_System_Threading_Tasks_Task_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler
	.long LDIFF_SYM2349
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,153,16
	.align 3
Lfde142_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:StartNew"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_"

	.byte 17,139,3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
	.quad Lme_90

	.byte 2,118,16,3
	.asciz "parent"

LDIFF_SYM2350=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2350
	.byte 2,141,48,3
	.asciz "function"

LDIFF_SYM2351=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2351
	.byte 1,102,3
	.asciz "cancellationToken"

LDIFF_SYM2352=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2352
	.byte 2,141,56,3
	.asciz "creationOptions"

LDIFF_SYM2353=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2353
	.byte 3,141,200,0,3
	.asciz "internalOptions"

LDIFF_SYM2354=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM2354
	.byte 1,104,3
	.asciz "scheduler"

LDIFF_SYM2355=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2355
	.byte 1,105,3
	.asciz "stackMark"

LDIFF_SYM2356=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2356
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2357=Lfde143_end - Lfde143_start
	.long LDIFF_SYM2357
Lfde143_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_

LDIFF_SYM2358=Lme_90 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Threading_Tasks_Task_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_InternalTaskOptions_System_Threading_Tasks_TaskScheduler_System_Threading_StackCrawlMark_
	.long LDIFF_SYM2358
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,148,20,68,150,19,68,152,18,153,17
	.align 3
Lfde143_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:TrySetResult"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult"

	.byte 17,207,3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult
	.quad Lme_91

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2359=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2359
	.byte 1,106,3
	.asciz "result"

LDIFF_SYM2360=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2360
	.byte 2,141,32,11
	.asciz "cp"

LDIFF_SYM2361=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2361
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2362=Lfde144_end - Lfde144_start
	.long LDIFF_SYM2362
Lfde144_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2363=Lme_91 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetResult_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2363
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde144_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:DangerousSetResult"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult"

	.byte 17,251,3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult
	.quad Lme_92

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2364=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2364
	.byte 1,106,3
	.asciz "result"

LDIFF_SYM2365=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2365
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2366=Lfde145_end - Lfde145_start
	.long LDIFF_SYM2366
Lfde145_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2367=Lme_92 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_DangerousSetResult_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2367
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10
	.align 3
Lfde145_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:get_Result"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result"

	.byte 17,148,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result
	.quad Lme_93

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2368=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2368
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2369=Lfde146_end - Lfde146_start
	.long LDIFF_SYM2369
Lfde146_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result

LDIFF_SYM2370=Lme_93 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Result
	.long LDIFF_SYM2370
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,154,12
	.align 3
Lfde146_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:get_ResultOnSuccess"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess"

	.byte 17,164,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess
	.quad Lme_94

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2371=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2371
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2372=Lfde147_end - Lfde147_start
	.long LDIFF_SYM2372
Lfde147_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess

LDIFF_SYM2373=Lme_94 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_ResultOnSuccess
	.long LDIFF_SYM2373
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde147_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:GetResultCore"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool"

	.byte 17,172,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool
	.quad Lme_95

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2374=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2374
	.byte 1,105,3
	.asciz "waitCompletionNotification"

LDIFF_SYM2375=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2375
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM2376=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2376
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2377=Lfde148_end - Lfde148_start
	.long LDIFF_SYM2377
Lfde148_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool

LDIFF_SYM2378=Lme_95 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetResultCore_bool
	.long LDIFF_SYM2378
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12
	.align 3
Lfde148_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:TrySetException"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object"

	.byte 17,206,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object
	.quad Lme_96

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2379=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2379
	.byte 1,105,3
	.asciz "exceptionObject"

LDIFF_SYM2380=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2380
	.byte 2,141,32,11
	.asciz "returnValue"

LDIFF_SYM2381=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2381
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2382=Lfde149_end - Lfde149_start
	.long LDIFF_SYM2382
Lfde149_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object

LDIFF_SYM2383=Lme_96 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetException_object
	.long LDIFF_SYM2383
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7
	.align 3
Lfde149_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:TrySetCanceled"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken"

	.byte 17,234,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken
	.quad Lme_97

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2384=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2384
	.byte 2,141,16,3
	.asciz "tokenToRecord"

LDIFF_SYM2385=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2385
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2386=Lfde150_end - Lfde150_start
	.long LDIFF_SYM2386
Lfde150_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken

LDIFF_SYM2387=Lme_97 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken
	.long LDIFF_SYM2387
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde150_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:TrySetCanceled"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object"

	.byte 17,253,4
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object
	.quad Lme_98

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2388=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2388
	.byte 1,105,3
	.asciz "tokenToRecord"

LDIFF_SYM2389=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2389
	.byte 2,141,32,3
	.asciz "cancellationException"

LDIFF_SYM2390=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2390
	.byte 2,141,48,11
	.asciz "returnValue"

LDIFF_SYM2391=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2391
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2392=Lfde151_end - Lfde151_start
	.long LDIFF_SYM2392
Lfde151_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object

LDIFF_SYM2393=Lme_98 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_TrySetCanceled_System_Threading_CancellationToken_object
	.long LDIFF_SYM2393
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12,153,11
	.align 3
Lfde151_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:get_Factory"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory"

	.byte 17,156,5
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory
	.quad Lme_99

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2394=Lfde152_end - Lfde152_start
	.long LDIFF_SYM2394
Lfde152_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory

LDIFF_SYM2395=Lme_99 - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_get_Factory
	.long LDIFF_SYM2395
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde152_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:InnerInvoke"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke"

	.byte 17,165,5
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke
	.quad Lme_9a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2396=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2396
	.byte 1,106,11
	.asciz "func"

LDIFF_SYM2397=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2397
	.byte 1,105,11
	.asciz "funcWithState"

LDIFF_SYM2398=LTDIE_231_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2398
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2399=Lfde153_end - Lfde153_start
	.long LDIFF_SYM2399
Lfde153_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke

LDIFF_SYM2400=Lme_9a - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_InnerInvoke
	.long LDIFF_SYM2400
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde153_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:GetAwaiter"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter"

	.byte 17,187,5
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
	.quad Lme_9b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2401=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2401
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2402=Lfde154_end - Lfde154_start
	.long LDIFF_SYM2402
Lfde154_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter

LDIFF_SYM2403=Lme_9b - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
	.long LDIFF_SYM2403
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde154_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:ConfigureAwait"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool"

	.byte 17,197,5
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool
	.quad Lme_9c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2404=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2404
	.byte 2,141,32,3
	.asciz "continueOnCapturedContext"

LDIFF_SYM2405=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2405
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2406=Lfde155_end - Lfde155_start
	.long LDIFF_SYM2406
Lfde155_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool

LDIFF_SYM2407=Lme_9c - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_ConfigureAwait_bool
	.long LDIFF_SYM2407
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde155_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>:.cctor"
	.asciz "System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor"

	.byte 17,81
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor
	.quad Lme_9d

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2408=Lfde156_end - Lfde156_start
	.long LDIFF_SYM2408
Lfde156_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor

LDIFF_SYM2409=Lme_9d - System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult__cctor
	.long LDIFF_SYM2409
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde156_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_237:

	.byte 8
	.asciz "System_Threading_Tasks_TaskContinuationOptions"

	.byte 4
LDIFF_SYM2410=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2410
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "PreferFairness"

	.byte 1,9
	.asciz "LongRunning"

	.byte 2,9
	.asciz "AttachedToParent"

	.byte 4,9
	.asciz "DenyChildAttach"

	.byte 8,9
	.asciz "HideScheduler"

	.byte 16,9
	.asciz "LazyCancellation"

	.byte 32,9
	.asciz "RunContinuationsAsynchronously"

	.byte 192,0,9
	.asciz "NotOnRanToCompletion"

	.byte 128,128,4,9
	.asciz "NotOnFaulted"

	.byte 128,128,8,9
	.asciz "NotOnCanceled"

	.byte 128,128,16,9
	.asciz "OnlyOnRanToCompletion"

	.byte 128,128,24,9
	.asciz "OnlyOnFaulted"

	.byte 128,128,20,9
	.asciz "OnlyOnCanceled"

	.byte 128,128,12,9
	.asciz "ExecuteSynchronously"

	.byte 128,128,32,0,7
	.asciz "System_Threading_Tasks_TaskContinuationOptions"

LDIFF_SYM2411=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2411
LTDIE_237_POINTER:

	.byte 13
LDIFF_SYM2412=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2412
LTDIE_237_REFERENCE:

	.byte 14
LDIFF_SYM2413=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2413
LTDIE_236:

	.byte 5
	.asciz "System_Threading_Tasks_TaskFactory`1"

	.byte 40,16
LDIFF_SYM2414=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2414
	.byte 2,35,0,6
	.asciz "m_defaultCancellationToken"

LDIFF_SYM2415=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2415
	.byte 2,35,16,6
	.asciz "m_defaultScheduler"

LDIFF_SYM2416=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2416
	.byte 2,35,24,6
	.asciz "m_defaultCreationOptions"

LDIFF_SYM2417=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2417
	.byte 2,35,32,6
	.asciz "m_defaultContinuationOptions"

LDIFF_SYM2418=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2418
	.byte 2,35,36,0,7
	.asciz "System_Threading_Tasks_TaskFactory`1"

LDIFF_SYM2419=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2419
LTDIE_236_POINTER:

	.byte 13
LDIFF_SYM2420=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2420
LTDIE_236_REFERENCE:

	.byte 14
LDIFF_SYM2421=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2421
	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor"

	.byte 18,93
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor
	.quad Lme_9e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2422=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2422
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM2423=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2423
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2424=Lfde157_end - Lfde157_start
	.long LDIFF_SYM2424
Lfde157_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor

LDIFF_SYM2425=Lme_9e - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor
	.long LDIFF_SYM2425
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde157_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler"

	.byte 18,208,1
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler
	.quad Lme_9f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2426=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2426
	.byte 1,103,3
	.asciz "cancellationToken"

LDIFF_SYM2427=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2427
	.byte 2,141,40,3
	.asciz "creationOptions"

LDIFF_SYM2428=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2428
	.byte 1,104,3
	.asciz "continuationOptions"

LDIFF_SYM2429=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2429
	.byte 1,105,3
	.asciz "scheduler"

LDIFF_SYM2430=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2430
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2431=Lfde158_end - Lfde158_start
	.long LDIFF_SYM2431
Lfde158_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler

LDIFF_SYM2432=Lme_9f - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskContinuationOptions_System_Threading_Tasks_TaskScheduler
	.long LDIFF_SYM2432
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10
	.align 3
Lfde158_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:StartNew"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler"

	.byte 18,132,3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler
	.quad Lme_a0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2433=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2433
	.byte 2,141,24,3
	.asciz "function"

LDIFF_SYM2434=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2434
	.byte 2,141,32,3
	.asciz "cancellationToken"

LDIFF_SYM2435=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2435
	.byte 2,141,40,3
	.asciz "creationOptions"

LDIFF_SYM2436=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2436
	.byte 1,105,3
	.asciz "scheduler"

LDIFF_SYM2437=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2437
	.byte 2,141,56,11
	.asciz "stackMark"

LDIFF_SYM2438=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM2438
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2439=Lfde159_end - Lfde159_start
	.long LDIFF_SYM2439
Lfde159_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler

LDIFF_SYM2440=Lme_a0 - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_StartNew_System_Func_1_System_Threading_Tasks_VoidTaskResult_System_Threading_CancellationToken_System_Threading_Tasks_TaskCreationOptions_System_Threading_Tasks_TaskScheduler
	.long LDIFF_SYM2440
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,153,14
	.align 3
Lfde159_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_238:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2441=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2441
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2442=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2442
LTDIE_238_POINTER:

	.byte 13
LDIFF_SYM2443=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2443
LTDIE_238_REFERENCE:

	.byte 14
LDIFF_SYM2444=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2444
	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:FromAsyncCoreLogic"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool"

	.byte 18,158,4
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.quad Lme_a1

	.byte 2,118,16,3
	.asciz "iar"

LDIFF_SYM2445=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2445
	.byte 1,104,3
	.asciz "endFunction"

LDIFF_SYM2446=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2446
	.byte 1,105,3
	.asciz "endAction"

LDIFF_SYM2447=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2447
	.byte 2,141,32,3
	.asciz "promise"

LDIFF_SYM2448=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2448
	.byte 2,141,40,3
	.asciz "requiresSynchronization"

LDIFF_SYM2449=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2449
	.byte 2,141,48,11
	.asciz "ex"

LDIFF_SYM2450=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2450
	.byte 3,141,248,0,11
	.asciz "oce"

LDIFF_SYM2451=LTDIE_228_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2451
	.byte 3,141,128,1,11
	.asciz "result"

LDIFF_SYM2452=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2452
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2453=Lfde160_end - Lfde160_start
	.long LDIFF_SYM2453
Lfde160_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool

LDIFF_SYM2454=Lme_a1 - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncCoreLogic_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.long LDIFF_SYM2454
	.long 0
	.byte 12,31,0,68,14,128,2,157,32,158,31,68,13,29,68,152,30,153,29
	.align 3
Lfde160_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:FromAsync"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object"

	.byte 18,138,6
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object
	.quad Lme_a2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2455=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2455
	.byte 2,141,16,3
	.asciz "beginMethod"

LDIFF_SYM2456=LTDIE_208_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2456
	.byte 2,141,24,3
	.asciz "endMethod"

LDIFF_SYM2457=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2457
	.byte 2,141,32,3
	.asciz "state"

LDIFF_SYM2458=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2458
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2459=Lfde161_end - Lfde161_start
	.long LDIFF_SYM2459
Lfde161_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object

LDIFF_SYM2460=Lme_a2 - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsync_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_object
	.long LDIFF_SYM2460
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde161_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_239:

	.byte 5
	.asciz "_<>c__DisplayClass35_1"

	.byte 40,16
LDIFF_SYM2461=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2461
	.byte 2,35,0,6
	.asciz "endFunction"

LDIFF_SYM2462=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2462
	.byte 2,35,16,6
	.asciz "endAction"

LDIFF_SYM2463=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2463
	.byte 2,35,24,6
	.asciz "promise"

LDIFF_SYM2464=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2464
	.byte 2,35,32,0,7
	.asciz "_<>c__DisplayClass35_1"

LDIFF_SYM2465=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2465
LTDIE_239_POINTER:

	.byte 13
LDIFF_SYM2466=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2466
LTDIE_239_REFERENCE:

	.byte 14
LDIFF_SYM2467=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2467
LTDIE_241:

	.byte 5
	.asciz "System_Threading_AtomicBoolean"

	.byte 20,16
LDIFF_SYM2468=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2468
	.byte 2,35,0,6
	.asciz "flag"

LDIFF_SYM2469=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2469
	.byte 2,35,16,0,7
	.asciz "System_Threading_AtomicBoolean"

LDIFF_SYM2470=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2470
LTDIE_241_POINTER:

	.byte 13
LDIFF_SYM2471=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2471
LTDIE_241_REFERENCE:

	.byte 14
LDIFF_SYM2472=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2472
LTDIE_240:

	.byte 5
	.asciz "_<>c__DisplayClass35_0"

	.byte 32,16
LDIFF_SYM2473=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2473
	.byte 2,35,0,6
	.asciz "invoked"

LDIFF_SYM2474=LTDIE_241_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2474
	.byte 2,35,16,6
	.asciz "CS$<>8__locals1"

LDIFF_SYM2475=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2475
	.byte 2,35,24,0,7
	.asciz "_<>c__DisplayClass35_0"

LDIFF_SYM2476=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2476
LTDIE_240_POINTER:

	.byte 13
LDIFF_SYM2477=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2477
LTDIE_240_REFERENCE:

	.byte 14
LDIFF_SYM2478=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2478
	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1<System.Threading.Tasks.VoidTaskResult>:FromAsyncImpl"
	.asciz "System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions"

	.byte 18,0
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions
	.quad Lme_a3

	.byte 2,118,16,3
	.asciz "beginMethod"

LDIFF_SYM2479=LTDIE_208_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2479
	.byte 1,102,3
	.asciz "endFunction"

LDIFF_SYM2480=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2480
	.byte 2,141,56,3
	.asciz "endAction"

LDIFF_SYM2481=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2481
	.byte 3,141,192,0,3
	.asciz "state"

LDIFF_SYM2482=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2482
	.byte 1,105,3
	.asciz "creationOptions"

LDIFF_SYM2483=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM2483
	.byte 1,106,11
	.asciz "CS$<>8__locals0"

LDIFF_SYM2484=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2484
	.byte 3,141,232,0,11
	.asciz "CS$<>8__locals1"

LDIFF_SYM2485=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2485
	.byte 1,101,11
	.asciz "asyncResult"

LDIFF_SYM2486=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2486
	.byte 1,100,11
	.asciz "V_3"

LDIFF_SYM2487=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2487
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2488=Lfde162_end - Lfde162_start
	.long LDIFF_SYM2488
Lfde162_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions

LDIFF_SYM2489=Lme_a3 - System_Threading_Tasks_TaskFactory_1_System_Threading_Tasks_VoidTaskResult_FromAsyncImpl_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_System_Action_1_System_IAsyncResult_object_System_Threading_Tasks_TaskCreationOptions
	.long LDIFF_SYM2489
	.long 0
	.byte 12,31,0,68,14,240,1,157,30,158,29,68,13,29,68,148,28,149,27,68,150,26,68,153,25,154,24
	.align 3
Lfde162_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_242:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2490=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM2490
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2491=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2491
LTDIE_242_POINTER:

	.byte 13
LDIFF_SYM2492=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2492
LTDIE_242_REFERENCE:

	.byte 14
LDIFF_SYM2493=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2493
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.Threading.Tasks.Task`1<System.Threading.Tasks.Task>,_System.Threading.Tasks.Task`1<System.Threading.Tasks.VoidTaskResult>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.quad Lme_a4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2494=LTDIE_242_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2494
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2495=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2495
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2496=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2496
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2497=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2497
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2498=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2498
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2499=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2499
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2500=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2500
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2501=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2501
	.byte 1,99,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2502=Lfde163_end - Lfde163_start
	.long LDIFF_SYM2502
Lfde163_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task

LDIFF_SYM2503=Lme_a4 - wrapper_delegate_invoke_System_Func_2_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.long LDIFF_SYM2503
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,147,16,148,15,68,149,14,150,13,68,151,12,152,11,68,153,10
	.byte 154,9
	.align 3
Lfde163_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<TResult_REF>:get_Task"
	.asciz "System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task"

	.byte 16,190,4
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
	.quad Lme_a5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2504=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2504
	.byte 1,106,11
	.asciz "task"

LDIFF_SYM2505=LTDIE_222_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2505
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2506=Lfde164_end - Lfde164_start
	.long LDIFF_SYM2506
Lfde164_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task

LDIFF_SYM2507=Lme_a5 - System_Runtime_CompilerServices_AsyncTaskMethodBuilder_1_TResult_REF_get_Task
	.long LDIFF_SYM2507
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,152,10,153,9,68,154,8
	.align 3
Lfde164_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.AsyncTaskCache:CreateCacheableTask<System.Threading.Tasks.VoidTaskResult>"
	.asciz "System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult"

	.byte 16,193,6
	.quad System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult
	.quad Lme_a6

	.byte 2,118,16,3
	.asciz "result"

LDIFF_SYM2508=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2508
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM2509=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2509
	.byte 3,141,200,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2510=Lfde165_end - Lfde165_start
	.long LDIFF_SYM2510
Lfde165_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2511=Lme_a6 - System_Runtime_CompilerServices_AsyncTaskCache_CreateCacheableTask_System_Threading_Tasks_VoidTaskResult_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2511
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde165_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Threading.Tasks.VoidTaskResult>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult
	.quad Lme_ab

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2512=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2512
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2513=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2513
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM2514=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2514
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2515=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2515
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM2516=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2516
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2517=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2517
	.byte 1,101,11
	.asciz "V_5"

LDIFF_SYM2518=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2518
	.byte 3,141,152,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2519=Lfde166_end - Lfde166_start
	.long LDIFF_SYM2519
Lfde166_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult

LDIFF_SYM2520=Lme_ab - wrapper_delegate_invoke_System_Func_1_System_Threading_Tasks_VoidTaskResult_invoke_TResult
	.long LDIFF_SYM2520
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,147,22,148,21,68,149,20,150,19,68,151,18,152,17,68,153,16
	.byte 154,15
	.align 3
Lfde166_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_243:

	.byte 5
	.asciz "System_Runtime_CompilerServices_TaskAwaiter`1"

	.byte 24,16
LDIFF_SYM2521=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2521
	.byte 2,35,0,6
	.asciz "m_task"

LDIFF_SYM2522=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2522
	.byte 2,35,16,0,7
	.asciz "System_Runtime_CompilerServices_TaskAwaiter`1"

LDIFF_SYM2523=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2523
LTDIE_243_POINTER:

	.byte 13
LDIFF_SYM2524=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2524
LTDIE_243_REFERENCE:

	.byte 14
LDIFF_SYM2525=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2525
	.byte 2
	.asciz "System.Runtime.CompilerServices.TaskAwaiter`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult"

	.byte 19,189,2
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
	.quad Lme_ac

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2526=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2526
	.byte 2,141,16,3
	.asciz "task"

LDIFF_SYM2527=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2527
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2528=Lfde167_end - Lfde167_start
	.long LDIFF_SYM2528
Lfde167_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult

LDIFF_SYM2529=Lme_ac - System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult
	.long LDIFF_SYM2529
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde167_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.TaskAwaiter`1<System.Threading.Tasks.VoidTaskResult>:get_IsCompleted"
	.asciz "System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted"

	.byte 19,197,2
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
	.quad Lme_ad

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2530=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2530
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2531=Lfde168_end - Lfde168_start
	.long LDIFF_SYM2531
Lfde168_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted

LDIFF_SYM2532=Lme_ad - System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
	.long LDIFF_SYM2532
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde168_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.TaskAwaiter`1<System.Threading.Tasks.VoidTaskResult>:OnCompleted"
	.asciz "System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action"

	.byte 19,208,2
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
	.quad Lme_ae

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2533=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2533
	.byte 2,141,16,3
	.asciz "continuation"

LDIFF_SYM2534=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2534
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2535=Lfde169_end - Lfde169_start
	.long LDIFF_SYM2535
Lfde169_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action

LDIFF_SYM2536=Lme_ae - System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
	.long LDIFF_SYM2536
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde169_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.TaskAwaiter`1<System.Threading.Tasks.VoidTaskResult>:UnsafeOnCompleted"
	.asciz "System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action"

	.byte 19,219,2
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
	.quad Lme_af

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2537=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2537
	.byte 2,141,16,3
	.asciz "continuation"

LDIFF_SYM2538=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2538
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2539=Lfde170_end - Lfde170_start
	.long LDIFF_SYM2539
Lfde170_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action

LDIFF_SYM2540=Lme_af - System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
	.long LDIFF_SYM2540
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde170_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.TaskAwaiter`1<System.Threading.Tasks.VoidTaskResult>:GetResult"
	.asciz "System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult"

	.byte 19,229,2
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult
	.quad Lme_b0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2541=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2541
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2542=Lfde171_end - Lfde171_start
	.long LDIFF_SYM2542
Lfde171_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult

LDIFF_SYM2543=Lme_b0 - System_Runtime_CompilerServices_TaskAwaiter_1_System_Threading_Tasks_VoidTaskResult_GetResult
	.long LDIFF_SYM2543
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,154,8
	.align 3
Lfde171_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_244:

	.byte 5
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable`1"

	.byte 32,16
LDIFF_SYM2544=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2544
	.byte 2,35,0,6
	.asciz "m_configuredTaskAwaiter"

LDIFF_SYM2545=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2545
	.byte 2,35,16,0,7
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable`1"

LDIFF_SYM2546=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2546
LTDIE_244_POINTER:

	.byte 13
LDIFF_SYM2547=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2547
LTDIE_244_REFERENCE:

	.byte 14
LDIFF_SYM2548=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2548
	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool"

	.byte 19,210,3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.quad Lme_b1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2549=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2549
	.byte 2,141,16,3
	.asciz "task"

LDIFF_SYM2550=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2550
	.byte 2,141,24,3
	.asciz "continueOnCapturedContext"

LDIFF_SYM2551=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2551
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2552=Lfde172_end - Lfde172_start
	.long LDIFF_SYM2552
Lfde172_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool

LDIFF_SYM2553=Lme_b1 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.long LDIFF_SYM2553
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29
	.align 3
Lfde172_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<System.Threading.Tasks.VoidTaskResult>:GetAwaiter"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter"

	.byte 19,217,3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
	.quad Lme_b2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2554=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2554
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2555=Lfde173_end - Lfde173_start
	.long LDIFF_SYM2555
Lfde173_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter

LDIFF_SYM2556=Lme_b2 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_System_Threading_Tasks_VoidTaskResult_GetAwaiter
	.long LDIFF_SYM2556
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde173_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_245:

	.byte 5
	.asciz "_ConfiguredTaskAwaiter"

	.byte 32,16
LDIFF_SYM2557=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM2557
	.byte 2,35,0,6
	.asciz "m_task"

LDIFF_SYM2558=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2558
	.byte 2,35,16,6
	.asciz "m_continueOnCapturedContext"

LDIFF_SYM2559=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2559
	.byte 2,35,24,0,7
	.asciz "_ConfiguredTaskAwaiter"

LDIFF_SYM2560=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2560
LTDIE_245_POINTER:

	.byte 13
LDIFF_SYM2561=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2561
LTDIE_245_REFERENCE:

	.byte 14
LDIFF_SYM2562=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2562
	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool"

	.byte 19,238,3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.quad Lme_b3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2563=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2563
	.byte 1,104,3
	.asciz "task"

LDIFF_SYM2564=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2564
	.byte 2,141,24,3
	.asciz "continueOnCapturedContext"

LDIFF_SYM2565=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2565
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2566=Lfde174_end - Lfde174_start
	.long LDIFF_SYM2566
Lfde174_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool

LDIFF_SYM2567=Lme_b3 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult__ctor_System_Threading_Tasks_Task_1_System_Threading_Tasks_VoidTaskResult_bool
	.long LDIFF_SYM2567
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.align 3
Lfde174_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<System.Threading.Tasks.VoidTaskResult>:get_IsCompleted"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted"

	.byte 19,247,3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
	.quad Lme_b4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2568=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2568
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2569=Lfde175_end - Lfde175_start
	.long LDIFF_SYM2569
Lfde175_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted

LDIFF_SYM2570=Lme_b4 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_get_IsCompleted
	.long LDIFF_SYM2570
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde175_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<System.Threading.Tasks.VoidTaskResult>:OnCompleted"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action"

	.byte 19,130,4
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
	.quad Lme_b5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2571=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2571
	.byte 1,105,3
	.asciz "continuation"

LDIFF_SYM2572=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2572
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2573=Lfde176_end - Lfde176_start
	.long LDIFF_SYM2573
Lfde176_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action

LDIFF_SYM2574=Lme_b5 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_OnCompleted_System_Action
	.long LDIFF_SYM2574
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde176_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<System.Threading.Tasks.VoidTaskResult>:UnsafeOnCompleted"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action"

	.byte 19,141,4
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
	.quad Lme_b6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2575=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2575
	.byte 1,105,3
	.asciz "continuation"

LDIFF_SYM2576=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2576
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2577=Lfde177_end - Lfde177_start
	.long LDIFF_SYM2577
Lfde177_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action

LDIFF_SYM2578=Lme_b6 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_UnsafeOnCompleted_System_Action
	.long LDIFF_SYM2578
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde177_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<System.Threading.Tasks.VoidTaskResult>:GetResult"
	.asciz "System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult"

	.byte 19,151,4
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult
	.quad Lme_b7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2579=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2579
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2580=Lfde178_end - Lfde178_start
	.long LDIFF_SYM2580
Lfde178_start:

	.long 0
	.align 3
	.quad System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult

LDIFF_SYM2581=Lme_b7 - System_Runtime_CompilerServices_ConfiguredTaskAwaitable_1_ConfiguredTaskAwaiter_System_Threading_Tasks_VoidTaskResult_GetResult
	.long LDIFF_SYM2581
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,154,8
	.align 3
Lfde178_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1/<>c<System.Threading.Tasks.VoidTaskResult>:.cctor"
	.asciz "System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor"

	.byte 0,0
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor
	.quad Lme_b8

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2582=Lfde179_end - Lfde179_start
	.long LDIFF_SYM2582
Lfde179_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor

LDIFF_SYM2583=Lme_b8 - System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__cctor
	.long LDIFF_SYM2583
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde179_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Threading.Tasks.VoidTaskResult>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult
	.quad Lme_bd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2584=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2584
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2585=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2585
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2586=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2586
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2587=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2587
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM2588=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2588
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM2589=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2589
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2590=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2590
	.byte 1,100,11
	.asciz "V_5"

LDIFF_SYM2591=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2591
	.byte 3,141,152,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2592=Lfde180_end - Lfde180_start
	.long LDIFF_SYM2592
Lfde180_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2593=Lme_bd - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Threading_Tasks_VoidTaskResult_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2593
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,147,22,148,21,68,149,20,150,19,68,151,18,152,17,68,153,16
	.byte 154,15
	.align 3
Lfde180_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1/<>c__DisplayClass35_1<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor"

	.byte 0,0
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor
	.quad Lme_be

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2594=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2594
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2595=Lfde181_end - Lfde181_start
	.long LDIFF_SYM2595
Lfde181_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor

LDIFF_SYM2596=Lme_be - System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__ctor
	.long LDIFF_SYM2596
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde181_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1/<>c__DisplayClass35_1<System.Threading.Tasks.VoidTaskResult>:<FromAsyncImpl>b__1"
	.asciz "System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult"

	.byte 18,223,6
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult
	.quad Lme_bf

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2597=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2597
	.byte 1,105,3
	.asciz "iar"

LDIFF_SYM2598=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2598
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2599=Lfde182_end - Lfde182_start
	.long LDIFF_SYM2599
Lfde182_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult

LDIFF_SYM2600=Lme_bf - System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_1_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__1_System_IAsyncResult
	.long LDIFF_SYM2600
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde182_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1/<>c__DisplayClass35_0<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor"

	.byte 0,0
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor
	.quad Lme_c0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2601=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2601
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2602=Lfde183_end - Lfde183_start
	.long LDIFF_SYM2602
Lfde183_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor

LDIFF_SYM2603=Lme_c0 - System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__ctor
	.long LDIFF_SYM2603
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde183_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.TaskFactory`1/<>c__DisplayClass35_0<System.Threading.Tasks.VoidTaskResult>:<FromAsyncImpl>b__0"
	.asciz "System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult"

	.byte 18,209,6
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult
	.quad Lme_c1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2604=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2604
	.byte 1,105,3
	.asciz "iar"

LDIFF_SYM2605=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2605
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2606=Lfde184_end - Lfde184_start
	.long LDIFF_SYM2606
Lfde184_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult

LDIFF_SYM2607=Lme_c1 - System_Threading_Tasks_TaskFactory_1__c__DisplayClass35_0_System_Threading_Tasks_VoidTaskResult__FromAsyncImplb__0_System_IAsyncResult
	.long LDIFF_SYM2607
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8
	.align 3
Lfde184_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_246:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM2608=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM2608
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM2609=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2609
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM2610=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2610
LTDIE_246_POINTER:

	.byte 13
LDIFF_SYM2611=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2611
LTDIE_246_REFERENCE:

	.byte 14
LDIFF_SYM2612=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2612
	.byte 2
	.asciz "System.Threading.Tasks.Task`1<TResult_REF>:.ctor"
	.asciz "System_Threading_Tasks_Task_1_TResult_REF__ctor"

	.byte 17,91
	.quad System_Threading_Tasks_Task_1_TResult_REF__ctor
	.quad Lme_c2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2613=LTDIE_246_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2613
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2614=Lfde185_end - Lfde185_start
	.long LDIFF_SYM2614
Lfde185_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1_TResult_REF__ctor

LDIFF_SYM2615=Lme_c2 - System_Threading_Tasks_Task_1_TResult_REF__ctor
	.long LDIFF_SYM2615
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde185_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_247:

	.byte 5
	.asciz "_<>c"

	.byte 16,16
LDIFF_SYM2616=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2616
	.byte 2,35,0,0,7
	.asciz "_<>c"

LDIFF_SYM2617=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2617
LTDIE_247_POINTER:

	.byte 13
LDIFF_SYM2618=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2618
LTDIE_247_REFERENCE:

	.byte 14
LDIFF_SYM2619=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2619
	.byte 2
	.asciz "System.Threading.Tasks.Task`1/<>c<System.Threading.Tasks.VoidTaskResult>:.ctor"
	.asciz "System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor"

	.byte 0,0
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor
	.quad Lme_c3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2620=LTDIE_247_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2620
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2621=Lfde186_end - Lfde186_start
	.long LDIFF_SYM2621
Lfde186_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor

LDIFF_SYM2622=Lme_c3 - System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult__ctor
	.long LDIFF_SYM2622
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde186_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Threading.Tasks.Task`1/<>c<System.Threading.Tasks.VoidTaskResult>:<.cctor>b__64_0"
	.asciz "System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task"

	.byte 17,87
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.quad Lme_c4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2623=LTDIE_247_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2623
	.byte 2,141,24,3
	.asciz "completed"

LDIFF_SYM2624=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2624
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2625=Lfde187_end - Lfde187_start
	.long LDIFF_SYM2625
Lfde187_start:

	.long 0
	.align 3
	.quad System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task

LDIFF_SYM2626=Lme_c4 - System_Threading_Tasks_Task_1__c_System_Threading_Tasks_VoidTaskResult___cctorb__64_0_System_Threading_Tasks_Task_1_System_Threading_Tasks_Task
	.long LDIFF_SYM2626
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde187_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:

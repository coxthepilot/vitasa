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
	.asciz "Mono AOT Compiler 5.14.0 (explicit/000780ca82c Wed Dec  5 11:43:50 EST 2018)"
	.asciz "Xamarin.Forms.Maps.iOS.dll"
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
	.no_dead_strip Xamarin_FormsMaps_get_IsiOs8OrNewer
Xamarin_FormsMaps_get_IsiOs8OrNewer:
.file 1 "<unknown>"
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #200]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #208]
.word 0x39400400
.word 0x35000360
bl _p_1
.word 0xaa0003e3
.word 0xaa0303e0
.word 0xd2800101
.word 0xd2800002
.word 0x3940007e
bl _p_2
.word 0x53001c01
.word 0x390063bf
.word 0x390067bf
.word 0x910063a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_3
.word 0x398063a0
.word 0x390043a0
.word 0x398067a0
.word 0x390047a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #200]
.word 0x398043a1
.word 0x39000001
.word 0x398047a1
.word 0x39000401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #200]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_4
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_0:
.text
	.align 4
	.no_dead_strip Xamarin_FormsMaps_get_IsiOs9OrNewer
Xamarin_FormsMaps_get_IsiOs9OrNewer:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #216]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #208]
.word 0x39400400
.word 0x35000360
bl _p_1
.word 0xaa0003e3
.word 0xaa0303e0
.word 0xd2800121
.word 0xd2800002
.word 0x3940007e
bl _p_2
.word 0x53001c01
.word 0x390063bf
.word 0x390067bf
.word 0x910063a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_3
.word 0x398063a0
.word 0x390043a0
.word 0x398067a0
.word 0x390047a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #216]
.word 0x398043a1
.word 0x39000001
.word 0x398047a1
.word 0x39000401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #216]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_4
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1:
.text
	.align 4
	.no_dead_strip Xamarin_FormsMaps_get_IsiOs10OrNewer
Xamarin_FormsMaps_get_IsiOs10OrNewer:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #224]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #208]
.word 0x39400400
.word 0x35000360
bl _p_1
.word 0xaa0003e3
.word 0xaa0303e0
.word 0xd2800141
.word 0xd2800002
.word 0x3940007e
bl _p_2
.word 0x53001c01
.word 0x390063bf
.word 0x390067bf
.word 0x910063a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_3
.word 0x398063a0
.word 0x390043a0
.word 0x398067a0
.word 0x390047a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #224]
.word 0x398043a1
.word 0x39000001
.word 0x398047a1
.word 0x39000401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #224]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_4
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2:
.text
	.align 4
	.no_dead_strip Xamarin_FormsMaps_Init
Xamarin_FormsMaps_Init:
.loc 1 1 0
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #232]
.word 0x39400000
.word 0x350000e0
bl _p_5

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #232]
.word 0xd280003e
.word 0x3900001e
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_3:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapPool_get_Instance
Xamarin_Forms_Maps_iOS_MapPool_get_Instance:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #240]
.word 0xf9400000
.word 0xaa0003fa
.word 0xb50001e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xd2800301
bl _p_6
.word 0xf90013a0
bl _p_7
.word 0xf94013a2
.word 0xaa0203e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #240]
.word 0xf9000022
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_4:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView
Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
bl _p_8
.word 0xf9400802
.word 0xaa0203e0
.word 0xf9400ba1
.word 0x3940005e
bl _p_9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_5:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapPool_Get
Xamarin_Forms_Maps_iOS_MapPool_Get:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bbf
bl _p_8
.word 0xf9400802
.word 0x910043a1
.word 0xaa0203e0
.word 0x3940005e
bl _p_10
.word 0x53001c00
.word 0x35000060
.word 0xd2800000
.word 0x14000002
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_6:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapPool__ctor
Xamarin_Forms_Maps_iOS_MapPool__ctor:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #256]
.word 0xd2800501
bl _p_6
.word 0xf90013a0
bl _p_11
.word 0xf94013a0
.word 0xf9400ba1
.word 0xf9000820
.word 0x91004021
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_7:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double
Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xfd002fa0
.word 0xfd0033a1
.word 0xf9402ba0
.word 0xf9406c00
.word 0xfd402fa0
.word 0xfd4033a1
.word 0x910043a1
.word 0xf90037a1
.word 0xd280001e
.word 0xf2f7fe1e
.word 0x9e6703c2
.word 0xd280001e
.word 0xf2f7fe1e
.word 0x9e6703c3
bl _p_12
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0xfd400ba0
.word 0xfd400fa1
.word 0xfd4013a2
.word 0xfd4017a3
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_8:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime
Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
bl _p_13
.word 0x53001c00
.word 0xd2800001
.word 0x6b01001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_9:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool
Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xaa0003f9
.word 0xf90017a1
.word 0xf9001bbf
.word 0x3943e720
.word 0x350023a0
.word 0xd280003e
.word 0x3903e73e
.word 0x3940a3a0
.word 0x340022c0
.word 0xf9403f20
.word 0xb4001640
.word 0xf9403f38
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x540022c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #272]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #280]
.word 0xaa1903e0
bl _p_14
.word 0x3940031e
.word 0xf940bf17
.word 0xb4000177
.word 0xf94002e0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #288]
.word 0xeb01001f
.word 0x10000011
.word 0x54002021
.word 0xeb1f033f
.word 0x10000011
.word 0x54001f60

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #296]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54001de0
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #304]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1703e0
.word 0x394002fe
bl _p_15
.word 0x3940031e
.word 0xf940bf01
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #328]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001ba0
.word 0x14000038
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #336]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90033a0
.word 0xeb1f033f
.word 0x10000011
.word 0x54001700

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xf94033a2
.word 0xeb1f033f
.word 0x10000011
.word 0x54001560
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa0203e0
.word 0x3940005e
bl _p_16
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff7c0
.word 0xf9001fbf
.word 0x94000005
.word 0xf9401fa0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf9002bbe
.word 0xf9401ba0
.word 0xb4000160
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402bbe
.word 0xd61f03c0
.word 0xf9406f38
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000ca1
.word 0xaa1803f7
.word 0xeb1f033f
.word 0x10000011
.word 0x54000bc0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #400]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54000a40
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #408]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #424]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1803e0
.word 0x3940031e
bl _p_18
.word 0xaa1803e0
.word 0xd2800001
.word 0x3940031e
bl _p_19
.word 0xaa1803e0
.word 0x3940031e
bl _p_20
.word 0xb4000240
.word 0xaa1703e0
.word 0x394002fe
bl _p_20
.word 0xaa0003e1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa1703e0
.word 0xd2800001
.word 0x394002fe
bl _p_21
.word 0xaa1703e0
.word 0xf94002e1
.word 0xf941ec30
.word 0xd63f0200
bl _p_13
.word 0x53001c00
.word 0x34000060
.word 0xaa1703e0
bl _p_22
.word 0xf9407720
.word 0xb40000c0
.word 0xf9407721
.word 0xaa0103e0
.word 0x3940003e
bl _p_23
.word 0xf900773f
.word 0xf9007b3f
.word 0xaa1903e0
.word 0x3940a3a1
bl _p_24
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9002bbf
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_26
.word 0x3940035e
.word 0xf9400f40
.word 0xb4001660
.word 0x3940035e
.word 0xf9400f58
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x540036c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #272]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #280]
.word 0xaa1903e0
bl _p_14
.word 0x3940031e
.word 0xf940bf17
.word 0xb4000177
.word 0xf94002e0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #288]
.word 0xeb01001f
.word 0x10000011
.word 0x54003421
.word 0xeb1f033f
.word 0x10000011
.word 0x54003480

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #296]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54003300
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #304]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1703e0
.word 0x394002fe
bl _p_15
.word 0x3940031e
.word 0xf940bf01
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #328]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9002ba0
.word 0x14000038
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #336]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90043a0
.word 0xeb1f033f
.word 0x10000011
.word 0x54002c20

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xf94043a2
.word 0xeb1f033f
.word 0x10000011
.word 0x54002a80
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa0203e0
.word 0x3940005e
bl _p_16
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff7c0
.word 0xf9002fbf
.word 0x94000005
.word 0xf9402fa0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf9003bbe
.word 0xf9402ba0
.word 0xb4000160
.word 0xf9402ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9403bbe
.word 0xd61f03c0
.word 0x3940035e
.word 0xf9400b40
.word 0xb4002120
.word 0x3940035e
.word 0xf9400b58
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54002021
.word 0xaa1803fa
.word 0xf9406f20
.word 0xb5000c00
.word 0xd2800018
bl _p_13
.word 0x53001c00
.word 0x34000060
bl _p_27
.word 0xaa0003f8
.word 0xb5000318

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #432]
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400401
.word 0xf9001fa1
.word 0xf9400801
.word 0xf90023a1
.word 0xf9400c00
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #440]
bl _p_28
.word 0xf90043a0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd4023a2
.word 0xfd4027a3
bl _p_29
.word 0xf94043a0
.word 0xaa0003f8
.word 0xaa1903e0
.word 0xaa1803e1
bl _p_30

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #448]
.word 0xaa1903e0
bl _p_31
.word 0xf90047a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #456]
.word 0xd2800e01
bl _p_6
.word 0xf94047a2
.word 0xf90043a0
.word 0xaa1903e1
bl _p_32
.word 0xf94043a1
.word 0xaa1803e0
.word 0x3940031e
bl _p_19
.word 0xeb1f033f
.word 0x10000011
.word 0x540019a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #400]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54001820
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #408]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #424]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1803e0
.word 0x3940031e
bl _p_33

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #272]
.word 0xf90043a0
.word 0xeb1f033f
.word 0x10000011
.word 0x540013c0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #464]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e2
.word 0xf94043a1
.word 0xeb1f033f
.word 0x10000011
.word 0x54001220
.word 0xf9001059
.word 0x91008040
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xf9001440

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #480]
.word 0xf9002040

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #488]
.word 0xf9401403
.word 0xf9000c43
.word 0xf9401000
.word 0xf9000840
.word 0x3901805f

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #496]
.word 0xaa1903e0
.word 0xaa1a03e3
bl _p_34
.word 0x3940035e
.word 0xf940c740
.word 0xd2800001
bl _p_35
.word 0x53001c00
.word 0x340000c0
.word 0x3940035e
.word 0xf940c741
.word 0xaa1903e0
.word 0xd2800002
bl _p_36
.word 0xaa1903e0
bl _p_37
.word 0xaa1903e0
bl _p_38
.word 0xaa1903e0
bl _p_39
.word 0xaa1903e0
bl _p_40
.word 0x3940035e
.word 0xf940bf58
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #288]
.word 0xeb01001f
.word 0x10000011
.word 0x54000981
.word 0xeb1f033f
.word 0x10000011
.word 0x540009e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #296]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54000860
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #304]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1803e0
.word 0x3940031e
bl _p_41
.word 0xf9403f3a
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x540002a1
.word 0x3940035e
.word 0xf940bf40
.word 0xf90043a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #504]
.word 0xd2800601
bl _p_6
.word 0xf90047a0
.word 0xd2800081
bl _p_42
.word 0xf94043a1
.word 0xf94047a2
.word 0xaa1903e0
bl _p_43
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fba
.word 0xaa0003f8
.word 0xf90013a1
.word 0xaa0203fa
.word 0xaa1803e0
.word 0xf94013a1
.word 0xaa1a03e2
bl _p_44
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #512]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000080
.word 0xaa1803e0
bl _p_37
.word 0x1400004e
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #520]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000080
.word 0xaa1803e0
bl _p_38
.word 0x1400003f
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #528]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000080
.word 0xaa1803e0
bl _p_39
.word 0x14000030
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #536]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000080
.word 0xaa1803e0
bl _p_40
.word 0x14000021
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #544]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x340002a0
.word 0xf9403f1a
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x540001c1
.word 0x3940035e
.word 0xf940c740
.word 0xd2800001
bl _p_35
.word 0x53001c00
.word 0x34000060
.word 0xd280003e
.word 0x3903e31e
.word 0xf9400bb8
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews
Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_46
.word 0xf9400ba0
bl _p_47
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin
Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xf9001ba0
.word 0xaa0103fa
.word 0xd2800000
.word 0xf9002fa0
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #552]
bl _p_28
.word 0xf9004ba0
bl _p_48
.word 0xf9404ba0
.word 0xf90047a0
.word 0xf90043a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_49
.word 0xaa0003e1
.word 0xf94047a2
.word 0xaa0203e0
.word 0x3940005e
bl _p_50
.word 0xf94043a0
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_51
.word 0xf9403ba2
.word 0xf9403fa3
.word 0xaa0003e1
.word 0xaa0303f9
.word 0xaa0203f8
.word 0xaa0103f7
.word 0xb5000080

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x23, [x16, #560]
.word 0xaa1803e0
.word 0xaa1703e1
.word 0x3940031e
bl _p_52
.word 0x910163a0
.word 0xf90037a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_53
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd402fa0
.word 0xfd004fa0
.word 0x910163a0
.word 0xf90037a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_53
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd404fa1
.word 0xfd4033a0
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xfd0027a1
.word 0xfd002ba0
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf9402ba0
.word 0xf90023a0
.word 0xaa1903e0
.word 0xfd401fa0
.word 0xfd4023a1
.word 0x3940033e
bl _p_54
.word 0xaa1903e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa9026bb9
.word 0xf9001ba0
.word 0xaa0103f9
.word 0xaa0203fa
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #568]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
bl _p_55
.word 0xaa0003f7
.word 0xaa1703f6
.word 0xeb1f02ff
.word 0x54000160
.word 0xf94002e0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800016
.word 0xb4000076
.word 0xd2800000
.word 0x14000026

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #584]
.word 0xaa1903e0
.word 0x3940033e
bl _p_56
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xb5000280

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #584]
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #592]
bl _p_28
.word 0xf94027a2
.word 0xf90023a0
.word 0xaa1a03e1
bl _p_57
.word 0xf94023a0
.word 0xaa0003f9
.word 0xaa1903e2
.word 0xaa0203e0
.word 0xd2800021
.word 0x3940005e
bl _p_58
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0x3940033e
bl _p_59
.word 0xf9401ba0
.word 0xaa1903e1
.word 0xaa1a03e2
bl _p_60
.word 0xaa1903e0
.word 0xa9415fb6
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation
Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #600]
.word 0xd2800401
bl _p_6
.word 0xaa0003f7
.word 0xf9000818
.word 0x91004001
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9000c1a
.word 0x91006000
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xaa1903e0
.word 0x3940033e
bl _p_61
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0xb40002a0
.word 0xaa1a03f8
.word 0xd280001a
.word 0x1400000f
.word 0x93407f40
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000fa9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1903e0
.word 0xaa1603e1
.word 0x3940033e
bl _p_62
.word 0x1100075a
.word 0xb9801b00
.word 0x6b00035f
.word 0x54fffe0b
.word 0xeb1f02ff
.word 0x10000011
.word 0x54000d60

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #608]
.word 0xd2800e01
bl _p_6
.word 0xeb1f02ff
.word 0x10000011
.word 0x54000c00
.word 0xf9001017
.word 0x91008001
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #616]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #624]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #632]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901801f
.word 0xf9002fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #640]
bl _p_28
.word 0xf9402fa1
.word 0xf9002ba0
bl _p_63
.word 0xf9402ba0
.word 0xf90027a0
.word 0xf90023a0
.word 0xeb1f02ff
.word 0x10000011
.word 0x54000720

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #648]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xf94027a2
.word 0xeb1f02ff
.word 0x10000011
.word 0x54000580
.word 0xf9001037
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #656]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #664]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #672]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa0203e0
.word 0x3940005e
bl _p_64
.word 0xf94023a0
.word 0xaa0003fa
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0x3940033e
bl _p_65
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_10:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer
Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001ba2
.word 0xf9001fbf
.word 0xb400031a
.word 0xf9400340
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #680]
.word 0xeb02003f
.word 0x10000011
.word 0x54001183
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #680]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x54000fa0
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #568]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
bl _p_55
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0xb4000d60
.word 0xd2800018
.word 0xf9403f37
.word 0xb4000177
.word 0xf94002e0
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000c61
.word 0x394002fe
.word 0xf940bee1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #328]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001fa0
.word 0x14000019
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #336]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f7
.word 0xaa1703e0
.word 0xaa0003e1
.word 0x3940003e
.word 0xf9402000
.word 0xeb1a001f
.word 0x54000101
.word 0xaa1703f8
.word 0xf90023bf
.word 0x94000017
.word 0xf94023a0
.word 0xb4000040
bl _p_17
.word 0x14000022
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffba0
.word 0xf90023bf
.word 0x94000005
.word 0xf94023a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf9002fbe
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402fbe
.word 0xd61f03c0
.word 0xaa1803e0
.word 0xd2800001
bl _p_66
.word 0x53001c00
.word 0x35000260
.word 0xf9407b3a
.word 0xaa1a03f9
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #688]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800019
.word 0xb5000099
.word 0xaa1803e0
.word 0x3940031e
bl _p_67
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_11:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion
Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0x3943e340
.word 0x34000260
.word 0xf9403f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000161
.word 0x3940033e
.word 0xf940c721
.word 0xaa1a03e0
.word 0xd2800002
bl _p_36
.word 0x3903e35f
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_12:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList
Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf90017bf
.word 0xf9001bbf
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #696]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90017a0
.word 0x14000066
.word 0xf94017a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #704]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #712]
.word 0xeb01001f
.word 0x10000011
.word 0x54001341
.word 0xaa1a03f8
.word 0xeb1f033f
.word 0x10000011
.word 0x54001380

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54001200
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1a03e0
.word 0x3940035e
bl _p_68
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xf9400322
.word 0xf942a850
.word 0xd63f0200
.word 0xaa0003fa
.word 0x3940031e
.word 0xf900231a
.word 0x91010300
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xf9406f38
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x540009e1
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0x3940031e
bl _p_69
.word 0xf94017a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff200
.word 0xf9001fbf
.word 0x94000005
.word 0xf9401fa0
.word 0xb4000040
bl _p_17
.word 0x14000034
.word 0xf90037be
.word 0xf94017a0
.word 0xf90023a0
.word 0xf94023a0
.word 0xf90027a0
.word 0xf94023a0
.word 0xeb1f001f
.word 0x54000380
.word 0xf94023a0
.word 0xf9400000
.word 0xf9002ba0
.word 0xf9402ba0
.word 0xb9402800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #720]
.word 0xeb01001f
.word 0x540001e3
.word 0xf9402ba0
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #720]
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
.word 0xf90027bf
.word 0x14000001
.word 0xf94027a0
.word 0xf9001ba0
.word 0xf9401ba0
.word 0xb4000160
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94037be
.word 0xd61f03c0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_13:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs:
.loc 1 1 0
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xf9001ba0
.word 0xaa0103f9
.word 0xaa0203fa
.word 0xd2800000
.word 0xf9002fa0
.word 0xf90033a0
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #712]
.word 0xeb01001f
.word 0x10000011
.word 0x54000dc1
.word 0xaa1903f8
.word 0x3940033e
.word 0xf9402339
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x54000160
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #728]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800017
.word 0xaa1703f9
.word 0xb4000af7
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #736]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000120
.word 0xaa1803e0
.word 0x3940031e
bl _p_49
.word 0xaa0003e1
.word 0xaa1903e0
.word 0x3940033e
bl _p_50
.word 0x14000043
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #744]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000120
.word 0xaa1803e0
.word 0x3940031e
bl _p_51
.word 0xaa0003e1
.word 0xaa1903e0
.word 0x3940033e
bl _p_52
.word 0x1400002f
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #752]
.word 0xf9400021
.word 0xaa0103e2
.word 0x3940005e
.word 0xf9401021
bl _p_45
.word 0x53001c00
.word 0x34000460
.word 0x910163a0
.word 0xf90037a0
.word 0xaa1803e0
.word 0x3940031e
bl _p_53
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd402fa0
.word 0xfd003ba0
.word 0x910163a0
.word 0xf90037a0
.word 0xaa1803e0
.word 0x3940031e
bl _p_53
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd403ba1
.word 0xfd4033a0
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xfd0027a1
.word 0xfd002ba0
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf9402ba0
.word 0xf90023a0
.word 0xaa1903e0
.word 0xfd401fa0
.word 0xfd4023a1
.word 0x3940033e
bl _p_54
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_14:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs
Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs:
.loc 1 1 0
.word 0xa9ac7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf90017a1
.word 0xf9001ba2
.word 0xf9403f40
.word 0xb4000f20
.word 0xf9403f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000e41
.word 0xaa1903f8
.word 0xf9406f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000ca1
.word 0xaa1903fa
.word 0x9103e3a0
.word 0xf9008fa0
.word 0xaa1903e0
.word 0x3940033e
bl _p_70
.word 0xf9408fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0x9103e3a0
.word 0xf9400001
.word 0xf90077a1
.word 0xf9400400
.word 0xf9007ba0
.word 0xfd4077a0
.word 0xfd009fa0
.word 0x910323a0
.word 0xf9008fa0
.word 0xaa1903e0
.word 0x3940033e
bl _p_70
.word 0xf9408fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0xfd409fa0
.word 0x910323a0
.word 0xf9400001
.word 0xf9005fa1
.word 0xf9400400
.word 0xf90063a0
.word 0xfd4063a1
.word 0xd2800000
.word 0xf90057a0
.word 0xf9005ba0
.word 0x9102a3a0
bl _p_71
.word 0xf94057a0
.word 0xf9001fa0
.word 0xf9405ba0
.word 0xf90023a0
.word 0x910223a0
.word 0xf9008fa0
.word 0xaa1903e0
.word 0x3940033e
bl _p_70
.word 0xf9408fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0x910223a0
.word 0x91004000
.word 0xf9400001
.word 0xf9003fa1
.word 0xf9400400
.word 0xf90043a0
.word 0xfd403fa0
.word 0xfd0097a0
.word 0x910163a0
.word 0xf9008fa0
.word 0xaa1903e0
.word 0x3940033e
bl _p_70
.word 0xf9408fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd000bc2
.word 0xfd000fc3
.word 0x910163a0
.word 0x91004000
.word 0xf9400001
.word 0xf90027a1
.word 0xf9400400
.word 0xf9002ba0
.word 0xfd402ba0
.word 0xfd009ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #760]
.word 0xd2800601
bl _p_6
.word 0xfd4097a2
.word 0xfd409ba3
.word 0xf90093a0
.word 0xfd401fa0
.word 0xfd4023a1
bl _p_72
.word 0xf94093a1
.word 0xaa1803e0
.word 0x3940031e
bl _p_73
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8d47bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_15:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool
Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool:
.loc 1 1 0
.word 0xa9b47bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xaa0103f9
.word 0xf90013a2
.word 0xd2800000
.word 0xf90057a0
.word 0xf9005ba0
.word 0xd2800000
.word 0xf90047a0
.word 0xf9004ba0
.word 0xf9004fa0
.word 0xf90053a0
.word 0x3940033e
.word 0x91004320
.word 0xf9400001
.word 0xf90057a1
.word 0xf9400400
.word 0xf9005ba0
.word 0x910223a0
.word 0xfd4057a0
.word 0x1e604001
.word 0xfd405ba0
.word 0xd2800001
.word 0xf9003fa1
.word 0xf90043a1
.word 0xfd003fa1
.word 0xfd0043a0
.word 0xf9403fa1
.word 0xf9002fa1
.word 0xf94043a1
.word 0xf90033a1
.word 0x3940033e
.word 0xfd401320
.word 0x1e604001
.word 0x3940033e
.word 0xfd401720
.word 0xd2800001
.word 0xf90037a1
.word 0xf9003ba1
.word 0xfd0037a1
.word 0xfd003ba0
.word 0xf94037a1
.word 0xf90027a1
.word 0xf9403ba1
.word 0xf9002ba1
.word 0xf9402fa1
.word 0xf90047a1
.word 0xf94033a1
.word 0xf9004ba1
.word 0x91004000
.word 0xf94027a1
.word 0xf9000001
.word 0xf9402ba1
.word 0xf9000401
.word 0xf9400fa0
.word 0xf9406c19
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x540002a1
.word 0xf94047a0
.word 0xf90017a0
.word 0xf9404ba0
.word 0xf9001ba0
.word 0xf9404fa0
.word 0xf9001fa0
.word 0xf94053a0
.word 0xf90023a0
.word 0xaa1903e0
.word 0xfd4017a0
.word 0xfd401ba1
.word 0xfd401fa2
.word 0xfd4023a3
.word 0x394083a1
.word 0x3940033e
bl _p_74
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_16:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xf90017a1
.word 0xaa0203fa
.word 0x3940035e
.word 0xb9802358
.word 0xd28000be
.word 0x6b1e031f
.word 0x54000ce2
.word 0xd37df300
.word 0x2a0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #768]
.word 0x8b010000
.word 0xf9400000
.word 0xd61f0000
.word 0x3940035e
.word 0xf9400b41
.word 0xaa1903e0
bl _p_75
.word 0x1400005a
.word 0x3940035e
.word 0xf9400f41
.word 0xaa1903e0
bl _p_76
.word 0x14000055
.word 0x3940035e
.word 0xf9400f41
.word 0xaa1903e0
bl _p_76
.word 0x3940035e
.word 0xf9400b41
.word 0xaa1903e0
bl _p_75
.word 0x1400004c
.word 0xf9406f3a
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x540008a1
.word 0xaa1a03f8
.word 0xaa1a03e0
.word 0x3940035e
bl _p_77
.word 0xaa0003fa
.word 0xb5000060
.word 0xd280001a
.word 0x14000005
.word 0xb9801b40
.word 0xd2800001
.word 0x6b01001f
.word 0x9a9f97fa
.word 0x3400011a
.word 0xaa1803e0
.word 0x3940031e
bl _p_77
.word 0xaa0003e1
.word 0xaa1803e0
.word 0x3940031e
bl _p_78
.word 0xf9403f3a
.word 0xaa1a03f8
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0x3940031e
.word 0xf940bf1a
.word 0xb400031a
.word 0xf9400340
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #776]
.word 0xeb02003f
.word 0x10000011
.word 0x54000303
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #776]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x54000120
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_75
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_17:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList
Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList:
.loc 1 1 0
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001bbf
.word 0xf9001fbf
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #696]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001ba0
.word 0x1400006f
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #704]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #712]
.word 0xeb01001f
.word 0x10000011
.word 0x54001461
.word 0xaa1a03f8
.word 0xeb1f033f
.word 0x10000011
.word 0x540014a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1
.word 0xeb1f033f
.word 0x10000011
.word 0x54001320
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f
.word 0xaa1a03e0
.word 0x3940035e
bl _p_16
.word 0xf9406f3a
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000d61
.word 0xaa1a03f7
.word 0x3940031e
.word 0xf940231a
.word 0xb400033a
.word 0xf9400340
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #680]
.word 0xeb02003f
.word 0x10000011
.word 0x54000be3
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #680]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x54000a00
.word 0x14000001
.word 0xaa1703e0
.word 0xaa1a03e1
.word 0x394002fe
bl _p_79
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff0e0
.word 0xf90023bf
.word 0x94000005
.word 0xf94023a0
.word 0xb4000040
bl _p_17
.word 0x14000034
.word 0xf9003bbe
.word 0xf9401ba0
.word 0xf90027a0
.word 0xf94027a0
.word 0xf9002ba0
.word 0xf94027a0
.word 0xeb1f001f
.word 0x54000380
.word 0xf94027a0
.word 0xf9400000
.word 0xf9002fa0
.word 0xf9402fa0
.word 0xb9402800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #720]
.word 0xeb01001f
.word 0x540001e3
.word 0xf9402fa0
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #720]
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
.word 0xf9002bbf
.word 0x14000001
.word 0xf9402ba0
.word 0xf9001fa0
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9403bbe
.word 0xd61f03c0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_18:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled
Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013a0
.word 0xf94013a0
.word 0xf9406c19
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000341
.word 0xaa1903f8
.word 0xf94013a0
.word 0xf9403c19
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000181
.word 0xaa1903e0
.word 0x3940033e
bl _p_80
.word 0x53001c01
.word 0xaa1803e0
.word 0x3940031e
bl _p_81
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_19:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled
Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013a0
.word 0xf94013a0
.word 0xf9406c19
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000341
.word 0xaa1903f8
.word 0xf94013a0
.word 0xf9403c19
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000181
.word 0xaa1903e0
.word 0x3940033e
bl _p_82
.word 0x53001c01
.word 0xaa1803e0
.word 0x3940031e
bl _p_83
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_1a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser
Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
bl _p_84
.word 0x53001c00
.word 0x34000520
.word 0xf9403f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000841
.word 0xaa1903e0
.word 0x3940033e
bl _p_85
.word 0x53001c00
.word 0x34000300

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #784]
bl _p_28
.word 0xf9001ba0
bl _p_86
.word 0xf9401ba0
.word 0xf9007740
.word 0x9103a341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9407741
.word 0xaa0103e0
.word 0x3940003e
bl _p_87
.word 0xf9406f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000341
.word 0xaa1903f8
.word 0xf9403f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x540001a1
.word 0xaa1903e0
.word 0x3940033e
bl _p_85
.word 0x53001c01
.word 0xaa1803e0
.word 0x3940031e
bl _p_88
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_1b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType
Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf9403f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xeb01001f
.word 0x10000011
.word 0x54000921
.word 0xaa1903e0
.word 0x3940033e
bl _p_89
.word 0x93407c00
.word 0xaa0003f9
.word 0xaa1903f8
.word 0xd280007e
.word 0x6b1e031f
.word 0x54000762
.word 0xd37df300
.word 0x2a0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #792]
.word 0x8b010000
.word 0xf9400000
.word 0xd61f0000
.word 0xf9406f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000581
.word 0xaa1903e0
.word 0xd2800001
.word 0x3940033e
bl _p_90
.word 0x14000022
.word 0xf9406f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000361
.word 0xaa1903e0
.word 0xd2800021
.word 0x3940033e
bl _p_90
.word 0x14000011
.word 0xf9406f59
.word 0xb4000179
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #392]
.word 0xeb01001f
.word 0x10000011
.word 0x54000141
.word 0xaa1903e0
.word 0xd2800041
.word 0x3940033e
bl _p_90
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_1c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer__ctor
Xamarin_Forms_Maps_iOS_MapRenderer__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_91
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf94013a1
.word 0xd2800022
bl _p_36
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_1e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend_Register
Xamarin_Forms_Maps_iOS_GeocoderBackend_Register:
.loc 1 1 0
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #800]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #808]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #816]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #824]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #832]
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #840]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #848]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #856]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #864]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901803f

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #872]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_1f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #880]
.word 0xd2800301
bl _p_6
.word 0xf90043a0
.word 0xf9003ba0
.word 0xfd400ba0
.word 0xfd004ba0
.word 0xfd400fa0
.word 0xfd004fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #888]
bl _p_28
.word 0xfd404ba0
.word 0xfd404fa1
.word 0xf90047a0
bl _p_92
.word 0xf94047a0
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #896]
bl _p_28
.word 0xf90037a0
bl _p_93

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #904]
.word 0xd2800301
bl _p_6
.word 0xf9003fa0
bl _p_94
.word 0xf9403ba0
.word 0xf9403fa1
.word 0xf94043a2
.word 0xf9000841
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xf9002fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000700

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e2
.word 0xf9402fa0
.word 0xf94033a1
.word 0xf94037a3
.word 0xeb1f001f
.word 0x10000011
.word 0x54000520
.word 0xf9001040
.word 0x91008044
.word 0xd349fc84
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0084

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x5, [x16, #16]
.word 0x8b050084
.word 0xd280003e
.word 0x3900009e
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #920]
.word 0xf9001440

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #928]
.word 0xf9002040

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #936]
.word 0xf9401404
.word 0xf9000c44
.word 0xf9401000
.word 0xf9000840
.word 0x3901805f
.word 0xaa0303e0
.word 0x3940007e
bl _p_95
.word 0xf9402ba0
.word 0xf9400800
.word 0xaa0003e1
.word 0x3940003e
.word 0xf9400800
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_20:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string
Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #944]
.word 0xd2800301
bl _p_6
.word 0xf90027a0
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #896]
bl _p_28
.word 0xf9001ba0
bl _p_93

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xd2800301
bl _p_6
.word 0xf90023a0
bl _p_96
.word 0xf9401fa0
.word 0xf94023a1
.word 0xf94027a2
.word 0xf9000841
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xf90017a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000700

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xd2800e01
bl _p_6
.word 0xaa0003e2
.word 0xf94017a0
.word 0xf9401ba3
.word 0xeb1f001f
.word 0x10000011
.word 0x54000540
.word 0xf9001040
.word 0x91008041
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040021
.word 0xd280003e
.word 0x3900003e
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #960]
.word 0xf9001440

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #968]
.word 0xf9002040

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #976]
.word 0xf9401401
.word 0xf9000c41
.word 0xf9401000
.word 0xf9000840
.word 0x3901805f
.word 0xaa0303e0
.word 0xf9400ba1
.word 0x3940007e
bl _p_97
.word 0xf94013a0
.word 0xf9400800
.word 0xaa0003e1
.word 0x3940003e
.word 0xf9400800
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_21:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor
Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_22:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor
Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_23:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer
Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba1
.word 0xf9400820
.word 0xf9400c21
.word 0xf9400fa2
bl _p_98
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_24:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch
Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400800
.word 0xf9001ba0
.word 0xf94013a0
.word 0xf94013a1
.word 0x3940003e
bl _p_99
.word 0xf9401ba1
.word 0xf9007820
.word 0x9103c021
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xd2800020
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_25:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_26:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fba
.word 0xf90013a0
.word 0xaa0103fa
.word 0xf90017a2
.word 0xb50000fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xd2800001
bl _p_100
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #992]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1000]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f8

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1008]
.word 0xf9400000
.word 0xaa0003e1
.word 0xaa1a03f8
.word 0xaa0103fa
.word 0xb5000660

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9400000
.word 0xf9001ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000880

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1024]
.word 0xd2800e01
bl _p_6
.word 0xf9401ba1
.word 0xeb1f003f
.word 0x10000011
.word 0x54000700
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1032]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1040]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1048]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901801f

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1008]
.word 0xf9000020
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1056]
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_101

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1064]
bl _p_102
.word 0xaa0003f8
.word 0xf94013a0
.word 0xf9400802
.word 0xaa0203e0
.word 0xaa1803e1
.word 0x3940005e
bl _p_103
.word 0xf9400bb8
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_27:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor:
.loc 1 1 0
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1072]
.word 0xd2800201
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_28:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_29:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa0
.word 0xf9400fa1
.word 0x3940003e
bl _p_104
.word 0xd2800001
bl _p_105
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9002fa0
.word 0xaa0103fa
.word 0xaa1a03e0
.word 0x3940035e
bl _p_106
.word 0xaa0003e1
.word 0x910203a0
.word 0xf9004ba0
.word 0xaa0103e0
.word 0x3940003e
bl _p_107
.word 0xf9404bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd4043a0
.word 0xfd0053a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_106
.word 0xaa0003e1
.word 0x9101c3a0
.word 0xf9004ba0
.word 0xaa0103e0
.word 0x3940003e
bl _p_107
.word 0xf9404bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd4053a0
.word 0xfd403fa1
.word 0xd2800000
.word 0xf90033a0
.word 0xf90037a0
.word 0x910183a0
bl _p_71
.word 0xf94033a0
.word 0xf9000fa0
.word 0xf94037a0
.word 0xf90013a0
.word 0xf9400bba
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_2b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xaa0103fa
.word 0xf90013a2
.word 0xb50000fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xd2800001
bl _p_100
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1080]
.word 0xf9400000
.word 0xaa0003e1
.word 0xf90017ba
.word 0xaa0103fa
.word 0xb5000660

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1016]
.word 0xf9400000
.word 0xf9001ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x540007e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1088]
.word 0xd2800e01
bl _p_6
.word 0xf9401ba1
.word 0xeb1f003f
.word 0x10000011
.word 0x54000660
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1096]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1104]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1112]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901801f

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1080]
.word 0xf9000020
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1120]
.word 0xf94017a0
.word 0xaa1a03e1
bl _p_108
.word 0xaa0003fa
.word 0xf9400fa0
.word 0xf9400802
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0x3940005e
bl _p_109
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_2d:
.text
ut_47:
add x0, x0, 16
b System_Nullable_1_bool__ctor_bool
ut_end:
.section __TEXT, __const
_unbox_trampoline_p:

	.long 0
LDIFF_SYM3=ut_end - ut_47
	.long LDIFF_SYM3
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool__ctor_bool
System_Nullable_1_bool__ctor_bool:
.file 2 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/mcs/class/corlib/System/Nullable.cs"
.loc 2 94 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xd280003e
.word 0x3900041e
.loc 2 95 0
.word 0x394063a1
.word 0x39000001
.loc 2 96 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2f:
.text
ut_48:
add x0, x0, 16
b System_Nullable_1_bool_get_HasValue
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_get_HasValue
System_Nullable_1_bool_get_HasValue:
.loc 2 99 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x39400400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_30:
.text
ut_49:
add x0, x0, 16
b System_Nullable_1_bool_get_Value
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_get_Value
System_Nullable_1_bool_get_Value:
.loc 2 104 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x39400400
.word 0x340000c0
.loc 2 107 0
.word 0xf9400ba0
.word 0x39400000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 2 105 0
.word 0xd2876580
bl _p_110
.word 0xaa0003e1
.word 0xd2802040
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_31:
.text
ut_50:
add x0, x0, 16
b System_Nullable_1_bool_Equals_object
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_Equals_object
System_Nullable_1_bool_Equals_object:
.loc 2 113 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fba
.word 0xf90013a0
.word 0xaa0103fa
.word 0xb50000fa
.loc 2 114 0
.word 0xf94013a0
.word 0x39400400
.word 0xd2800001
.word 0x6b01001f
.word 0x9a9f17e0
.word 0x14000021
.loc 2 115 0
.word 0xaa1a03f8
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1128]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0xb5000078
.loc 2 116 0
.word 0xd2800000
.word 0x14000011
.loc 2 118 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
.word 0x9100a3a0
.word 0xf9001ba0
.word 0xaa1a03e0
bl _p_112
.word 0xf9401bbe
.word 0xf90003c0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
.word 0xf94013a0
.word 0xf94017a1
bl _p_113
.word 0x53001c00
.word 0xf9400bb8
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_32:
.text
ut_51:
add x0, x0, 16
b System_Nullable_1_bool_Equals_System_Nullable_1_bool
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_Equals_System_Nullable_1_bool
System_Nullable_1_bool_Equals_System_Nullable_1_bool:
.loc 2 123 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0x394067a0
.word 0xf9400ba1
.word 0x39400421
.word 0x6b01001f
.word 0x54000060
.loc 2 124 0
.word 0xd2800000
.word 0x14000016
.loc 2 126 0
.word 0xf9400ba0
.word 0x39400400
.word 0x35000060
.loc 2 127 0
.word 0xd2800020
.word 0x14000011
.loc 2 129 0
.word 0x910063a0
.word 0xf9001ba0
.word 0xf9400ba0
.word 0x39400000
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1136]
.word 0xd2800221
bl _p_6
.word 0xaa0003e1
.word 0xf9401ba0
.word 0xf9401fa2
.word 0x39004022
bl _p_114
.word 0x53001c00
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_33:
.text
ut_52:
add x0, x0, 16
b System_Nullable_1_bool_GetHashCode
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_GetHashCode
System_Nullable_1_bool_GetHashCode:
.loc 2 134 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0x39400740
.word 0x35000060
.loc 2 135 0
.word 0xd2800000
.word 0x14000008
.loc 2 137 0
.word 0x3940035e
.word 0x39400340
.word 0x35000060
.word 0xd280001a
.word 0x14000002
.word 0xd280003a
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_34:
.text
ut_53:
add x0, x0, 16
b System_Nullable_1_bool_GetValueOrDefault
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_GetValueOrDefault
System_Nullable_1_bool_GetValueOrDefault:
.loc 2 142 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x39400000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_35:
.text
ut_54:
add x0, x0, 16
b System_Nullable_1_bool_ToString
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_ToString
System_Nullable_1_bool_ToString:
.loc 2 152 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0x39400740
.word 0x340001a0
.loc 2 153 0
.word 0x3940035e
.word 0x39400340
.word 0x350000a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x26, [x16, #1144]
.word 0x14000004

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x26, [x16, #1152]
.word 0xaa1a03e0
.word 0x14000005
.loc 2 155 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1160]
.word 0xf9400000
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_36:
.text
ut_55:
add x0, x0, 16
b System_Nullable_1_bool_Box_System_Nullable_1_bool
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_Box_System_Nullable_1_bool
System_Nullable_1_bool_Box_System_Nullable_1_bool:
.loc 2 177 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x394047a0
.word 0x35000060
.loc 2 178 0
.word 0xd2800000
.word 0x1400000a
.loc 2 180 0
.word 0x394043a0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1136]
.word 0xd2800221
bl _p_6
.word 0xf94013a1
.word 0x39004001
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_37:
.text
ut_56:
add x0, x0, 16
b System_Nullable_1_bool_Unbox_object
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_Unbox_object
System_Nullable_1_bool_Unbox_object:
.loc 2 185 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf90013a0
.word 0x3900c3bf
.word 0x3900c7bf
.word 0xf94013a0
.word 0xb5000100
.loc 2 186 0
.word 0x3900c3bf
.word 0x3900c7bf
.word 0x3980c3a0
.word 0x390043a0
.word 0x3980c7a0
.word 0x390047a0
.word 0x1400001b
.loc 2 187 0
.word 0xf94013a0
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54000321
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #1128]
.word 0xeb02003f
.word 0x10000011
.word 0x54000221
.word 0x39404001
.word 0x3900a3bf
.word 0x3900a7bf
.word 0x9100a3a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_3
.word 0x3980a3a0
.word 0x390043a0
.word 0x3980a7a0
.word 0x390047a0
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_38:
.text
ut_57:
add x0, x0, 16
b System_Nullable_1_bool_UnboxExact_object
.text
	.align 4
	.no_dead_strip System_Nullable_1_bool_UnboxExact_object
System_Nullable_1_bool_UnboxExact_object:
.loc 2 192 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0x3900c3bf
.word 0x3900c7bf
.word 0xb500011a
.loc 2 193 0
.word 0x3900c3bf
.word 0x3900c7bf
.word 0x3980c3a0
.word 0x390063a0
.word 0x3980c7a0
.word 0x390067a0
.word 0x14000025
.loc 2 194 0
.word 0xf9400340
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1168]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0xd2800001
.word 0x6b01001f
.word 0x9a9f17e0
.word 0x350003e0
.loc 2 197 0
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x540003c1
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1128]
.word 0xeb01001f
.word 0x10000011
.word 0x540002c1
.word 0x39404341
.word 0x3900a3bf
.word 0x3900a7bf
.word 0x9100a3a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #208]
bl _p_3
.word 0x3980a3a0
.word 0x390063a0
.word 0x3980a7a0
.word 0x390067a0
.word 0xf9400bba
.word 0xf9400fa0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.loc 2 195 0
.word 0xd2802020
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_111
.word 0xd2802020
.word 0xaa1103e1
bl _p_25

Lme_39:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF:
.file 3 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/mcs/class/corlib/System/Array.cs"
.loc 3 70 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9001faf
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xb9801800
.word 0x35000140
.loc 3 71 0
.word 0xf9401fa0
bl _p_115
.word 0x3980b410
.word 0xb5000050
bl _p_116
.word 0xf9401fa0
bl _p_117
.word 0xf9400000
.word 0x14000025
.loc 3 73 0
.word 0xd2800000
.word 0xf90017a0
.word 0xf9001ba0
.word 0x9100a3a0
.word 0xf90023a0
.word 0xf9401fa0
bl _p_118
.word 0xaa0003ef
.word 0xf94023a0
.word 0xf9400ba1
bl _p_119
.word 0xf94017a0
.word 0xf9000fa0
.word 0xf9401ba0
.word 0xf90013a0
.word 0xf9401fa0
bl _p_118
.word 0xd2800401
bl _p_6
.word 0x91004003
.word 0xaa0303e1
.word 0xf9400fa2
.word 0xf9000062
.word 0xd349fc23
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0063

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040063
.word 0xd280003e
.word 0x3900007e
.word 0x91002021
.word 0xf94013a2
.word 0xf9000022
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_3a:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs
wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000680
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001e
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000018
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003a9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffcb
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_3b:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000680
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001e
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000018
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003a9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffcb
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_3c:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000680
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001e
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000018
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003a9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffcb
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_3d:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_get_Count
System_Array_InternalArray__ICollection_get_Count:
.loc 3 60 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xb9801800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_46:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_get_IsReadOnly
System_Array_InternalArray__ICollection_get_IsReadOnly:
.loc 3 65 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800020
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_47:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Clear
System_Array_InternalArray__ICollection_Clear:
.loc 3 78 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2888320
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_48:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Add_T_REF_T_REF
System_Array_InternalArray__ICollection_Add_T_REF_T_REF:
.loc 3 83 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf90013af
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_49:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
System_Array_InternalArray__ICollection_Remove_T_REF_T_REF:
.loc 3 88 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf90013af
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_4a:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
System_Array_InternalArray__ICollection_Contains_T_REF_T_REF:
.loc 3 93 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xf9001faf
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9400320
.word 0x3940b000
.word 0xd2800021
.word 0x6b01001f
.word 0x5400044c
.loc 3 96 0
.word 0xb9801b38
.loc 3 97 0
.word 0xd2800017
.word 0x14000016
.loc 3 99 0
.word 0xf9401fa0
bl _p_121
.word 0x93407ee0
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400016
.loc 3 100 0
.word 0xb500009a
.loc 3 101 0
.word 0xb5000196
.loc 3 102 0
.word 0xd2800020
.word 0x1400000e
.loc 3 108 0
.word 0xaa1a03e0
.word 0xaa1603e1
.word 0xf9400342
.word 0xf9402c50
.word 0xd63f0200
.word 0x53001c00
.word 0x34000060
.loc 3 109 0
.word 0xd2800020
.word 0x14000005
.loc 3 97 0
.word 0x110006f7
.word 0x6b1802ff
.word 0x54fffd4b
.loc 3 113 0
.word 0xd2800000
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.loc 3 94 0
.word 0xd28890a0
bl _p_110
.word 0xaa0003e1
.word 0xd2802380
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_4b:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int:
.loc 3 118 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb6
.word 0xf9001faf
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9400fa0
.word 0xf9001ba0
.word 0xf9400fa0
.word 0xf9400816
.word 0xeb1f02df
.word 0x54000060
.word 0xb98006d6
.word 0x14000002
.word 0xd2800016
.word 0xf9400fa0
.word 0xb9801804
.word 0xf9401ba0
.word 0xaa1603e1
.word 0xf94013a2
.word 0xb9802ba3
bl _p_122
.loc 3 119 0
.word 0xf9400bb6
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_4c:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006c0
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb5000220
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000100
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000020
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400001a
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x53001c16
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd6b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffc9
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_4d:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_4e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000720
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000260
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000120
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x93407c00
.word 0x14000022
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x93407c00
.word 0x1400001b
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0x93407c00
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd4b
.word 0xaa1503e0
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffc6
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_4f:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__Insert_T_REF_int_T_REF
System_Array_InternalArray__Insert_T_REF_int_T_REF:
.loc 3 138 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf90017af
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_50:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__RemoveAt_int
System_Array_InternalArray__RemoveAt_int:
.loc 3 143 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_51:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IndexOf_T_REF_T_REF
System_Array_InternalArray__IndexOf_T_REF_T_REF:
.loc 3 148 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xf9001faf
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9400320
.word 0x3940b000
.word 0xd2800021
.word 0x6b01001f
.word 0x540006cc
.loc 3 151 0
.word 0xb9801b38
.loc 3 152 0
.word 0xd2800017
.word 0x14000024
.loc 3 154 0
.word 0xf9401fa0
bl _p_123
.word 0x93407ee0
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400016
.loc 3 155 0
.word 0xb500017a
.loc 3 156 0
.word 0xb5000356
.loc 3 157 0
.word 0xaa1703fa
.word 0xf9400b38
.word 0xeb1f031f
.word 0x54000060
.word 0xb9800719
.word 0x14000002
.word 0xd2800019
.word 0xb190340
.word 0x1400001b
.loc 3 161 0
.word 0xaa1603e0
.word 0xaa1a03e1
.word 0xf94002c2
.word 0xf9402c50
.word 0xd63f0200
.word 0x53001c00
.word 0x34000140
.loc 3 164 0
.word 0xaa1703fa
.word 0xf9400b38
.word 0xeb1f031f
.word 0x54000060
.word 0xb9800719
.word 0x14000002
.word 0xd2800019
.word 0xb190340
.word 0x1400000b
.loc 3 152 0
.word 0x110006f7
.word 0x6b1802ff
.word 0x54fffb8b
.loc 3 169 0
.word 0xf9400b3a
.word 0xeb1f035f
.word 0x54000060
.word 0xb980075a
.word 0x14000002
.word 0xd280001a
.word 0x51000740
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.loc 3 149 0
.word 0xd28890a0
bl _p_110
.word 0xaa0003e1
.word 0xd2802380
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_52:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__get_Item_T_REF_int
System_Array_InternalArray__get_Item_T_REF_int:
.loc 3 175 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf90013af
.word 0xf9000fa0
.word 0xaa0103fa
.word 0xf9400fa0
.word 0xb9801800
.word 0x6b00035f
.word 0x540001c2
.loc 3 179 0
.word 0xf94013a0
bl _p_124
.word 0x93407f40
.word 0xd37df001
.word 0xf9400fa0
.word 0x8b010000
.word 0x91008000
.word 0xf940001a
.loc 3 180 0
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.loc 3 176 0
.word 0xd285eb20
bl _p_110
.word 0xaa0003e1
.word 0xd2801540
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_53:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__set_Item_T_REF_int_T_REF
System_Array_InternalArray__set_Item_T_REF_int_T_REF:
.loc 3 185 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xf90013b8
.word 0xf9001faf
.word 0xaa0003f8
.word 0xf90017a1
.word 0xf9001ba2
.word 0xb9801b01
.word 0xb9802ba0
.word 0x6b01001f
.word 0x54000742
.loc 3 188 0
.word 0xaa1803f7
.word 0xeb1f031f
.word 0x540002c0
.word 0xf9400316
.word 0xf9400b00
.word 0xb5000240
.word 0x3940b2c0
.word 0xd280003e
.word 0xeb1e001f
.word 0x540001c1
.word 0xf94002c0
.word 0xf9400416
.word 0xf94016c0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1184]
.word 0xeb01001f
.word 0x540000e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1192]
.word 0xeb0002df
.word 0x54000040
.word 0xd2800017
.word 0xaa1703f6
.loc 3 189 0
.word 0xb4000117
.loc 3 190 0
.word 0xf9401ba2
.word 0xaa1603e0
.word 0xb9802ba1
.word 0xf94002c3
.word 0xf9408070
.word 0xd63f0200
.loc 3 191 0
.word 0x14000014
.loc 3 193 0
.word 0xf9401fa0
bl _p_125
.word 0xb9802ba0
.word 0x93407c00
.word 0xd37df000
.word 0x8b000300
.word 0x91008001
.word 0xf9401ba0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 3 194 0
.word 0xa9415fb6
.word 0xf94013b8
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.loc 3 186 0
.word 0xd285eb20
bl _p_110
.word 0xaa0003e1
.word 0xd2801540
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_54:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs
wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000680
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001e
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000018
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003a9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffcb
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_55:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000680
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001e
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000018
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003a9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffcb
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_56:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer
wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_57:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_58:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006a0
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb5000220
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000100
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x14000020
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x1400001a
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd6b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffca
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_5d:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_5e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350005e0
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb50001a0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb40000c0
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xd63f0020
.word 0x1400001c
.word 0xf9401f40
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000018
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xf9001ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9401ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffdab
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffd0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_5f:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_60:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_61:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_62:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006c0
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x14000020
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001a
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd6b
.word 0xaa1503e0
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffc9
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_63:
.text
ut_101:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array:
.loc 3 217 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa1
.word 0xf9400ba0
.word 0xf9000001
.word 0xd349fc02
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.loc 3 218 0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900081e
.loc 3 219 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_65:
.text
ut_102:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 3 223 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_66:
.text
ut_103:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 3 227 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9800b40
.word 0x92800021
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x54000081
.loc 3 228 0
.word 0xf9400340
.word 0xb9801800
.word 0xb9000b40
.loc 3 230 0
.word 0xb9800b40
.word 0x92800001
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x540001a0
.word 0xb9800b40
.word 0x51000419
.word 0xaa1903e0
.word 0xb9000b40
.word 0x92800000
.word 0xf2bfffe0
.word 0x6b00033f
.word 0x9a9f17e0
.word 0xd2800001
.word 0x6b01001f
.word 0x9a9f17e0
.word 0x14000002
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_67:
.text
ut_104:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 3 235 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xb9800b40
.word 0x92800021
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x54000380
.loc 3 237 0
.word 0xb9800b40
.word 0x92800001
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x540003c0
.loc 3 240 0
.word 0xf9400340
.word 0xf9400341
.word 0xb9801821
.word 0x51000421
.word 0xb9800b42
.word 0x4b020021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1200]
.word 0x3940001e
.word 0x910063a2
.word 0xf9002fa2
bl _p_126
.word 0xf9402fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9400bba
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 3 236 0
.word 0xd2894ae0
bl _p_110
.word 0xaa0003e1
.word 0xd2802040
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.loc 3 238 0
.word 0xd28955a0
bl _p_110
.word 0xaa0003e1
.word 0xd2802040
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_68:
.text
ut_105:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 3 246 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900081e
.loc 3 247 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_69:
.text
ut_106:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 3 251 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1208]
.word 0x910063a0
.word 0xf90017a0
.word 0xf9400ba0
bl _p_127
.word 0xf94017be
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1216]
.word 0xd2800401
bl _p_6
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_6a:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position:
.loc 3 70 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xb9801800
.word 0x350000c0
.loc 3 71 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1224]
.word 0xf9400000
.word 0x14000024
.loc 3 73 0
.word 0xd2800000
.word 0xf90017a0
.word 0xf9001ba0
.word 0x9100a3a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1208]
.word 0xf9400ba1
bl _p_128
.word 0xf94017a0
.word 0xf9000fa0
.word 0xf9401ba0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1208]
.word 0xd2800401
bl _p_6
.word 0x91004003
.word 0xaa0303e1
.word 0xf9400fa2
.word 0xf9000062
.word 0xd349fc23
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0063

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040063
.word 0xd280003e
.word 0x3900007e
.word 0x91002021
.word 0xf94013a2
.word 0xf9000022
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_6b:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_6c:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350005e0
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb50001a0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb40000c0
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xd63f0020
.word 0x1400001c
.word 0xf9401f40
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000018
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xf9001ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9401ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffdab
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffd0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_6d:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_6e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_6f:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006c0
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb5000220
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000100
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000020
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400001a
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x53001c16
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd6b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffc9
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_70:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_71:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000720
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000260
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000120
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x93407c00
.word 0x14000022
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x93407c00
.word 0x1400001b
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0x93407c00
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd4b
.word 0xaa1503e0
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffc6
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_72:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001e
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000019
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003c9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_73:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark:
.word 0xa9b57bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xd2800000
.word 0xf90047a0
.word 0xf9004ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000940
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb5000320
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000180
.word 0xf9401f20
.word 0xf9400b22
.word 0x9100e3a0
.word 0xf9004fa0
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0xf9404fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0x1400002e
.word 0xf9401f20
.word 0xf9400b21
.word 0x9100e3a0
.word 0xf9004fa0
.word 0xaa1a03e0
.word 0xd63f0020
.word 0xf9404fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0x14000024
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000569
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0x9101e3a0
.word 0xf9004fa0
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90053a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9404fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94053a0
.word 0xf9403fa0
.word 0xf90047a0
.word 0xf94043a0
.word 0xf9004ba0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffc8b
.word 0xf94047a0
.word 0xf9001fa0
.word 0xf9404ba0
.word 0xf90023a0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0xfd401fa0
.word 0xfd4023a1
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffb5
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_78:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.file 4 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/System.Linq/src/System/Linq/Select.cs"
.loc 4 16 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb4001c39
.loc 4 21 0
.word 0xb4001b3a
.loc 4 26 0
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x54000160
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1232]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0xb40001b8
.loc 4 28 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1240]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1248]
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xf9400302
.word 0xf9405050
.word 0xd63f0200
.word 0x140000b9
.loc 4 31 0
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x54000480
.word 0xf9400337
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1256]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1256]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000200
.word 0x3940b2e0
.word 0xd280003e
.word 0xeb1e001f
.word 0x54000161

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1264]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #1272]
.word 0xaa1903e0
bl _p_129
.word 0xaa0003f8
.word 0x14000002
.word 0xd2800018
.word 0xb40009f8
.loc 4 33 0
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x54000240
.word 0xf9400336
.word 0xf9400b20
.word 0xb50001c0
.word 0x3940b2c0
.word 0xd280003e
.word 0xeb1e001f
.word 0x54000141
.word 0xf94002c0
.word 0xf9400400
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1280]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800017
.word 0xb40002b7
.loc 4 35 0
.word 0xb9801ae0
.word 0x340001c0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1288]
.word 0xd2800701
bl _p_6
.word 0xf90023a0
.word 0xaa1703e1
.word 0xaa1a03e2
bl _p_130
.word 0xf94023a0
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x1400006e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400000
.word 0x14000069
.loc 4 40 0
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x54000160
.word 0xf9400320
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1304]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800017
.word 0xaa1703f9
.word 0xb4000197
.loc 4 42 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1312]
.word 0xd2800a01
bl _p_6
.word 0xf90023a0
.word 0xaa1903e1
.word 0xaa1a03e2
bl _p_131
.word 0xf94023a0
.word 0x1400004f
.loc 4 45 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1320]
.word 0xd2800801
bl _p_6
.word 0xf90023a0
.word 0xaa1803e1
.word 0xaa1a03e2
bl _p_132
.word 0xf94023a0
.word 0x14000044
.loc 4 48 0
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x540002c0
.word 0xf9400337
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1328]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1328]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000040
.word 0xd2800018
.word 0xb4000438
.loc 4 50 0
.word 0xaa1803f9
.word 0xeb1f031f
.word 0x54000160
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1336]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800019
.word 0xb50001d9

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1344]
.word 0xd2800801
bl _p_6
.word 0xf90023a0
.word 0xaa1803e1
.word 0xaa1a03e2
bl _p_133
.word 0xf94023a0
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x14000010

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400000
.word 0x1400000b
.loc 4 55 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1352]
.word 0xd2800801
bl _p_6
.word 0xf90023a0
.word 0xaa1903e1
.word 0xaa1a03e2
bl _p_134
.word 0xf94023a0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.loc 4 23 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1360]
.word 0xd280fe61
bl _p_135
bl _p_136
bl _p_111

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1360]
.loc 4 18 0
.word 0xd280f561
bl _p_135
bl _p_136
bl _p_111

Lme_79:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006c0
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb5000220
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000100
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000020
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400001a
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x53001c16
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd6b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffc9
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_7e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350006c0
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb5000220
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000100
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000020
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400001a
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x53001c16
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd6b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffc9
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_7f:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000620
.word 0x14000001
.word 0xf9403738
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001c
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000017
.word 0xb9801b19
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1803e0
bl _p_111
bl _p_120
.word 0xaa0003f8
.word 0xb5ffff80
.word 0x17ffffce
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_80:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark
wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000720
.word 0x14000001
.word 0xf9403717
.word 0xaa1703e0
.word 0xb5000260
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000120
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x93407c00
.word 0x14000022
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x93407c00
.word 0x1400001b
.word 0xb9801af8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0x93407c00
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd4b
.word 0xaa1503e0
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xaa1703e0
bl _p_111
bl _p_120
.word 0xaa0003f7
.word 0xb5ffff80
.word 0x17ffffc6
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_81:
.text
ut_135:
add x0, x0, 16
b System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
System_Array_InternalEnumerator_1_T_REF__ctor_System_Array:
.loc 3 217 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf90013af
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa1
.word 0xf9400ba0
.word 0xf9000001
.word 0xd349fc02
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.loc 3 218 0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900081e
.loc 3 219 0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_87:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int:
.loc 3 175 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xd2800000
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9402ba0
.word 0xb9801801
.word 0xb9805ba0
.word 0x6b01001f
.word 0x540002e2
.loc 3 179 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1368]
.word 0xb9805ba0
.word 0x93407c00
.word 0xd37cec01
.word 0xf9402ba0
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0xf90033a1
.word 0xf9400400
.word 0xf90037a0
.loc 3 180 0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.loc 3 176 0
.word 0xd285eb20
bl _p_110
.word 0xaa0003e1
.word 0xd2801540
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_88:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor:
.loc 3 278 0 prologue_end
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1376]
.word 0xd2800201
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1224]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_89:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 4 98 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 4 102 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 103 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 104 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_8a:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 107 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1352]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_134
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_8b:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose:
.loc 4 111 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9401f40
.word 0xb4000180
.loc 4 113 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.loc 4 114 0
.word 0xf9001f5f
.loc 4 117 0
.word 0xaa1a03e0
bl _p_138
.loc 4 118 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_8c:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 122 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801759
.word 0xaa1903e0
.word 0xd2800021
.word 0x6b01001f
.word 0x540000a0
.word 0xd2800040
.word 0x6b00033f
.word 0x54000340
.word 0x14000048
.loc 4 125 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001f40
.word 0x9100e341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 126 0
.word 0xd280005e
.word 0xb900175e
.loc 4 129 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x34000400
.loc 4 131 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 132 0
.word 0xd2800020
.word 0x14000006
.loc 4 135 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 139 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_8d:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 147 0 prologue_end
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xf9002fa0
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9003fbf
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xd2800021
bl _p_139
.loc 4 149 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9003fa0
.word 0x14000041
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f9
.loc 4 151 0
.word 0x910123a0
.word 0xf9005ba0
.word 0xf9401b42
.word 0x9100a3a0
.word 0xf90043a0
.word 0xaa0203e0
.word 0xaa1903e1
.word 0xf9005fa2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9405ba0
.word 0xf9405fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1400]
.word 0xaa0003f9
.word 0xf94017a0
.word 0xf9001fa0
.word 0xf9401ba0
.word 0xf90023a0
.word 0xb9802b20
.word 0xf9401321
.word 0xb9801821
.word 0x6b01001f
.word 0x540000c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e0
bl _p_140
.word 0xf9401320
.word 0xb9802b38
.word 0xaa1803e1
.word 0x11000421
.word 0xb9002b21
.word 0x93407f01
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf9401fa1
.word 0xf9000001
.word 0xf94023a1
.word 0xf9000401
.word 0xb9802f20
.word 0x11000400
.word 0xb9002f20
.loc 4 149 0
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff6a0
.word 0xf90047bf
.word 0x94000005
.word 0xf94047a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90053be
.word 0xf9403fa0
.word 0xb4000160
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94053be
.word 0xd61f03c0
.loc 4 154 0
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
bl _p_141
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_8e:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 159 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa
.word 0xf9002fbf

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f9
.loc 4 161 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9002fa0
.word 0x1400003a
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f8
.loc 4 163 0
.word 0xf9401b42
.word 0x9100e3a0
.word 0xf90033a0
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94033be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xaa1903f8
.word 0xf9401fa0
.word 0xf90027a0
.word 0xf94023a0
.word 0xf9002ba0
.word 0x3940033e
.word 0xf9400b17
.word 0xb9802316
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801ae0
.word 0x6b0002df
.word 0x54000202
.word 0x110006c0
.word 0xb9002300
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec00
.word 0x8b0002e0
.word 0x91008000
.word 0xf94027a1
.word 0xf9000001
.word 0xf9402ba1
.word 0xf9000401
.word 0x14000006
.word 0xaa1803e0
.word 0xfd4027a0
.word 0xfd402ba1
bl _p_142
.word 0x14000001
.loc 4 161 0
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff780
.word 0xf90037bf
.word 0x94000005
.word 0xf94037a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90043be
.word 0xf9402fa0
.word 0xb4000160
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94043be
.word 0xd61f03c0
.loc 4 166 0
.word 0xaa1903e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_8f:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 174 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001fbf
.word 0x3400009a
.loc 4 176 0
.word 0x92800000
.word 0xf2bfffe0
.word 0x1400004c
.loc 4 179 0
.word 0xd280001a
.loc 4 181 0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001fa0
.word 0x1400001d
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f8
.loc 4 183 0
.word 0xf9401b22
.word 0x9100a3a0
.word 0xf90023a0
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.loc 4 186 0
.word 0xd2800020
.word 0x2b000340
.word 0x10000011
.word 0x54000526
.word 0xaa0003fa
.loc 4 181 0
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffb20
.word 0xf90027bf
.word 0x94000005
.word 0xf94027a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90033be
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94033be
.word 0xd61f03c0
.loc 4 190 0
.word 0xaa1a03e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd28022e0
.word 0xaa1103e1
bl _p_25

Lme_90:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor:
.file 5 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/System.Linq/src/System/Linq/Iterator.cs"
.loc 5 43 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
bl _p_143
.word 0x93407c00
.word 0xaa0003e1
.word 0xf9400ba0
.word 0xb9001001
.loc 5 44 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_91:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 5 49 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9402ba0
.word 0x91006000
.word 0xf9400001
.word 0xf9000ba1
.word 0xf9400400
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_92:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 5 68 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000160
.word 0x91006001
.word 0xd2800002
.word 0xf9000022
.word 0xf9000422
.loc 5 69 0
.word 0x9280001e
.word 0xf2bffffe
.word 0xb900141e
.loc 5 70 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25

Lme_94:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator:
.loc 5 82 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xb9801740
.word 0x35000120
.word 0xb9801340
.word 0xf90013a0
bl _p_143
.word 0x93407c00
.word 0xaa0003e1
.word 0xf94013a0
.word 0x6b01001f
.word 0x540000e0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405c30
.word 0xd63f0200
.word 0xaa0003fa
.word 0x14000001
.loc 5 83 0
.word 0xd280003e
.word 0xb900175e
.loc 5 84 0
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_95:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool:
.loc 5 109 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1424]
.word 0xd2800801
bl _p_6
.word 0xf90013a0
.word 0xf9400ba1
.word 0xf9400fa2
bl _p_144
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_97:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 5 112 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x91006000
.word 0xf9400001
.word 0xf9000fa1
.word 0xf9400400
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1216]
.word 0xd2800401
bl _p_6
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_98:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator:
.loc 5 114 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_145
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_99:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 5 116 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
bl _p_146
bl _p_111
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_9a:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor:
.file 6 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/System.Linq/src/System/Linq/Partition.cs"
.loc 6 93 0 prologue_end
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1432]
.word 0xd2800201
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_9b:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 4 619 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 4 623 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 624 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 625 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_9c:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 628 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1344]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_133
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_9d:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 632 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801759
.word 0xaa1903e0
.word 0xd2800021
.word 0x6b01001f
.word 0x540000a0
.word 0xd2800040
.word 0x6b00033f
.word 0x54000340
.word 0x14000048
.loc 4 635 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001f40
.word 0x9100e341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 636 0
.word 0xd280005e
.word 0xb900175e
.loc 4 639 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x34000400
.loc 4 641 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 642 0
.word 0xd2800020
.word 0x14000006
.loc 4 645 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 649 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_9e:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose:
.loc 4 654 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9401f40
.word 0xb4000180
.loc 4 656 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.loc 4 657 0
.word 0xf9001f5f
.loc 4 660 0
.word 0xaa1a03e0
bl _p_138
.loc 4 661 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_9f:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int:
.loc 4 669 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401402
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1440]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf90017a0
.word 0xf9400ba0
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1344]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_133
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_a0:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int:
.loc 4 673 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401402
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1448]
.word 0x928010f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf90017a0
.word 0xf9400ba0
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1344]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_133
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_a1:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 4 678 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9002fa0
.word 0xf90033a1
.word 0xf90037a2
.word 0x390243bf
.word 0xd2800000
.word 0xf90043a0
.word 0xf90047a0
.word 0xf9402fa0
.word 0xf9401403
.word 0x910243a2
.word 0xaa0303e0
.word 0xb98063a1
.word 0xf9400063

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1456]
.word 0x928008f0
.word 0xf2bffff0
.word 0xf8706870
.word 0xd63f0200
.word 0xaa0003f9
.loc 4 679 0
.word 0x394243a1
.word 0xf94037a0
.word 0x39000001
.loc 4 680 0
.word 0x394243a0
.word 0x35000120
.word 0xd2800000
.word 0xf90043a0
.word 0xf90047a0
.word 0xf94043a0
.word 0xf9000fa0
.word 0xf94047a0
.word 0xf90013a0
.word 0x14000012
.word 0xf9402fa0
.word 0xf9401802
.word 0x9101c3a0
.word 0xf9004fa0
.word 0xaa0203e0
.word 0xaa1903e1
.word 0xf90053a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9404fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94053a0
.word 0xf9403ba0
.word 0xf9000fa0
.word 0xf9403fa0
.word 0xf90013a0
.word 0xf9400bb9
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_a2:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 4 686 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0x390203bf
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9402ba0
.word 0xf9401402
.word 0x910203a1
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1464]
.word 0x928000f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf90047a0
.loc 4 687 0
.word 0x394203a1
.word 0xf9402fa0
.word 0x39000001
.loc 4 688 0
.word 0x394203a0
.word 0x35000120
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9403ba0
.word 0xf9000ba0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0x14000012
.word 0xf9402ba0
.word 0xf9401802
.word 0x910183a0
.word 0xf9004ba0
.word 0xaa0203e0
.word 0xf94047a1
.word 0xf90053a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9404bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94053a0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_a3:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 4 694 0 prologue_end
.word 0xa9b57bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0x390203bf
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9402ba0
.word 0xf9401402
.word 0x910203a1
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf90047a0
.loc 4 695 0
.word 0x394203a1
.word 0xf9402fa0
.word 0x39000001
.loc 4 696 0
.word 0x394203a0
.word 0x35000120
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9403ba0
.word 0xf9000ba0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0x14000012
.word 0xf9402ba0
.word 0xf9401802
.word 0x910183a0
.word 0xf9004ba0
.word 0xaa0203e0
.word 0xf94047a1
.word 0xf90053a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9404bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94053a0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_a4:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray:
.loc 4 703 0 prologue_end
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xf9002fa0
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9003fbf
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xd2800021
bl _p_139
.loc 4 704 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9003fa0
.word 0x14000041
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f9
.loc 4 706 0
.word 0x910123a0
.word 0xf9005ba0
.word 0xf9401b42
.word 0x9100a3a0
.word 0xf90043a0
.word 0xaa0203e0
.word 0xaa1903e1
.word 0xf9005fa2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9405ba0
.word 0xf9405fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1400]
.word 0xaa0003f9
.word 0xf94017a0
.word 0xf9001fa0
.word 0xf9401ba0
.word 0xf90023a0
.word 0xb9802b20
.word 0xf9401321
.word 0xb9801821
.word 0x6b01001f
.word 0x540000c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e0
bl _p_140
.word 0xf9401320
.word 0xb9802b38
.word 0xaa1803e1
.word 0x11000421
.word 0xb9002b21
.word 0x93407f01
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf9401fa1
.word 0xf9000001
.word 0xf94023a1
.word 0xf9000401
.word 0xb9802f20
.word 0x11000400
.word 0xb9002f20
.loc 4 704 0
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff6a0
.word 0xf90047bf
.word 0x94000005
.word 0xf94047a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90053be
.word 0xf9403fa0
.word 0xb4000160
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94053be
.word 0xd61f03c0
.loc 4 708 0
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
bl _p_141
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_a5:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int:
.loc 4 716 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf90023bf

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1a03e1
bl _p_100
.word 0xaa0003fa
.loc 4 717 0
.word 0xd2800018
.loc 4 718 0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90023a0
.word 0x14000025
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f7
.loc 4 720 0
.word 0xf9401b22
.word 0x9100c3a0
.word 0xf90027a0
.word 0xaa0203e0
.word 0xaa1703e1
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94027be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0x93407f00
.word 0xb9801b41
.word 0xeb00003f
.word 0x10000011
.word 0x54000609
.word 0xd37cec00
.word 0x8b000340
.word 0x91008000
.word 0xf9401ba1
.word 0xf9000001
.word 0xf9401fa1
.word 0xf9000401
.loc 4 721 0
.word 0x11000718
.loc 4 718 0
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffa20
.word 0xf9002bbf
.word 0x94000005
.word 0xf9402ba0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90037be
.word 0xf94023a0
.word 0xb4000160
.word 0xf94023a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94037be
.word 0xd61f03c0
.loc 4 724 0
.word 0xaa1a03e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_a6:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 729 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf9400fa0
.word 0xf9401402
.word 0xaa0203e0
.word 0xd2800021
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 730 0
.word 0xaa1903e0
.word 0x92800001
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x54000060
.word 0x340000b9
.word 0x14000012
.loc 4 733 0
.word 0xf9400fa0
bl _p_147
.word 0x14000012
.loc 4 735 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x14000004
.loc 4 737 0
.word 0xf9400fa0
.word 0xaa1903e1
bl _p_148
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a7:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 743 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa
.word 0xf9002fbf
.word 0xf9401742
.word 0xaa0203e0
.word 0xd2800021
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 745 0
.word 0xaa1903e0
.word 0x92800001
.word 0xf2bfffe1
.word 0x6b01001f
.word 0x54000060
.word 0x34000339
.word 0x1400002e
.loc 4 748 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f9
.loc 4 749 0
.word 0x14000021
.loc 4 751 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x14000072
.loc 4 753 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6
.word 0xf9004ba0
.word 0xaa1903e1
bl _p_149
.word 0xf9404ba0
.word 0xaa0003f9
.loc 4 757 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9002fa0
.word 0x1400003a
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f8
.loc 4 759 0
.word 0xf9401b42
.word 0x9100e3a0
.word 0xf90033a0
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94033be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xaa1903f8
.word 0xf9401fa0
.word 0xf90027a0
.word 0xf94023a0
.word 0xf9002ba0
.word 0x3940033e
.word 0xf9400b17
.word 0xb9802316
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801ae0
.word 0x6b0002df
.word 0x54000202
.word 0x110006c0
.word 0xb9002300
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec00
.word 0x8b0002e0
.word 0x91008000
.word 0xf94027a1
.word 0xf9000001
.word 0xf9402ba1
.word 0xf9000401
.word 0x14000006
.word 0xaa1803e0
.word 0xfd4027a0
.word 0xfd402ba1
bl _p_142
.word 0x14000001
.loc 4 757 0
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff780
.word 0xf90037bf
.word 0x94000005
.word 0xf94037a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90043be
.word 0xf9402fa0
.word 0xb4000160
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94043be
.word 0xd61f03c0
.loc 4 762 0
.word 0xaa1903e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_a8:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 770 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xaa0003f9
.word 0xf90013a1
.word 0xf9001fbf
.word 0x394083a0
.word 0x350008a0
.loc 4 772 0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001fa0
.word 0x14000018
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f8
.loc 4 774 0
.word 0xf9401b22
.word 0x9100a3a0
.word 0xf90023a0
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.loc 4 772 0
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffbc0
.word 0xf90027bf
.word 0x94000005
.word 0xf94027a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90033be
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94033be
.word 0xd61f03c0
.loc 4 778 0
.word 0xf9401722
.word 0xaa0203e0
.word 0x394083a1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0x93407c00
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_a9:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 4 468 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 4 472 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 473 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 474 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_aa:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 476 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1320]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_132
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_ab:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 480 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801759
.word 0xaa1903e0
.word 0xd2800021
.word 0x6b01001f
.word 0x540000a0
.word 0xd2800040
.word 0x6b00033f
.word 0x54000340
.word 0x14000048
.loc 4 483 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001f40
.word 0x9100e341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 484 0
.word 0xd280005e
.word 0xb900175e
.loc 4 487 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x34000400
.loc 4 489 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1392]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 490 0
.word 0xd2800020
.word 0x14000006
.loc 4 493 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 497 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_ac:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose:
.loc 4 502 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9401f40
.word 0xb4000180
.loc 4 504 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.loc 4 505 0
.word 0xf9001f5f
.loc 4 508 0
.word 0xaa1a03e0
bl _p_138
.loc 4 509 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_ad:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 516 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 517 0
.word 0xaa1903e0
.word 0x350001e0
.loc 4 519 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x14000033
.loc 4 522 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1903e1
bl _p_100
.word 0xaa0003f9
.loc 4 523 0
.word 0xd2800018
.word 0x14000027
.loc 4 525 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1803e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000249
.word 0xd37cec00
.word 0x8b000320
.word 0x91008000
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.loc 4 523 0
.word 0x11000718
.word 0xb9801b20
.word 0x6b00031f
.word 0x54fffb0b
.loc 4 528 0
.word 0xaa1903e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_ae:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 533 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003fa
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 534 0
.word 0xaa1903e0
.word 0xf9003fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6
.word 0xf9403fa1
.word 0xf9003ba0
bl _p_149
.word 0xf9403ba0
.word 0xaa0003f8
.loc 4 535 0
.word 0xd2800017
.word 0x1400003c
.loc 4 537 0
.word 0xf9401b40
.word 0xf9003fa0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1703e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9403fa2
.word 0x910123a0
.word 0xf90037a0
.word 0xaa0203e0
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0xaa1803f6
.word 0xf94027a0
.word 0xf9002fa0
.word 0xf9402ba0
.word 0xf90033a0
.word 0x3940031e
.word 0xf9400b15
.word 0xb9802314
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801aa0
.word 0x6b00029f
.word 0x54000202
.word 0x11000680
.word 0xb90022c0
.word 0x93407e80
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000309
.word 0xd37cec00
.word 0x8b0002a0
.word 0x91008000
.word 0xf9402fa1
.word 0xf9000001
.word 0xf94033a1
.word 0xf9000401
.word 0x14000005
.word 0xaa1603e0
.word 0xfd402fa0
.word 0xfd4033a1
bl _p_142
.loc 4 535 0
.word 0x110006f7
.word 0x6b1902ff
.word 0x54fff88b
.loc 4 540 0
.word 0xaa1803e0
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_af:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 548 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f8
.loc 4 550 0
.word 0x350003fa
.loc 4 552 0
.word 0xd280001a
.word 0x1400001b
.loc 4 554 0
.word 0xf9401b20
.word 0xf90027a0
.word 0xf9401722
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.loc 4 552 0
.word 0x1100075a
.word 0x6b18035f
.word 0x54fffcab
.loc 4 558 0
.word 0xaa1803e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_b0:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int:
.loc 4 564 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
.word 0xb9801ba3
.word 0xd29fffe4
.word 0xf2afffe4
bl _p_150
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b1:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int:
.loc 4 568 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0
.word 0xb9801ba0
.word 0x51000400
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf9401fa4
.word 0xf90013a0
.word 0xd2800003
bl _p_150
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b2:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 4 572 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf90033a2
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9402ba0
.word 0xf9401401
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003e1
.word 0xb9805ba0
.word 0x6b01001f
.word 0x54000462
.loc 4 574 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 575 0
.word 0xf9402ba0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0xaa0203e0
.word 0xb9805ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000ba0
.word 0xf9403ba0
.word 0xf9000fa0
.word 0x1400000a
.loc 4 578 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 579 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000ba0
.word 0xf94043a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_b3:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 4 584 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9402ba0
.word 0xf9401401
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0x34000460
.loc 4 586 0
.word 0xf9402fa0
.word 0xd280003e
.word 0x3900001e
.loc 4 587 0
.word 0xf9402ba0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0xaa0203e0
.word 0xd2800001
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x910183a0
.word 0xf90043a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0x1400000a
.loc 4 590 0
.word 0xf9402fa0
.word 0x3900001f
.loc 4 591 0
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9403ba0
.word 0xf9000ba0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_b4:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 4 596 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9002fa0
.word 0xf90033a1
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9402fa0
.word 0xf9401401
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f8
.loc 4 597 0
.word 0xaa1803e0
.word 0x34000460
.loc 4 599 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 600 0
.word 0xf9402fa0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0x51000701
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xf9403ba0
.word 0xf90013a0
.word 0x1400000a
.loc 4 603 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 604 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0xf94043a0
.word 0xf90013a0
.word 0xf9400bb8
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_b5:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 4 328 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 4 332 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 333 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 334 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_b6:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 336 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1312]
.word 0xd2800a01
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_131
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b7:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 340 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801759
.word 0xaa1903e0
.word 0xd2800021
.word 0x6b01001f
.word 0x540000a0
.word 0xd2800040
.word 0x6b00033f
.word 0x540004e0
.word 0x1400004e
.loc 4 343 0
.word 0xf9401741
.word 0x9100c3a8
.word 0xaa0103e0
.word 0x3940003e
bl _p_151
.word 0x9100e342
.word 0xaa0203e0
.word 0xf9401ba1
.word 0xf9000041
.word 0xd349fc02
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x91002000
.word 0xf9401fa1
.word 0xf9000001
.word 0x91002001
.word 0xf94023a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 344 0
.word 0xd280005e
.word 0xb900175e
.loc 4 347 0
.word 0xeb1f035f
.word 0x10000011
.word 0x54000560
.word 0x9100e340

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1544]
bl _p_152
.word 0x53001c00
.word 0x34000360
.loc 4 349 0
.word 0xf9401b42
.word 0xeb1f035f
.word 0x10000011
.word 0x54000400
.word 0x9100e340

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1544]
.word 0xf9400801
.word 0x910083a0
.word 0xf90027a0
.word 0xaa0203e0
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94027be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 350 0
.word 0xd2800020
.word 0x14000006
.loc 4 353 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 357 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25

Lme_b8:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 365 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf9401740
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802019
.loc 4 366 0
.word 0xaa1903e0
.word 0x350001e0
.loc 4 368 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x1400002d
.loc 4 371 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1903e1
bl _p_100
.word 0xaa0003f9
.loc 4 372 0
.word 0xd2800018
.word 0x14000021
.loc 4 374 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1803e1
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf94027a2
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000249
.word 0xd37cec00
.word 0x8b000320
.word 0x91008000
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.loc 4 372 0
.word 0x11000718
.word 0xb9801b20
.word 0x6b00031f
.word 0x54fffbcb
.loc 4 377 0
.word 0xaa1903e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_b9:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 382 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003fa
.word 0xf9401740
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802019
.loc 4 383 0
.word 0xaa1903e0
.word 0xf9003fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6
.word 0xf9403fa1
.word 0xf9003ba0
bl _p_149
.word 0xf9403ba0
.word 0xaa0003f8
.loc 4 384 0
.word 0xd2800017
.word 0x14000036
.loc 4 386 0
.word 0xf9401b40
.word 0xf9003fa0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1703e1
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf9403fa2
.word 0x910123a0
.word 0xf90037a0
.word 0xaa0203e0
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0xaa1803f6
.word 0xf94027a0
.word 0xf9002fa0
.word 0xf9402ba0
.word 0xf90033a0
.word 0x3940031e
.word 0xf9400b15
.word 0xb9802314
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801aa0
.word 0x6b00029f
.word 0x54000202
.word 0x11000680
.word 0xb90022c0
.word 0x93407e80
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000309
.word 0xd37cec00
.word 0x8b0002a0
.word 0x91008000
.word 0xf9402fa1
.word 0xf9000001
.word 0xf94033a1
.word 0xf9000401
.word 0x14000005
.word 0xaa1603e0
.word 0xfd402fa0
.word 0xfd4033a1
bl _p_142
.loc 4 384 0
.word 0x110006f7
.word 0x6b1902ff
.word 0x54fff94b
.loc 4 389 0
.word 0xaa1803e0
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_ba:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 397 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401720
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802018
.loc 4 399 0
.word 0x3500033a
.loc 4 401 0
.word 0xd280001a
.word 0x14000015
.loc 4 403 0
.word 0xf9401b20
.word 0xf90027a0
.word 0xf9401722
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf94027a2
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.loc 4 401 0
.word 0x1100075a
.word 0x6b18035f
.word 0x54fffd6b
.loc 4 407 0
.word 0xaa1803e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_bb:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int:
.loc 4 413 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
.word 0xb9801ba3
.word 0xd29fffe4
.word 0xf2afffe4
bl _p_150
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_bc:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int:
.loc 4 417 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0
.word 0xb9801ba0
.word 0x51000400
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf9401fa4
.word 0xf90013a0
.word 0xd2800003
bl _p_150
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_bd:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 4 421 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf90033a2
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9402ba0
.word 0xf9401400
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802001
.word 0xb9805ba0
.word 0x6b01001f
.word 0x540003a2
.loc 4 423 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 424 0
.word 0xf9402ba0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0xaa0203e0
.word 0xb9805ba1
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000ba0
.word 0xf9403ba0
.word 0xf9000fa0
.word 0x1400000a
.loc 4 427 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 428 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000ba0
.word 0xf94043a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_be:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 4 433 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9402ba0
.word 0xf9401400
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802000
.word 0x340003a0
.loc 4 435 0
.word 0xf9402fa0
.word 0xd280003e
.word 0x3900001e
.loc 4 436 0
.word 0xf9402ba0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0xaa0203e0
.word 0xd2800001
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x910183a0
.word 0xf90043a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0x1400000a
.loc 4 439 0
.word 0xf9402fa0
.word 0x3900001f
.loc 4 440 0
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9403ba0
.word 0xf9000ba0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_bf:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 4 445 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9002fa0
.word 0xf90033a1
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9402fa0
.word 0xf9401400
.word 0xaa0003e1
.word 0x3940003e
.word 0xb9802018
.loc 4 446 0
.word 0xaa1803e0
.word 0x340003a0
.loc 4 448 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 449 0
.word 0xf9402fa0
.word 0xf9401801
.word 0xf9004fa1
.word 0xf9401402
.word 0x51000701
.word 0xaa0203e0
.word 0x3940005e
bl _p_153
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xf9403ba0
.word 0xf90013a0
.word 0x1400000a
.loc 4 452 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 453 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0xf94043a0
.word 0xf90013a0
.word 0xf9400bb8
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_c0:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 4 204 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 4 209 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 210 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 211 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_c1:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 213 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1288]
.word 0xd2800701
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_130
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_c2:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 217 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801740
.word 0xd2800021
.word 0x6b01001f
.word 0x9a9fa7e0
.word 0xb9801741
.word 0xf9401742
.word 0xb9801842
.word 0x11000442
.word 0x6b02003f
.word 0x9a9f17e1
.word 0x2a010000
.word 0x340000e0
.loc 4 219 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 220 0
.word 0xd2800000
.word 0x14000022
.loc 4 223 0
.word 0xb9801759
.word 0xaa1903e0
.word 0x11000400
.word 0xb9001740
.word 0x51000721
.word 0xb90033a1
.loc 4 224 0
.word 0xf9401b42
.word 0xf9401740
.word 0x93407c21
.word 0xb9801803
.word 0xeb01007f
.word 0x10000011
.word 0x54000329
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0x910083a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 225 0
.word 0xd2800020
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_c3:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 237 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf9401740
.word 0xb9801801

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
bl _p_100
.word 0xaa0003f9
.loc 4 238 0
.word 0xd2800018
.word 0x14000023
.loc 4 240 0
.word 0xf9401b42
.word 0xf9401740
.word 0x93407f01
.word 0xb9801803
.word 0xeb01007f
.word 0x10000011
.word 0x540004a9
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000249
.word 0xd37cec00
.word 0x8b000320
.word 0x91008000
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.loc 4 238 0
.word 0x11000718
.word 0xb9801b20
.word 0x6b00031f
.word 0x54fffb8b
.loc 4 243 0
.word 0xaa1903e0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_c4:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 248 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003fa
.word 0xf9401759
.loc 4 249 0
.word 0xaa1903e0
.word 0xb9801800
.word 0xf9003fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6
.word 0xf9403fa1
.word 0xf9003ba0
bl _p_149
.word 0xf9403ba0
.word 0xaa0003f8
.loc 4 250 0
.word 0xd2800017
.word 0x14000037
.loc 4 252 0
.word 0xf9401b42
.word 0x93407ee0
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000789
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400001
.word 0x910123a0
.word 0xf90037a0
.word 0xaa0203e0
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0xaa1803f6
.word 0xf94027a0
.word 0xf9002fa0
.word 0xf9402ba0
.word 0xf90033a0
.word 0x3940031e
.word 0xf9400b15
.word 0xb9802314
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801aa0
.word 0x6b00029f
.word 0x54000202
.word 0x11000680
.word 0xb90022c0
.word 0x93407e80
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000329
.word 0xd37cec00
.word 0x8b0002a0
.word 0x91008000
.word 0xf9402fa1
.word 0xf9000001
.word 0xf94033a1
.word 0xf9000401
.word 0x14000005
.word 0xaa1603e0
.word 0xfd402fa0
.word 0xfd4033a1
bl _p_142
.loc 4 250 0
.word 0x110006f7
.word 0xb9801b20
.word 0x6b0002ff
.word 0x54fff90b
.loc 4 255 0
.word 0xaa1803e0
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_c5:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 263 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0x350003ba
.loc 4 265 0
.word 0xf940173a
.word 0xd2800018
.word 0x14000017
.word 0x93407f00
.word 0xb9801b41
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000340
.word 0x91008000
.word 0xf9400017
.loc 4 267 0
.word 0xf9401b22
.word 0x9100c3a0
.word 0xf90023a0
.word 0xaa0203e0
.word 0xaa1703e1
.word 0xf9002ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9402ba0
.word 0x11000718
.loc 4 265 0
.word 0xb9801b40
.word 0x6b00031f
.word 0x54fffd0b
.loc 4 271 0
.word 0xf9401720
.word 0xb9801800
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_c6:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int:
.loc 4 277 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401400
.word 0xb9801801
.word 0xb9801ba0
.word 0x6b01001f
.word 0x540000cb
.loc 4 279 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400000
.word 0x14000013
.loc 4 282 0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
.word 0xb9801ba3
.word 0xd29fffe4
.word 0xf2afffe4
bl _p_150
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_c7:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int:
.loc 4 286 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401720
.word 0xb9801800
.word 0x6b00035f
.word 0x540002ca
.word 0xf9401720
.word 0xf90017a0
.word 0xf9401b20
.word 0xf9001ba0
.word 0x51000740
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf9401fa4
.word 0xf90013a0
.word 0xd2800003
bl _p_150
.word 0xf94013a0
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x14000003
.word 0xaa1903fa
.word 0xaa1903e0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_c8:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 4 290 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf90033a2
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9402ba0
.word 0xf9401400
.word 0xb9801801
.word 0xb9805ba0
.word 0x6b01001f
.word 0x54000402
.loc 4 292 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 293 0
.word 0xf9402ba0
.word 0xf9401802
.word 0xf9401400
.word 0xb9805ba1
.word 0x93407c21
.word 0xb9801803
.word 0xeb01007f
.word 0x10000011
.word 0x54000449
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000ba0
.word 0xf9403ba0
.word 0xf9000fa0
.word 0x1400000a
.loc 4 296 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 297 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000ba0
.word 0xf94043a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_c9:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 4 304 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf9402fa0
.word 0xd280003e
.word 0x3900001e
.loc 4 305 0
.word 0xf9402ba0
.word 0xf9401802
.word 0xf9401400
.word 0xd2800003
.word 0xb9801801
.word 0xeb03003f
.word 0x10000011
.word 0x540002a9
.word 0xf9401001
.word 0x910183a0
.word 0xf9003ba0
.word 0xaa0203e0
.word 0xf90043a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9403bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94043a0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_ca:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 4 312 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf9402fa0
.word 0xd280003e
.word 0x3900001e
.loc 4 313 0
.word 0xf9402ba1
.word 0xf9401822
.word 0xf9401420
.word 0xf9401421
.word 0xb9801821
.word 0x51000421
.word 0x93407c21
.word 0xb9801803
.word 0xeb01007f
.word 0x10000011
.word 0x54000309
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0x910183a0
.word 0xf9003ba0
.word 0xaa0203e0
.word 0xf90043a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9403bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94043a0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_cb:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
.loc 5 100 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1352]
.word 0xd2800801
bl _p_6
.word 0xf90013a0
.word 0xf9400ba1
.word 0xf9400fa2
bl _p_134
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_cc:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_
wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_:
.word 0xa9b67bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #112]
.word 0xd63f0000
.word 0xaa0003f7
.word 0x910083a0
.word 0xf94002e1
.word 0xf90013a1
.word 0xf90002e0
.word 0xf9400ba0
.word 0xb40002e0
.word 0xf9400ba0
.word 0xb9801ba1
.word 0xaa1a03e2
bl _ves_icall_System_Array_GetGenericValueImpl

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000120
.word 0x14000001
.word 0xf94013a0
.word 0xf90002e0
.word 0xf9402fb7
.word 0xf9403bba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
bl _p_120
.word 0xaa0003fa
.word 0xb4fffee0
.word 0xaa1a03e0
bl _p_111
.word 0xd2802200
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_111

Lme_cd:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 3 282 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_ce:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 3 287 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_cf:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 3 292 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xd2894ae0
bl _p_110
.word 0xaa0003e1
.word 0xd2802040
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_d0:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 3 298 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2894ae0
bl _p_110
.word 0xaa0003e1
.word 0xd2802040
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0xd2800000
.word 0xf9000fa0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1216]
.word 0xd2800401
bl _p_6
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_d1:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 3 304 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d2:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor:
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d3:
.text
ut_212:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray:
.file 7 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/Common/src/System/Collections/Generic/LargeArrayBuilder.cs"
.loc 7 313 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fbf
.word 0x910063a1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1a03e0
bl _p_154
.word 0x53001c00
.word 0x34000060
.loc 7 316 0
.word 0xf9400fa0
.word 0x14000010
.loc 7 319 0
.word 0xb9802f41

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
bl _p_100
.word 0xf9000fa0
.loc 7 320 0
.word 0xf9400fa1
.word 0xb9802f43

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1a03e0
.word 0xd2800002
bl _p_155
.loc 7 321 0
.word 0xf9400fa0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d4:
.text
ut_213:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool:
.loc 7 86 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xf9400ba0
.word 0xd29fffe1
.word 0xf2afffe1
bl _p_156
.loc 7 91 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d5:
.text
ut_214:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int:
.loc 7 101 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xd2800000
.word 0xf9000320
.word 0xf9000720
.word 0xf9000b20
.word 0xf9000f20
.word 0xf9001320
.word 0xf9001720
.loc 7 105 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0xaa0003e1
.word 0xf9001321
.word 0x91008322
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xf9000720
.word 0x91002321
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 7 106 0
.word 0xb9801ba0
.word 0xb9000320
.loc 7 107 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d6:
.text
ut_215:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count:
.loc 7 112 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xb9802c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d7:
.text
ut_216:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position:
.loc 7 127 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xb9802b40
.word 0xf9401341
.word 0xb9801821
.word 0x6b01001f
.word 0x540000c1
.loc 7 129 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1a03e0
bl _p_140
.loc 7 132 0
.word 0xf9401340
.word 0xb9802b59
.word 0xaa1903e1
.word 0x11000421
.word 0xb9002b41
.word 0x93407f21
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540001e9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 7 133 0
.word 0xb9802f40
.word 0x11000400
.word 0xb9002f40
.loc 7 134 0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_d8:
.text
ut_217:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.loc 7 148 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001fbf
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001fa0
.loc 7 150 0
.word 0xf940133a
.loc 7 151 0
.word 0xb9802b38
.word 0x14000030
.loc 7 158 0
.word 0xb9801b40
.word 0x6b00031f
.word 0x540001c1
.loc 7 161 0
.word 0xb9802f20
.word 0xb9802b21
.word 0x4b010301
.word 0xb010000
.word 0xb9002f20
.loc 7 162 0
.word 0xb9002b38
.loc 7 163 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e0
bl _p_140
.loc 7 164 0
.word 0xf940133a
.loc 7 165 0
.word 0xb9802b38
.loc 7 168 0
.word 0xaa1803e0
.word 0xf9003ba0
.word 0x11000718
.word 0xf9401fa1
.word 0x9100a3a0
.word 0xf90023a0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1560]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0x93407c00
.word 0xb9801b41
.word 0xeb00003f
.word 0x10000011
.word 0x54000689
.word 0xd37cec00
.word 0x8b000340
.word 0x91008000
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.loc 7 156 0
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff8c0
.loc 7 172 0
.word 0xb9802f20
.word 0xb9802b21
.word 0x4b010301
.word 0xb010000
.word 0xb9002f20
.loc 7 173 0
.word 0xb9002b38
.loc 7 174 0
.word 0xf90027bf
.word 0x94000005
.word 0xf94027a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90033be
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94033be
.word 0xd61f03c0
.loc 7 175 0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_d9:
.text
ut_218:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int:
.loc 7 189 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f7
.word 0xaa0103f8
.word 0xaa0203f9
.word 0xaa0303fa
.word 0xd2800016
.word 0x14000019
.loc 7 192 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1703e0
.word 0xaa1603e1
bl _p_157
.word 0xaa0003f5
.loc 7 195 0
.word 0xb9801aa0
.word 0xaa1a03f4
.word 0xaa0003f3
.word 0x6b00035f
.word 0x5400004d
.word 0x14000002
.word 0xaa1403f3
.word 0xaa1303f4
.loc 7 196 0
.word 0xaa1503e0
.word 0xd2800001
.word 0xaa1803e2
.word 0xaa1903e3
.word 0xaa1303e4
bl _p_122
.loc 7 199 0
.word 0x4b13035a
.loc 7 200 0
.word 0xb130339
.loc 7 189 0
.word 0x110006d6
.word 0xd2800000
.word 0x6b00035f
.word 0x54fffccc
.loc 7 202 0
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_da:
.text
ut_219:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int:
.loc 7 0 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f7
.word 0xf90027a1
.word 0xaa0203f8
.word 0xaa0303f9
.word 0xaa0403fa
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf90043a0
.word 0xb9006bbf
.word 0xb9006fbf
.word 0xb90073ba
.word 0x9101c3a0
.word 0xf9003fb8
.word 0x91002000
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xb90083b9
.loc 7 231 0
.word 0xb9804bba
.loc 7 232 0
.word 0xb9804fb9
.loc 7 234 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1703e0
.word 0xaa1a03e1
bl _p_157
.word 0xaa0003f8
.loc 7 235 0
.word 0xaa1803e0
.word 0x9101c3a2

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e1
bl _p_158
.word 0x93407c00
.word 0xaa0003f6
.loc 7 242 0
.word 0xb98073a0
.word 0x35000240
.loc 7 244 0
.word 0xb160320
.word 0xb90063bf
.word 0xb90067bf
.word 0xb90063ba
.word 0xb90067a0
.word 0xb98063a0
.word 0xb9006ba0
.word 0xb98067a0
.word 0xb9006fa0
.word 0x9101a3a0
.word 0xb9801b01
.word 0x9100e3a2
.word 0xf90047a2
bl _p_159
.word 0xf94047be
.word 0xf90003c0
.word 0x14000026
.loc 7 249 0
.word 0x11000740
.word 0xaa0003e1
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1703e0
bl _p_157
.word 0xaa0003f8
.loc 7 250 0
.word 0xaa1803e0
.word 0x9101c3a2

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xd2800001
bl _p_158
.word 0x93407c00
.word 0xaa0003f6
.loc 7 256 0
.word 0xb98073a0
.word 0xd2800001
.word 0x6b01001f
.word 0x54fffd6c
.loc 7 258 0
.word 0xb9005bbf
.word 0xb9005fbf
.word 0xb9005bba
.word 0xb9005fb6
.word 0xb9805ba0
.word 0xb9006ba0
.word 0xb9805fa0
.word 0xb9006fa0
.word 0x9101a3a0
.word 0xb9801b01
.word 0x9100e3a2
.word 0xf90047a2
bl _p_159
.word 0xf94047be
.word 0xf90003c0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0xf9401fa0
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_db:
.text
ut_220:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int:
.loc 7 292 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xb9801ba0
.word 0x34000380
.word 0x91004320

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1568]
.word 0xb9800801
.word 0xb9801ba0
.word 0x6b01001f
.word 0x5400006d
.word 0xf9401320
.word 0x14000013
.word 0x91004320
.word 0xb9801ba1
.word 0x51000421

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #1568]
.word 0xf9400000
.word 0x93407c21
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x54000169
.word 0xd37df021
.word 0x8b010000
.word 0x91008000
.word 0xf9400000
.word 0x14000002
.word 0xf9400720
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_dc:
.text
ut_221:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position:
.loc 7 306 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xfd0013a0
.word 0xfd0017a1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1400]
.word 0xaa1a03f9
.word 0xf94013a0
.word 0xf90033a0
.word 0xf94017a0
.word 0xf90037a0
.word 0xb9802b40
.word 0xf9401341
.word 0xb9801821
.word 0x6b01001f
.word 0x540000c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e0
bl _p_140
.word 0xf9401320
.word 0xb9802b3a
.word 0xaa1a03e1
.word 0x11000421
.word 0xb9002b21
.word 0x93407f41
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540001e9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf94033a1
.word 0xf9000001
.word 0xf94037a1
.word 0xf9000401
.word 0xb9802f20
.word 0x11000400
.word 0xb9002f20
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_dd:
.text
ut_222:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___:
.loc 7 331 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba1
.word 0xf9400420
.word 0xf9400fa2
.word 0xf9000040
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.loc 7 332 0
.word 0xb9802c20
.word 0xf9400421
.word 0xb9801821
.word 0x6b01001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_de:
.text
ut_223:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer:
.loc 7 348 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xb9802f40
.word 0xd2800101
.word 0x6b01001f
.word 0x54000682
.loc 7 353 0
.word 0xb9802f40
.word 0x34000080
.word 0xb9802f40
.word 0x531f7819
.word 0x14000002
.word 0xd2800099
.word 0xb9800340
.word 0xaa1903f8
.word 0xaa0003f9
.word 0x6b00031f
.word 0x5400004d
.word 0x14000002
.word 0xaa1803f9
.word 0xaa1903f8
.loc 7 355 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1903e1
bl _p_100
.word 0xf9001340
.word 0x91008341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 7 356 0
.word 0xf9400740
.word 0xf9401342
.word 0xb9802f44
.word 0xd2800001
.word 0xd2800003
bl _p_122
.loc 7 357 0
.word 0xf9401340
.word 0xf9000740
.word 0x91002341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 7 358 0
.word 0x1400002a
.loc 7 365 0
.word 0xb9802f40
.word 0xd2800101
.word 0x6b01001f
.word 0x54000061
.loc 7 367 0
.word 0xd2800119
.loc 7 368 0
.word 0x14000012
.loc 7 381 0
.word 0x91004340
.word 0xf9401341

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1568]
bl _p_160
.loc 7 382 0
.word 0xb9802f40
.word 0xb9800341
.word 0xb9802f42
.word 0x4b020021
.word 0xaa0003f9
.word 0xaa0103f8
.word 0x6b01001f
.word 0x5400004d
.word 0x14000002
.word 0xaa1903f8
.word 0xaa1803f9
.loc 7 385 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1903e1
bl _p_100
.word 0xf9001340
.word 0x91008341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 7 386 0
.word 0xb9002b5f
.loc 7 388 0
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_df:
.text
ut_224:
add x0, x0, 16
b System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
.text
	.align 4
	.no_dead_strip System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_:
.loc 7 271 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xf90013ba
.word 0xf90017a0
.word 0xf9001ba1
.word 0xaa0203fa
.word 0xf94017a0
.word 0xb9801800
.word 0xb98033a1
.word 0x4b010000
.word 0xb9800341
.word 0xaa0003f7
.word 0xaa0103f6
.word 0x6b01001f
.word 0x5400004d
.word 0x14000002
.word 0xaa1703f6
.word 0xaa1603f7
.loc 7 272 0
.word 0xf9400742
.word 0xb9801343
.word 0xf94017a0
.word 0xb98033a1
.word 0xaa1603e4
bl _p_122
.loc 7 274 0
.word 0xb9801340
.word 0xb160000
.word 0xb9001340
.loc 7 275 0
.word 0xb9800340
.word 0x4b160000
.word 0xb9000340
.loc 7 277 0
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_e0:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position:
.file 8 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/Common/src/CoreLib/System/Collections/Generic/List.cs"
.loc 8 249 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xb9802340
.loc 8 250 0
.word 0xf90033a0
.word 0x11000401
.word 0xaa1a03e0
bl _p_161
.word 0xf94033a1
.loc 8 251 0
.word 0x11000420
.word 0xb9002340
.loc 8 252 0
.word 0xf9400b40
.word 0x93407c21
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x54000189
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf9400fa1
.word 0xf9000001
.word 0xf94013a1
.word 0xf9000401
.loc 8 253 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_e1:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 3 83 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_e9:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 3 88 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xd2888920
bl _p_110
.word 0xaa0003e1
.word 0xd28021e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_ea:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 3 93 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xfd0017a0
.word 0xfd001ba1
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9400340
.word 0x3940b000
.word 0xd2800021
.word 0x6b01001f
.word 0x5400066c
.loc 3 96 0
.word 0xb9801b59
.loc 3 97 0
.word 0xd2800018
.word 0x14000028
.loc 3 99 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1368]
.word 0x93407f00
.word 0xd37cec00
.word 0x8b000340
.word 0x91008000
.word 0xf9400001
.word 0xf9003fa1
.word 0xf9400400
.word 0xf90043a0
.loc 3 100 0
.word 0x14000004
.loc 3 101 0
.word 0x1400001a
.loc 3 102 0
.word 0xd2800020
.word 0x1400001c
.loc 3 108 0
.word 0x9100a3a0
.word 0xf9004ba0
.word 0xf9403fa0
.word 0xf90037a0
.word 0xf94043a0
.word 0xf9003ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1216]
.word 0xd2800401
bl _p_6
.word 0xaa0003e1
.word 0xf9404ba0
.word 0x91004022
.word 0xf94037a3
.word 0xf9000043
.word 0xf9403ba3
.word 0xf9000443
bl _p_162
.word 0x53001c00
.word 0x34000060
.loc 3 109 0
.word 0xd2800020
.word 0x14000005
.loc 3 97 0
.word 0x11000718
.word 0x6b19031f
.word 0x54fffb0b
.loc 3 113 0
.word 0xd2800000
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.loc 3 94 0
.word 0xd28890a0
bl _p_110
.word 0xaa0003e1
.word 0xd2802380
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_111

Lme_eb:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int:
.loc 3 118 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb6
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9400fa0
.word 0xf9001ba0
.word 0xf9400fa0
.word 0xf9400816
.word 0xeb1f02df
.word 0x54000060
.word 0xb98006d6
.word 0x14000002
.word 0xd2800016
.word 0xf9400fa0
.word 0xb9801804
.word 0xf9401ba0
.word 0xaa1603e1
.word 0xf94013a2
.word 0xb9802ba3
bl _p_122
.loc 3 119 0
.word 0xf9400bb6
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_ec:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb5000260
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000120
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x53001c00
.word 0x14000022
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x53001c00
.word 0x1400001b
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba1
.word 0x53001c00
.word 0x53001c17
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd4b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffc7
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_f1:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb5000220
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000100
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x1400001e
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x14000018
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000389
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba0
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd8b
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffcc
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_f6:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1
.word 0xfd003ba2
.word 0xfd003fa3

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x350007c0
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb50002e0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000160
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xd63f0020
.word 0x93407c00
.word 0x14000026
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xd63f0000
.word 0x93407c00
.word 0x1400001d
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xf9005ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0x93407c00
.word 0xf9405ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd0b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffc1
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_fd:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor:
.loc 8 34 0 prologue_end
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xd2800001
bl _p_100
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1416]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_fe:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool:
.file 9 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/System.Linq/src/System/Linq/Where.cs"
.loc 9 87 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_137
.loc 9 91 0
.word 0xf9400fa0
.word 0xf9001700
.word 0x9100a301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 9 92 0
.word 0xf94013a0
.word 0xf9001b00
.word 0x9100c301
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 9 93 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_ff:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403759
.word 0xaa1903e0
.word 0xb5000260
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000120
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x53001c00
.word 0x14000022
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x53001c00
.word 0x1400001b
.word 0xb9801b3a
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba1
.word 0x53001c00
.word 0x53001c17
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd4b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xaa1903e0
bl _p_111
bl _p_120
.word 0xaa0003f9
.word 0xb5ffff80
.word 0x17ffffc7
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_104:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone:
.loc 9 95 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1424]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_144
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_105:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 9 99 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9401f40
.word 0xb4000180
.loc 9 101 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.loc 9 102 0
.word 0xf9001f5f
.loc 9 105 0
.word 0xaa1a03e0
bl _p_138
.loc 9 106 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_106:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 9 110 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001bbf
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0x3400009a
.loc 9 112 0
.word 0x92800000
.word 0xf2bfffe0
.word 0x1400004e
.loc 9 115 0
.word 0xd280001a
.loc 9 117 0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001ba0
.word 0x1400001f
.word 0xf9401ba1
.word 0x910083a0
.word 0xf9001fa0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1560]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 9 119 0
.word 0xf9401b21
.word 0xaa0103e0
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf90033a1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94033a1
.word 0x53001c00
.word 0x340000c0
.loc 9 123 0
.word 0xd2800020
.word 0x2b000340
.word 0x10000011
.word 0x54000506
.word 0xaa0003fa
.loc 9 117 0
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffae0
.word 0xf90023bf
.word 0x94000005
.word 0xf94023a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf9002fbe
.word 0xf9401ba0
.word 0xb4000160
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402fbe
.word 0xd61f03c0
.loc 9 128 0
.word 0xaa1a03e0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd28022e0
.word 0xaa1103e1
bl _p_25

Lme_107:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 9 133 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0xb9801759
.word 0xaa1903e0
.word 0xd2800021
.word 0x6b01001f
.word 0x540000a0
.word 0xd2800040
.word 0x6b00033f
.word 0x54000760
.word 0x1400004a
.loc 9 136 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001f40
.word 0x9100e341
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 9 137 0
.word 0xd280005e
.word 0xb900175e
.loc 9 138 0
.word 0x14000021
.loc 9 142 0
.word 0xf9401f41
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1560]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 9 143 0
.word 0xf9401b41
.word 0xaa0103e0
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf90023a1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x34000100
.loc 9 145 0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 9 146 0
.word 0xd2800020
.word 0x14000012
.loc 9 140 0
.word 0xf9401f41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffaa0
.loc 9 150 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 9 154 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_108:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray:
.loc 9 162 0 prologue_end
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xf9002fa0
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9003fbf
.word 0xd2800000
.word 0xf9001fa0
.word 0xf90023a0
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xd2800021
bl _p_139
.loc 9 164 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9003fa0
.word 0x14000041
.word 0xf9403fa1
.word 0x9100e3a0
.word 0xf90043a0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1560]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.loc 9 166 0
.word 0xf9401b41
.word 0xaa0103e0
.word 0xfd401fa0
.word 0xfd4023a1
.word 0xf9005ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9405ba1
.word 0x53001c00
.word 0x34000500
.loc 9 168 0
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1400]
.word 0xaa0003f9
.word 0xf9401fa0
.word 0xf90017a0
.word 0xf94023a0
.word 0xf9001ba0
.word 0xb9802b20
.word 0xf9401321
.word 0xb9801821
.word 0x6b01001f
.word 0x540000c1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
.word 0xaa1903e0
bl _p_140
.word 0xf9401320
.word 0xb9802b38
.word 0xaa1803e1
.word 0x11000421
.word 0xb9002b21
.word 0x93407f01
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.word 0xb9802f20
.word 0x11000400
.word 0xb9002f20
.loc 9 164 0
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff6a0
.word 0xf90047bf
.word 0x94000005
.word 0xf94047a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90053be
.word 0xf9403fa0
.word 0xb4000160
.word 0xf9403fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94053be
.word 0xd61f03c0
.loc 9 172 0
.word 0x910123a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1400]
bl _p_141
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_109:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList:
.loc 9 177 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa
.word 0xf9002fbf
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f9
.loc 9 179 0
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9002fa0
.word 0x1400003c
.word 0xf9402fa1
.word 0x910123a0
.word 0xf90033a0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1560]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94033be
.word 0xfd0003c0
.word 0xfd0007c1
.loc 9 181 0
.word 0xf9401b41
.word 0xaa0103e0
.word 0xfd4027a0
.word 0xfd402ba1
.word 0xf9004ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9404ba1
.word 0x53001c00
.word 0x34000460
.loc 9 183 0
.word 0xaa1903f8
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf9402ba0
.word 0xf90023a0
.word 0x3940033e
.word 0xf9400b17
.word 0xb9802316
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801ae0
.word 0x6b0002df
.word 0x54000202
.word 0x110006c0
.word 0xb9002300
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x540006c9
.word 0xd37cec00
.word 0x8b0002e0
.word 0x91008000
.word 0xf9401fa1
.word 0xf9000001
.word 0xf94023a1
.word 0xf9000401
.word 0x14000006
.word 0xaa1803e0
.word 0xfd401fa0
.word 0xfd4023a1
bl _p_142
.word 0x14000001
.loc 9 179 0
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #376]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff740
.word 0xf90037bf
.word 0x94000005
.word 0xf94037a0
.word 0xb4000040
bl _p_17
.word 0x14000010
.word 0xf90043be
.word 0xf9402fa0
.word 0xb4000160
.word 0xf9402fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #384]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94043be
.word 0xd61f03c0
.loc 9 187 0
.word 0xaa1903e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_10a:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool:
.loc 9 191 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9401401
.word 0xf90017a1
.word 0xf9401800

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1576]
.word 0xf9400fa1
bl _p_163
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1424]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf90013a0
bl _p_144
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_10b:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor:
.loc 6 97 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_10c:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator:
.loc 6 99 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_10d:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator:
.loc 6 101 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_10e:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 6 103 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_10f:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 6 106 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xd2800000
.word 0xf9000ba0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_110:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 6 109 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0xf9000fa0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1216]
.word 0xd2800401
bl _p_6
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_111:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 6 111 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
bl _p_146
bl _p_111
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_112:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose:
.loc 6 116 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_113:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int:
.loc 6 118 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_114:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int:
.loc 6 120 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_115:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 6 124 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf90033a2
.word 0xf94033a0
.word 0x3900001f
.loc 6 125 0
.word 0xd2800000
.word 0xf9000ba0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_116:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 6 130 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf9402fa0
.word 0x3900001f
.loc 6 131 0
.word 0xd2800000
.word 0xf9000ba0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_117:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 6 136 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf9402fa0
.word 0x3900001f
.loc 6 137 0
.word 0xd2800000
.word 0xf9000ba0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_118:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray:
.loc 6 140 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_119:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList:
.loc 6 142 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_11a:
.text
	.align 4
	.no_dead_strip System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 6 144 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xd2800000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_11b:
.text
	.align 4
	.no_dead_strip System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor
System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor:
.file 10 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/mcs/class/corlib/System/EmptyArray.cs"
.loc 10 33 0 prologue_end
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xd2800001
bl _p_100
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9000001
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_11c:
.text
	.align 4
	.no_dead_strip System_Array_Empty_Xamarin_Forms_Maps_Position
System_Array_Empty_Xamarin_Forms_Maps_Position:
.loc 3 647 0 prologue_end
.word 0xa9bf7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x910003bf
.word 0xa8c17bfd
.word 0xd65f03c0

Lme_11d:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int:
.loc 8 51 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xd2800001
.word 0xb9801ba0
.word 0x6b01001f
.word 0x5400052b
.loc 8 54 0
.word 0xb9801ba0
.word 0x35000240
.loc 8 55 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1416]
.word 0xf9400000
.word 0xf9000b20
.word 0x91004321
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x14000012
.loc 8 57 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xb9801ba1
bl _p_100
.word 0xf9000b20
.word 0x91004321
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 8 58 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 8 52 0
.word 0xd2800180
.word 0xd2800081
bl _p_164
.word 0x17ffffd5

Lme_11e:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int:
.loc 4 794 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb6
.word 0xaa0003f6
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9001ba4
.word 0xaa1603e0
bl _p_137
.loc 4 800 0
.word 0xf9400fa0
.word 0xf90016c0
.word 0x9100a2c1
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 801 0
.word 0xf94013a0
.word 0xf9001ac0
.word 0x9100c2c1
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 802 0
.word 0xb9802ba0
.word 0xb9003ac0
.loc 4 803 0
.word 0xb98033a0
.word 0xb9003ec0
.loc 4 804 0
.word 0xf9400bb6
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_11f:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone:
.loc 4 807 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9401740
.word 0xf90017a0
.word 0xf9401b40
.word 0xf9001ba0
.word 0xb9803b40
.word 0xf9001fa0
.word 0xb9803f40
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf9401fa3
.word 0xf94023a4
.word 0xf90013a0
bl _p_150
.word 0xf94013a0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_120:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext:
.loc 4 814 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9801740
.word 0x51000419
.loc 4 815 0
.word 0xaa1903e0
.word 0xb9803f41
.word 0xb9803b42
.word 0x4b020021
.word 0x6b01001f
.word 0x54000688
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xb9803b41
.word 0x4b010000
.word 0x6b00033f
.word 0x540004aa
.loc 4 817 0
.word 0xf9401b40
.word 0xf90027a0
.word 0xf9401742
.word 0xb9803b40
.word 0xb190001
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf94027a2
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0203e0
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf94023a0
.word 0x91006340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 4 818 0
.word 0xb9801740
.word 0x11000400
.word 0xb9001740
.loc 4 819 0
.word 0xd2800020
.word 0x14000006
.loc 4 822 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9405830
.word 0xd63f0200
.loc 4 823 0
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_121:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int:
.loc 4 832 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003f9
.word 0xf90017a1
.word 0xb9803b20
.word 0xb9802ba1
.word 0xb010018
.loc 4 833 0
.word 0xaa1803e0
.word 0xb9803f21
.word 0x6b01001f
.word 0x540002c8
.word 0xf9401720
.word 0xf9001fa0
.word 0xf9401b20
.word 0xf90023a0
.word 0xb9803f20
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf9401fa1
.word 0xf94023a2
.word 0xf94027a4
.word 0xf9001ba0
.word 0xaa1803e3
bl _p_150
.word 0xf9401ba0
.word 0xaa0003fa
.word 0xaa1a03e0
.word 0x14000005

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400000
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_122:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int:
.loc 4 838 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb9803b20
.word 0xb1a0000
.word 0x5100041a
.loc 4 839 0
.word 0xaa1a03e0
.word 0xb9803f21
.word 0x6b01001f
.word 0x54000282
.word 0xf9401720
.word 0xf90017a0
.word 0xf9401b20
.word 0xf9001ba0
.word 0xb9803b20
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1536]
.word 0xd2800801
bl _p_6
.word 0xf94017a1
.word 0xf9401ba2
.word 0xf9401fa3
.word 0xf90013a0
.word 0xaa1a03e4
bl _p_150
.word 0xf94013a0
.word 0x14000002
.word 0xaa1903e0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_123:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_:
.loc 4 844 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9002fa1
.word 0xf90033a2
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xb9803f00
.word 0xb9803b01
.word 0x4b010001
.word 0xb9805ba0
.word 0x6b01001f
.word 0x54000688
.word 0xf9401701
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xb9803b01
.word 0x4b010001
.word 0xb9805ba0
.word 0x6b01001f
.word 0x5400048a
.loc 4 846 0
.word 0xf94033a0
.word 0xd280003e
.word 0x3900001e
.loc 4 847 0
.word 0xf9401b00
.word 0xf9004fa0
.word 0xf9401702
.word 0xb9803b00
.word 0xb9805ba1
.word 0xb010001
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x9101a3a0
.word 0xf90047a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94047be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xf9403ba0
.word 0xf90013a0
.word 0x1400000a
.loc 4 850 0
.word 0xf94033a0
.word 0x3900001f
.loc 4 851 0
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9403fa0
.word 0xf9000fa0
.word 0xf94043a0
.word 0xf90013a0
.word 0xf9400bb8
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_124:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_:
.loc 4 856 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9002fa1
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xb9803b21
.word 0x6b01001f
.word 0x5400044d
.loc 4 858 0
.word 0xf9402fa0
.word 0xd280003e
.word 0x3900001e
.loc 4 859 0
.word 0xf9401b20
.word 0xf9004fa0
.word 0xf9401722
.word 0xb9803b21
.word 0xaa0203e0
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9404fa2
.word 0x910183a0
.word 0xf90043a0
.word 0xaa0203e0
.word 0xf9004ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9404ba0
.word 0xf94033a0
.word 0xf9000fa0
.word 0xf94037a0
.word 0xf90013a0
.word 0x1400000a
.loc 4 862 0
.word 0xf9402fa0
.word 0x3900001f
.loc 4 863 0
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf9403ba0
.word 0xf9000fa0
.word 0xf9403fa0
.word 0xf90013a0
.word 0xf9400bb9
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_125:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_:
.loc 4 868 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xd2800000
.word 0xf90043a0
.word 0xf90047a0
.word 0xf9401721
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0x51000418
.loc 4 869 0
.word 0xaa1803e0
.word 0xb9803b21
.word 0x6b01001f
.word 0x5400048b
.loc 4 871 0
.word 0xd280003e
.word 0x3900035e
.loc 4 872 0
.word 0xf9401b3a
.word 0xf9401737
.word 0xb9803f20
.word 0xaa1803f9
.word 0xaa0003f8
.word 0x6b00033f
.word 0x5400004d
.word 0x14000002
.word 0xaa1903f8
.word 0xaa1703e0
.word 0xaa1803e1
.word 0xf94002e2

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0x9101c3a0
.word 0xf9004ba0
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200
.word 0xf9404bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0xf9001ba0
.word 0xf9403fa0
.word 0xf9001fa0
.word 0x14000009
.loc 4 875 0
.word 0x3900035f
.loc 4 876 0
.word 0xd2800000
.word 0xf90043a0
.word 0xf90047a0
.word 0xf94043a0
.word 0xf9001ba0
.word 0xf94047a0
.word 0xf9001fa0
.word 0xa94163b7
.word 0xa9426bb9
.word 0xfd401ba0
.word 0xfd401fa1
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_126:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count:
.loc 4 883 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xf9401741
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 884 0
.word 0xaa1903e0
.word 0xb9803b41
.word 0x6b01001f
.word 0x5400006c
.loc 4 886 0
.word 0xd2800000
.word 0x1400000c
.loc 4 889 0
.word 0x51000720
.word 0xb9803f41
.word 0xaa0003f9
.word 0xaa0103f8
.word 0x6b01001f
.word 0x5400004d
.word 0x14000002
.word 0xaa1903f8
.word 0xb9803b40
.word 0x4b000300
.word 0x11000400
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_127:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray:
.loc 4 895 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xaa1a03e0
bl _p_165
.word 0x93407c00
.word 0xaa0003f9
.loc 4 896 0
.word 0xaa1903e0
.word 0x350001e0
.loc 4 898 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1496]

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1504]
.word 0x3980b410
.word 0xb5000050
bl _p_116

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1512]
.word 0xf9400000
.word 0x14000035
.loc 4 901 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1903e1
bl _p_100
.word 0xaa0003f9
.loc 4 902 0
.word 0xd2800018
.word 0xb9803b57
.word 0x14000028
.loc 4 904 0
.word 0xf9401b40
.word 0xf9002fa0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1703e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9402fa2
.word 0x9100c3a0
.word 0xf90023a0
.word 0xaa0203e0
.word 0xf9002ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9402ba0
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000269
.word 0xd37cec00
.word 0x8b000320
.word 0x91008000
.word 0xf9401ba1
.word 0xf9000001
.word 0xf9401fa1
.word 0xf9000401
.loc 4 902 0
.word 0x11000718
.word 0x110006f7
.word 0xb9801b20
.word 0x6b00031f
.word 0x54fffae1
.loc 4 907 0
.word 0xaa1903e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_128:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList:
.loc 4 912 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003fa
.word 0xaa1a03e0
bl _p_165
.word 0x93407c00
.word 0xaa0003f9
.loc 4 913 0
.word 0xaa1903e0
.word 0x350002e0
.loc 4 915 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xf9400021
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x1400004d
.loc 4 918 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1408]
.word 0xd2800501
bl _p_6
.word 0xf9003ba0
.word 0xaa1903e1
bl _p_149
.word 0xf9403ba0
.word 0xaa0003f8
.loc 4 919 0
.word 0xb9803b40
.word 0xb190017
.loc 4 920 0
.word 0xb9803b59
.word 0x1400003c
.loc 4 922 0
.word 0xf9401b40
.word 0xf9003fa0
.word 0xf9401742
.word 0xaa0203e0
.word 0xaa1903e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9403fa2
.word 0x910123a0
.word 0xf90037a0
.word 0xaa0203e0
.word 0xf9003ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94037be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9403ba0
.word 0xaa1803f6
.word 0xf94027a0
.word 0xf9002fa0
.word 0xf9402ba0
.word 0xf90033a0
.word 0x3940031e
.word 0xf9400b15
.word 0xb9802314
.word 0xb9802700
.word 0x11000400
.word 0xb9002700
.word 0xb9801aa0
.word 0x6b00029f
.word 0x54000202
.word 0x11000680
.word 0xb90022c0
.word 0x93407e80
.word 0xb9801aa1
.word 0xeb00003f
.word 0x10000011
.word 0x54000309
.word 0xd37cec00
.word 0x8b0002a0
.word 0x91008000
.word 0xf9402fa1
.word 0xf9000001
.word 0xf94033a1
.word 0xf9000401
.word 0x14000005
.word 0xaa1603e0
.word 0xfd402fa0
.word 0xfd4033a1
bl _p_142
.loc 4 920 0
.word 0x11000739
.word 0x6b17033f
.word 0x54fff881
.loc 4 925 0
.word 0xaa1803e0
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0xd2801f60
.word 0xaa1103e1
bl _p_25

Lme_129:
.text
	.align 4
	.no_dead_strip System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool:
.loc 4 933 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xaa1903e0
bl _p_165
.word 0x93407c00
.word 0xaa0003f8
.loc 4 935 0
.word 0x3500043a
.loc 4 937 0
.word 0xb9803b20
.word 0xb18001a
.loc 4 938 0
.word 0xb9803b37
.word 0x1400001b
.loc 4 940 0
.word 0xf9401b20
.word 0xf9002fa0
.word 0xf9401722
.word 0xaa0203e0
.word 0xaa1703e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa0003e1
.word 0xf9402fa2
.word 0x9100c3a0
.word 0xf90023a0
.word 0xaa0203e0
.word 0xf9002ba2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9402ba0
.loc 4 938 0
.word 0x110006f7
.word 0x6b1a02ff
.word 0x54fffca1
.loc 4 944 0
.word 0xaa1803e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_12a:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int:
.loc 8 446 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xaa0003f9
.word 0xf90017a1
.word 0xf9400b20
.word 0xb9801800
.word 0xb9802ba1
.word 0x6b01001f
.word 0x540002ea
.loc 8 448 0
.word 0xf9400b20
.word 0xb9801800
.word 0x340000a0
.word 0xf9400b20
.word 0xb9801800
.word 0x531f7818
.word 0x14000002
.word 0xd2800098
.word 0xaa1803f7
.loc 8 452 0
.word 0xd29fffe0
.word 0xf2affde0
.word 0x6b00031f
.word 0x54000069
.word 0xd29ffff7
.word 0xf2affdf7
.loc 8 456 0
.word 0xb9802ba0
.word 0x6b0002ff
.word 0x5400004a
.word 0xb9802bb7
.loc 8 457 0
.word 0xaa1903e0
.word 0xaa1703e1
bl _p_166
.loc 8 459 0
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_12b:
.text
	.align 4
	.no_dead_strip System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool
System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool:
.file 11 "/Library/Frameworks/Xamarin.iOS.framework/Versions/12.2.1.12/src/Xamarin.iOS/external/corefx/src/System.Linq/src/System/Linq/Utilities.cs"
.loc 11 0 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1584]
.word 0xd2800401
bl _p_6
.word 0xf9400ba1
.word 0xf9000801
.word 0x91004002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003e1
.word 0xf90013a1
.word 0xf9400fa1
.word 0xf9000c01
.word 0x91006002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.loc 11 58 0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000580

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1592]
.word 0xd2800e01
bl _p_6
.word 0xf94013a1
.word 0xeb1f003f
.word 0x10000011
.word 0x54000400
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1600]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1608]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #1616]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901801f
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2802200
.word 0xaa1103e1
bl _p_25
.word 0xd2801500
.word 0xaa1103e1
bl _p_25

Lme_12c:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int:
.loc 8 104 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb9802320
.word 0x6b00035f
.word 0x5400072b
.loc 8 109 0
.word 0xf9400b20
.word 0xb9801800
.word 0x6b00035f
.word 0x54000620
.loc 8 111 0
.word 0xd2800000
.word 0x6b00035f
.word 0x540003cd
.loc 8 113 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1480]
.word 0xaa1a03e1
bl _p_100
.word 0xaa0003fa
.loc 8 114 0
.word 0xb9802320
.word 0xd2800001
.word 0x6b01001f
.word 0x540000ed
.loc 8 116 0
.word 0xf9400b20
.word 0xb9802324
.word 0xd2800001
.word 0xaa1a03e2
.word 0xd2800003
bl _p_122
.loc 8 118 0
.word 0xf9000b3a
.word 0x91004320
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.loc 8 119 0
.word 0x14000011
.loc 8 122 0

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x0, [x16, #1416]
.word 0xf9400000
.word 0xf9000b20
.word 0x91004321
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 8 125 0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 8 106 0
.word 0xd28001e0
.word 0xd28002a1
bl _p_164
.word 0x17ffffc5

Lme_12d:
.text
	.align 4
	.no_dead_strip System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor
System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor:
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_12e:
.text
	.align 4
	.no_dead_strip System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position
System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position:
.loc 11 58 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf90033a1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94033a1
.word 0x53001c00
.word 0x34000180
.word 0xf9400ba0
.word 0xf9400c01
.word 0xaa0103e0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf90033a1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94033a1
.word 0x53001c00
.word 0x14000002
.word 0xd2800000
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_12f:
.text
	.align 3
jit_code_end:

	.byte 0,0,0,0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
bl Xamarin_FormsMaps_get_IsiOs8OrNewer
bl Xamarin_FormsMaps_get_IsiOs9OrNewer
bl Xamarin_FormsMaps_get_IsiOs10OrNewer
bl Xamarin_FormsMaps_Init
bl Xamarin_Forms_Maps_iOS_MapPool_get_Instance
bl Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView
bl Xamarin_Forms_Maps_iOS_MapPool_Get
bl Xamarin_Forms_Maps_iOS_MapPool__ctor
bl Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double
bl Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime
bl Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool
bl Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
bl Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
bl Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews
bl Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin
bl Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
bl Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation
bl Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer
bl Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion
bl Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList
bl Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
bl Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs
bl Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool
bl Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList
bl Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled
bl Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled
bl Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser
bl Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType
bl Xamarin_Forms_Maps_iOS_MapRenderer__ctor
bl Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_iOS_GeocoderBackend_Register
bl Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor
bl Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor
bl Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer
bl Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor
bl Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
bl method_addresses
bl System_Nullable_1_bool__ctor_bool
bl System_Nullable_1_bool_get_HasValue
bl System_Nullable_1_bool_get_Value
bl System_Nullable_1_bool_Equals_object
bl System_Nullable_1_bool_Equals_System_Nullable_1_bool
bl System_Nullable_1_bool_GetHashCode
bl System_Nullable_1_bool_GetValueOrDefault
bl System_Nullable_1_bool_ToString
bl System_Nullable_1_bool_Box_System_Nullable_1_bool
bl System_Nullable_1_bool_Unbox_object
bl System_Nullable_1_bool_UnboxExact_object
bl System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
bl wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs
bl wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
bl wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl System_Array_InternalArray__ICollection_get_Count
bl System_Array_InternalArray__ICollection_get_IsReadOnly
bl System_Array_InternalArray__ICollection_Clear
bl System_Array_InternalArray__ICollection_Add_T_REF_T_REF
bl System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
bl System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
bl System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
bl wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
bl wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
bl wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
bl System_Array_InternalArray__Insert_T_REF_int_T_REF
bl System_Array_InternalArray__RemoveAt_int
bl System_Array_InternalArray__IndexOf_T_REF_T_REF
bl System_Array_InternalArray__get_Item_T_REF_int
bl System_Array_InternalArray__set_Item_T_REF_int_T_REF
bl wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs
bl wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
bl wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer
bl wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
bl wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
bl method_addresses
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
bl wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
bl wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
bl wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
bl wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark
bl System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark
bl wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark
bl wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark
bl wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
bl System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current
bl method_addresses
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator
bl method_addresses
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
bl System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
bl wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
bl System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor
bl System_Array_Empty_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
bl System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
bl System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
bl System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor
bl System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position
method_addresses_end:

.section __TEXT, __const
	.align 3
unbox_trampolines:

	.long 47,48,49,50,51,52,53,54
	.long 55,56,57,101,102,103,104,105
	.long 106,135,212,213,214,215,216,217
	.long 218,219,220,221,222,223,224
unbox_trampolines_end:

	.long 0
.text
	.align 3
unbox_trampoline_addresses:
bl ut_47
bl ut_48
bl ut_49
bl ut_50
bl ut_51
bl ut_52
bl ut_53
bl ut_54
bl ut_55
bl ut_56
bl ut_57
bl ut_101
bl ut_102
bl ut_103
bl ut_104
bl ut_105
bl ut_106
bl ut_135
bl ut_212
bl ut_213
bl ut_214
bl ut_215
bl ut_216
bl ut_217
bl ut_218
bl ut_219
bl ut_220
bl ut_221
bl ut_222
bl ut_223
bl ut_224

	.long 0
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 0,13,12,31,0,68,14,32,157,4,158,3,68,13,29,13,12,31,0,68,14,16,157,2,158,1,68,13,29,16,12,31
	.byte 0,68,14,48,157,6,158,5,68,13,29,68,154,4,13,12,31,0,68,14,48,157,6,158,5,68,13,29,13,12,31,0
	.byte 68,14,112,157,14,158,13,68,13,29,21,12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10
	.byte 24,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,151,16,152,15,68,153,14,154,13,19,12,31,0,68,14,48
	.byte 157,6,158,5,68,13,29,68,152,4,68,154,3,24,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,151,18,152
	.byte 17,68,153,16,154,15,23,12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,153,6,154,5,26,12
	.byte 31,0,68,14,96,157,12,158,11,68,13,29,68,150,10,151,9,68,152,8,153,7,68,154,6,23,12,31,0,68,14,96
	.byte 157,12,158,11,68,13,29,68,151,10,152,9,68,153,8,154,7,18,12,31,0,68,14,32,157,4,158,3,68,13,29,68
	.byte 153,2,154,1,21,12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12,153,11,68,154,10,24,12,31,0,68,14
	.byte 128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11,22,12,31,0,68,14,192,2,157,40,158,39,68
	.byte 13,29,68,152,38,153,37,68,154,36,17,12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,153,22,21,12,31,0
	.byte 68,14,48,157,6,158,5,68,13,29,68,152,4,153,3,68,154,2,18,12,31,0,68,14,48,157,6,158,5,68,13,29
	.byte 68,152,4,153,3,21,12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,153,5,68,154,4,14,12,31,0,68
	.byte 14,160,1,157,20,158,19,68,13,29,13,12,31,0,68,14,80,157,10,158,9,68,13,29,13,12,31,0,68,14,64,157
	.byte 8,158,7,68,13,29,19,12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,68,154,5,17,12,31,0,68,14
	.byte 176,1,157,22,158,21,68,13,29,68,154,20,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6,16,12,31
	.byte 0,68,14,32,157,4,158,3,68,13,29,68,154,2,28,12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150
	.byte 7,68,151,6,152,5,68,153,4,154,3,26,12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,152
	.byte 4,153,3,68,154,2,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,26,12,31,0,68,14,80,157,10
	.byte 158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4,21,12,31,0,68,14,64,157,8,158,7,68,13,29
	.byte 68,150,6,151,5,68,152,4,23,12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.byte 16,12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10,27,12,31,0,68,14,176,1,157,22,158,21,68,13,29
	.byte 68,150,20,151,19,68,152,18,153,17,68,154,16,16,12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,18,12
	.byte 31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7,22,12,31,0,68,14,192,1,157,24,158,23,68,13,29
	.byte 68,152,22,153,21,68,154,20,27,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153
	.byte 15,68,154,14,22,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,68,154,12,13,12,31,0,68
	.byte 14,96,157,12,158,11,68,13,29,17,12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,153,20,14,12,31,0,68
	.byte 14,176,1,157,22,158,21,68,13,29,16,12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,19,12,31,0,68
	.byte 14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,21,12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.byte 153,7,68,154,6,32,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152
	.byte 10,153,9,68,154,8,17,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18,19,12,31,0,68,14,128,1
	.byte 157,16,158,15,68,13,29,68,153,14,154,13,18,12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5,14
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,39,12,31,0,68,14,160,1,157,20,158,19,68,13,29,76,147,13
	.byte 148,12,68,149,11,150,10,68,151,9,152,8,68,153,7,154,6,68,155,5,156,4,18,12,31,0,68,14,96,157,12,158
	.byte 11,68,13,29,68,153,10,154,9,33,12,31,0,68,14,80,157,10,158,9,68,13,29,68,147,8,148,7,68,149,6,150
	.byte 5,68,151,4,152,3,68,153,2,154,1,27,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,150,16,151,15,68
	.byte 152,14,153,13,68,154,12,18,12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,154,11,21,12,31,0,68,14
	.byte 64,157,8,158,7,68,13,29,68,150,6,151,5,68,154,4,16,12,31,0,68,14,112,157,14,158,13,68,13,29,68,154
	.byte 12,22,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18,153,17,68,154,16,24,12,31,0,68,14,192,1
	.byte 157,24,158,23,68,13,29,68,151,22,152,21,68,153,20,154,19,16,12,31,0,68,14,80,157,10,158,9,68,13,29,68
	.byte 154,8,17,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,153,18,21,12,31,0,68,14,48,157,6,158,5,68
	.byte 13,29,68,151,4,152,3,68,153,2

.text
	.align 4
plt:
mono_aot_Xamarin_Forms_Maps_iOS_plt:
	.no_dead_strip plt_UIKit_UIDevice_get_CurrentDevice
plt_UIKit_UIDevice_get_CurrentDevice:
_p_1:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1632]
br x16
.word 7283
	.no_dead_strip plt_UIKit_UIDevice_CheckSystemVersion_int_int
plt_UIKit_UIDevice_CheckSystemVersion_int_int:
_p_2:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1640]
br x16
.word 7288
	.no_dead_strip plt_System_Nullable_1_bool__ctor_bool
plt_System_Nullable_1_bool__ctor_bool:
_p_3:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1648]
br x16
.word 7293
	.no_dead_strip plt_System_Nullable_1_bool_get_Value
plt_System_Nullable_1_bool_get_Value:
_p_4:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1656]
br x16
.word 7304
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_GeocoderBackend_Register
plt_Xamarin_Forms_Maps_iOS_GeocoderBackend_Register:
_p_5:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1664]
br x16
.word 7315
	.no_dead_strip plt_wrapper_alloc_object_AllocSmall_intptr_intptr
plt_wrapper_alloc_object_AllocSmall_intptr_intptr:
_p_6:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1672]
br x16
.word 7317
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapPool__ctor
plt_Xamarin_Forms_Maps_iOS_MapPool__ctor:
_p_7:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1680]
br x16
.word 7325
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapPool_get_Instance
plt_Xamarin_Forms_Maps_iOS_MapPool_get_Instance:
_p_8:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1688]
br x16
.word 7327
	.no_dead_strip plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView_Enqueue_MapKit_MKMapView
plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView_Enqueue_MapKit_MKMapView:
_p_9:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1696]
br x16
.word 7329
	.no_dead_strip plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView_TryDequeue_MapKit_MKMapView_
plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView_TryDequeue_MapKit_MKMapView_:
_p_10:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1704]
br x16
.word 7340
	.no_dead_strip plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView__ctor
plt_System_Collections_Concurrent_ConcurrentQueue_1_MapKit_MKMapView__ctor:
_p_11:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1712]
br x16
.word 7351
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_UIViewExtensions_GetSizeRequest_UIKit_UIView_double_double_double_double
plt_Xamarin_Forms_Platform_iOS_UIViewExtensions_GetSizeRequest_UIKit_UIView_double_double_double_double:
_p_12:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1720]
br x16
.word 7362
	.no_dead_strip plt_Xamarin_FormsMaps_get_IsiOs9OrNewer
plt_Xamarin_FormsMaps_get_IsiOs9OrNewer:
_p_13:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1728]
br x16
.word 7367
	.no_dead_strip plt_Xamarin_Forms_MessagingCenter_Unsubscribe_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_object_string
plt_Xamarin_Forms_MessagingCenter_Unsubscribe_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_object_string:
_p_14:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1736]
br x16
.word 7369
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
_p_15:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1744]
br x16
.word 7381
	.no_dead_strip plt_Xamarin_Forms_BindableObject_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
plt_Xamarin_Forms_BindableObject_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
_p_16:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1752]
br x16
.word 7392
	.no_dead_strip plt__jit_icall_ves_icall_thread_finish_async_abort
plt__jit_icall_ves_icall_thread_finish_async_abort:
_p_17:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1760]
br x16
.word 7397
	.no_dead_strip plt_MapKit_MKMapView_remove_RegionChanged_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs
plt_MapKit_MKMapView_remove_RegionChanged_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs:
_p_18:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1768]
br x16
.word 7435
	.no_dead_strip plt_MapKit_MKMapView_set_GetViewForAnnotation_MapKit_MKMapViewAnnotation
plt_MapKit_MKMapView_set_GetViewForAnnotation_MapKit_MKMapViewAnnotation:
_p_19:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1776]
br x16
.word 7440
	.no_dead_strip plt_MapKit_MKMapView_get_Delegate
plt_MapKit_MKMapView_get_Delegate:
_p_20:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1784]
br x16
.word 7445
	.no_dead_strip plt_MapKit_MKMapView_set_Delegate_MapKit_IMKMapViewDelegate
plt_MapKit_MKMapView_set_Delegate_MapKit_IMKMapViewDelegate:
_p_21:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1792]
br x16
.word 7450
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView
plt_Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView:
_p_22:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1800]
br x16
.word 7455
	.no_dead_strip plt_Foundation_NSObject_Dispose
plt_Foundation_NSObject_Dispose:
_p_23:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1808]
br x16
.word 7457
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_Dispose_bool
plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_Dispose_bool:
_p_24:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1816]
br x16
.word 7462
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_25:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1824]
br x16
.word 7473
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View:
_p_26:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1832]
br x16
.word 7508
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapPool_Get
plt_Xamarin_Forms_Maps_iOS_MapPool_Get:
_p_27:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1840]
br x16
.word 7519
	.no_dead_strip plt__jit_icall_ves_icall_object_new_specific
plt__jit_icall_ves_icall_object_new_specific:
_p_28:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1848]
br x16
.word 7521
	.no_dead_strip plt_MapKit_MKMapView__ctor_CoreGraphics_CGRect
plt_MapKit_MKMapView__ctor_CoreGraphics_CGRect:
_p_29:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1856]
br x16
.word 7553
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_SetNativeControl_UIKit_UIView
plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_SetNativeControl_UIKit_UIView:
_p_30:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1864]
br x16
.word 7558
	.no_dead_strip plt__jit_icall_mono_ldvirtfn
plt__jit_icall_mono_ldvirtfn:
_p_31:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1872]
br x16
.word 7569
	.no_dead_strip plt_MapKit_MKMapViewAnnotation__ctor_object_intptr
plt_MapKit_MKMapViewAnnotation__ctor_object_intptr:
_p_32:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1880]
br x16
.word 7585
	.no_dead_strip plt_MapKit_MKMapView_add_RegionChanged_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs
plt_MapKit_MKMapView_add_RegionChanged_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs:
_p_33:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1888]
br x16
.word 7590
	.no_dead_strip plt_Xamarin_Forms_MessagingCenter_Subscribe_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_object_string_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_Map
plt_Xamarin_Forms_MessagingCenter_Subscribe_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_object_string_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_Map:
_p_34:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1896]
br x16
.word 7595
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan:
_p_35:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1904]
br x16
.word 7607
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool
plt_Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool:
_p_36:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1912]
br x16
.word 7612
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType
plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType:
_p_37:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1920]
br x16
.word 7614
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser
plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser:
_p_38:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1928]
br x16
.word 7616
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled
plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled:
_p_39:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1936]
br x16
.word 7618
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled
plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled:
_p_40:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1944]
br x16
.word 7620
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
_p_41:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1952]
br x16
.word 7622
	.no_dead_strip plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction
plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction:
_p_42:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1960]
br x16
.word 7633
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
plt_Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
_p_43:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1968]
br x16
.word 7638
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs:
_p_44:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1976]
br x16
.word 7640
	.no_dead_strip plt_string_op_Equality_string_string
plt_string_op_Equality_string_string:
_p_45:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1984]
br x16
.word 7651
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_LayoutSubviews
plt_Xamarin_Forms_Platform_iOS_ViewRenderer_2_Xamarin_Forms_View_UIKit_UIView_LayoutSubviews:
_p_46:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #1992]
br x16
.word 7656
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion
plt_Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion:
_p_47:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2000]
br x16
.word 7667
	.no_dead_strip plt_MapKit_MKPointAnnotation__ctor
plt_MapKit_MKPointAnnotation__ctor:
_p_48:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2008]
br x16
.word 7669
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Label
plt_Xamarin_Forms_Maps_Pin_get_Label:
_p_49:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2016]
br x16
.word 7674
	.no_dead_strip plt_MapKit_MKShape_set_Title_string
plt_MapKit_MKShape_set_Title_string:
_p_50:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2024]
br x16
.word 7679
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Address
plt_Xamarin_Forms_Maps_Pin_get_Address:
_p_51:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2032]
br x16
.word 7684
	.no_dead_strip plt_MapKit_MKShape_set_Subtitle_string
plt_MapKit_MKShape_set_Subtitle_string:
_p_52:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2040]
br x16
.word 7689
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Position
plt_Xamarin_Forms_Maps_Pin_get_Position:
_p_53:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2048]
br x16
.word 7694
	.no_dead_strip plt_MapKit_MKPointAnnotation_set_Coordinate_CoreLocation_CLLocationCoordinate2D
plt_MapKit_MKPointAnnotation_set_Coordinate_CoreLocation_CLLocationCoordinate2D:
_p_54:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2056]
br x16
.word 7699
	.no_dead_strip plt_ObjCRuntime_Runtime_GetNSObject_intptr
plt_ObjCRuntime_Runtime_GetNSObject_intptr:
_p_55:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2064]
br x16
.word 7704
	.no_dead_strip plt_MapKit_MKMapView_DequeueReusableAnnotation_string
plt_MapKit_MKMapView_DequeueReusableAnnotation_string:
_p_56:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2072]
br x16
.word 7709
	.no_dead_strip plt_MapKit_MKPinAnnotationView__ctor_MapKit_IMKAnnotation_string
plt_MapKit_MKPinAnnotationView__ctor_MapKit_IMKAnnotation_string:
_p_57:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2080]
br x16
.word 7714
	.no_dead_strip plt_MapKit_MKAnnotationView_set_CanShowCallout_bool
plt_MapKit_MKAnnotationView_set_CanShowCallout_bool:
_p_58:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2088]
br x16
.word 7719
	.no_dead_strip plt_MapKit_MKAnnotationView_set_Annotation_MapKit_IMKAnnotation
plt_MapKit_MKAnnotationView_set_Annotation_MapKit_IMKAnnotation:
_p_59:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2096]
br x16
.word 7724
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation
plt_Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation:
_p_60:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2104]
br x16
.word 7729
	.no_dead_strip plt_UIKit_UIView_get_GestureRecognizers
plt_UIKit_UIView_get_GestureRecognizers:
_p_61:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2112]
br x16
.word 7731
	.no_dead_strip plt_UIKit_UIView_RemoveGestureRecognizer_UIKit_UIGestureRecognizer
plt_UIKit_UIView_RemoveGestureRecognizer_UIKit_UIGestureRecognizer:
_p_62:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2120]
br x16
.word 7736
	.no_dead_strip plt_UIKit_UITapGestureRecognizer__ctor_System_Action_1_UIKit_UITapGestureRecognizer
plt_UIKit_UITapGestureRecognizer__ctor_System_Action_1_UIKit_UITapGestureRecognizer:
_p_63:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2128]
br x16
.word 7741
	.no_dead_strip plt_UIKit_UIGestureRecognizer_set_ShouldReceiveTouch_UIKit_UITouchEventArgs
plt_UIKit_UIGestureRecognizer_set_ShouldReceiveTouch_UIKit_UITouchEventArgs:
_p_64:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2136]
br x16
.word 7746
	.no_dead_strip plt_UIKit_UIView_AddGestureRecognizer_UIKit_UIGestureRecognizer
plt_UIKit_UIView_AddGestureRecognizer_UIKit_UIGestureRecognizer:
_p_65:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2144]
br x16
.word 7751
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
plt_Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin:
_p_66:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2152]
br x16
.word 7756
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_SendTap
plt_Xamarin_Forms_Maps_Pin_SendTap:
_p_67:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2160]
br x16
.word 7761
	.no_dead_strip plt_Xamarin_Forms_BindableObject_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
plt_Xamarin_Forms_BindableObject_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
_p_68:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2168]
br x16
.word 7766
	.no_dead_strip plt_MapKit_MKMapView_AddAnnotation_MapKit_IMKAnnotation
plt_MapKit_MKMapView_AddAnnotation_MapKit_IMKAnnotation:
_p_69:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2176]
br x16
.word 7771
	.no_dead_strip plt_MapKit_MKMapView_get_Region
plt_MapKit_MKMapView_get_Region:
_p_70:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2184]
br x16
.word 7776
	.no_dead_strip plt_Xamarin_Forms_Maps_Position__ctor_double_double
plt_Xamarin_Forms_Maps_Position__ctor_double_double:
_p_71:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2192]
br x16
.word 7781
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
plt_Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double:
_p_72:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2200]
br x16
.word 7786
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan:
_p_73:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2208]
br x16
.word 7791
	.no_dead_strip plt_MapKit_MKMapView_SetRegion_MapKit_MKCoordinateRegion_bool
plt_MapKit_MKMapView_SetRegion_MapKit_MKCoordinateRegion_bool:
_p_74:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2216]
br x16
.word 7796
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList
plt_Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList:
_p_75:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2224]
br x16
.word 7801
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList
plt_Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList:
_p_76:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2232]
br x16
.word 7803
	.no_dead_strip plt_MapKit_MKMapView_get_Annotations
plt_MapKit_MKMapView_get_Annotations:
_p_77:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2240]
br x16
.word 7805
	.no_dead_strip plt_MapKit_MKMapView_RemoveAnnotations_MapKit_IMKAnnotation__
plt_MapKit_MKMapView_RemoveAnnotations_MapKit_IMKAnnotation__:
_p_78:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2248]
br x16
.word 7810
	.no_dead_strip plt_MapKit_MKMapView_RemoveAnnotation_MapKit_IMKAnnotation
plt_MapKit_MKMapView_RemoveAnnotation_MapKit_IMKAnnotation:
_p_79:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2256]
br x16
.word 7815
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_HasScrollEnabled
plt_Xamarin_Forms_Maps_Map_get_HasScrollEnabled:
_p_80:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2264]
br x16
.word 7820
	.no_dead_strip plt_MapKit_MKMapView_set_ScrollEnabled_bool
plt_MapKit_MKMapView_set_ScrollEnabled_bool:
_p_81:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2272]
br x16
.word 7825
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_HasZoomEnabled
plt_Xamarin_Forms_Maps_Map_get_HasZoomEnabled:
_p_82:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2280]
br x16
.word 7830
	.no_dead_strip plt_MapKit_MKMapView_set_ZoomEnabled_bool
plt_MapKit_MKMapView_set_ZoomEnabled_bool:
_p_83:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2288]
br x16
.word 7835
	.no_dead_strip plt_Xamarin_FormsMaps_get_IsiOs8OrNewer
plt_Xamarin_FormsMaps_get_IsiOs8OrNewer:
_p_84:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2296]
br x16
.word 7840
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_IsShowingUser
plt_Xamarin_Forms_Maps_Map_get_IsShowingUser:
_p_85:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2304]
br x16
.word 7842
	.no_dead_strip plt_CoreLocation_CLLocationManager__ctor
plt_CoreLocation_CLLocationManager__ctor:
_p_86:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2312]
br x16
.word 7847
	.no_dead_strip plt_CoreLocation_CLLocationManager_RequestWhenInUseAuthorization
plt_CoreLocation_CLLocationManager_RequestWhenInUseAuthorization:
_p_87:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2320]
br x16
.word 7852
	.no_dead_strip plt_MapKit_MKMapView_set_ShowsUserLocation_bool
plt_MapKit_MKMapView_set_ShowsUserLocation_bool:
_p_88:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2328]
br x16
.word 7857
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_MapType
plt_Xamarin_Forms_Maps_Map_get_MapType:
_p_89:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2336]
br x16
.word 7862
	.no_dead_strip plt_MapKit_MKMapView_set_MapType_MapKit_MKMapType
plt_MapKit_MKMapView_set_MapType_MapKit_MKMapType:
_p_90:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2344]
br x16
.word 7867
	.no_dead_strip plt_Xamarin_Forms_Platform_iOS_ViewRenderer__ctor
plt_Xamarin_Forms_Platform_iOS_ViewRenderer__ctor:
_p_91:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2352]
br x16
.word 7872
	.no_dead_strip plt_CoreLocation_CLLocation__ctor_double_double
plt_CoreLocation_CLLocation__ctor_double_double:
_p_92:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2360]
br x16
.word 7877
	.no_dead_strip plt_CoreLocation_CLGeocoder__ctor
plt_CoreLocation_CLGeocoder__ctor:
_p_93:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2368]
br x16
.word 7882
	.no_dead_strip plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_string__ctor
plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_string__ctor:
_p_94:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2376]
br x16
.word 7887
	.no_dead_strip plt_CoreLocation_CLGeocoder_ReverseGeocodeLocation_CoreLocation_CLLocation_CoreLocation_CLGeocodeCompletionHandler
plt_CoreLocation_CLGeocoder_ReverseGeocodeLocation_CoreLocation_CLLocation_CoreLocation_CLGeocodeCompletionHandler:
_p_95:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2384]
br x16
.word 7898
	.no_dead_strip plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position__ctor
plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position__ctor:
_p_96:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2392]
br x16
.word 7903
	.no_dead_strip plt_CoreLocation_CLGeocoder_GeocodeAddress_string_CoreLocation_CLGeocodeCompletionHandler
plt_CoreLocation_CLGeocoder_GeocodeAddress_string_CoreLocation_CLGeocodeCompletionHandler:
_p_97:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2400]
br x16
.word 7914
	.no_dead_strip plt_Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer
plt_Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer:
_p_98:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2408]
br x16
.word 7919
	.no_dead_strip plt_UIKit_UITouch_get_View
plt_UIKit_UITouch_get_View:
_p_99:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2416]
br x16
.word 7921
	.no_dead_strip plt_wrapper_alloc_object_AllocVector_intptr_intptr
plt_wrapper_alloc_object_AllocVector_intptr_intptr:
_p_100:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2424]
br x16
.word 7926
	.no_dead_strip plt_System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_string_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_string
plt_System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_string_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_string:
_p_101:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2432]
br x16
.word 7934
	.no_dead_strip plt_System_Linq_Enumerable_ToList_string_System_Collections_Generic_IEnumerable_1_string
plt_System_Linq_Enumerable_ToList_string_System_Collections_Generic_IEnumerable_1_string:
_p_102:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2440]
br x16
.word 7946
	.no_dead_strip plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_string_SetResult_System_Collections_Generic_IEnumerable_1_string
plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_string_SetResult_System_Collections_Generic_IEnumerable_1_string:
_p_103:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2448]
br x16
.word 7958
	.no_dead_strip plt_CoreLocation_CLPlacemark_get_AddressDictionary
plt_CoreLocation_CLPlacemark_get_AddressDictionary:
_p_104:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2456]
br x16
.word 7969
	.no_dead_strip plt_AddressBookUI_ABAddressFormatting_ToString_Foundation_NSDictionary_bool
plt_AddressBookUI_ABAddressFormatting_ToString_Foundation_NSDictionary_bool:
_p_105:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2464]
br x16
.word 7974
	.no_dead_strip plt_CoreLocation_CLPlacemark_get_Location
plt_CoreLocation_CLPlacemark_get_Location:
_p_106:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2472]
br x16
.word 7979
	.no_dead_strip plt_CoreLocation_CLLocation_get_Coordinate
plt_CoreLocation_CLLocation_get_Coordinate:
_p_107:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2480]
br x16
.word 7984
	.no_dead_strip plt_System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_108:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2488]
br x16
.word 7989
	.no_dead_strip plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_SetResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
plt_System_Threading_Tasks_TaskCompletionSource_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_SetResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
_p_109:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2496]
br x16
.word 8001
	.no_dead_strip plt__jit_icall_mono_helper_ldstr_mscorlib
plt__jit_icall_mono_helper_ldstr_mscorlib:
_p_110:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2504]
br x16
.word 8012
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_111:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2512]
br x16
.word 8041
	.no_dead_strip plt_System_Nullable_1_bool_Unbox_object
plt_System_Nullable_1_bool_Unbox_object:
_p_112:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2520]
br x16
.word 8069
	.no_dead_strip plt_System_Nullable_1_bool_Equals_System_Nullable_1_bool
plt_System_Nullable_1_bool_Equals_System_Nullable_1_bool:
_p_113:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2528]
br x16
.word 8091
	.no_dead_strip plt_bool_Equals_object
plt_bool_Equals_object:
_p_114:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2536]
br x16
.word 8113
	.no_dead_strip plt__rgctx_fetch_0
plt__rgctx_fetch_0:
_p_115:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2544]
br x16
.word 8145
	.no_dead_strip plt__jit_icall_mono_generic_class_init
plt__jit_icall_mono_generic_class_init:
_p_116:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2552]
br x16
.word 8153
	.no_dead_strip plt__rgctx_fetch_1
plt__rgctx_fetch_1:
_p_117:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2560]
br x16
.word 8179
	.no_dead_strip plt__rgctx_fetch_2
plt__rgctx_fetch_2:
_p_118:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2568]
br x16
.word 8195
	.no_dead_strip plt_System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
plt_System_Array_InternalEnumerator_1_T_REF__ctor_System_Array:
_p_119:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2576]
br x16
.word 8203
	.no_dead_strip plt__jit_icall_mono_thread_interruption_checkpoint
plt__jit_icall_mono_thread_interruption_checkpoint:
_p_120:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2584]
br x16
.word 8222
	.no_dead_strip plt__rgctx_fetch_3
plt__rgctx_fetch_3:
_p_121:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2592]
br x16
.word 8278
	.no_dead_strip plt_System_Array_Copy_System_Array_int_System_Array_int_int
plt_System_Array_Copy_System_Array_int_System_Array_int_int:
_p_122:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2600]
br x16
.word 8301
	.no_dead_strip plt__rgctx_fetch_4
plt__rgctx_fetch_4:
_p_123:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2608]
br x16
.word 8324
	.no_dead_strip plt__rgctx_fetch_5
plt__rgctx_fetch_5:
_p_124:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2616]
br x16
.word 8365
	.no_dead_strip plt__rgctx_fetch_6
plt__rgctx_fetch_6:
_p_125:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2624]
br x16
.word 8406
	.no_dead_strip plt_System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
plt_System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int:
_p_126:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2632]
br x16
.word 8429
	.no_dead_strip plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
_p_127:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2640]
br x16
.word 8448
	.no_dead_strip plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array:
_p_128:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2648]
br x16
.word 8467
	.no_dead_strip plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr
plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr:
_p_129:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2656]
br x16
.word 8486
	.no_dead_strip plt_System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_130:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2664]
br x16
.word 8494
	.no_dead_strip plt_System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_131:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2672]
br x16
.word 8517
	.no_dead_strip plt_System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_132:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2680]
br x16
.word 8540
	.no_dead_strip plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_133:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2688]
br x16
.word 8563
	.no_dead_strip plt_System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
plt_System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position:
_p_134:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2696]
br x16
.word 8586
	.no_dead_strip plt__jit_icall_mono_helper_ldstr
plt__jit_icall_mono_helper_ldstr:
_p_135:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2704]
br x16
.word 8609
	.no_dead_strip plt_System_Linq_Error_ArgumentNull_string
plt_System_Linq_Error_ArgumentNull_string:
_p_136:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2712]
br x16
.word 8629
	.no_dead_strip plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor
plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor:
_p_137:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2720]
br x16
.word 8634
	.no_dead_strip plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose
plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose:
_p_138:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2728]
br x16
.word 8653
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool:
_p_139:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2736]
br x16
.word 8672
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer:
_p_140:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2744]
br x16
.word 8691
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray:
_p_141:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2752]
br x16
.word 8710
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position:
_p_142:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2760]
br x16
.word 8729
	.no_dead_strip plt_System_Environment_get_CurrentManagedThreadId
plt_System_Environment_get_CurrentManagedThreadId:
_p_143:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2768]
br x16
.word 8748
	.no_dead_strip plt_System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool
plt_System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool:
_p_144:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2776]
br x16
.word 8753
	.no_dead_strip plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator
plt_System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator:
_p_145:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2784]
br x16
.word 8772
	.no_dead_strip plt_System_Linq_Error_NotSupported
plt_System_Linq_Error_NotSupported:
_p_146:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2792]
br x16
.word 8791
	.no_dead_strip plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray
plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray:
_p_147:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2800]
br x16
.word 8796
	.no_dead_strip plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int
plt_System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int:
_p_148:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2808]
br x16
.word 8819
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int:
_p_149:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2816]
br x16
.word 8842
	.no_dead_strip plt_System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int
plt_System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int:
_p_150:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2824]
br x16
.word 8861
	.no_dead_strip plt_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_GetEnumerator
plt_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_GetEnumerator:
_p_151:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2832]
br x16
.word 8884
	.no_dead_strip plt_System_Collections_Generic_List_1_Enumerator_CoreLocation_CLPlacemark_MoveNext
plt_System_Collections_Generic_List_1_Enumerator_CoreLocation_CLPlacemark_MoveNext:
_p_152:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2840]
br x16
.word 8904
	.no_dead_strip plt_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_get_Item_int
plt_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_get_Item_int:
_p_153:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2848]
br x16
.word 8924
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___:
_p_154:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2856]
br x16
.word 8944
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int:
_p_155:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2864]
br x16
.word 8963
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int:
_p_156:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2872]
br x16
.word 8982
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int:
_p_157:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2880]
br x16
.word 9001
	.no_dead_strip plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
plt_System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_:
_p_158:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2888]
br x16
.word 9020
	.no_dead_strip plt_System_Collections_Generic_CopyPosition_Normalize_int
plt_System_Collections_Generic_CopyPosition_Normalize_int:
_p_159:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2896]
br x16
.word 9039
	.no_dead_strip plt_System_Collections_Generic_ArrayBuilder_1_Xamarin_Forms_Maps_Position___Add_Xamarin_Forms_Maps_Position__
plt_System_Collections_Generic_ArrayBuilder_1_Xamarin_Forms_Maps_Position___Add_Xamarin_Forms_Maps_Position__:
_p_160:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2904]
br x16
.word 9044
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int:
_p_161:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2912]
br x16
.word 9065
	.no_dead_strip plt_Xamarin_Forms_Maps_Position_Equals_object
plt_Xamarin_Forms_Maps_Position_Equals_object:
_p_162:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2920]
br x16
.word 9084
	.no_dead_strip plt_System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool
plt_System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool:
_p_163:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2928]
br x16
.word 9089
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentOutOfRangeException_System_ExceptionArgument_System_ExceptionResource
plt_System_ThrowHelper_ThrowArgumentOutOfRangeException_System_ExceptionArgument_System_ExceptionResource:
_p_164:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2936]
br x16
.word 9108
	.no_dead_strip plt_System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count
plt_System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count:
_p_165:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2944]
br x16
.word 9113
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int:
_p_166:
adrp x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_iOS_got@PAGEOFF
ldr x16, [x16, #2952]
br x16
.word 9136
plt_end:
.section __DATA, __bss
	.align 3
.lcomm mono_aot_Xamarin_Forms_Maps_iOS_got, 2960
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
	.asciz "EBA1BA60-F24F-47D4-81F3-FFEA74A23705"
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "Xamarin.Forms.Maps.iOS"
.data
	.align 3
_mono_aot_file_info:

	.long 144,0
	.align 3
	.quad mono_aot_Xamarin_Forms_Maps_iOS_got
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

	.long 203,2960,167,304,66,387000831,0,10814
	.long 128,8,8,8,0,25,20000,9176
	.long 8472,7600,0,7976,8440,7688,0,5536
	.long 464,9168,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0
	.byte 97,3,70,254,185,95,203,171,10,34,186,131,0,112,117,44
	.globl _mono_aot_module_Xamarin_Forms_Maps_iOS_info
	.align 3
_mono_aot_module_Xamarin_Forms_Maps_iOS_info:
	.align 3
	.quad _mono_aot_file_info
.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.FormsMaps:get_IsiOs8OrNewer"
	.asciz "Xamarin_FormsMaps_get_IsiOs8OrNewer"

	.byte 0,0
	.quad Xamarin_FormsMaps_get_IsiOs8OrNewer
	.quad Lme_0

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM4=Lfde0_end - Lfde0_start
	.long LDIFF_SYM4
Lfde0_start:

	.long 0
	.align 3
	.quad Xamarin_FormsMaps_get_IsiOs8OrNewer

LDIFF_SYM5=Lme_0 - Xamarin_FormsMaps_get_IsiOs8OrNewer
	.long LDIFF_SYM5
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde0_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.FormsMaps:get_IsiOs9OrNewer"
	.asciz "Xamarin_FormsMaps_get_IsiOs9OrNewer"

	.byte 0,0
	.quad Xamarin_FormsMaps_get_IsiOs9OrNewer
	.quad Lme_1

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM6=Lfde1_end - Lfde1_start
	.long LDIFF_SYM6
Lfde1_start:

	.long 0
	.align 3
	.quad Xamarin_FormsMaps_get_IsiOs9OrNewer

LDIFF_SYM7=Lme_1 - Xamarin_FormsMaps_get_IsiOs9OrNewer
	.long LDIFF_SYM7
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde1_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.FormsMaps:get_IsiOs10OrNewer"
	.asciz "Xamarin_FormsMaps_get_IsiOs10OrNewer"

	.byte 0,0
	.quad Xamarin_FormsMaps_get_IsiOs10OrNewer
	.quad Lme_2

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM8=Lfde2_end - Lfde2_start
	.long LDIFF_SYM8
Lfde2_start:

	.long 0
	.align 3
	.quad Xamarin_FormsMaps_get_IsiOs10OrNewer

LDIFF_SYM9=Lme_2 - Xamarin_FormsMaps_get_IsiOs10OrNewer
	.long LDIFF_SYM9
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde2_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.FormsMaps:Init"
	.asciz "Xamarin_FormsMaps_Init"

	.byte 0,0
	.quad Xamarin_FormsMaps_Init
	.quad Lme_3

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM10=Lfde3_end - Lfde3_start
	.long LDIFF_SYM10
Lfde3_start:

	.long 0
	.align 3
	.quad Xamarin_FormsMaps_Init

LDIFF_SYM11=Lme_3 - Xamarin_FormsMaps_Init
	.long LDIFF_SYM11
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde3_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapPool:get_Instance"
	.asciz "Xamarin_Forms_Maps_iOS_MapPool_get_Instance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapPool_get_Instance
	.quad Lme_4

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM12=Lfde4_end - Lfde4_start
	.long LDIFF_SYM12
Lfde4_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapPool_get_Instance

LDIFF_SYM13=Lme_4 - Xamarin_Forms_Maps_iOS_MapPool_get_Instance
	.long LDIFF_SYM13
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde4_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_4:

	.byte 17
	.asciz "System_Object"

	.byte 16,7
	.asciz "System_Object"

LDIFF_SYM14=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM14
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM15=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM15
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM16=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM16
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

	.byte 32,9
	.asciz "IsCustomType"

	.byte 128,127,0,7
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
LTDIE_3:

	.byte 5
	.asciz "Foundation_NSObject"

	.byte 40,16
LDIFF_SYM21=LTDIE_4 - Ldebug_info_start
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

LDIFF_SYM25=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM25
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM26=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM26
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM27=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM27
LTDIE_2:

	.byte 5
	.asciz "UIKit_UIResponder"

	.byte 40,16
LDIFF_SYM28=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,35,0,0,7
	.asciz "UIKit_UIResponder"

LDIFF_SYM29=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM29
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM30=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM30
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM31=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM31
LTDIE_1:

	.byte 5
	.asciz "UIKit_UIView"

	.byte 48,16
LDIFF_SYM32=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM32
	.byte 2,35,0,6
	.asciz "__mt_PreferredFocusedView_var"

LDIFF_SYM33=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM33
	.byte 2,35,40,0,7
	.asciz "UIKit_UIView"

LDIFF_SYM34=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM34
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM35=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM35
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM36=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM36
LTDIE_0:

	.byte 5
	.asciz "MapKit_MKMapView"

	.byte 56,16
LDIFF_SYM37=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM37
	.byte 2,35,0,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM38=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM38
	.byte 2,35,48,0,7
	.asciz "MapKit_MKMapView"

LDIFF_SYM39=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM39
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM40=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM40
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM41=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM41
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapPool:Add"
	.asciz "Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView
	.quad Lme_5

	.byte 2,118,16,3
	.asciz "mapView"

LDIFF_SYM42=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM42
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM43=Lfde5_end - Lfde5_start
	.long LDIFF_SYM43
Lfde5_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView

LDIFF_SYM44=Lme_5 - Xamarin_Forms_Maps_iOS_MapPool_Add_MapKit_MKMapView
	.long LDIFF_SYM44
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde5_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapPool:Get"
	.asciz "Xamarin_Forms_Maps_iOS_MapPool_Get"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapPool_Get
	.quad Lme_6

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM45=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM46=Lfde6_end - Lfde6_start
	.long LDIFF_SYM46
Lfde6_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapPool_Get

LDIFF_SYM47=Lme_6 - Xamarin_Forms_Maps_iOS_MapPool_Get
	.long LDIFF_SYM47
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde6_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_10:

	.byte 5
	.asciz "System_ValueType"

	.byte 16,16
LDIFF_SYM48=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM48
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM49=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM49
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM50=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM50
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM51=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM51
LTDIE_9:

	.byte 5
	.asciz "System_Int32"

	.byte 20,16
LDIFF_SYM52=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM52
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM53=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM53
	.byte 2,35,16,0,7
	.asciz "System_Int32"

LDIFF_SYM54=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM54
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM55=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM55
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM56=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM56
LTDIE_11:

	.byte 5
	.asciz "System_Boolean"

	.byte 17,16
LDIFF_SYM57=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM57
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM58=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM58
	.byte 2,35,16,0,7
	.asciz "System_Boolean"

LDIFF_SYM59=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM59
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM60=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM60
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM61=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM61
LTDIE_8:

	.byte 5
	.asciz "_Segment"

	.byte 168,3,16
LDIFF_SYM62=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM62
	.byte 2,35,0,6
	.asciz "_slots"

LDIFF_SYM63=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM63
	.byte 2,35,16,6
	.asciz "_slotsMask"

LDIFF_SYM64=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM64
	.byte 2,35,32,6
	.asciz "_headAndTail"

LDIFF_SYM65=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM65
	.byte 2,35,36,6
	.asciz "_preservedForObservation"

LDIFF_SYM66=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 3,35,164,3,6
	.asciz "_frozenForEnqueues"

LDIFF_SYM67=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM67
	.byte 3,35,165,3,6
	.asciz "_nextSegment"

LDIFF_SYM68=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM68
	.byte 2,35,24,0,7
	.asciz "_Segment"

LDIFF_SYM69=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM69
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM70=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM70
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM71=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM71
LTDIE_7:

	.byte 5
	.asciz "System_Collections_Concurrent_ConcurrentQueue`1"

	.byte 40,16
LDIFF_SYM72=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM72
	.byte 2,35,0,6
	.asciz "_crossSegmentLock"

LDIFF_SYM73=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM73
	.byte 2,35,16,6
	.asciz "_tail"

LDIFF_SYM74=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,35,24,6
	.asciz "_head"

LDIFF_SYM75=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,35,32,0,7
	.asciz "System_Collections_Concurrent_ConcurrentQueue`1"

LDIFF_SYM76=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM76
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM77=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM77
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM78=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM78
LTDIE_6:

	.byte 5
	.asciz "Xamarin_Forms_Maps_iOS_MapPool"

	.byte 24,16
LDIFF_SYM79=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM79
	.byte 2,35,0,6
	.asciz "Maps"

LDIFF_SYM80=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 2,35,16,0,7
	.asciz "Xamarin_Forms_Maps_iOS_MapPool"

LDIFF_SYM81=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM81
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM82=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM82
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM83=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM83
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapPool:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_MapPool__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapPool__ctor
	.quad Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM84=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM84
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM85=Lfde7_end - Lfde7_start
	.long LDIFF_SYM85
Lfde7_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapPool__ctor

LDIFF_SYM86=Lme_7 - Xamarin_Forms_Maps_iOS_MapPool__ctor
	.long LDIFF_SYM86
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde7_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_16:

	.byte 5
	.asciz "UIKit_UIColor"

	.byte 40,16
LDIFF_SYM87=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM87
	.byte 2,35,0,0,7
	.asciz "UIKit_UIColor"

LDIFF_SYM88=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM88
LTDIE_16_POINTER:

	.byte 13
LDIFF_SYM89=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM89
LTDIE_16_REFERENCE:

	.byte 14
LDIFF_SYM90=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM90
LTDIE_17:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM91=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM91
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM92=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM93=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM94=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM94
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM95=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM95
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM96=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM96
LTDIE_17_POINTER:

	.byte 13
LDIFF_SYM97=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM97
LTDIE_17_REFERENCE:

	.byte 14
LDIFF_SYM98=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM98
LTDIE_23:

	.byte 5
	.asciz "System_Reflection_MemberInfo"

	.byte 16,16
LDIFF_SYM99=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM99
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MemberInfo"

LDIFF_SYM100=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM100
LTDIE_23_POINTER:

	.byte 13
LDIFF_SYM101=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM101
LTDIE_23_REFERENCE:

	.byte 14
LDIFF_SYM102=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM102
LTDIE_22:

	.byte 5
	.asciz "System_Reflection_MethodBase"

	.byte 16,16
LDIFF_SYM103=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM103
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodBase"

LDIFF_SYM104=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM104
LTDIE_22_POINTER:

	.byte 13
LDIFF_SYM105=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM105
LTDIE_22_REFERENCE:

	.byte 14
LDIFF_SYM106=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM106
LTDIE_21:

	.byte 5
	.asciz "System_Reflection_MethodInfo"

	.byte 16,16
LDIFF_SYM107=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM107
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodInfo"

LDIFF_SYM108=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM108
LTDIE_21_POINTER:

	.byte 13
LDIFF_SYM109=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM109
LTDIE_21_REFERENCE:

	.byte 14
LDIFF_SYM110=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM110
LTDIE_25:

	.byte 5
	.asciz "System_Type"

	.byte 24,16
LDIFF_SYM111=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM111
	.byte 2,35,0,6
	.asciz "_impl"

LDIFF_SYM112=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM112
	.byte 2,35,16,0,7
	.asciz "System_Type"

LDIFF_SYM113=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM113
LTDIE_25_POINTER:

	.byte 13
LDIFF_SYM114=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM114
LTDIE_25_REFERENCE:

	.byte 14
LDIFF_SYM115=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM115
LTDIE_24:

	.byte 5
	.asciz "System_DelegateData"

	.byte 40,16
LDIFF_SYM116=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM116
	.byte 2,35,0,6
	.asciz "target_type"

LDIFF_SYM117=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM117
	.byte 2,35,16,6
	.asciz "method_name"

LDIFF_SYM118=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM118
	.byte 2,35,24,6
	.asciz "curried_first_arg"

LDIFF_SYM119=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM119
	.byte 2,35,32,0,7
	.asciz "System_DelegateData"

LDIFF_SYM120=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM120
LTDIE_24_POINTER:

	.byte 13
LDIFF_SYM121=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM121
LTDIE_24_REFERENCE:

	.byte 14
LDIFF_SYM122=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM122
LTDIE_20:

	.byte 5
	.asciz "System_Delegate"

	.byte 104,16
LDIFF_SYM123=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM123
	.byte 2,35,0,6
	.asciz "method_ptr"

LDIFF_SYM124=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM124
	.byte 2,35,16,6
	.asciz "invoke_impl"

LDIFF_SYM125=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM125
	.byte 2,35,24,6
	.asciz "m_target"

LDIFF_SYM126=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM126
	.byte 2,35,32,6
	.asciz "method"

LDIFF_SYM127=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM127
	.byte 2,35,40,6
	.asciz "delegate_trampoline"

LDIFF_SYM128=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM128
	.byte 2,35,48,6
	.asciz "extra_arg"

LDIFF_SYM129=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM129
	.byte 2,35,56,6
	.asciz "method_code"

LDIFF_SYM130=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM130
	.byte 2,35,64,6
	.asciz "method_info"

LDIFF_SYM131=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM131
	.byte 2,35,72,6
	.asciz "original_method_info"

LDIFF_SYM132=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM132
	.byte 2,35,80,6
	.asciz "data"

LDIFF_SYM133=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM133
	.byte 2,35,88,6
	.asciz "method_is_virtual"

LDIFF_SYM134=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM134
	.byte 2,35,96,0,7
	.asciz "System_Delegate"

LDIFF_SYM135=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM135
LTDIE_20_POINTER:

	.byte 13
LDIFF_SYM136=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM136
LTDIE_20_REFERENCE:

	.byte 14
LDIFF_SYM137=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM137
LTDIE_19:

	.byte 5
	.asciz "System_MulticastDelegate"

	.byte 112,16
LDIFF_SYM138=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM138
	.byte 2,35,0,6
	.asciz "delegates"

LDIFF_SYM139=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM139
	.byte 2,35,104,0,7
	.asciz "System_MulticastDelegate"

LDIFF_SYM140=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM140
LTDIE_19_POINTER:

	.byte 13
LDIFF_SYM141=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM141
LTDIE_19_REFERENCE:

	.byte 14
LDIFF_SYM142=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM142
LTDIE_18:

	.byte 5
	.asciz "System_ComponentModel_PropertyChangedEventHandler"

	.byte 112,16
LDIFF_SYM143=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM143
	.byte 2,35,0,0,7
	.asciz "System_ComponentModel_PropertyChangedEventHandler"

LDIFF_SYM144=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM144
LTDIE_18_POINTER:

	.byte 13
LDIFF_SYM145=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM145
LTDIE_18_REFERENCE:

	.byte 14
LDIFF_SYM146=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM146
LTDIE_27:

	.byte 5
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventHandler"

	.byte 112,16
LDIFF_SYM147=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM147
	.byte 2,35,0,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventHandler"

LDIFF_SYM148=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM148
LTDIE_27_POINTER:

	.byte 13
LDIFF_SYM149=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM149
LTDIE_27_REFERENCE:

	.byte 14
LDIFF_SYM150=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM150
LTDIE_29:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM151=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM151
LTDIE_29_POINTER:

	.byte 13
LDIFF_SYM152=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM152
LTDIE_29_REFERENCE:

	.byte 14
LDIFF_SYM153=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM153
LTDIE_30:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM154=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM154
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM155=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM155
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM156=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM156
LTDIE_30_POINTER:

	.byte 13
LDIFF_SYM157=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM157
LTDIE_30_REFERENCE:

	.byte 14
LDIFF_SYM158=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM158
LTDIE_31:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM159=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM159
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM160=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM160
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM161=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM161
LTDIE_31_POINTER:

	.byte 13
LDIFF_SYM162=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM162
LTDIE_31_REFERENCE:

	.byte 14
LDIFF_SYM163=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM163
LTDIE_28:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM164=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM164
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM165=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM166=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM166
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM167=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM167
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM168=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM168
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM169=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM169
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM170=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM170
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM171=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM171
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM172=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM172
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM173=LTDIE_31_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM173
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM174=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM174
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM175=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM175
LTDIE_28_POINTER:

	.byte 13
LDIFF_SYM176=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM176
LTDIE_28_REFERENCE:

	.byte 14
LDIFF_SYM177=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM177
LTDIE_32:

	.byte 17
	.asciz "Xamarin_Forms_Platform_iOS_IVisualElementRenderer"

	.byte 16,7
	.asciz "Xamarin_Forms_Platform_iOS_IVisualElementRenderer"

LDIFF_SYM178=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM178
LTDIE_32_POINTER:

	.byte 13
LDIFF_SYM179=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM179
LTDIE_32_REFERENCE:

	.byte 14
LDIFF_SYM180=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM180
LTDIE_33:

	.byte 5
	.asciz "System_Double"

	.byte 24,16
LDIFF_SYM181=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM181
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM182=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM182
	.byte 2,35,16,0,7
	.asciz "System_Double"

LDIFF_SYM183=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM183
LTDIE_33_POINTER:

	.byte 13
LDIFF_SYM184=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM184
LTDIE_33_REFERENCE:

	.byte 14
LDIFF_SYM185=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM185
LTDIE_34:

	.byte 5
	.asciz "UIKit_UITouchEventArgs"

	.byte 112,16
LDIFF_SYM186=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM186
	.byte 2,35,0,0,7
	.asciz "UIKit_UITouchEventArgs"

LDIFF_SYM187=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM187
LTDIE_34_POINTER:

	.byte 13
LDIFF_SYM188=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM188
LTDIE_34_REFERENCE:

	.byte 14
LDIFF_SYM189=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM189
LTDIE_26:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_EventTracker"

	.byte 72,16
LDIFF_SYM190=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM190
	.byte 2,35,0,6
	.asciz "_collectionChangedHandler"

LDIFF_SYM191=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM191
	.byte 2,35,16,6
	.asciz "_gestureRecognizers"

LDIFF_SYM192=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM192
	.byte 2,35,24,6
	.asciz "_renderer"

LDIFF_SYM193=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM193
	.byte 2,35,32,6
	.asciz "_disposed"

LDIFF_SYM194=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM194
	.byte 2,35,56,6
	.asciz "_handler"

LDIFF_SYM195=LTDIE_1_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM195
	.byte 2,35,40,6
	.asciz "_previousScale"

LDIFF_SYM196=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM196
	.byte 2,35,64,6
	.asciz "_shouldReceiveTouch"

LDIFF_SYM197=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM197
	.byte 2,35,48,0,7
	.asciz "Xamarin_Forms_Platform_iOS_EventTracker"

LDIFF_SYM198=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM198
LTDIE_26_POINTER:

	.byte 13
LDIFF_SYM199=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM199
LTDIE_26_REFERENCE:

	.byte 14
LDIFF_SYM200=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM200
LTDIE_35:

	.byte 8
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementRendererFlags"

	.byte 4
LDIFF_SYM201=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM201
	.byte 9
	.asciz "Disposed"

	.byte 1,9
	.asciz "AutoTrack"

	.byte 2,9
	.asciz "AutoPackage"

	.byte 4,0,7
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementRendererFlags"

LDIFF_SYM202=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM202
LTDIE_35_POINTER:

	.byte 13
LDIFF_SYM203=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM203
LTDIE_35_REFERENCE:

	.byte 14
LDIFF_SYM204=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM204
LTDIE_40:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM205=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM205
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM206=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM206
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM207=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM207
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM208=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM208
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM209=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM209
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM210=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM210
LTDIE_40_POINTER:

	.byte 13
LDIFF_SYM211=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM211
LTDIE_40_REFERENCE:

	.byte 14
LDIFF_SYM212=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM212
LTDIE_41:

	.byte 5
	.asciz "System_EventHandler"

	.byte 112,16
LDIFF_SYM213=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM213
	.byte 2,35,0,0,7
	.asciz "System_EventHandler"

LDIFF_SYM214=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM214
LTDIE_41_POINTER:

	.byte 13
LDIFF_SYM215=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM215
LTDIE_41_REFERENCE:

	.byte 14
LDIFF_SYM216=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM216
LTDIE_42:

	.byte 5
	.asciz "Xamarin_Forms_PropertyChangingEventHandler"

	.byte 112,16
LDIFF_SYM217=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM217
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_PropertyChangingEventHandler"

LDIFF_SYM218=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM218
LTDIE_42_POINTER:

	.byte 13
LDIFF_SYM219=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM219
LTDIE_42_REFERENCE:

	.byte 14
LDIFF_SYM220=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM220
LTDIE_39:

	.byte 5
	.asciz "Xamarin_Forms_BindableObject"

	.byte 64,16
LDIFF_SYM221=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM221
	.byte 2,35,0,6
	.asciz "_properties"

LDIFF_SYM222=LTDIE_40_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM222
	.byte 2,35,16,6
	.asciz "_applying"

LDIFF_SYM223=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM223
	.byte 2,35,56,6
	.asciz "_inheritedContext"

LDIFF_SYM224=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM224
	.byte 2,35,24,6
	.asciz "PropertyChanged"

LDIFF_SYM225=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM225
	.byte 2,35,32,6
	.asciz "BindingContextChanged"

LDIFF_SYM226=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 2,35,40,6
	.asciz "PropertyChanging"

LDIFF_SYM227=LTDIE_42_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM227
	.byte 2,35,48,0,7
	.asciz "Xamarin_Forms_BindableObject"

LDIFF_SYM228=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM228
LTDIE_39_POINTER:

	.byte 13
LDIFF_SYM229=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM229
LTDIE_39_REFERENCE:

	.byte 14
LDIFF_SYM230=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM230
LTDIE_43:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM231=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM231
LTDIE_43_POINTER:

	.byte 13
LDIFF_SYM232=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM232
LTDIE_43_REFERENCE:

	.byte 14
LDIFF_SYM233=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM233
LTDIE_44:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM234=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM234
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM235=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM235
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM236=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM236
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM237=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM237
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM238=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM238
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM239=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM239
LTDIE_44_POINTER:

	.byte 13
LDIFF_SYM240=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM240
LTDIE_44_REFERENCE:

	.byte 14
LDIFF_SYM241=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM241
LTDIE_46:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM242=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM242
LTDIE_46_POINTER:

	.byte 13
LDIFF_SYM243=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM243
LTDIE_46_REFERENCE:

	.byte 14
LDIFF_SYM244=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM244
LTDIE_47:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM245=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM245
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM246=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM246
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM247=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM247
LTDIE_47_POINTER:

	.byte 13
LDIFF_SYM248=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM248
LTDIE_47_REFERENCE:

	.byte 14
LDIFF_SYM249=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM249
LTDIE_48:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM250=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM250
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM251=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM251
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM252=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM252
LTDIE_48_POINTER:

	.byte 13
LDIFF_SYM253=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM253
LTDIE_48_REFERENCE:

	.byte 14
LDIFF_SYM254=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM254
LTDIE_45:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM255=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM255
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM256=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM256
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM257=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM257
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM258=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM258
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM259=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM259
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM260=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM260
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM261=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM261
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM262=LTDIE_46_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM262
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM263=LTDIE_47_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM263
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM264=LTDIE_48_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM264
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM265=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM265
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM266=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM266
LTDIE_45_POINTER:

	.byte 13
LDIFF_SYM267=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM267
LTDIE_45_REFERENCE:

	.byte 14
LDIFF_SYM268=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM268
LTDIE_49:

	.byte 17
	.asciz "Xamarin_Forms_IEffectControlProvider"

	.byte 16,7
	.asciz "Xamarin_Forms_IEffectControlProvider"

LDIFF_SYM269=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM269
LTDIE_49_POINTER:

	.byte 13
LDIFF_SYM270=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM270
LTDIE_49_REFERENCE:

	.byte 14
LDIFF_SYM271=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM271
LTDIE_53:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM272=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM272
LTDIE_53_POINTER:

	.byte 13
LDIFF_SYM273=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM273
LTDIE_53_REFERENCE:

	.byte 14
LDIFF_SYM274=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM274
LTDIE_52:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 32,16
LDIFF_SYM275=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM275
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM276=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM276
	.byte 2,35,16,6
	.asciz "_syncRoot"

LDIFF_SYM277=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM277
	.byte 2,35,24,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM278=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM278
LTDIE_52_POINTER:

	.byte 13
LDIFF_SYM279=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM279
LTDIE_52_REFERENCE:

	.byte 14
LDIFF_SYM280=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM280
LTDIE_54:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM281=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM281
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM282=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM282
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM283=LTDIE_51_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM283
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM284=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM284
LTDIE_54_POINTER:

	.byte 13
LDIFF_SYM285=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM285
LTDIE_54_REFERENCE:

	.byte 14
LDIFF_SYM286=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM286
LTDIE_51:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 64,16
LDIFF_SYM287=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM287
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM288=LTDIE_54_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM288
	.byte 2,35,32,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM289=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM289
	.byte 2,35,56,6
	.asciz "CollectionChanged"

LDIFF_SYM290=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM290
	.byte 2,35,40,6
	.asciz "PropertyChanged"

LDIFF_SYM291=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM291
	.byte 2,35,48,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM292=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM292
LTDIE_51_POINTER:

	.byte 13
LDIFF_SYM293=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM293
LTDIE_51_REFERENCE:

	.byte 14
LDIFF_SYM294=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM294
LTDIE_50:

	.byte 5
	.asciz "Xamarin_Forms_TrackableCollection`1"

	.byte 72,16
LDIFF_SYM295=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM295
	.byte 2,35,0,6
	.asciz "Clearing"

LDIFF_SYM296=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM296
	.byte 2,35,64,0,7
	.asciz "Xamarin_Forms_TrackableCollection`1"

LDIFF_SYM297=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM297
LTDIE_50_POINTER:

	.byte 13
LDIFF_SYM298=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM298
LTDIE_50_REFERENCE:

	.byte 14
LDIFF_SYM299=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM299
LTDIE_55:

	.byte 17
	.asciz "Xamarin_Forms_Internals_IPlatform"

	.byte 16,7
	.asciz "Xamarin_Forms_Internals_IPlatform"

LDIFF_SYM300=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM300
LTDIE_55_POINTER:

	.byte 13
LDIFF_SYM301=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM301
LTDIE_55_REFERENCE:

	.byte 14
LDIFF_SYM302=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM302
LTDIE_56:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM303=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM303
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM304=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM304
LTDIE_56_POINTER:

	.byte 13
LDIFF_SYM305=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM305
LTDIE_56_REFERENCE:

	.byte 14
LDIFF_SYM306=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM306
LTDIE_38:

	.byte 5
	.asciz "Xamarin_Forms_Element"

	.byte 224,1,16
LDIFF_SYM307=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM307
	.byte 2,35,0,6
	.asciz "_bindableResources"

LDIFF_SYM308=LTDIE_43_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM308
	.byte 2,35,64,6
	.asciz "_changeHandlers"

LDIFF_SYM309=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM309
	.byte 2,35,72,6
	.asciz "_dynamicResources"

LDIFF_SYM310=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM310
	.byte 2,35,80,6
	.asciz "_effectControlProvider"

LDIFF_SYM311=LTDIE_49_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM311
	.byte 2,35,88,6
	.asciz "_effects"

LDIFF_SYM312=LTDIE_50_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM312
	.byte 2,35,96,6
	.asciz "_id"

LDIFF_SYM313=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM313
	.byte 3,35,200,1,6
	.asciz "_parentOverride"

LDIFF_SYM314=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM314
	.byte 2,35,104,6
	.asciz "_platform"

LDIFF_SYM315=LTDIE_55_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM315
	.byte 2,35,112,6
	.asciz "_styleId"

LDIFF_SYM316=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM316
	.byte 2,35,120,6
	.asciz "<Owned>k__BackingField"

LDIFF_SYM317=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM317
	.byte 3,35,220,1,6
	.asciz "<RealParent>k__BackingField"

LDIFF_SYM318=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM318
	.byte 3,35,128,1,6
	.asciz "ChildAdded"

LDIFF_SYM319=LTDIE_56_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM319
	.byte 3,35,136,1,6
	.asciz "ChildRemoved"

LDIFF_SYM320=LTDIE_56_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM320
	.byte 3,35,144,1,6
	.asciz "DescendantAdded"

LDIFF_SYM321=LTDIE_56_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM321
	.byte 3,35,152,1,6
	.asciz "DescendantRemoved"

LDIFF_SYM322=LTDIE_56_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM322
	.byte 3,35,160,1,6
	.asciz "ParentSet"

LDIFF_SYM323=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM323
	.byte 3,35,168,1,6
	.asciz "PlatformSet"

LDIFF_SYM324=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM324
	.byte 3,35,176,1,6
	.asciz "_cssFallbackTypeName"

LDIFF_SYM325=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM325
	.byte 3,35,184,1,6
	.asciz "_styleSelectableNameAndBaseNames"

LDIFF_SYM326=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM326
	.byte 3,35,192,1,0,7
	.asciz "Xamarin_Forms_Element"

LDIFF_SYM327=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM327
LTDIE_38_POINTER:

	.byte 13
LDIFF_SYM328=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM328
LTDIE_38_REFERENCE:

	.byte 14
LDIFF_SYM329=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM329
LTDIE_57:

	.byte 8
	.asciz "Xamarin_Forms_EffectiveFlowDirection"

	.byte 4
LDIFF_SYM330=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM330
	.byte 9
	.asciz "RightToLeft"

	.byte 1,9
	.asciz "Explicit"

	.byte 2,0,7
	.asciz "Xamarin_Forms_EffectiveFlowDirection"

LDIFF_SYM331=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM331
LTDIE_57_POINTER:

	.byte 13
LDIFF_SYM332=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM332
LTDIE_57_REFERENCE:

	.byte 14
LDIFF_SYM333=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM333
LTDIE_59:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM334=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM334
LTDIE_59_POINTER:

	.byte 13
LDIFF_SYM335=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM335
LTDIE_59_REFERENCE:

	.byte 14
LDIFF_SYM336=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM336
LTDIE_60:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM337=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM337
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM338=LTDIE_58_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM338
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM339=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM339
LTDIE_60_POINTER:

	.byte 13
LDIFF_SYM340=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM340
LTDIE_60_REFERENCE:

	.byte 14
LDIFF_SYM341=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM341
LTDIE_61:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM342=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM342
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM343=LTDIE_58_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM343
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM344=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM344
LTDIE_61_POINTER:

	.byte 13
LDIFF_SYM345=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM345
LTDIE_61_REFERENCE:

	.byte 14
LDIFF_SYM346=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM346
LTDIE_58:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM347=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM347
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM348=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM348
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM349=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM349
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM350=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM350
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM351=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM351
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM352=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM352
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM353=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM353
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM354=LTDIE_59_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM354
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM355=LTDIE_60_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM355
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM356=LTDIE_61_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM356
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM357=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM357
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM358=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM358
LTDIE_58_POINTER:

	.byte 13
LDIFF_SYM359=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM359
LTDIE_58_REFERENCE:

	.byte 14
LDIFF_SYM360=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM360
LTDIE_63:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM361=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM361
LTDIE_63_POINTER:

	.byte 13
LDIFF_SYM362=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM362
LTDIE_63_REFERENCE:

	.byte 14
LDIFF_SYM363=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM363
LTDIE_64:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM364=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM364
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM365=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM365
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM366=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM366
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM367=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM367
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM368=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM368
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM369=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM369
LTDIE_64_POINTER:

	.byte 13
LDIFF_SYM370=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM370
LTDIE_64_REFERENCE:

	.byte 14
LDIFF_SYM371=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM371
LTDIE_65:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM372=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM372
LTDIE_65_POINTER:

	.byte 13
LDIFF_SYM373=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM373
LTDIE_65_REFERENCE:

	.byte 14
LDIFF_SYM374=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM374
LTDIE_66:

	.byte 17
	.asciz "Xamarin_Forms_IStyle"

	.byte 16,7
	.asciz "Xamarin_Forms_IStyle"

LDIFF_SYM375=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM375
LTDIE_66_POINTER:

	.byte 13
LDIFF_SYM376=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM376
LTDIE_66_REFERENCE:

	.byte 14
LDIFF_SYM377=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM377
LTDIE_67:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM378=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM378
LTDIE_67_POINTER:

	.byte 13
LDIFF_SYM379=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM379
LTDIE_67_REFERENCE:

	.byte 14
LDIFF_SYM380=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM380
LTDIE_62:

	.byte 5
	.asciz "Xamarin_Forms_MergedStyle"

	.byte 80,16
LDIFF_SYM381=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM381
	.byte 2,35,0,6
	.asciz "_classStyleProperties"

LDIFF_SYM382=LTDIE_63_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM382
	.byte 2,35,16,6
	.asciz "_implicitStyles"

LDIFF_SYM383=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM383
	.byte 2,35,24,6
	.asciz "_classStyles"

LDIFF_SYM384=LTDIE_65_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM384
	.byte 2,35,32,6
	.asciz "_implicitStyle"

LDIFF_SYM385=LTDIE_66_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM385
	.byte 2,35,40,6
	.asciz "_style"

LDIFF_SYM386=LTDIE_66_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM386
	.byte 2,35,48,6
	.asciz "_styleClass"

LDIFF_SYM387=LTDIE_67_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM387
	.byte 2,35,56,6
	.asciz "<Target>k__BackingField"

LDIFF_SYM388=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM388
	.byte 2,35,64,6
	.asciz "<TargetType>k__BackingField"

LDIFF_SYM389=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM389
	.byte 2,35,72,0,7
	.asciz "Xamarin_Forms_MergedStyle"

LDIFF_SYM390=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM390
LTDIE_62_POINTER:

	.byte 13
LDIFF_SYM391=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM391
LTDIE_62_REFERENCE:

	.byte 14
LDIFF_SYM392=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM392
LTDIE_68:

	.byte 8
	.asciz "Xamarin_Forms_LayoutConstraint"

	.byte 4
LDIFF_SYM393=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM393
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "HorizontallyFixed"

	.byte 1,9
	.asciz "VerticallyFixed"

	.byte 2,9
	.asciz "Fixed"

	.byte 3,0,7
	.asciz "Xamarin_Forms_LayoutConstraint"

LDIFF_SYM394=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM394
LTDIE_68_POINTER:

	.byte 13
LDIFF_SYM395=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM395
LTDIE_68_REFERENCE:

	.byte 14
LDIFF_SYM396=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM396
LTDIE_71:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM397=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM397
LTDIE_71_POINTER:

	.byte 13
LDIFF_SYM398=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM398
LTDIE_71_REFERENCE:

	.byte 14
LDIFF_SYM399=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM399
LTDIE_72:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM400=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM400
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM401=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM401
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM402=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM402
LTDIE_72_POINTER:

	.byte 13
LDIFF_SYM403=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM403
LTDIE_72_REFERENCE:

	.byte 14
LDIFF_SYM404=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM404
LTDIE_73:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM405=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM405
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM406=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM406
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM407=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM407
LTDIE_73_POINTER:

	.byte 13
LDIFF_SYM408=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM408
LTDIE_73_REFERENCE:

	.byte 14
LDIFF_SYM409=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM409
LTDIE_70:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM410=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM410
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM411=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM411
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM412=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM412
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM413=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM413
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM414=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM414
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM415=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM415
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM416=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM416
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM417=LTDIE_71_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM417
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM418=LTDIE_72_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM418
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM419=LTDIE_73_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM419
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM420=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM420
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM421=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM421
LTDIE_70_POINTER:

	.byte 13
LDIFF_SYM422=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM422
LTDIE_70_REFERENCE:

	.byte 14
LDIFF_SYM423=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM423
LTDIE_76:

	.byte 8
	.asciz "System_UriSyntaxFlags"

	.byte 4
LDIFF_SYM424=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM424
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

LDIFF_SYM425=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM425
LTDIE_76_POINTER:

	.byte 13
LDIFF_SYM426=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM426
LTDIE_76_REFERENCE:

	.byte 14
LDIFF_SYM427=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM427
LTDIE_75:

	.byte 5
	.asciz "System_UriParser"

	.byte 40,16
LDIFF_SYM428=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM428
	.byte 2,35,0,6
	.asciz "m_Flags"

LDIFF_SYM429=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM429
	.byte 2,35,24,6
	.asciz "m_UpdatableFlags"

LDIFF_SYM430=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM430
	.byte 2,35,28,6
	.asciz "m_UpdatableFlagsUsed"

LDIFF_SYM431=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM431
	.byte 2,35,32,6
	.asciz "m_Port"

LDIFF_SYM432=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM432
	.byte 2,35,36,6
	.asciz "m_Scheme"

LDIFF_SYM433=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM433
	.byte 2,35,16,0,7
	.asciz "System_UriParser"

LDIFF_SYM434=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM434
LTDIE_75_POINTER:

	.byte 13
LDIFF_SYM435=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM435
LTDIE_75_REFERENCE:

	.byte 14
LDIFF_SYM436=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM436
LTDIE_77:

	.byte 8
	.asciz "_Flags"

	.byte 8
LDIFF_SYM437=LDIE_U8 - Ldebug_info_start
	.long LDIFF_SYM437
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

LDIFF_SYM438=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM438
LTDIE_77_POINTER:

	.byte 13
LDIFF_SYM439=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM439
LTDIE_77_REFERENCE:

	.byte 14
LDIFF_SYM440=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM440
LTDIE_79:

	.byte 5
	.asciz "_MoreInfo"

	.byte 64,16
LDIFF_SYM441=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM441
	.byte 2,35,0,6
	.asciz "Path"

LDIFF_SYM442=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM442
	.byte 2,35,16,6
	.asciz "Query"

LDIFF_SYM443=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM443
	.byte 2,35,24,6
	.asciz "Fragment"

LDIFF_SYM444=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM444
	.byte 2,35,32,6
	.asciz "AbsoluteUri"

LDIFF_SYM445=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM445
	.byte 2,35,40,6
	.asciz "Hash"

LDIFF_SYM446=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM446
	.byte 2,35,56,6
	.asciz "RemoteUrl"

LDIFF_SYM447=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM447
	.byte 2,35,48,0,7
	.asciz "_MoreInfo"

LDIFF_SYM448=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM448
LTDIE_79_POINTER:

	.byte 13
LDIFF_SYM449=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM449
LTDIE_79_REFERENCE:

	.byte 14
LDIFF_SYM450=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM450
LTDIE_78:

	.byte 5
	.asciz "_UriInfo"

	.byte 72,16
LDIFF_SYM451=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM451
	.byte 2,35,0,6
	.asciz "Host"

LDIFF_SYM452=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM452
	.byte 2,35,16,6
	.asciz "ScopeId"

LDIFF_SYM453=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM453
	.byte 2,35,24,6
	.asciz "String"

LDIFF_SYM454=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM454
	.byte 2,35,32,6
	.asciz "Offset"

LDIFF_SYM455=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM455
	.byte 2,35,56,6
	.asciz "DnsSafeHost"

LDIFF_SYM456=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM456
	.byte 2,35,40,6
	.asciz "MoreInfo"

LDIFF_SYM457=LTDIE_79_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM457
	.byte 2,35,48,0,7
	.asciz "_UriInfo"

LDIFF_SYM458=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM458
LTDIE_78_POINTER:

	.byte 13
LDIFF_SYM459=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM459
LTDIE_78_REFERENCE:

	.byte 14
LDIFF_SYM460=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM460
LTDIE_74:

	.byte 5
	.asciz "System_Uri"

	.byte 72,16
LDIFF_SYM461=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM461
	.byte 2,35,0,6
	.asciz "m_String"

LDIFF_SYM462=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM462
	.byte 2,35,16,6
	.asciz "m_originalUnicodeString"

LDIFF_SYM463=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM463
	.byte 2,35,24,6
	.asciz "m_Syntax"

LDIFF_SYM464=LTDIE_75_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM464
	.byte 2,35,32,6
	.asciz "m_DnsSafeHost"

LDIFF_SYM465=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM465
	.byte 2,35,40,6
	.asciz "m_Flags"

LDIFF_SYM466=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM466
	.byte 2,35,56,6
	.asciz "m_Info"

LDIFF_SYM467=LTDIE_78_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM467
	.byte 2,35,48,6
	.asciz "m_iriParsing"

LDIFF_SYM468=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM468
	.byte 2,35,64,0,7
	.asciz "System_Uri"

LDIFF_SYM469=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM469
LTDIE_74_POINTER:

	.byte 13
LDIFF_SYM470=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM470
LTDIE_74_REFERENCE:

	.byte 14
LDIFF_SYM471=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM471
LTDIE_80:

	.byte 17
	.asciz "System_Collections_Generic_ICollection`1"

	.byte 16,7
	.asciz "System_Collections_Generic_ICollection`1"

LDIFF_SYM472=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM472
LTDIE_80_POINTER:

	.byte 13
LDIFF_SYM473=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM473
LTDIE_80_REFERENCE:

	.byte 14
LDIFF_SYM474=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM474
LTDIE_81:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM475=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM475
LTDIE_81_POINTER:

	.byte 13
LDIFF_SYM476=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM476
LTDIE_81_REFERENCE:

	.byte 14
LDIFF_SYM477=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM477
LTDIE_82:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM478=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM478
LTDIE_82_POINTER:

	.byte 13
LDIFF_SYM479=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM479
LTDIE_82_REFERENCE:

	.byte 14
LDIFF_SYM480=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM480
LTDIE_83:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM481=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM481
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM482=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM482
LTDIE_83_POINTER:

	.byte 13
LDIFF_SYM483=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM483
LTDIE_83_REFERENCE:

	.byte 14
LDIFF_SYM484=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM484
LTDIE_69:

	.byte 5
	.asciz "Xamarin_Forms_ResourceDictionary"

	.byte 80,16
LDIFF_SYM485=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM485
	.byte 2,35,0,6
	.asciz "_innerDictionary"

LDIFF_SYM486=LTDIE_70_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM486
	.byte 2,35,16,6
	.asciz "_mergedInstance"

LDIFF_SYM487=LTDIE_69_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM487
	.byte 2,35,24,6
	.asciz "_mergedWith"

LDIFF_SYM488=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM488
	.byte 2,35,32,6
	.asciz "_source"

LDIFF_SYM489=LTDIE_74_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM489
	.byte 2,35,40,6
	.asciz "_mergedDictionaries"

LDIFF_SYM490=LTDIE_80_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM490
	.byte 2,35,48,6
	.asciz "<StyleSheets>k__BackingField"

LDIFF_SYM491=LTDIE_81_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM491
	.byte 2,35,56,6
	.asciz "_collectionTrack"

LDIFF_SYM492=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM492
	.byte 2,35,64,6
	.asciz "ValuesChanged"

LDIFF_SYM493=LTDIE_83_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM493
	.byte 2,35,72,0,7
	.asciz "Xamarin_Forms_ResourceDictionary"

LDIFF_SYM494=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM494
LTDIE_69_POINTER:

	.byte 13
LDIFF_SYM495=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM495
LTDIE_69_REFERENCE:

	.byte 14
LDIFF_SYM496=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM496
LTDIE_84:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM497=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM497
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM498=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM498
LTDIE_84_POINTER:

	.byte 13
LDIFF_SYM499=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM499
LTDIE_84_REFERENCE:

	.byte 14
LDIFF_SYM500=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM500
LTDIE_85:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM501=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM501
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM502=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM502
LTDIE_85_POINTER:

	.byte 13
LDIFF_SYM503=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM503
LTDIE_85_REFERENCE:

	.byte 14
LDIFF_SYM504=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM504
LTDIE_86:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM505=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM505
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM506=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM506
LTDIE_86_POINTER:

	.byte 13
LDIFF_SYM507=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM507
LTDIE_86_REFERENCE:

	.byte 14
LDIFF_SYM508=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM508
LTDIE_37:

	.byte 5
	.asciz "Xamarin_Forms_VisualElement"

	.byte 232,2,16
LDIFF_SYM509=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM509
	.byte 2,35,0,6
	.asciz "_effectiveFlowDirection"

LDIFF_SYM510=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM510
	.byte 3,35,176,2,6
	.asciz "_measureCache"

LDIFF_SYM511=LTDIE_58_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM511
	.byte 3,35,224,1,6
	.asciz "_mergedStyle"

LDIFF_SYM512=LTDIE_62_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM512
	.byte 3,35,232,1,6
	.asciz "_batched"

LDIFF_SYM513=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM513
	.byte 3,35,180,2,6
	.asciz "_computedConstraint"

LDIFF_SYM514=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM514
	.byte 3,35,184,2,6
	.asciz "_isInNativeLayout"

LDIFF_SYM515=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM515
	.byte 3,35,188,2,6
	.asciz "_isNativeStateConsistent"

LDIFF_SYM516=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM516
	.byte 3,35,189,2,6
	.asciz "_isPlatformEnabled"

LDIFF_SYM517=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM517
	.byte 3,35,190,2,6
	.asciz "_mockHeight"

LDIFF_SYM518=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM518
	.byte 3,35,192,2,6
	.asciz "_mockWidth"

LDIFF_SYM519=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM519
	.byte 3,35,200,2,6
	.asciz "_mockX"

LDIFF_SYM520=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM520
	.byte 3,35,208,2,6
	.asciz "_mockY"

LDIFF_SYM521=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM521
	.byte 3,35,216,2,6
	.asciz "_selfConstraint"

LDIFF_SYM522=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM522
	.byte 3,35,224,2,6
	.asciz "<DisableLayout>k__BackingField"

LDIFF_SYM523=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM523
	.byte 3,35,228,2,6
	.asciz "_resources"

LDIFF_SYM524=LTDIE_69_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM524
	.byte 3,35,240,1,6
	.asciz "ChildrenReordered"

LDIFF_SYM525=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM525
	.byte 3,35,248,1,6
	.asciz "Focused"

LDIFF_SYM526=LTDIE_84_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM526
	.byte 3,35,128,2,6
	.asciz "MeasureInvalidated"

LDIFF_SYM527=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM527
	.byte 3,35,136,2,6
	.asciz "SizeChanged"

LDIFF_SYM528=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM528
	.byte 3,35,144,2,6
	.asciz "Unfocused"

LDIFF_SYM529=LTDIE_84_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM529
	.byte 3,35,152,2,6
	.asciz "BatchCommitted"

LDIFF_SYM530=LTDIE_85_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM530
	.byte 3,35,160,2,6
	.asciz "FocusChangeRequested"

LDIFF_SYM531=LTDIE_86_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM531
	.byte 3,35,168,2,0,7
	.asciz "Xamarin_Forms_VisualElement"

LDIFF_SYM532=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM532
LTDIE_37_POINTER:

	.byte 13
LDIFF_SYM533=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM533
LTDIE_37_REFERENCE:

	.byte 14
LDIFF_SYM534=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM534
LTDIE_36:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementPackager"

	.byte 40,16
LDIFF_SYM535=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM535
	.byte 2,35,0,6
	.asciz "_element"

LDIFF_SYM536=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM536
	.byte 2,35,16,6
	.asciz "_isDisposed"

LDIFF_SYM537=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM537
	.byte 2,35,32,6
	.asciz "<Renderer>k__BackingField"

LDIFF_SYM538=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM538
	.byte 2,35,24,0,7
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementPackager"

LDIFF_SYM539=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM539
LTDIE_36_POINTER:

	.byte 13
LDIFF_SYM540=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM540
LTDIE_36_REFERENCE:

	.byte 14
LDIFF_SYM541=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM541
LTDIE_89:

	.byte 5
	.asciz "System_WeakReference"

	.byte 24,16
LDIFF_SYM542=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM542
	.byte 2,35,0,6
	.asciz "isLongReference"

LDIFF_SYM543=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM543
	.byte 2,35,16,6
	.asciz "gcHandle"

LDIFF_SYM544=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM544
	.byte 2,35,20,0,7
	.asciz "System_WeakReference"

LDIFF_SYM545=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM545
LTDIE_89_POINTER:

	.byte 13
LDIFF_SYM546=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM546
LTDIE_89_REFERENCE:

	.byte 14
LDIFF_SYM547=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM547
LTDIE_88:

	.byte 5
	.asciz "CoreAnimation_CALayer"

	.byte 56,16
LDIFF_SYM548=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM548
	.byte 2,35,0,6
	.asciz "calayerdelegate"

LDIFF_SYM549=LTDIE_89_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM549
	.byte 2,35,40,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM550=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM550
	.byte 2,35,48,0,7
	.asciz "CoreAnimation_CALayer"

LDIFF_SYM551=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM551
LTDIE_88_POINTER:

	.byte 13
LDIFF_SYM552=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM552
LTDIE_88_REFERENCE:

	.byte 14
LDIFF_SYM553=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM553
LTDIE_87:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementTracker"

	.byte 120,16
LDIFF_SYM554=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM554
	.byte 2,35,0,6
	.asciz "_batchCommittedHandler"

LDIFF_SYM555=LTDIE_85_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM555
	.byte 2,35,16,6
	.asciz "_propertyChangedHandler"

LDIFF_SYM556=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM556
	.byte 2,35,24,6
	.asciz "_sizeChangedEventHandler"

LDIFF_SYM557=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM557
	.byte 2,35,32,6
	.asciz "_disposed"

LDIFF_SYM558=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM558
	.byte 2,35,72,6
	.asciz "_element"

LDIFF_SYM559=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM559
	.byte 2,35,40,6
	.asciz "_isInteractive"

LDIFF_SYM560=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM560
	.byte 2,35,73,6
	.asciz "_lastBounds"

LDIFF_SYM561=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM561
	.byte 2,35,80,6
	.asciz "_layer"

LDIFF_SYM562=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM562
	.byte 2,35,48,6
	.asciz "_updateCount"

LDIFF_SYM563=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM563
	.byte 2,35,112,6
	.asciz "<Renderer>k__BackingField"

LDIFF_SYM564=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM564
	.byte 2,35,56,6
	.asciz "NativeControlUpdated"

LDIFF_SYM565=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM565
	.byte 2,35,64,0,7
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementTracker"

LDIFF_SYM566=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM566
LTDIE_87_POINTER:

	.byte 13
LDIFF_SYM567=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM567
LTDIE_87_REFERENCE:

	.byte 14
LDIFF_SYM568=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM568
LTDIE_90:

	.byte 5
	.asciz "UIKit_UIVisualEffectView"

	.byte 48,16
LDIFF_SYM569=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM569
	.byte 2,35,0,0,7
	.asciz "UIKit_UIVisualEffectView"

LDIFF_SYM570=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM570
LTDIE_90_POINTER:

	.byte 13
LDIFF_SYM571=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM571
LTDIE_90_REFERENCE:

	.byte 14
LDIFF_SYM572=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM572
LTDIE_91:

	.byte 8
	.asciz "Xamarin_Forms_PlatformConfiguration_iOSSpecific_BlurEffectStyle"

	.byte 4
LDIFF_SYM573=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM573
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "ExtraLight"

	.byte 1,9
	.asciz "Light"

	.byte 2,9
	.asciz "Dark"

	.byte 3,0,7
	.asciz "Xamarin_Forms_PlatformConfiguration_iOSSpecific_BlurEffectStyle"

LDIFF_SYM574=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM574
LTDIE_91_POINTER:

	.byte 13
LDIFF_SYM575=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM575
LTDIE_91_REFERENCE:

	.byte 14
LDIFF_SYM576=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM576
LTDIE_95:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM577=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM577
LTDIE_95_POINTER:

	.byte 13
LDIFF_SYM578=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM578
LTDIE_95_REFERENCE:

	.byte 14
LDIFF_SYM579=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM579
LTDIE_94:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 32,16
LDIFF_SYM580=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM580
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM581=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM581
	.byte 2,35,16,6
	.asciz "_syncRoot"

LDIFF_SYM582=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM582
	.byte 2,35,24,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM583=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM583
LTDIE_94_POINTER:

	.byte 13
LDIFF_SYM584=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM584
LTDIE_94_REFERENCE:

	.byte 14
LDIFF_SYM585=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM585
LTDIE_96:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM586=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM586
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM587=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM587
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM588=LTDIE_93_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM588
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM589=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM589
LTDIE_96_POINTER:

	.byte 13
LDIFF_SYM590=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM590
LTDIE_96_REFERENCE:

	.byte 14
LDIFF_SYM591=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM591
LTDIE_93:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 64,16
LDIFF_SYM592=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM592
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM593=LTDIE_96_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM593
	.byte 2,35,32,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM594=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM594
	.byte 2,35,56,6
	.asciz "CollectionChanged"

LDIFF_SYM595=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM595
	.byte 2,35,40,6
	.asciz "PropertyChanged"

LDIFF_SYM596=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM596
	.byte 2,35,48,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM597=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM597
LTDIE_93_POINTER:

	.byte 13
LDIFF_SYM598=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM598
LTDIE_93_REFERENCE:

	.byte 14
LDIFF_SYM599=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM599
LTDIE_92:

	.byte 5
	.asciz "Xamarin_Forms_View"

	.byte 248,2,16
LDIFF_SYM600=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM600
	.byte 2,35,0,6
	.asciz "_gestureRecognizers"

LDIFF_SYM601=LTDIE_93_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM601
	.byte 3,35,232,2,6
	.asciz "_compositeGestureRecognizers"

LDIFF_SYM602=LTDIE_93_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM602
	.byte 3,35,240,2,0,7
	.asciz "Xamarin_Forms_View"

LDIFF_SYM603=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM603
LTDIE_92_POINTER:

	.byte 13
LDIFF_SYM604=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM604
LTDIE_92_REFERENCE:

	.byte 14
LDIFF_SYM605=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM605
LTDIE_97:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM606=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM606
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM607=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM607
LTDIE_97_POINTER:

	.byte 13
LDIFF_SYM608=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM608
LTDIE_97_REFERENCE:

	.byte 14
LDIFF_SYM609=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM609
LTDIE_15:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementRenderer`1"

	.byte 168,1,16
LDIFF_SYM610=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM610
	.byte 2,35,0,6
	.asciz "_defaultColor"

LDIFF_SYM611=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM611
	.byte 2,35,48,6
	.asciz "_elementChangedHandlers"

LDIFF_SYM612=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM612
	.byte 2,35,56,6
	.asciz "_propertyChangedHandler"

LDIFF_SYM613=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM613
	.byte 2,35,64,6
	.asciz "_defaultAccessibilityLabel"

LDIFF_SYM614=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM614
	.byte 2,35,72,6
	.asciz "_defaultAccessibilityHint"

LDIFF_SYM615=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM615
	.byte 2,35,80,6
	.asciz "_defaultIsAccessibilityElement"

LDIFF_SYM616=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM616
	.byte 3,35,144,1,6
	.asciz "_events"

LDIFF_SYM617=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM617
	.byte 2,35,88,6
	.asciz "_flags"

LDIFF_SYM618=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM618
	.byte 3,35,148,1,6
	.asciz "_packager"

LDIFF_SYM619=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM619
	.byte 2,35,96,6
	.asciz "_tracker"

LDIFF_SYM620=LTDIE_87_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM620
	.byte 2,35,104,6
	.asciz "_blur"

LDIFF_SYM621=LTDIE_90_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM621
	.byte 2,35,112,6
	.asciz "_previousBlur"

LDIFF_SYM622=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM622
	.byte 3,35,152,1,6
	.asciz "<Element>k__BackingField"

LDIFF_SYM623=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM623
	.byte 2,35,120,6
	.asciz "ElementChanged"

LDIFF_SYM624=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM624
	.byte 3,35,128,1,6
	.asciz "<TabIndex>k__BackingField"

LDIFF_SYM625=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM625
	.byte 3,35,156,1,6
	.asciz "<TabStop>k__BackingField"

LDIFF_SYM626=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM626
	.byte 3,35,160,1,6
	.asciz "tabCommands"

LDIFF_SYM627=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM627
	.byte 3,35,136,1,0,7
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementRenderer`1"

LDIFF_SYM628=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM628
LTDIE_15_POINTER:

	.byte 13
LDIFF_SYM629=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM629
LTDIE_15_REFERENCE:

	.byte 14
LDIFF_SYM630=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM630
LTDIE_98:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM631=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM631
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM632=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM632
LTDIE_98_POINTER:

	.byte 13
LDIFF_SYM633=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM633
LTDIE_98_REFERENCE:

	.byte 14
LDIFF_SYM634=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM634
LTDIE_14:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_ViewRenderer`2"

	.byte 232,1,16
LDIFF_SYM635=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM635
	.byte 2,35,0,6
	.asciz "_defaultAccessibilityLabel"

LDIFF_SYM636=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM636
	.byte 3,35,168,1,6
	.asciz "_defaultAccessibilityHint"

LDIFF_SYM637=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM637
	.byte 3,35,176,1,6
	.asciz "_defaultIsAccessibilityElement"

LDIFF_SYM638=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM638
	.byte 3,35,224,1,6
	.asciz "_defaultColor"

LDIFF_SYM639=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM639
	.byte 3,35,184,1,6
	.asciz "_elementPropertyChanged"

LDIFF_SYM640=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM640
	.byte 3,35,192,1,6
	.asciz "_controlChanging"

LDIFF_SYM641=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM641
	.byte 3,35,200,1,6
	.asciz "_controlChanged"

LDIFF_SYM642=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM642
	.byte 3,35,208,1,6
	.asciz "<Control>k__BackingField"

LDIFF_SYM643=LTDIE_1_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM643
	.byte 3,35,216,1,0,7
	.asciz "Xamarin_Forms_Platform_iOS_ViewRenderer`2"

LDIFF_SYM644=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM644
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM645=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM645
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM646=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM646
LTDIE_13:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_ViewRenderer"

	.byte 232,1,16
LDIFF_SYM647=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM647
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Platform_iOS_ViewRenderer"

LDIFF_SYM648=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM648
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM649=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM649
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM650=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM650
LTDIE_99:

	.byte 5
	.asciz "CoreLocation_CLLocationManager"

	.byte 40,16
LDIFF_SYM651=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM651
	.byte 2,35,0,0,7
	.asciz "CoreLocation_CLLocationManager"

LDIFF_SYM652=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM652
LTDIE_99_POINTER:

	.byte 13
LDIFF_SYM653=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM653
LTDIE_99_REFERENCE:

	.byte 14
LDIFF_SYM654=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM654
LTDIE_12:

	.byte 5
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer"

	.byte 128,2,16
LDIFF_SYM655=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM655
	.byte 2,35,0,6
	.asciz "_locationManager"

LDIFF_SYM656=LTDIE_99_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM656
	.byte 3,35,232,1,6
	.asciz "_shouldUpdateRegion"

LDIFF_SYM657=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM657
	.byte 3,35,248,1,6
	.asciz "_lastTouchedView"

LDIFF_SYM658=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM658
	.byte 3,35,240,1,6
	.asciz "_disposed"

LDIFF_SYM659=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM659
	.byte 3,35,249,1,0,7
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer"

LDIFF_SYM660=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM660
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM661=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM661
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM662=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM662
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:GetDesiredSize"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double
	.quad Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM663=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM663
	.byte 3,141,208,0,3
	.asciz "widthConstraint"

LDIFF_SYM664=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM664
	.byte 3,141,216,0,3
	.asciz "heightConstraint"

LDIFF_SYM665=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM665
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM666=Lfde8_end - Lfde8_start
	.long LDIFF_SYM666
Lfde8_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double

LDIFF_SYM667=Lme_8 - Xamarin_Forms_Maps_iOS_MapRenderer_GetDesiredSize_double_double
	.long LDIFF_SYM667
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:get_ManageNativeControlLifetime"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime
	.quad Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM668=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM668
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM669=Lfde9_end - Lfde9_start
	.long LDIFF_SYM669
Lfde9_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime

LDIFF_SYM670=Lme_9 - Xamarin_Forms_Maps_iOS_MapRenderer_get_ManageNativeControlLifetime
	.long LDIFF_SYM670
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde9_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_100:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerator`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerator`1"

LDIFF_SYM671=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM671
LTDIE_100_POINTER:

	.byte 13
LDIFF_SYM672=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM672
LTDIE_100_REFERENCE:

	.byte 14
LDIFF_SYM673=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM673
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:Dispose"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool
	.quad Lme_a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM674=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM674
	.byte 1,105,3
	.asciz "disposing"

LDIFF_SYM675=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM675
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM676=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM676
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM677=LTDIE_100_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM677
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM678=Lfde10_end - Lfde10_start
	.long LDIFF_SYM678
Lfde10_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool

LDIFF_SYM679=Lme_a - Xamarin_Forms_Maps_iOS_MapRenderer_Dispose_bool
	.long LDIFF_SYM679
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10
	.align 3
Lfde10_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_102:

	.byte 5
	.asciz "System_EventArgs"

	.byte 16,16
LDIFF_SYM680=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM680
	.byte 2,35,0,0,7
	.asciz "System_EventArgs"

LDIFF_SYM681=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM681
LTDIE_102_POINTER:

	.byte 13
LDIFF_SYM682=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM682
LTDIE_102_REFERENCE:

	.byte 14
LDIFF_SYM683=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM683
LTDIE_101:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_ElementChangedEventArgs`1"

	.byte 32,16
LDIFF_SYM684=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM684
	.byte 2,35,0,6
	.asciz "<NewElement>k__BackingField"

LDIFF_SYM685=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM685
	.byte 2,35,16,6
	.asciz "<OldElement>k__BackingField"

LDIFF_SYM686=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM686
	.byte 2,35,24,0,7
	.asciz "Xamarin_Forms_Platform_iOS_ElementChangedEventArgs`1"

LDIFF_SYM687=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM687
LTDIE_101_POINTER:

	.byte 13
LDIFF_SYM688=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM688
LTDIE_101_REFERENCE:

	.byte 14
LDIFF_SYM689=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM689
LTDIE_106:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM690=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM690
LTDIE_106_POINTER:

	.byte 13
LDIFF_SYM691=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM691
LTDIE_106_REFERENCE:

	.byte 14
LDIFF_SYM692=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM692
LTDIE_105:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 32,16
LDIFF_SYM693=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM693
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM694=LTDIE_106_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM694
	.byte 2,35,16,6
	.asciz "_syncRoot"

LDIFF_SYM695=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM695
	.byte 2,35,24,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM696=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM696
LTDIE_105_POINTER:

	.byte 13
LDIFF_SYM697=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM697
LTDIE_105_REFERENCE:

	.byte 14
LDIFF_SYM698=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM698
LTDIE_107:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM699=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM699
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM700=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM700
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM701=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM701
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM702=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM702
LTDIE_107_POINTER:

	.byte 13
LDIFF_SYM703=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM703
LTDIE_107_REFERENCE:

	.byte 14
LDIFF_SYM704=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM704
LTDIE_104:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 64,16
LDIFF_SYM705=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM705
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM706=LTDIE_107_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM706
	.byte 2,35,32,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM707=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM707
	.byte 2,35,56,6
	.asciz "CollectionChanged"

LDIFF_SYM708=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM708
	.byte 2,35,40,6
	.asciz "PropertyChanged"

LDIFF_SYM709=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM709
	.byte 2,35,48,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM710=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM710
LTDIE_104_POINTER:

	.byte 13
LDIFF_SYM711=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM711
LTDIE_104_REFERENCE:

	.byte 14
LDIFF_SYM712=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM712
LTDIE_108:

	.byte 5
	.asciz "Xamarin_Forms_Maps_MapSpan"

	.byte 48,16
LDIFF_SYM713=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM713
	.byte 2,35,0,6
	.asciz "<Center>k__BackingField"

LDIFF_SYM714=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM714
	.byte 2,35,16,6
	.asciz "<LatitudeDegrees>k__BackingField"

LDIFF_SYM715=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM715
	.byte 2,35,32,6
	.asciz "<LongitudeDegrees>k__BackingField"

LDIFF_SYM716=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM716
	.byte 2,35,40,0,7
	.asciz "Xamarin_Forms_Maps_MapSpan"

LDIFF_SYM717=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM717
LTDIE_108_POINTER:

	.byte 13
LDIFF_SYM718=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM718
LTDIE_108_REFERENCE:

	.byte 14
LDIFF_SYM719=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM719
LTDIE_103:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Map"

	.byte 144,3,16
LDIFF_SYM720=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM720
	.byte 2,35,0,6
	.asciz "_pins"

LDIFF_SYM721=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM721
	.byte 3,35,248,2,6
	.asciz "_visibleRegion"

LDIFF_SYM722=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM722
	.byte 3,35,128,3,6
	.asciz "<LastMoveToRegion>k__BackingField"

LDIFF_SYM723=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM723
	.byte 3,35,136,3,0,7
	.asciz "Xamarin_Forms_Maps_Map"

LDIFF_SYM724=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM724
LTDIE_103_POINTER:

	.byte 13
LDIFF_SYM725=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM725
LTDIE_103_REFERENCE:

	.byte 14
LDIFF_SYM726=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM726
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:OnElementChanged"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
	.quad Lme_b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM727=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM727
	.byte 1,105,3
	.asciz "e"

LDIFF_SYM728=LTDIE_101_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM728
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM729=LTDIE_100_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM729
	.byte 3,141,208,0,11
	.asciz "V_1"

LDIFF_SYM730=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM730
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM731=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM731
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM732=Lfde11_end - Lfde11_start
	.long LDIFF_SYM732
Lfde11_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View

LDIFF_SYM733=Lme_b - Xamarin_Forms_Maps_iOS_MapRenderer_OnElementChanged_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
	.long LDIFF_SYM733
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,151,16,152,15,68,153,14,154,13
	.align 3
Lfde11_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_109:

	.byte 5
	.asciz "System_ComponentModel_PropertyChangedEventArgs"

	.byte 24,16
LDIFF_SYM734=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM734
	.byte 2,35,0,6
	.asciz "propertyName"

LDIFF_SYM735=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM735
	.byte 2,35,16,0,7
	.asciz "System_ComponentModel_PropertyChangedEventArgs"

LDIFF_SYM736=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM736
LTDIE_109_POINTER:

	.byte 13
LDIFF_SYM737=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM737
LTDIE_109_REFERENCE:

	.byte 14
LDIFF_SYM738=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM738
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:OnElementPropertyChanged"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
	.quad Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM739=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM739
	.byte 1,104,3
	.asciz "sender"

LDIFF_SYM740=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM740
	.byte 2,141,32,3
	.asciz "e"

LDIFF_SYM741=LTDIE_109_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM741
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM742=Lfde12_end - Lfde12_start
	.long LDIFF_SYM742
Lfde12_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs

LDIFF_SYM743=Lme_c - Xamarin_Forms_Maps_iOS_MapRenderer_OnElementPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
	.long LDIFF_SYM743
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,68,154,3
	.align 3
Lfde12_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:LayoutSubviews"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews
	.quad Lme_d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM744=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM744
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM745=Lfde13_end - Lfde13_start
	.long LDIFF_SYM745
Lfde13_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews

LDIFF_SYM746=Lme_d - Xamarin_Forms_Maps_iOS_MapRenderer_LayoutSubviews
	.long LDIFF_SYM746
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde13_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_110:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Pin"

	.byte 80,16
LDIFF_SYM747=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM747
	.byte 2,35,0,6
	.asciz "<Id>k__BackingField"

LDIFF_SYM748=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM748
	.byte 2,35,64,6
	.asciz "Clicked"

LDIFF_SYM749=LTDIE_41_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM749
	.byte 2,35,72,0,7
	.asciz "Xamarin_Forms_Maps_Pin"

LDIFF_SYM750=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM750
LTDIE_110_POINTER:

	.byte 13
LDIFF_SYM751=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM751
LTDIE_110_REFERENCE:

	.byte 14
LDIFF_SYM752=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM752
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:CreateAnnotation"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin
	.quad Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM753=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM753
	.byte 0,3
	.asciz "pin"

LDIFF_SYM754=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM754
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM755=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM755
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM756=Lfde14_end - Lfde14_start
	.long LDIFF_SYM756
Lfde14_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin

LDIFF_SYM757=Lme_e - Xamarin_Forms_Maps_iOS_MapRenderer_CreateAnnotation_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM757
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,151,18,152,17,68,153,16,154,15
	.align 3
Lfde14_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_111:

	.byte 17
	.asciz "MapKit_IMKAnnotation"

	.byte 16,7
	.asciz "MapKit_IMKAnnotation"

LDIFF_SYM758=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM758
LTDIE_111_POINTER:

	.byte 13
LDIFF_SYM759=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM759
LTDIE_111_REFERENCE:

	.byte 14
LDIFF_SYM760=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM760
LTDIE_112:

	.byte 5
	.asciz "MapKit_MKAnnotationView"

	.byte 48,16
LDIFF_SYM761=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM761
	.byte 2,35,0,0,7
	.asciz "MapKit_MKAnnotationView"

LDIFF_SYM762=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM762
LTDIE_112_POINTER:

	.byte 13
LDIFF_SYM763=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM763
LTDIE_112_REFERENCE:

	.byte 14
LDIFF_SYM764=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM764
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:GetViewForAnnotation"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
	.quad Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM765=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM765
	.byte 2,141,48,3
	.asciz "mapView"

LDIFF_SYM766=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM766
	.byte 1,105,3
	.asciz "annotation"

LDIFF_SYM767=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM767
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM768=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM768
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM769=Lfde15_end - Lfde15_start
	.long LDIFF_SYM769
Lfde15_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation

LDIFF_SYM770=Lme_f - Xamarin_Forms_Maps_iOS_MapRenderer_GetViewForAnnotation_MapKit_MKMapView_MapKit_IMKAnnotation
	.long LDIFF_SYM770
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,153,6,154,5
	.align 3
Lfde15_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_113:

	.byte 5
	.asciz "_<>c__DisplayClass14_0"

	.byte 32,16
LDIFF_SYM771=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM771
	.byte 2,35,0,6
	.asciz "<>4__this"

LDIFF_SYM772=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM772
	.byte 2,35,16,6
	.asciz "annotation"

LDIFF_SYM773=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM773
	.byte 2,35,24,0,7
	.asciz "_<>c__DisplayClass14_0"

LDIFF_SYM774=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM774
LTDIE_113_POINTER:

	.byte 13
LDIFF_SYM775=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM775
LTDIE_113_REFERENCE:

	.byte 14
LDIFF_SYM776=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM776
LTDIE_115:

	.byte 5
	.asciz "UIKit_UIGestureRecognizer"

	.byte 56,16
LDIFF_SYM777=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM777
	.byte 2,35,0,6
	.asciz "recognizers"

LDIFF_SYM778=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM778
	.byte 2,35,40,6
	.asciz "__mt_WeakDelegate_var"

LDIFF_SYM779=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM779
	.byte 2,35,48,0,7
	.asciz "UIKit_UIGestureRecognizer"

LDIFF_SYM780=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM780
LTDIE_115_POINTER:

	.byte 13
LDIFF_SYM781=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM781
LTDIE_115_REFERENCE:

	.byte 14
LDIFF_SYM782=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM782
LTDIE_114:

	.byte 5
	.asciz "UIKit_UITapGestureRecognizer"

	.byte 56,16
LDIFF_SYM783=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM783
	.byte 2,35,0,0,7
	.asciz "UIKit_UITapGestureRecognizer"

LDIFF_SYM784=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM784
LTDIE_114_POINTER:

	.byte 13
LDIFF_SYM785=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM785
LTDIE_114_REFERENCE:

	.byte 14
LDIFF_SYM786=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM786
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:AttachGestureToPin"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation
	.quad Lme_10

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM787=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM787
	.byte 1,104,3
	.asciz "mapPin"

LDIFF_SYM788=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM788
	.byte 1,105,3
	.asciz "annotation"

LDIFF_SYM789=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM789
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM790=LTDIE_113_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM790
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM791=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM791
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM792=LTDIE_114_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM792
	.byte 1,106,11
	.asciz "V_3"

LDIFF_SYM793=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM793
	.byte 1,104,11
	.asciz "V_4"

LDIFF_SYM794=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM794
	.byte 1,106,11
	.asciz "V_5"

LDIFF_SYM795=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM795
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM796=Lfde16_end - Lfde16_start
	.long LDIFF_SYM796
Lfde16_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation

LDIFF_SYM797=Lme_10 - Xamarin_Forms_Maps_iOS_MapRenderer_AttachGestureToPin_MapKit_MKAnnotationView_MapKit_IMKAnnotation
	.long LDIFF_SYM797
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,150,10,151,9,68,152,8,153,7,68,154,6
	.align 3
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:OnClick"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer
	.quad Lme_11

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM798=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM798
	.byte 1,105,3
	.asciz "annotationObject"

LDIFF_SYM799=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM799
	.byte 1,106,3
	.asciz "recognizer"

LDIFF_SYM800=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM800
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM801=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM801
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM802=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM802
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM803=LTDIE_100_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM803
	.byte 2,141,56,11
	.asciz "V_3"

LDIFF_SYM804=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM804
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM805=Lfde17_end - Lfde17_start
	.long LDIFF_SYM805
Lfde17_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer

LDIFF_SYM806=Lme_11 - Xamarin_Forms_Maps_iOS_MapRenderer_OnClick_object_UIKit_UITapGestureRecognizer
	.long LDIFF_SYM806
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,151,10,152,9,68,153,8,154,7
	.align 3
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:UpdateRegion"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion
	.quad Lme_12

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM807=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM807
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM808=Lfde18_end - Lfde18_start
	.long LDIFF_SYM808
Lfde18_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion

LDIFF_SYM809=Lme_12 - Xamarin_Forms_Maps_iOS_MapRenderer_UpdateRegion
	.long LDIFF_SYM809
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,154,1
	.align 3
Lfde18_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_116:

	.byte 17
	.asciz "System_Collections_IList"

	.byte 16,7
	.asciz "System_Collections_IList"

LDIFF_SYM810=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM810
LTDIE_116_POINTER:

	.byte 13
LDIFF_SYM811=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM811
LTDIE_116_REFERENCE:

	.byte 14
LDIFF_SYM812=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM812
LTDIE_117:

	.byte 17
	.asciz "System_Collections_IEnumerator"

	.byte 16,7
	.asciz "System_Collections_IEnumerator"

LDIFF_SYM813=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM813
LTDIE_117_POINTER:

	.byte 13
LDIFF_SYM814=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM814
LTDIE_117_REFERENCE:

	.byte 14
LDIFF_SYM815=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM815
LTDIE_118:

	.byte 17
	.asciz "System_IDisposable"

	.byte 16,7
	.asciz "System_IDisposable"

LDIFF_SYM816=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM816
LTDIE_118_POINTER:

	.byte 13
LDIFF_SYM817=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM817
LTDIE_118_REFERENCE:

	.byte 14
LDIFF_SYM818=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM818
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:AddPins"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList
	.quad Lme_13

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM819=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM819
	.byte 1,105,3
	.asciz "pins"

LDIFF_SYM820=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM820
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM821=LTDIE_117_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM821
	.byte 2,141,40,11
	.asciz "V_1"

LDIFF_SYM822=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM822
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM823=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM823
	.byte 1,106,11
	.asciz "V_3"

LDIFF_SYM824=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM824
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM825=Lfde19_end - Lfde19_start
	.long LDIFF_SYM825
Lfde19_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList

LDIFF_SYM826=Lme_13 - Xamarin_Forms_Maps_iOS_MapRenderer_AddPins_System_Collections_IList
	.long LDIFF_SYM826
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12,153,11,68,154,10
	.align 3
Lfde19_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_120:

	.byte 5
	.asciz "MapKit_MKShape"

	.byte 40,16
LDIFF_SYM827=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM827
	.byte 2,35,0,0,7
	.asciz "MapKit_MKShape"

LDIFF_SYM828=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM828
LTDIE_120_POINTER:

	.byte 13
LDIFF_SYM829=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM829
LTDIE_120_REFERENCE:

	.byte 14
LDIFF_SYM830=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM830
LTDIE_119:

	.byte 5
	.asciz "MapKit_MKPointAnnotation"

	.byte 40,16
LDIFF_SYM831=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM831
	.byte 2,35,0,0,7
	.asciz "MapKit_MKPointAnnotation"

LDIFF_SYM832=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM832
LTDIE_119_POINTER:

	.byte 13
LDIFF_SYM833=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM833
LTDIE_119_REFERENCE:

	.byte 14
LDIFF_SYM834=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM834
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:PinOnPropertyChanged"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
	.quad Lme_14

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM835=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM835
	.byte 0,3
	.asciz "sender"

LDIFF_SYM836=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM836
	.byte 1,105,3
	.asciz "e"

LDIFF_SYM837=LTDIE_109_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM837
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM838=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM838
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM839=LTDIE_119_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM839
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM840=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM840
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM841=Lfde20_end - Lfde20_start
	.long LDIFF_SYM841
Lfde20_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs

LDIFF_SYM842=Lme_14 - Xamarin_Forms_Maps_iOS_MapRenderer_PinOnPropertyChanged_object_System_ComponentModel_PropertyChangedEventArgs
	.long LDIFF_SYM842
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde20_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_121:

	.byte 5
	.asciz "MapKit_MKMapViewChangeEventArgs"

	.byte 17,16
LDIFF_SYM843=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM843
	.byte 2,35,0,6
	.asciz "<Animated>k__BackingField"

LDIFF_SYM844=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM844
	.byte 2,35,16,0,7
	.asciz "MapKit_MKMapViewChangeEventArgs"

LDIFF_SYM845=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM845
LTDIE_121_POINTER:

	.byte 13
LDIFF_SYM846=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM846
LTDIE_121_REFERENCE:

	.byte 14
LDIFF_SYM847=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM847
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:MkMapViewOnRegionChanged"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs
	.quad Lme_15

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM848=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM848
	.byte 1,106,3
	.asciz "sender"

LDIFF_SYM849=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM849
	.byte 0,3
	.asciz "e"

LDIFF_SYM850=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM850
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM851=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM851
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM852=Lfde21_end - Lfde21_start
	.long LDIFF_SYM852
Lfde21_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs

LDIFF_SYM853=Lme_15 - Xamarin_Forms_Maps_iOS_MapRenderer_MkMapViewOnRegionChanged_object_MapKit_MKMapViewChangeEventArgs
	.long LDIFF_SYM853
	.long 0
	.byte 12,31,0,68,14,192,2,157,40,158,39,68,13,29,68,152,38,153,37,68,154,36
	.align 3
Lfde21_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:MoveToRegion"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool
	.quad Lme_16

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM854=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM854
	.byte 2,141,24,3
	.asciz "mapSpan"

LDIFF_SYM855=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM855
	.byte 1,105,3
	.asciz "animated"

LDIFF_SYM856=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM856
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM857=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM857
	.byte 3,141,168,1,11
	.asciz "V_1"

LDIFF_SYM858=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM858
	.byte 3,141,136,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM859=Lfde22_end - Lfde22_start
	.long LDIFF_SYM859
Lfde22_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool

LDIFF_SYM860=Lme_16 - Xamarin_Forms_Maps_iOS_MapRenderer_MoveToRegion_Xamarin_Forms_Maps_MapSpan_bool
	.long LDIFF_SYM860
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,153,22
	.align 3
Lfde22_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_123:

	.byte 8
	.asciz "System_Collections_Specialized_NotifyCollectionChangedAction"

	.byte 4
LDIFF_SYM861=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM861
	.byte 9
	.asciz "Add"

	.byte 0,9
	.asciz "Remove"

	.byte 1,9
	.asciz "Replace"

	.byte 2,9
	.asciz "Move"

	.byte 3,9
	.asciz "Reset"

	.byte 4,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedAction"

LDIFF_SYM862=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM862
LTDIE_123_POINTER:

	.byte 13
LDIFF_SYM863=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM863
LTDIE_123_REFERENCE:

	.byte 14
LDIFF_SYM864=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM864
LTDIE_122:

	.byte 5
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 48,16
LDIFF_SYM865=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM865
	.byte 2,35,0,6
	.asciz "_action"

LDIFF_SYM866=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM866
	.byte 2,35,32,6
	.asciz "_newItems"

LDIFF_SYM867=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM867
	.byte 2,35,16,6
	.asciz "_oldItems"

LDIFF_SYM868=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM868
	.byte 2,35,24,6
	.asciz "_newStartingIndex"

LDIFF_SYM869=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM869
	.byte 2,35,36,6
	.asciz "_oldStartingIndex"

LDIFF_SYM870=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM870
	.byte 2,35,40,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventArgs"

LDIFF_SYM871=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM871
LTDIE_122_POINTER:

	.byte 13
LDIFF_SYM872=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM872
LTDIE_122_REFERENCE:

	.byte 14
LDIFF_SYM873=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM873
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:OnCollectionChanged"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_17

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM874=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM874
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM875=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM875
	.byte 0,3
	.asciz "notifyCollectionChangedEventArgs"

LDIFF_SYM876=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM876
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM877=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM877
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM878=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM878
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM879=Lfde23_end - Lfde23_start
	.long LDIFF_SYM879
Lfde23_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM880=Lme_17 - Xamarin_Forms_Maps_iOS_MapRenderer_OnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM880
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3,68,154,2
	.align 3
Lfde23_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:RemovePins"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList
	.quad Lme_18

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM881=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM881
	.byte 1,105,3
	.asciz "pins"

LDIFF_SYM882=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM882
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM883=LTDIE_117_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM883
	.byte 2,141,48,11
	.asciz "V_1"

LDIFF_SYM884=LTDIE_110_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM884
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM885=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM885
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM886=Lfde24_end - Lfde24_start
	.long LDIFF_SYM886
Lfde24_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList

LDIFF_SYM887=Lme_18 - Xamarin_Forms_Maps_iOS_MapRenderer_RemovePins_System_Collections_IList
	.long LDIFF_SYM887
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde24_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:UpdateHasScrollEnabled"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled
	.quad Lme_19

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM888=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM888
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM889=Lfde25_end - Lfde25_start
	.long LDIFF_SYM889
Lfde25_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled

LDIFF_SYM890=Lme_19 - Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasScrollEnabled
	.long LDIFF_SYM890
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3
	.align 3
Lfde25_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:UpdateHasZoomEnabled"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled
	.quad Lme_1a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM891=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM891
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM892=Lfde26_end - Lfde26_start
	.long LDIFF_SYM892
Lfde26_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled

LDIFF_SYM893=Lme_1a - Xamarin_Forms_Maps_iOS_MapRenderer_UpdateHasZoomEnabled
	.long LDIFF_SYM893
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3
	.align 3
Lfde26_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:UpdateIsShowingUser"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser
	.quad Lme_1b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM894=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM894
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM895=Lfde27_end - Lfde27_start
	.long LDIFF_SYM895
Lfde27_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser

LDIFF_SYM896=Lme_1b - Xamarin_Forms_Maps_iOS_MapRenderer_UpdateIsShowingUser
	.long LDIFF_SYM896
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,153,5,68,154,4
	.align 3
Lfde27_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_124:

	.byte 8
	.asciz "Xamarin_Forms_Maps_MapType"

	.byte 4
LDIFF_SYM897=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM897
	.byte 9
	.asciz "Street"

	.byte 0,9
	.asciz "Satellite"

	.byte 1,9
	.asciz "Hybrid"

	.byte 2,0,7
	.asciz "Xamarin_Forms_Maps_MapType"

LDIFF_SYM898=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM898
LTDIE_124_POINTER:

	.byte 13
LDIFF_SYM899=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM899
LTDIE_124_REFERENCE:

	.byte 14
LDIFF_SYM900=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM900
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:UpdateMapType"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType
	.quad Lme_1c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM901=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM901
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM902=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM902
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM903=Lfde28_end - Lfde28_start
	.long LDIFF_SYM903
Lfde28_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType

LDIFF_SYM904=Lme_1c - Xamarin_Forms_Maps_iOS_MapRenderer_UpdateMapType
	.long LDIFF_SYM904
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3,68,154,2
	.align 3
Lfde28_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__ctor
	.quad Lme_1d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM905=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM905
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM906=Lfde29_end - Lfde29_start
	.long LDIFF_SYM906
Lfde29_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__ctor

LDIFF_SYM907=Lme_1d - Xamarin_Forms_Maps_iOS_MapRenderer__ctor
	.long LDIFF_SYM907
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde29_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer:<OnElementChanged>b__9_0"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
	.quad Lme_1e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM908=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM908
	.byte 2,141,16,3
	.asciz "s"

LDIFF_SYM909=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM909
	.byte 0,3
	.asciz "a"

LDIFF_SYM910=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM910
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM911=Lfde30_end - Lfde30_start
	.long LDIFF_SYM911
Lfde30_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM912=Lme_1e - Xamarin_Forms_Maps_iOS_MapRenderer__OnElementChangedb__9_0_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM912
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde30_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend:Register"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend_Register"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_Register
	.quad Lme_1f

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM913=Lfde31_end - Lfde31_start
	.long LDIFF_SYM913
Lfde31_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_Register

LDIFF_SYM914=Lme_1f - Xamarin_Forms_Maps_iOS_GeocoderBackend_Register
	.long LDIFF_SYM914
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde31_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_129:

	.byte 5
	.asciz "System_Threading_Tasks_TaskScheduler"

	.byte 20,16
LDIFF_SYM915=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM915
	.byte 2,35,0,6
	.asciz "m_taskSchedulerId"

LDIFF_SYM916=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM916
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_TaskScheduler"

LDIFF_SYM917=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM917
LTDIE_129_POINTER:

	.byte 13
LDIFF_SYM918=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM918
LTDIE_129_REFERENCE:

	.byte 14
LDIFF_SYM919=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM919
LTDIE_133:

	.byte 8
	.asciz "System_Threading_SynchronizationContextProperties"

	.byte 4
LDIFF_SYM920=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM920
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "RequireWaitNotification"

	.byte 1,0,7
	.asciz "System_Threading_SynchronizationContextProperties"

LDIFF_SYM921=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM921
LTDIE_133_POINTER:

	.byte 13
LDIFF_SYM922=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM922
LTDIE_133_REFERENCE:

	.byte 14
LDIFF_SYM923=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM923
LTDIE_132:

	.byte 5
	.asciz "System_Threading_SynchronizationContext"

	.byte 20,16
LDIFF_SYM924=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM924
	.byte 2,35,0,6
	.asciz "_props"

LDIFF_SYM925=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM925
	.byte 2,35,16,0,7
	.asciz "System_Threading_SynchronizationContext"

LDIFF_SYM926=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM926
LTDIE_132_POINTER:

	.byte 13
LDIFF_SYM927=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM927
LTDIE_132_REFERENCE:

	.byte 14
LDIFF_SYM928=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM928
LTDIE_136:

	.byte 5
	.asciz "System_Single"

	.byte 20,16
LDIFF_SYM929=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM929
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM930=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM930
	.byte 2,35,16,0,7
	.asciz "System_Single"

LDIFF_SYM931=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM931
LTDIE_136_POINTER:

	.byte 13
LDIFF_SYM932=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM932
LTDIE_136_REFERENCE:

	.byte 14
LDIFF_SYM933=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM933
LTDIE_137:

	.byte 17
	.asciz "System_Collections_ICollection"

	.byte 16,7
	.asciz "System_Collections_ICollection"

LDIFF_SYM934=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM934
LTDIE_137_POINTER:

	.byte 13
LDIFF_SYM935=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM935
LTDIE_137_REFERENCE:

	.byte 14
LDIFF_SYM936=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM936
LTDIE_138:

	.byte 17
	.asciz "System_Collections_IEqualityComparer"

	.byte 16,7
	.asciz "System_Collections_IEqualityComparer"

LDIFF_SYM937=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM937
LTDIE_138_POINTER:

	.byte 13
LDIFF_SYM938=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM938
LTDIE_138_REFERENCE:

	.byte 14
LDIFF_SYM939=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM939
LTDIE_135:

	.byte 5
	.asciz "System_Collections_Hashtable"

	.byte 80,16
LDIFF_SYM940=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM940
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM941=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM941
	.byte 2,35,16,6
	.asciz "_count"

LDIFF_SYM942=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM942
	.byte 2,35,56,6
	.asciz "_occupancy"

LDIFF_SYM943=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM943
	.byte 2,35,60,6
	.asciz "_loadsize"

LDIFF_SYM944=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM944
	.byte 2,35,64,6
	.asciz "_loadFactor"

LDIFF_SYM945=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM945
	.byte 2,35,68,6
	.asciz "_version"

LDIFF_SYM946=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM946
	.byte 2,35,72,6
	.asciz "_isWriterInProgress"

LDIFF_SYM947=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM947
	.byte 2,35,76,6
	.asciz "_keys"

LDIFF_SYM948=LTDIE_137_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM948
	.byte 2,35,24,6
	.asciz "_values"

LDIFF_SYM949=LTDIE_137_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM949
	.byte 2,35,32,6
	.asciz "_keycomparer"

LDIFF_SYM950=LTDIE_138_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM950
	.byte 2,35,40,6
	.asciz "_syncRoot"

LDIFF_SYM951=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM951
	.byte 2,35,48,0,7
	.asciz "System_Collections_Hashtable"

LDIFF_SYM952=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM952
LTDIE_135_POINTER:

	.byte 13
LDIFF_SYM953=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM953
LTDIE_135_REFERENCE:

	.byte 14
LDIFF_SYM954=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM954
LTDIE_139:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

	.byte 16,16
LDIFF_SYM955=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM955
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

LDIFF_SYM956=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM956
LTDIE_139_POINTER:

	.byte 13
LDIFF_SYM957=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM957
LTDIE_139_REFERENCE:

	.byte 14
LDIFF_SYM958=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM958
LTDIE_140:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

	.byte 16,16
LDIFF_SYM959=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM959
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

LDIFF_SYM960=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM960
LTDIE_140_POINTER:

	.byte 13
LDIFF_SYM961=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM961
LTDIE_140_REFERENCE:

	.byte 14
LDIFF_SYM962=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM962
LTDIE_134:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

	.byte 56,16
LDIFF_SYM963=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM963
	.byte 2,35,0,6
	.asciz "m_Datastore"

LDIFF_SYM964=LTDIE_135_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM964
	.byte 2,35,16,6
	.asciz "m_RemotingData"

LDIFF_SYM965=LTDIE_139_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM965
	.byte 2,35,24,6
	.asciz "m_SecurityData"

LDIFF_SYM966=LTDIE_140_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM966
	.byte 2,35,32,6
	.asciz "m_HostContext"

LDIFF_SYM967=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM967
	.byte 2,35,40,6
	.asciz "m_IsCorrelationMgr"

LDIFF_SYM968=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM968
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

LDIFF_SYM969=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM969
LTDIE_134_POINTER:

	.byte 13
LDIFF_SYM970=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM970
LTDIE_134_REFERENCE:

	.byte 14
LDIFF_SYM971=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM971
LTDIE_141:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

	.byte 16,16
LDIFF_SYM972=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM972
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

LDIFF_SYM973=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM973
LTDIE_141_POINTER:

	.byte 13
LDIFF_SYM974=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM974
LTDIE_141_REFERENCE:

	.byte 14
LDIFF_SYM975=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM975
LTDIE_142:

	.byte 8
	.asciz "_Flags"

	.byte 4
LDIFF_SYM976=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM976
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

LDIFF_SYM977=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM977
LTDIE_142_POINTER:

	.byte 13
LDIFF_SYM978=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM978
LTDIE_142_REFERENCE:

	.byte 14
LDIFF_SYM979=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM979
LTDIE_144:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM980=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM980
LTDIE_144_POINTER:

	.byte 13
LDIFF_SYM981=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM981
LTDIE_144_REFERENCE:

	.byte 14
LDIFF_SYM982=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM982
LTDIE_145:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM983=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM983
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM984=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM984
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM985=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM985
LTDIE_145_POINTER:

	.byte 13
LDIFF_SYM986=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM986
LTDIE_145_REFERENCE:

	.byte 14
LDIFF_SYM987=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM987
LTDIE_146:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM988=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM988
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM989=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM989
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM990=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM990
LTDIE_146_POINTER:

	.byte 13
LDIFF_SYM991=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM991
LTDIE_146_REFERENCE:

	.byte 14
LDIFF_SYM992=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM992
LTDIE_143:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM993=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM993
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM994=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM994
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM995=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM995
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM996=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM996
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM997=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM997
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM998=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM998
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM999=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM999
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM1000=LTDIE_144_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1000
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM1001=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1001
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM1002=LTDIE_146_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1002
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM1003=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1003
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM1004=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1004
LTDIE_143_POINTER:

	.byte 13
LDIFF_SYM1005=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1005
LTDIE_143_REFERENCE:

	.byte 14
LDIFF_SYM1006=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1006
LTDIE_147:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM1007=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1007
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1008=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1008
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1009=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1009
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM1010=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1010
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM1011=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1011
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1012=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1012
LTDIE_147_POINTER:

	.byte 13
LDIFF_SYM1013=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1013
LTDIE_147_REFERENCE:

	.byte 14
LDIFF_SYM1014=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1014
LTDIE_131:

	.byte 5
	.asciz "System_Threading_ExecutionContext"

	.byte 72,16
LDIFF_SYM1015=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1015
	.byte 2,35,0,6
	.asciz "_syncContext"

LDIFF_SYM1016=LTDIE_132_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1016
	.byte 2,35,16,6
	.asciz "_syncContextNoFlow"

LDIFF_SYM1017=LTDIE_132_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1017
	.byte 2,35,24,6
	.asciz "_logicalCallContext"

LDIFF_SYM1018=LTDIE_134_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1018
	.byte 2,35,32,6
	.asciz "_illogicalCallContext"

LDIFF_SYM1019=LTDIE_141_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1019
	.byte 2,35,40,6
	.asciz "_flags"

LDIFF_SYM1020=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1020
	.byte 2,35,64,6
	.asciz "_localValues"

LDIFF_SYM1021=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1021
	.byte 2,35,48,6
	.asciz "_localChangeNotifications"

LDIFF_SYM1022=LTDIE_147_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1022
	.byte 2,35,56,0,7
	.asciz "System_Threading_ExecutionContext"

LDIFF_SYM1023=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1023
LTDIE_131_POINTER:

	.byte 13
LDIFF_SYM1024=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1024
LTDIE_131_REFERENCE:

	.byte 14
LDIFF_SYM1025=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1025
LTDIE_152:

	.byte 5
	.asciz "System_MarshalByRefObject"

	.byte 24,16
LDIFF_SYM1026=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1026
	.byte 2,35,0,6
	.asciz "_identity"

LDIFF_SYM1027=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1027
	.byte 2,35,16,0,7
	.asciz "System_MarshalByRefObject"

LDIFF_SYM1028=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1028
LTDIE_152_POINTER:

	.byte 13
LDIFF_SYM1029=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1029
LTDIE_152_REFERENCE:

	.byte 14
LDIFF_SYM1030=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1030
LTDIE_156:

	.byte 5
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

	.byte 16,16
LDIFF_SYM1031=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1031
	.byte 2,35,0,0,7
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

LDIFF_SYM1032=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1032
LTDIE_156_POINTER:

	.byte 13
LDIFF_SYM1033=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1033
LTDIE_156_REFERENCE:

	.byte 14
LDIFF_SYM1034=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1034
LTDIE_155:

	.byte 5
	.asciz "System_Runtime_InteropServices_SafeHandle"

	.byte 32,16
LDIFF_SYM1035=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1035
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM1036=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1036
	.byte 2,35,16,6
	.asciz "_state"

LDIFF_SYM1037=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1037
	.byte 2,35,24,6
	.asciz "_ownsHandle"

LDIFF_SYM1038=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1038
	.byte 2,35,28,6
	.asciz "_fullyInitialized"

LDIFF_SYM1039=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1039
	.byte 2,35,29,0,7
	.asciz "System_Runtime_InteropServices_SafeHandle"

LDIFF_SYM1040=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1040
LTDIE_155_POINTER:

	.byte 13
LDIFF_SYM1041=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1041
LTDIE_155_REFERENCE:

	.byte 14
LDIFF_SYM1042=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1042
LTDIE_154:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

	.byte 32,16
LDIFF_SYM1043=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1043
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

LDIFF_SYM1044=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1044
LTDIE_154_POINTER:

	.byte 13
LDIFF_SYM1045=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1045
LTDIE_154_REFERENCE:

	.byte 14
LDIFF_SYM1046=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1046
LTDIE_153:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

	.byte 32,16
LDIFF_SYM1047=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1047
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

LDIFF_SYM1048=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1048
LTDIE_153_POINTER:

	.byte 13
LDIFF_SYM1049=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1049
LTDIE_153_REFERENCE:

	.byte 14
LDIFF_SYM1050=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1050
LTDIE_151:

	.byte 5
	.asciz "System_Threading_WaitHandle"

	.byte 48,16
LDIFF_SYM1051=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1051
	.byte 2,35,0,6
	.asciz "waitHandle"

LDIFF_SYM1052=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1052
	.byte 2,35,24,6
	.asciz "safeWaitHandle"

LDIFF_SYM1053=LTDIE_153_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1053
	.byte 2,35,32,6
	.asciz "hasThreadAffinity"

LDIFF_SYM1054=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1054
	.byte 2,35,40,0,7
	.asciz "System_Threading_WaitHandle"

LDIFF_SYM1055=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1055
LTDIE_151_POINTER:

	.byte 13
LDIFF_SYM1056=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1056
LTDIE_151_REFERENCE:

	.byte 14
LDIFF_SYM1057=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1057
LTDIE_150:

	.byte 5
	.asciz "System_Threading_EventWaitHandle"

	.byte 48,16
LDIFF_SYM1058=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1058
	.byte 2,35,0,0,7
	.asciz "System_Threading_EventWaitHandle"

LDIFF_SYM1059=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1059
LTDIE_150_POINTER:

	.byte 13
LDIFF_SYM1060=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1060
LTDIE_150_REFERENCE:

	.byte 14
LDIFF_SYM1061=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1061
LTDIE_149:

	.byte 5
	.asciz "System_Threading_ManualResetEvent"

	.byte 48,16
LDIFF_SYM1062=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1062
	.byte 2,35,0,0,7
	.asciz "System_Threading_ManualResetEvent"

LDIFF_SYM1063=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1063
LTDIE_149_POINTER:

	.byte 13
LDIFF_SYM1064=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1064
LTDIE_149_REFERENCE:

	.byte 14
LDIFF_SYM1065=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1065
LTDIE_148:

	.byte 5
	.asciz "System_Threading_ManualResetEventSlim"

	.byte 40,16
LDIFF_SYM1066=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1066
	.byte 2,35,0,6
	.asciz "m_lock"

LDIFF_SYM1067=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1067
	.byte 2,35,16,6
	.asciz "m_eventObj"

LDIFF_SYM1068=LTDIE_149_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1068
	.byte 2,35,24,6
	.asciz "m_combinedState"

LDIFF_SYM1069=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1069
	.byte 2,35,32,0,7
	.asciz "System_Threading_ManualResetEventSlim"

LDIFF_SYM1070=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1070
LTDIE_148_POINTER:

	.byte 13
LDIFF_SYM1071=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1071
LTDIE_148_REFERENCE:

	.byte 14
LDIFF_SYM1072=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1072
LTDIE_158:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM1073=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1073
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1074=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1074
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1075=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1075
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM1076=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1076
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM1077=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1077
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1078=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1078
LTDIE_158_POINTER:

	.byte 13
LDIFF_SYM1079=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1079
LTDIE_158_REFERENCE:

	.byte 14
LDIFF_SYM1080=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1080
LTDIE_161:

	.byte 17
	.asciz "System_Collections_IDictionary"

	.byte 16,7
	.asciz "System_Collections_IDictionary"

LDIFF_SYM1081=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1081
LTDIE_161_POINTER:

	.byte 13
LDIFF_SYM1082=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1082
LTDIE_161_REFERENCE:

	.byte 14
LDIFF_SYM1083=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1083
LTDIE_163:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM1084=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1084
LTDIE_163_POINTER:

	.byte 13
LDIFF_SYM1085=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1085
LTDIE_163_REFERENCE:

	.byte 14
LDIFF_SYM1086=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1086
LTDIE_166:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM1087=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1087
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1088=LTDIE_165_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1088
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM1089=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1089
LTDIE_166_POINTER:

	.byte 13
LDIFF_SYM1090=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1090
LTDIE_166_REFERENCE:

	.byte 14
LDIFF_SYM1091=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1091
LTDIE_167:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM1092=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1092
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1093=LTDIE_165_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1093
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM1094=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1094
LTDIE_167_POINTER:

	.byte 13
LDIFF_SYM1095=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1095
LTDIE_167_REFERENCE:

	.byte 14
LDIFF_SYM1096=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1096
LTDIE_165:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM1097=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1097
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM1098=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1098
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM1099=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1099
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM1100=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1100
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM1101=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1101
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM1102=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1102
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM1103=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1103
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM1104=LTDIE_71_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1104
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM1105=LTDIE_166_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1105
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM1106=LTDIE_167_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1106
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM1107=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1107
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM1108=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1108
LTDIE_165_POINTER:

	.byte 13
LDIFF_SYM1109=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1109
LTDIE_165_REFERENCE:

	.byte 14
LDIFF_SYM1110=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1110
LTDIE_168:

	.byte 17
	.asciz "System_Runtime_Serialization_IFormatterConverter"

	.byte 16,7
	.asciz "System_Runtime_Serialization_IFormatterConverter"

LDIFF_SYM1111=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1111
LTDIE_168_POINTER:

	.byte 13
LDIFF_SYM1112=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1112
LTDIE_168_REFERENCE:

	.byte 14
LDIFF_SYM1113=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1113
LTDIE_164:

	.byte 5
	.asciz "System_Runtime_Serialization_SerializationInfo"

	.byte 88,16
LDIFF_SYM1114=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1114
	.byte 2,35,0,6
	.asciz "m_members"

LDIFF_SYM1115=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1115
	.byte 2,35,16,6
	.asciz "m_data"

LDIFF_SYM1116=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1116
	.byte 2,35,24,6
	.asciz "m_types"

LDIFF_SYM1117=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1117
	.byte 2,35,32,6
	.asciz "m_nameToIndex"

LDIFF_SYM1118=LTDIE_165_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1118
	.byte 2,35,40,6
	.asciz "m_currMember"

LDIFF_SYM1119=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1119
	.byte 2,35,80,6
	.asciz "m_converter"

LDIFF_SYM1120=LTDIE_168_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1120
	.byte 2,35,48,6
	.asciz "m_fullTypeName"

LDIFF_SYM1121=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1121
	.byte 2,35,56,6
	.asciz "m_assemName"

LDIFF_SYM1122=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1122
	.byte 2,35,64,6
	.asciz "objectType"

LDIFF_SYM1123=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1123
	.byte 2,35,72,6
	.asciz "isFullTypeNameSetExplicit"

LDIFF_SYM1124=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1124
	.byte 2,35,84,6
	.asciz "isAssemblyNameSetExplicit"

LDIFF_SYM1125=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1125
	.byte 2,35,85,6
	.asciz "requireSameTokenInPartialTrust"

LDIFF_SYM1126=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1126
	.byte 2,35,86,0,7
	.asciz "System_Runtime_Serialization_SerializationInfo"

LDIFF_SYM1127=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1127
LTDIE_164_POINTER:

	.byte 13
LDIFF_SYM1128=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1128
LTDIE_164_REFERENCE:

	.byte 14
LDIFF_SYM1129=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1129
LTDIE_170:

	.byte 5
	.asciz "System_Reflection_TypeInfo"

	.byte 24,16
LDIFF_SYM1130=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM1130
	.byte 2,35,0,0,7
	.asciz "System_Reflection_TypeInfo"

LDIFF_SYM1131=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1131
LTDIE_170_POINTER:

	.byte 13
LDIFF_SYM1132=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1132
LTDIE_170_REFERENCE:

	.byte 14
LDIFF_SYM1133=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1133
LTDIE_174:

	.byte 5
	.asciz "System_Reflection_ConstructorInfo"

	.byte 16,16
LDIFF_SYM1134=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM1134
	.byte 2,35,0,0,7
	.asciz "System_Reflection_ConstructorInfo"

LDIFF_SYM1135=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1135
LTDIE_174_POINTER:

	.byte 13
LDIFF_SYM1136=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1136
LTDIE_174_REFERENCE:

	.byte 14
LDIFF_SYM1137=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1137
LTDIE_173:

	.byte 5
	.asciz "System_Reflection_RuntimeConstructorInfo"

	.byte 16,16
LDIFF_SYM1138=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1138
	.byte 2,35,0,0,7
	.asciz "System_Reflection_RuntimeConstructorInfo"

LDIFF_SYM1139=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1139
LTDIE_173_POINTER:

	.byte 13
LDIFF_SYM1140=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1140
LTDIE_173_REFERENCE:

	.byte 14
LDIFF_SYM1141=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1141
LTDIE_172:

	.byte 5
	.asciz "System_Reflection_MonoCMethod"

	.byte 40,16
LDIFF_SYM1142=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1142
	.byte 2,35,0,6
	.asciz "mhandle"

LDIFF_SYM1143=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1143
	.byte 2,35,16,6
	.asciz "name"

LDIFF_SYM1144=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1144
	.byte 2,35,24,6
	.asciz "reftype"

LDIFF_SYM1145=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1145
	.byte 2,35,32,0,7
	.asciz "System_Reflection_MonoCMethod"

LDIFF_SYM1146=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1146
LTDIE_172_POINTER:

	.byte 13
LDIFF_SYM1147=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1147
LTDIE_172_REFERENCE:

	.byte 14
LDIFF_SYM1148=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1148
LTDIE_171:

	.byte 5
	.asciz "System_MonoTypeInfo"

	.byte 32,16
LDIFF_SYM1149=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1149
	.byte 2,35,0,6
	.asciz "full_name"

LDIFF_SYM1150=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1150
	.byte 2,35,16,6
	.asciz "default_ctor"

LDIFF_SYM1151=LTDIE_172_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1151
	.byte 2,35,24,0,7
	.asciz "System_MonoTypeInfo"

LDIFF_SYM1152=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1152
LTDIE_171_POINTER:

	.byte 13
LDIFF_SYM1153=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1153
LTDIE_171_REFERENCE:

	.byte 14
LDIFF_SYM1154=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1154
LTDIE_169:

	.byte 5
	.asciz "System_RuntimeType"

	.byte 48,16
LDIFF_SYM1155=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1155
	.byte 2,35,0,6
	.asciz "type_info"

LDIFF_SYM1156=LTDIE_171_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1156
	.byte 2,35,24,6
	.asciz "GenericCache"

LDIFF_SYM1157=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1157
	.byte 2,35,32,6
	.asciz "m_serializationCtor"

LDIFF_SYM1158=LTDIE_173_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1158
	.byte 2,35,40,0,7
	.asciz "System_RuntimeType"

LDIFF_SYM1159=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1159
LTDIE_169_POINTER:

	.byte 13
LDIFF_SYM1160=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1160
LTDIE_169_REFERENCE:

	.byte 14
LDIFF_SYM1161=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1161
LTDIE_175:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM1162=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1162
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM1163=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1163
LTDIE_175_POINTER:

	.byte 13
LDIFF_SYM1164=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1164
LTDIE_175_REFERENCE:

	.byte 14
LDIFF_SYM1165=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1165
LTDIE_162:

	.byte 5
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

	.byte 56,16
LDIFF_SYM1166=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1166
	.byte 2,35,0,6
	.asciz "m_serializedStates"

LDIFF_SYM1167=LTDIE_163_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1167
	.byte 2,35,16,6
	.asciz "m_savedSerializationInfo"

LDIFF_SYM1168=LTDIE_164_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1168
	.byte 2,35,24,6
	.asciz "m_realObject"

LDIFF_SYM1169=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1169
	.byte 2,35,32,6
	.asciz "m_realType"

LDIFF_SYM1170=LTDIE_169_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1170
	.byte 2,35,40,6
	.asciz "SerializeObjectState"

LDIFF_SYM1171=LTDIE_175_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1171
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

LDIFF_SYM1172=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1172
LTDIE_162_POINTER:

	.byte 13
LDIFF_SYM1173=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1173
LTDIE_162_REFERENCE:

	.byte 14
LDIFF_SYM1174=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1174
LTDIE_160:

	.byte 5
	.asciz "System_Exception"

	.byte 136,1,16
LDIFF_SYM1175=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1175
	.byte 2,35,0,6
	.asciz "_className"

LDIFF_SYM1176=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1176
	.byte 2,35,16,6
	.asciz "_message"

LDIFF_SYM1177=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1177
	.byte 2,35,24,6
	.asciz "_data"

LDIFF_SYM1178=LTDIE_161_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1178
	.byte 2,35,32,6
	.asciz "_innerException"

LDIFF_SYM1179=LTDIE_160_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1179
	.byte 2,35,40,6
	.asciz "_helpURL"

LDIFF_SYM1180=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1180
	.byte 2,35,48,6
	.asciz "_stackTrace"

LDIFF_SYM1181=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1181
	.byte 2,35,56,6
	.asciz "_stackTraceString"

LDIFF_SYM1182=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1182
	.byte 2,35,64,6
	.asciz "_remoteStackTraceString"

LDIFF_SYM1183=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1183
	.byte 2,35,72,6
	.asciz "_remoteStackIndex"

LDIFF_SYM1184=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1184
	.byte 2,35,80,6
	.asciz "_dynamicMethods"

LDIFF_SYM1185=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1185
	.byte 2,35,88,6
	.asciz "_HResult"

LDIFF_SYM1186=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1186
	.byte 2,35,96,6
	.asciz "_source"

LDIFF_SYM1187=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1187
	.byte 2,35,104,6
	.asciz "_safeSerializationManager"

LDIFF_SYM1188=LTDIE_162_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1188
	.byte 2,35,112,6
	.asciz "captured_traces"

LDIFF_SYM1189=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1189
	.byte 2,35,120,6
	.asciz "native_trace_ips"

LDIFF_SYM1190=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1190
	.byte 3,35,128,1,0,7
	.asciz "System_Exception"

LDIFF_SYM1191=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1191
LTDIE_160_POINTER:

	.byte 13
LDIFF_SYM1192=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1192
LTDIE_160_REFERENCE:

	.byte 14
LDIFF_SYM1193=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1193
LTDIE_159:

	.byte 5
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

	.byte 32,16
LDIFF_SYM1194=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1194
	.byte 2,35,0,6
	.asciz "m_Exception"

LDIFF_SYM1195=LTDIE_160_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1195
	.byte 2,35,16,6
	.asciz "m_stackTrace"

LDIFF_SYM1196=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1196
	.byte 2,35,24,0,7
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

LDIFF_SYM1197=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1197
LTDIE_159_POINTER:

	.byte 13
LDIFF_SYM1198=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1198
LTDIE_159_REFERENCE:

	.byte 14
LDIFF_SYM1199=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1199
LTDIE_157:

	.byte 5
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

	.byte 48,16
LDIFF_SYM1200=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1200
	.byte 2,35,0,6
	.asciz "m_task"

LDIFF_SYM1201=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1201
	.byte 2,35,16,6
	.asciz "m_faultExceptions"

LDIFF_SYM1202=LTDIE_158_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1202
	.byte 2,35,24,6
	.asciz "m_cancellationException"

LDIFF_SYM1203=LTDIE_159_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1203
	.byte 2,35,32,6
	.asciz "m_isHandled"

LDIFF_SYM1204=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1204
	.byte 2,35,40,0,7
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

LDIFF_SYM1205=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1205
LTDIE_157_POINTER:

	.byte 13
LDIFF_SYM1206=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1206
LTDIE_157_REFERENCE:

	.byte 14
LDIFF_SYM1207=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1207
LTDIE_177:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelList`1"

	.byte 32,16
LDIFF_SYM1208=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1208
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1209=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1209
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1210=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1210
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1211=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1211
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_LowLevelList`1"

LDIFF_SYM1212=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1212
LTDIE_177_POINTER:

	.byte 13
LDIFF_SYM1213=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1213
LTDIE_177_REFERENCE:

	.byte 14
LDIFF_SYM1214=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1214
LTDIE_176:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

	.byte 32,16
LDIFF_SYM1215=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1215
	.byte 2,35,0,0,7
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

LDIFF_SYM1216=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1216
LTDIE_176_POINTER:

	.byte 13
LDIFF_SYM1217=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1217
LTDIE_176_REFERENCE:

	.byte 14
LDIFF_SYM1218=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1218
LTDIE_130:

	.byte 5
	.asciz "_ContingentProperties"

	.byte 72,16
LDIFF_SYM1219=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1219
	.byte 2,35,0,6
	.asciz "m_capturedContext"

LDIFF_SYM1220=LTDIE_131_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1220
	.byte 2,35,16,6
	.asciz "m_completionEvent"

LDIFF_SYM1221=LTDIE_148_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1221
	.byte 2,35,24,6
	.asciz "m_exceptionsHolder"

LDIFF_SYM1222=LTDIE_157_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1222
	.byte 2,35,32,6
	.asciz "m_cancellationToken"

LDIFF_SYM1223=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1223
	.byte 2,35,40,6
	.asciz "m_cancellationRegistration"

LDIFF_SYM1224=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1224
	.byte 2,35,48,6
	.asciz "m_internalCancellationRequested"

LDIFF_SYM1225=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1225
	.byte 2,35,64,6
	.asciz "m_completionCountdown"

LDIFF_SYM1226=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1226
	.byte 2,35,68,6
	.asciz "m_exceptionalChildren"

LDIFF_SYM1227=LTDIE_176_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1227
	.byte 2,35,56,0,7
	.asciz "_ContingentProperties"

LDIFF_SYM1228=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1228
LTDIE_130_POINTER:

	.byte 13
LDIFF_SYM1229=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1229
LTDIE_130_REFERENCE:

	.byte 14
LDIFF_SYM1230=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1230
LTDIE_128:

	.byte 5
	.asciz "System_Threading_Tasks_Task"

	.byte 72,16
LDIFF_SYM1231=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1231
	.byte 2,35,0,6
	.asciz "m_taskId"

LDIFF_SYM1232=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1232
	.byte 2,35,64,6
	.asciz "m_action"

LDIFF_SYM1233=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1233
	.byte 2,35,16,6
	.asciz "m_stateObject"

LDIFF_SYM1234=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1234
	.byte 2,35,24,6
	.asciz "m_taskScheduler"

LDIFF_SYM1235=LTDIE_129_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1235
	.byte 2,35,32,6
	.asciz "m_parent"

LDIFF_SYM1236=LTDIE_128_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1236
	.byte 2,35,40,6
	.asciz "m_stateFlags"

LDIFF_SYM1237=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1237
	.byte 2,35,68,6
	.asciz "m_continuationObject"

LDIFF_SYM1238=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1238
	.byte 2,35,48,6
	.asciz "m_contingentProperties"

LDIFF_SYM1239=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1239
	.byte 2,35,56,0,7
	.asciz "System_Threading_Tasks_Task"

LDIFF_SYM1240=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1240
LTDIE_128_POINTER:

	.byte 13
LDIFF_SYM1241=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1241
LTDIE_128_REFERENCE:

	.byte 14
LDIFF_SYM1242=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1242
LTDIE_178:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerable`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerable`1"

LDIFF_SYM1243=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1243
LTDIE_178_POINTER:

	.byte 13
LDIFF_SYM1244=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1244
LTDIE_178_REFERENCE:

	.byte 14
LDIFF_SYM1245=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1245
LTDIE_127:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1246=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1246
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1247=LTDIE_178_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1247
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1248=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1248
LTDIE_127_POINTER:

	.byte 13
LDIFF_SYM1249=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1249
LTDIE_127_REFERENCE:

	.byte 14
LDIFF_SYM1250=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1250
LTDIE_126:

	.byte 5
	.asciz "System_Threading_Tasks_TaskCompletionSource`1"

	.byte 24,16
LDIFF_SYM1251=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1251
	.byte 2,35,0,6
	.asciz "_task"

LDIFF_SYM1252=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1252
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_TaskCompletionSource`1"

LDIFF_SYM1253=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1253
LTDIE_126_POINTER:

	.byte 13
LDIFF_SYM1254=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1254
LTDIE_126_REFERENCE:

	.byte 14
LDIFF_SYM1255=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1255
LTDIE_125:

	.byte 5
	.asciz "_<>c__DisplayClass1_0"

	.byte 24,16
LDIFF_SYM1256=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1256
	.byte 2,35,0,6
	.asciz "source"

LDIFF_SYM1257=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1257
	.byte 2,35,16,0,7
	.asciz "_<>c__DisplayClass1_0"

LDIFF_SYM1258=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1258
LTDIE_125_POINTER:

	.byte 13
LDIFF_SYM1259=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1259
LTDIE_125_REFERENCE:

	.byte 14
LDIFF_SYM1260=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1260
LTDIE_179:

	.byte 5
	.asciz "CoreLocation_CLLocation"

	.byte 40,16
LDIFF_SYM1261=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM1261
	.byte 2,35,0,0,7
	.asciz "CoreLocation_CLLocation"

LDIFF_SYM1262=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1262
LTDIE_179_POINTER:

	.byte 13
LDIFF_SYM1263=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1263
LTDIE_179_REFERENCE:

	.byte 14
LDIFF_SYM1264=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1264
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend:GetAddressesForPositionAsync"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
	.quad Lme_20

	.byte 2,118,16,3
	.asciz "position"

LDIFF_SYM1265=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1265
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM1266=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1266
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM1267=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1267
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1268=Lfde32_end - Lfde32_start
	.long LDIFF_SYM1268
Lfde32_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position

LDIFF_SYM1269=Lme_20 - Xamarin_Forms_Maps_iOS_GeocoderBackend_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1269
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde32_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_183:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerable`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerable`1"

LDIFF_SYM1270=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1270
LTDIE_183_POINTER:

	.byte 13
LDIFF_SYM1271=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1271
LTDIE_183_REFERENCE:

	.byte 14
LDIFF_SYM1272=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1272
LTDIE_182:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1273=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1273
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1274=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1274
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1275=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1275
LTDIE_182_POINTER:

	.byte 13
LDIFF_SYM1276=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1276
LTDIE_182_REFERENCE:

	.byte 14
LDIFF_SYM1277=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1277
LTDIE_181:

	.byte 5
	.asciz "System_Threading_Tasks_TaskCompletionSource`1"

	.byte 24,16
LDIFF_SYM1278=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1278
	.byte 2,35,0,6
	.asciz "_task"

LDIFF_SYM1279=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1279
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_TaskCompletionSource`1"

LDIFF_SYM1280=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1280
LTDIE_181_POINTER:

	.byte 13
LDIFF_SYM1281=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1281
LTDIE_181_REFERENCE:

	.byte 14
LDIFF_SYM1282=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1282
LTDIE_180:

	.byte 5
	.asciz "_<>c__DisplayClass2_0"

	.byte 24,16
LDIFF_SYM1283=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1283
	.byte 2,35,0,6
	.asciz "source"

LDIFF_SYM1284=LTDIE_181_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1284
	.byte 2,35,16,0,7
	.asciz "_<>c__DisplayClass2_0"

LDIFF_SYM1285=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1285
LTDIE_180_POINTER:

	.byte 13
LDIFF_SYM1286=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1286
LTDIE_180_REFERENCE:

	.byte 14
LDIFF_SYM1287=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1287
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend:GetPositionsForAddressAsync"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string
	.quad Lme_21

	.byte 2,118,16,3
	.asciz "address"

LDIFF_SYM1288=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1288
	.byte 2,141,16,11
	.asciz "V_0"

LDIFF_SYM1289=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1289
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1290=Lfde33_end - Lfde33_start
	.long LDIFF_SYM1290
Lfde33_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string

LDIFF_SYM1291=Lme_21 - Xamarin_Forms_Maps_iOS_GeocoderBackend_GetPositionsForAddressAsync_string
	.long LDIFF_SYM1291
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde33_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_184:

	.byte 5
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend"

	.byte 16,16
LDIFF_SYM1292=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1292
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend"

LDIFF_SYM1293=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1293
LTDIE_184_POINTER:

	.byte 13
LDIFF_SYM1294=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1294
LTDIE_184_REFERENCE:

	.byte 14
LDIFF_SYM1295=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1295
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor
	.quad Lme_22

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1296=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1296
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1297=Lfde34_end - Lfde34_start
	.long LDIFF_SYM1297
Lfde34_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor

LDIFF_SYM1298=Lme_22 - Xamarin_Forms_Maps_iOS_GeocoderBackend__ctor
	.long LDIFF_SYM1298
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde34_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer/<>c__DisplayClass14_0:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor
	.quad Lme_23

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1299=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1299
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1300=Lfde35_end - Lfde35_start
	.long LDIFF_SYM1300
Lfde35_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor

LDIFF_SYM1301=Lme_23 - Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__ctor
	.long LDIFF_SYM1301
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde35_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer/<>c__DisplayClass14_0:<AttachGestureToPin>b__0"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer
	.quad Lme_24

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1302=LTDIE_113_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1302
	.byte 2,141,16,3
	.asciz "g"

LDIFF_SYM1303=LTDIE_114_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1303
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1304=Lfde36_end - Lfde36_start
	.long LDIFF_SYM1304
Lfde36_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer

LDIFF_SYM1305=Lme_24 - Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__0_UIKit_UITapGestureRecognizer
	.long LDIFF_SYM1305
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde36_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_185:

	.byte 5
	.asciz "UIKit_UITouch"

	.byte 40,16
LDIFF_SYM1306=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM1306
	.byte 2,35,0,0,7
	.asciz "UIKit_UITouch"

LDIFF_SYM1307=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1307
LTDIE_185_POINTER:

	.byte 13
LDIFF_SYM1308=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1308
LTDIE_185_REFERENCE:

	.byte 14
LDIFF_SYM1309=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1309
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.MapRenderer/<>c__DisplayClass14_0:<AttachGestureToPin>b__1"
	.asciz "Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch
	.quad Lme_25

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1310=LTDIE_113_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1310
	.byte 2,141,16,3
	.asciz "gestureRecognizer"

LDIFF_SYM1311=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1311
	.byte 0,3
	.asciz "touch"

LDIFF_SYM1312=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1312
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1313=Lfde37_end - Lfde37_start
	.long LDIFF_SYM1313
Lfde37_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch

LDIFF_SYM1314=Lme_25 - Xamarin_Forms_Maps_iOS_MapRenderer__c__DisplayClass14_0__AttachGestureToPinb__1_UIKit_UIGestureRecognizer_UIKit_UITouch
	.long LDIFF_SYM1314
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde37_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c__DisplayClass1_0:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor
	.quad Lme_26

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1315=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1315
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1316=Lfde38_end - Lfde38_start
	.long LDIFF_SYM1316
Lfde38_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor

LDIFF_SYM1317=Lme_26 - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__ctor
	.long LDIFF_SYM1317
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde38_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_186:

	.byte 5
	.asciz "Foundation_NSError"

	.byte 40,16
LDIFF_SYM1318=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM1318
	.byte 2,35,0,0,7
	.asciz "Foundation_NSError"

LDIFF_SYM1319=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1319
LTDIE_186_POINTER:

	.byte 13
LDIFF_SYM1320=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1320
LTDIE_186_REFERENCE:

	.byte 14
LDIFF_SYM1321=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1321
LTDIE_187:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM1322=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1322
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1323=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1323
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1324=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1324
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM1325=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1325
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM1326=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1326
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1327=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1327
LTDIE_187_POINTER:

	.byte 13
LDIFF_SYM1328=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1328
LTDIE_187_REFERENCE:

	.byte 14
LDIFF_SYM1329=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1329
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c__DisplayClass1_0:<GetAddressesForPositionAsync>b__0"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
	.quad Lme_27

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1330=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1330
	.byte 2,141,32,3
	.asciz "placemarks"

LDIFF_SYM1331=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1331
	.byte 1,106,3
	.asciz "error"

LDIFF_SYM1332=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1332
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM1333=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1333
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1334=Lfde39_end - Lfde39_start
	.long LDIFF_SYM1334
Lfde39_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError

LDIFF_SYM1335=Lme_27 - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass1_0__GetAddressesForPositionAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
	.long LDIFF_SYM1335
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,68,154,5
	.align 3
Lfde39_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c:.cctor"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor
	.quad Lme_28

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1336=Lfde40_end - Lfde40_start
	.long LDIFF_SYM1336
Lfde40_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor

LDIFF_SYM1337=Lme_28 - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__cctor
	.long LDIFF_SYM1337
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde40_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_188:

	.byte 5
	.asciz "_<>c"

	.byte 16,16
LDIFF_SYM1338=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1338
	.byte 2,35,0,0,7
	.asciz "_<>c"

LDIFF_SYM1339=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1339
LTDIE_188_POINTER:

	.byte 13
LDIFF_SYM1340=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1340
LTDIE_188_REFERENCE:

	.byte 14
LDIFF_SYM1341=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1341
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor
	.quad Lme_29

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1342=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1342
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1343=Lfde41_end - Lfde41_start
	.long LDIFF_SYM1343
Lfde41_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor

LDIFF_SYM1344=Lme_29 - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__ctor
	.long LDIFF_SYM1344
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde41_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_189:

	.byte 5
	.asciz "CoreLocation_CLPlacemark"

	.byte 40,16
LDIFF_SYM1345=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM1345
	.byte 2,35,0,0,7
	.asciz "CoreLocation_CLPlacemark"

LDIFF_SYM1346=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1346
LTDIE_189_POINTER:

	.byte 13
LDIFF_SYM1347=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1347
LTDIE_189_REFERENCE:

	.byte 14
LDIFF_SYM1348=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1348
	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c:<GetAddressesForPositionAsync>b__1_1"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark
	.quad Lme_2a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1349=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1349
	.byte 0,3
	.asciz "p"

LDIFF_SYM1350=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1350
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1351=Lfde42_end - Lfde42_start
	.long LDIFF_SYM1351
Lfde42_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark

LDIFF_SYM1352=Lme_2a - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetAddressesForPositionAsyncb__1_1_CoreLocation_CLPlacemark
	.long LDIFF_SYM1352
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde42_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c:<GetPositionsForAddressAsync>b__2_1"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark
	.quad Lme_2b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1353=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1353
	.byte 0,3
	.asciz "p"

LDIFF_SYM1354=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1354
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1355=Lfde43_end - Lfde43_start
	.long LDIFF_SYM1355
Lfde43_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark

LDIFF_SYM1356=Lme_2b - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__GetPositionsForAddressAsyncb__2_1_CoreLocation_CLPlacemark
	.long LDIFF_SYM1356
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,154,20
	.align 3
Lfde43_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c__DisplayClass2_0:.ctor"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor
	.quad Lme_2c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1357=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1357
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1358=Lfde44_end - Lfde44_start
	.long LDIFF_SYM1358
Lfde44_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor

LDIFF_SYM1359=Lme_2c - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__ctor
	.long LDIFF_SYM1359
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde44_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.iOS.GeocoderBackend/<>c__DisplayClass2_0:<GetPositionsForAddressAsync>b__0"
	.asciz "Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError"

	.byte 0,0
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
	.quad Lme_2d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1360=LTDIE_180_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1360
	.byte 2,141,24,3
	.asciz "placemarks"

LDIFF_SYM1361=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1361
	.byte 1,106,3
	.asciz "error"

LDIFF_SYM1362=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1362
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM1363=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1363
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1364=Lfde45_end - Lfde45_start
	.long LDIFF_SYM1364
Lfde45_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError

LDIFF_SYM1365=Lme_2d - Xamarin_Forms_Maps_iOS_GeocoderBackend__c__DisplayClass2_0__GetPositionsForAddressAsyncb__0_CoreLocation_CLPlacemark___Foundation_NSError
	.long LDIFF_SYM1365
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6
	.align 3
Lfde45_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_190:

	.byte 5
	.asciz "System_Nullable`1"

	.byte 18,16
LDIFF_SYM1366=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM1366
	.byte 2,35,0,6
	.asciz "value"

LDIFF_SYM1367=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1367
	.byte 2,35,16,6
	.asciz "has_value"

LDIFF_SYM1368=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1368
	.byte 2,35,17,0,7
	.asciz "System_Nullable`1"

LDIFF_SYM1369=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1369
LTDIE_190_POINTER:

	.byte 13
LDIFF_SYM1370=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1370
LTDIE_190_REFERENCE:

	.byte 14
LDIFF_SYM1371=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1371
	.byte 2
	.asciz "System.Nullable`1<bool>:.ctor"
	.asciz "System_Nullable_1_bool__ctor_bool"

	.byte 1,94
	.quad System_Nullable_1_bool__ctor_bool
	.quad Lme_2f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1372=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1372
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1373=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1373
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1374=Lfde46_end - Lfde46_start
	.long LDIFF_SYM1374
Lfde46_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool__ctor_bool

LDIFF_SYM1375=Lme_2f - System_Nullable_1_bool__ctor_bool
	.long LDIFF_SYM1375
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde46_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:get_HasValue"
	.asciz "System_Nullable_1_bool_get_HasValue"

	.byte 1,99
	.quad System_Nullable_1_bool_get_HasValue
	.quad Lme_30

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1376=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1376
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1377=Lfde47_end - Lfde47_start
	.long LDIFF_SYM1377
Lfde47_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_get_HasValue

LDIFF_SYM1378=Lme_30 - System_Nullable_1_bool_get_HasValue
	.long LDIFF_SYM1378
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde47_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:get_Value"
	.asciz "System_Nullable_1_bool_get_Value"

	.byte 1,104
	.quad System_Nullable_1_bool_get_Value
	.quad Lme_31

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1379=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1379
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1380=Lfde48_end - Lfde48_start
	.long LDIFF_SYM1380
Lfde48_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_get_Value

LDIFF_SYM1381=Lme_31 - System_Nullable_1_bool_get_Value
	.long LDIFF_SYM1381
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde48_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:Equals"
	.asciz "System_Nullable_1_bool_Equals_object"

	.byte 1,113
	.quad System_Nullable_1_bool_Equals_object
	.quad Lme_32

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1382=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1382
	.byte 2,141,32,3
	.asciz "param0"

LDIFF_SYM1383=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1383
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1384=Lfde49_end - Lfde49_start
	.long LDIFF_SYM1384
Lfde49_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_Equals_object

LDIFF_SYM1385=Lme_32 - System_Nullable_1_bool_Equals_object
	.long LDIFF_SYM1385
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,68,154,5
	.align 3
Lfde49_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:Equals"
	.asciz "System_Nullable_1_bool_Equals_System_Nullable_1_bool"

	.byte 1,123
	.quad System_Nullable_1_bool_Equals_System_Nullable_1_bool
	.quad Lme_33

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1386=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1386
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1387=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1387
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1388=Lfde50_end - Lfde50_start
	.long LDIFF_SYM1388
Lfde50_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_Equals_System_Nullable_1_bool

LDIFF_SYM1389=Lme_33 - System_Nullable_1_bool_Equals_System_Nullable_1_bool
	.long LDIFF_SYM1389
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde50_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:GetHashCode"
	.asciz "System_Nullable_1_bool_GetHashCode"

	.byte 1,134,1
	.quad System_Nullable_1_bool_GetHashCode
	.quad Lme_34

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1390=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1390
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1391=Lfde51_end - Lfde51_start
	.long LDIFF_SYM1391
Lfde51_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_GetHashCode

LDIFF_SYM1392=Lme_34 - System_Nullable_1_bool_GetHashCode
	.long LDIFF_SYM1392
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde51_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:GetValueOrDefault"
	.asciz "System_Nullable_1_bool_GetValueOrDefault"

	.byte 1,142,1
	.quad System_Nullable_1_bool_GetValueOrDefault
	.quad Lme_35

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1393=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1393
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1394=Lfde52_end - Lfde52_start
	.long LDIFF_SYM1394
Lfde52_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_GetValueOrDefault

LDIFF_SYM1395=Lme_35 - System_Nullable_1_bool_GetValueOrDefault
	.long LDIFF_SYM1395
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde52_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:ToString"
	.asciz "System_Nullable_1_bool_ToString"

	.byte 1,152,1
	.quad System_Nullable_1_bool_ToString
	.quad Lme_36

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1396=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1396
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1397=Lfde53_end - Lfde53_start
	.long LDIFF_SYM1397
Lfde53_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_ToString

LDIFF_SYM1398=Lme_36 - System_Nullable_1_bool_ToString
	.long LDIFF_SYM1398
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde53_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:Box"
	.asciz "System_Nullable_1_bool_Box_System_Nullable_1_bool"

	.byte 1,177,1
	.quad System_Nullable_1_bool_Box_System_Nullable_1_bool
	.quad Lme_37

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM1399=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1399
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1400=Lfde54_end - Lfde54_start
	.long LDIFF_SYM1400
Lfde54_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_Box_System_Nullable_1_bool

LDIFF_SYM1401=Lme_37 - System_Nullable_1_bool_Box_System_Nullable_1_bool
	.long LDIFF_SYM1401
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde54_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:Unbox"
	.asciz "System_Nullable_1_bool_Unbox_object"

	.byte 1,185,1
	.quad System_Nullable_1_bool_Unbox_object
	.quad Lme_38

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM1402=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1402
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM1403=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1403
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1404=Lfde55_end - Lfde55_start
	.long LDIFF_SYM1404
Lfde55_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_Unbox_object

LDIFF_SYM1405=Lme_38 - System_Nullable_1_bool_Unbox_object
	.long LDIFF_SYM1405
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde55_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Nullable`1<bool>:UnboxExact"
	.asciz "System_Nullable_1_bool_UnboxExact_object"

	.byte 1,192,1
	.quad System_Nullable_1_bool_UnboxExact_object
	.quad Lme_39

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM1406=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1406
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1407=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1407
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1408=Lfde56_end - Lfde56_start
	.long LDIFF_SYM1408
Lfde56_start:

	.long 0
	.align 3
	.quad System_Nullable_1_bool_UnboxExact_object

LDIFF_SYM1409=Lme_39 - System_Nullable_1_bool_UnboxExact_object
	.long LDIFF_SYM1409
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6
	.align 3
Lfde56_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_191:

	.byte 5
	.asciz "System_Array"

	.byte 16,16
LDIFF_SYM1410=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1410
	.byte 2,35,0,0,7
	.asciz "System_Array"

LDIFF_SYM1411=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1411
LTDIE_191_POINTER:

	.byte 13
LDIFF_SYM1412=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1412
LTDIE_191_REFERENCE:

	.byte 14
LDIFF_SYM1413=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1413
	.byte 2
	.asciz "System.Array:InternalArray__IEnumerable_GetEnumerator<T_REF>"
	.asciz "System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF"

	.byte 2,70
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
	.quad Lme_3a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1414=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1414
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1415=Lfde57_end - Lfde57_start
	.long LDIFF_SYM1415
Lfde57_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF

LDIFF_SYM1416=Lme_3a - System_Array_InternalArray__IEnumerable_GetEnumerator_T_REF
	.long LDIFF_SYM1416
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde57_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<System.ComponentModel.PropertyChangedEventArgs>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs
	.quad Lme_3b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1417=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1417
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1418=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1418
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1419=LTDIE_109_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1419
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1420=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1420
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1421=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1421
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1422=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1422
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1423=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1423
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1424=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1424
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1425=Lfde58_end - Lfde58_start
	.long LDIFF_SYM1425
Lfde58_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs

LDIFF_SYM1426=Lme_3b - wrapper_delegate_invoke_System_EventHandler_1_System_ComponentModel_PropertyChangedEventArgs_invoke_void_object_TEventArgs_object_System_ComponentModel_PropertyChangedEventArgs
	.long LDIFF_SYM1426
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde58_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_192:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM1427=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1427
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM1428=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1428
LTDIE_192_POINTER:

	.byte 13
LDIFF_SYM1429=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1429
LTDIE_192_REFERENCE:

	.byte 14
LDIFF_SYM1430=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1430
LTDIE_194:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_ElementChangedEventArgs`1"

	.byte 32,16
LDIFF_SYM1431=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM1431
	.byte 2,35,0,6
	.asciz "<NewElement>k__BackingField"

LDIFF_SYM1432=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1432
	.byte 2,35,16,6
	.asciz "<OldElement>k__BackingField"

LDIFF_SYM1433=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1433
	.byte 2,35,24,0,7
	.asciz "Xamarin_Forms_Platform_iOS_ElementChangedEventArgs`1"

LDIFF_SYM1434=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1434
LTDIE_194_POINTER:

	.byte 13
LDIFF_SYM1435=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1435
LTDIE_194_REFERENCE:

	.byte 14
LDIFF_SYM1436=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1436
LTDIE_193:

	.byte 5
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

	.byte 32,16
LDIFF_SYM1437=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM1437
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

LDIFF_SYM1438=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1438
LTDIE_193_POINTER:

	.byte 13
LDIFF_SYM1439=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1439
LTDIE_193_REFERENCE:

	.byte 14
LDIFF_SYM1440=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1440
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<Xamarin.Forms.Platform.iOS.VisualElementChangedEventArgs>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.quad Lme_3c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1441=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1441
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1442=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1442
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1443=LTDIE_193_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1443
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1444=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1444
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1445=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1445
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1446=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1446
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1447=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1447
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1448=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1448
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1449=Lfde59_end - Lfde59_start
	.long LDIFF_SYM1449
Lfde59_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs

LDIFF_SYM1450=Lme_3c - wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.long LDIFF_SYM1450
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde59_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<Xamarin.Forms.Platform.iOS.ElementChangedEventArgs`1<Xamarin.Forms.View>>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
	.quad Lme_3d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1451=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1451
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1452=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1452
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1453=LTDIE_101_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1453
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1454=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1454
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1455=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1455
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1456=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1456
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1457=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1457
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1458=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1458
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1459=Lfde60_end - Lfde60_start
	.long LDIFF_SYM1459
Lfde60_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View

LDIFF_SYM1460=Lme_3d - wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View_invoke_void_object_TEventArgs_object_Xamarin_Forms_Platform_iOS_ElementChangedEventArgs_1_Xamarin_Forms_View
	.long LDIFF_SYM1460
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde60_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_get_Count"
	.asciz "System_Array_InternalArray__ICollection_get_Count"

	.byte 2,60
	.quad System_Array_InternalArray__ICollection_get_Count
	.quad Lme_46

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1461=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1461
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1462=Lfde61_end - Lfde61_start
	.long LDIFF_SYM1462
Lfde61_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_get_Count

LDIFF_SYM1463=Lme_46 - System_Array_InternalArray__ICollection_get_Count
	.long LDIFF_SYM1463
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde61_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_get_IsReadOnly"
	.asciz "System_Array_InternalArray__ICollection_get_IsReadOnly"

	.byte 2,65
	.quad System_Array_InternalArray__ICollection_get_IsReadOnly
	.quad Lme_47

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1464=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1464
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1465=Lfde62_end - Lfde62_start
	.long LDIFF_SYM1465
Lfde62_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_get_IsReadOnly

LDIFF_SYM1466=Lme_47 - System_Array_InternalArray__ICollection_get_IsReadOnly
	.long LDIFF_SYM1466
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde62_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Clear"
	.asciz "System_Array_InternalArray__ICollection_Clear"

	.byte 2,78
	.quad System_Array_InternalArray__ICollection_Clear
	.quad Lme_48

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1467=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1467
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1468=Lfde63_end - Lfde63_start
	.long LDIFF_SYM1468
Lfde63_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Clear

LDIFF_SYM1469=Lme_48 - System_Array_InternalArray__ICollection_Clear
	.long LDIFF_SYM1469
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde63_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Add<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Add_T_REF_T_REF"

	.byte 2,83
	.quad System_Array_InternalArray__ICollection_Add_T_REF_T_REF
	.quad Lme_49

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1470=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1470
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1471=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1471
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1472=Lfde64_end - Lfde64_start
	.long LDIFF_SYM1472
Lfde64_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Add_T_REF_T_REF

LDIFF_SYM1473=Lme_49 - System_Array_InternalArray__ICollection_Add_T_REF_T_REF
	.long LDIFF_SYM1473
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde64_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Remove<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Remove_T_REF_T_REF"

	.byte 2,88
	.quad System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
	.quad Lme_4a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1474=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1474
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1475=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1475
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1476=Lfde65_end - Lfde65_start
	.long LDIFF_SYM1476
Lfde65_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Remove_T_REF_T_REF

LDIFF_SYM1477=Lme_4a - System_Array_InternalArray__ICollection_Remove_T_REF_T_REF
	.long LDIFF_SYM1477
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde65_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Contains<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_Contains_T_REF_T_REF"

	.byte 2,93
	.quad System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
	.quad Lme_4b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1478=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1478
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1479=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1479
	.byte 1,106,11
	.asciz "length"

LDIFF_SYM1480=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1480
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM1481=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1481
	.byte 1,103,11
	.asciz "value"

LDIFF_SYM1482=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1482
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1483=Lfde66_end - Lfde66_start
	.long LDIFF_SYM1483
Lfde66_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Contains_T_REF_T_REF

LDIFF_SYM1484=Lme_4b - System_Array_InternalArray__ICollection_Contains_T_REF_T_REF
	.long LDIFF_SYM1484
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,152,4,153,3,68,154,2
	.align 3
Lfde66_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_CopyTo<T_REF>"
	.asciz "System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int"

	.byte 2,118
	.quad System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
	.quad Lme_4c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1485=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1485
	.byte 2,141,24,3
	.asciz "param0"

LDIFF_SYM1486=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1486
	.byte 2,141,32,3
	.asciz "param1"

LDIFF_SYM1487=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1487
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1488=Lfde67_end - Lfde67_start
	.long LDIFF_SYM1488
Lfde67_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int

LDIFF_SYM1489=Lme_4c - System_Array_InternalArray__ICollection_CopyTo_T_REF_T_REF___int
	.long LDIFF_SYM1489
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6
	.align 3
Lfde67_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_195:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 112,16
LDIFF_SYM1490=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1490
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM1491=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1491
LTDIE_195_POINTER:

	.byte 13
LDIFF_SYM1492=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1492
LTDIE_195_REFERENCE:

	.byte 14
LDIFF_SYM1493=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM1493
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<System.EventHandler`1<Xamarin.Forms.Platform.iOS.VisualElementChangedEventArgs>>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.quad Lme_4d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1494=LTDIE_195_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1494
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1495=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1495
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1496=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1496
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1497=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1497
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1498=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1498
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1499=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1499
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1500=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1500
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1501=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1501
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1502=Lfde68_end - Lfde68_start
	.long LDIFF_SYM1502
Lfde68_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs

LDIFF_SYM1503=Lme_4d - wrapper_delegate_invoke_System_Predicate_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_bool_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.long LDIFF_SYM1503
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde68_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_196:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1504=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1504
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1505=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1505
LTDIE_196_POINTER:

	.byte 13
LDIFF_SYM1506=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1506
LTDIE_196_REFERENCE:

	.byte 14
LDIFF_SYM1507=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM1507
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.EventHandler`1<Xamarin.Forms.Platform.iOS.VisualElementChangedEventArgs>>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.quad Lme_4e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1508=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1508
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1509=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1509
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1510=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1510
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1511=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1511
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1512=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1512
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1513=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1513
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1514=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1514
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1515=Lfde69_end - Lfde69_start
	.long LDIFF_SYM1515
Lfde69_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs

LDIFF_SYM1516=Lme_4e - wrapper_delegate_invoke_System_Action_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_void_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.long LDIFF_SYM1516
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde69_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_197:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 112,16
LDIFF_SYM1517=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1517
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM1518=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1518
LTDIE_197_POINTER:

	.byte 13
LDIFF_SYM1519=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1519
LTDIE_197_REFERENCE:

	.byte 14
LDIFF_SYM1520=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM1520
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<System.EventHandler`1<Xamarin.Forms.Platform.iOS.VisualElementChangedEventArgs>>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.quad Lme_4f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1521=LTDIE_197_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1521
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1522=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1522
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1523=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1523
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1524=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1524
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1525=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1525
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1526=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1526
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1527=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1527
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1528=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1528
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM1529=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1529
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1530=Lfde70_end - Lfde70_start
	.long LDIFF_SYM1530
Lfde70_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs

LDIFF_SYM1531=Lme_4f - wrapper_delegate_invoke_System_Comparison_1_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_invoke_int_T_T_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs_System_EventHandler_1_Xamarin_Forms_Platform_iOS_VisualElementChangedEventArgs
	.long LDIFF_SYM1531
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde70_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__Insert<T_REF>"
	.asciz "System_Array_InternalArray__Insert_T_REF_int_T_REF"

	.byte 2,138,1
	.quad System_Array_InternalArray__Insert_T_REF_int_T_REF
	.quad Lme_50

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1532=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1532
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1533=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1533
	.byte 0,3
	.asciz "param1"

LDIFF_SYM1534=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1534
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1535=Lfde71_end - Lfde71_start
	.long LDIFF_SYM1535
Lfde71_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__Insert_T_REF_int_T_REF

LDIFF_SYM1536=Lme_50 - System_Array_InternalArray__Insert_T_REF_int_T_REF
	.long LDIFF_SYM1536
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde71_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__RemoveAt"
	.asciz "System_Array_InternalArray__RemoveAt_int"

	.byte 2,143,1
	.quad System_Array_InternalArray__RemoveAt_int
	.quad Lme_51

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1537=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1537
	.byte 0,3
	.asciz "param0"

LDIFF_SYM1538=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1538
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1539=Lfde72_end - Lfde72_start
	.long LDIFF_SYM1539
Lfde72_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__RemoveAt_int

LDIFF_SYM1540=Lme_51 - System_Array_InternalArray__RemoveAt_int
	.long LDIFF_SYM1540
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde72_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__IndexOf<T_REF>"
	.asciz "System_Array_InternalArray__IndexOf_T_REF_T_REF"

	.byte 2,148,1
	.quad System_Array_InternalArray__IndexOf_T_REF_T_REF
	.quad Lme_52

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1541=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1541
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1542=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1542
	.byte 1,106,11
	.asciz "length"

LDIFF_SYM1543=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1543
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM1544=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1544
	.byte 1,103,11
	.asciz "value"

LDIFF_SYM1545=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1545
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1546=Lfde73_end - Lfde73_start
	.long LDIFF_SYM1546
Lfde73_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IndexOf_T_REF_T_REF

LDIFF_SYM1547=Lme_52 - System_Array_InternalArray__IndexOf_T_REF_T_REF
	.long LDIFF_SYM1547
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,152,4,153,3,68,154,2
	.align 3
Lfde73_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__get_Item<T_REF>"
	.asciz "System_Array_InternalArray__get_Item_T_REF_int"

	.byte 2,175,1
	.quad System_Array_InternalArray__get_Item_T_REF_int
	.quad Lme_53

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1548=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1548
	.byte 2,141,24,3
	.asciz "param0"

LDIFF_SYM1549=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1549
	.byte 1,106,11
	.asciz "value"

LDIFF_SYM1550=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1550
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1551=Lfde74_end - Lfde74_start
	.long LDIFF_SYM1551
Lfde74_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__get_Item_T_REF_int

LDIFF_SYM1552=Lme_53 - System_Array_InternalArray__get_Item_T_REF_int
	.long LDIFF_SYM1552
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde74_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__set_Item<T_REF>"
	.asciz "System_Array_InternalArray__set_Item_T_REF_int_T_REF"

	.byte 2,185,1
	.quad System_Array_InternalArray__set_Item_T_REF_int_T_REF
	.quad Lme_54

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1553=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1553
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1554=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1554
	.byte 2,141,40,3
	.asciz "param1"

LDIFF_SYM1555=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1555
	.byte 2,141,48,11
	.asciz "oarray"

LDIFF_SYM1556=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1556
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1557=Lfde75_end - Lfde75_start
	.long LDIFF_SYM1557
Lfde75_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__set_Item_T_REF_int_T_REF

LDIFF_SYM1558=Lme_54 - System_Array_InternalArray__set_Item_T_REF_int_T_REF
	.long LDIFF_SYM1558
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,152,4
	.align 3
Lfde75_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_198:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 112,16
LDIFF_SYM1559=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1559
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM1560=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1560
LTDIE_198_POINTER:

	.byte 13
LDIFF_SYM1561=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1561
LTDIE_198_REFERENCE:

	.byte 14
LDIFF_SYM1562=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM1562
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<MapKit.MKMapViewChangeEventArgs>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs
	.quad Lme_55

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1563=LTDIE_198_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1563
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1564=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1564
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1565=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1565
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1566=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1566
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1567=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1567
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1568=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1568
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1569=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1569
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1570=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1570
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1571=Lfde76_end - Lfde76_start
	.long LDIFF_SYM1571
Lfde76_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs

LDIFF_SYM1572=Lme_55 - wrapper_delegate_invoke_System_EventHandler_1_MapKit_MKMapViewChangeEventArgs_invoke_void_object_TEventArgs_object_MapKit_MKMapViewChangeEventArgs
	.long LDIFF_SYM1572
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde76_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_199:

	.byte 5
	.asciz "System_Action`2"

	.byte 112,16
LDIFF_SYM1573=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1573
	.byte 2,35,0,0,7
	.asciz "System_Action`2"

LDIFF_SYM1574=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1574
LTDIE_199_POINTER:

	.byte 13
LDIFF_SYM1575=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1575
LTDIE_199_REFERENCE:

	.byte 14
LDIFF_SYM1576=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM1576
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`2<Xamarin.Forms.Maps.Map,_Xamarin.Forms.Maps.MapSpan>:invoke_void_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
	.quad Lme_56

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1577=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1577
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1578=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1578
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1579=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1579
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1580=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1580
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1581=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1581
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1582=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1582
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1583=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1583
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1584=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1584
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1585=Lfde77_end - Lfde77_start
	.long LDIFF_SYM1585
Lfde77_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM1586=Lme_56 - wrapper_delegate_invoke_System_Action_2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_invoke_void_T1_T2_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM1586
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde77_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_200:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1587=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1587
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1588=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1588
LTDIE_200_POINTER:

	.byte 13
LDIFF_SYM1589=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1589
LTDIE_200_REFERENCE:

	.byte 14
LDIFF_SYM1590=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM1590
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<UIKit.UITapGestureRecognizer>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer
	.quad Lme_57

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1591=LTDIE_200_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1591
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1592=LTDIE_114_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1592
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1593=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1593
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1594=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1594
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1595=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1595
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1596=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1596
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1597=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1597
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1598=Lfde78_end - Lfde78_start
	.long LDIFF_SYM1598
Lfde78_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer

LDIFF_SYM1599=Lme_57 - wrapper_delegate_invoke_System_Action_1_UIKit_UITapGestureRecognizer_invoke_void_T_UIKit_UITapGestureRecognizer
	.long LDIFF_SYM1599
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde78_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_201:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1600=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1600
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1601=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1601
LTDIE_201_POINTER:

	.byte 13
LDIFF_SYM1602=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1602
LTDIE_201_REFERENCE:

	.byte 14
LDIFF_SYM1603=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM1603
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<string,_System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
	.quad Lme_58

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1604=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1604
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1605=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1605
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1606=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1606
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1607=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1607
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1608=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1608
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1609=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1609
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1610=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1610
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1611=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1611
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1612=Lfde79_end - Lfde79_start
	.long LDIFF_SYM1612
Lfde79_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string

LDIFF_SYM1613=Lme_58 - wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
	.long LDIFF_SYM1613
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde79_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_202:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1614=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1614
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1615=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1615
LTDIE_202_POINTER:

	.byte 13
LDIFF_SYM1616=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1616
LTDIE_202_REFERENCE:

	.byte 14
LDIFF_SYM1617=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM1617
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<Xamarin.Forms.Maps.Position,_System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<string>>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.quad Lme_5d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1618=LTDIE_202_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1618
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM1619=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1619
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1620=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1620
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1621=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1621
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1622=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1622
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1623=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1623
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1624=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1624
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1625=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1625
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1626=Lfde80_end - Lfde80_start
	.long LDIFF_SYM1626
Lfde80_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position

LDIFF_SYM1627=Lme_5d - wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1627
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde80_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_203:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1628=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1628
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1629=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1629
LTDIE_203_POINTER:

	.byte 13
LDIFF_SYM1630=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1630
LTDIE_203_REFERENCE:

	.byte 14
LDIFF_SYM1631=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM1631
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
	.quad Lme_5e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1632=LTDIE_203_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1632
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1633=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1633
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1634=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1634
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1635=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1635
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1636=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1636
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1637=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1637
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1638=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1638
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1639=LTDIE_178_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1639
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1640=Lfde81_end - Lfde81_start
	.long LDIFF_SYM1640
Lfde81_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object

LDIFF_SYM1641=Lme_5e - wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
	.long LDIFF_SYM1641
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde81_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_204:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM1642=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1642
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM1643=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1643
LTDIE_204_POINTER:

	.byte 13
LDIFF_SYM1644=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1644
LTDIE_204_REFERENCE:

	.byte 14
LDIFF_SYM1645=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM1645
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
	.quad Lme_5f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1646=LTDIE_204_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1646
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1647=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1647
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1648=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1648
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1649=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1649
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1650=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1650
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1651=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1651
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1652=LTDIE_178_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1652
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1653=Lfde82_end - Lfde82_start
	.long LDIFF_SYM1653
Lfde82_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult

LDIFF_SYM1654=Lme_5f - wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
	.long LDIFF_SYM1654
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde82_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_205:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1655=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1655
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1656=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1656
LTDIE_205_POINTER:

	.byte 13
LDIFF_SYM1657=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1657
LTDIE_205_REFERENCE:

	.byte 14
LDIFF_SYM1658=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM1658
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<string>>>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
	.quad Lme_60

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1659=LTDIE_205_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1659
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1660=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1660
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1661=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1661
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1662=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1662
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1663=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1663
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1664=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1664
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1665=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1665
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1666=Lfde83_end - Lfde83_start
	.long LDIFF_SYM1666
Lfde83_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string

LDIFF_SYM1667=Lme_60 - wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
	.long LDIFF_SYM1667
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde83_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_206:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1668=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1668
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1669=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1669
LTDIE_206_POINTER:

	.byte 13
LDIFF_SYM1670=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1670
LTDIE_206_REFERENCE:

	.byte 14
LDIFF_SYM1671=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM1671
LTDIE_207:

	.byte 17
	.asciz "System_IAsyncResult"

	.byte 16,7
	.asciz "System_IAsyncResult"

LDIFF_SYM1672=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM1672
LTDIE_207_POINTER:

	.byte 13
LDIFF_SYM1673=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM1673
LTDIE_207_REFERENCE:

	.byte 14
LDIFF_SYM1674=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM1674
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
	.quad Lme_61

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1675=LTDIE_206_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1675
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1676=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1676
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1677=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1677
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1678=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1678
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1679=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1679
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1680=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1680
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1681=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1681
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1682=LTDIE_178_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1682
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1683=Lfde84_end - Lfde84_start
	.long LDIFF_SYM1683
Lfde84_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM1684=Lme_61 - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM1684
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde84_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_208:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1685=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1685
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1686=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM1686
LTDIE_208_POINTER:

	.byte 13
LDIFF_SYM1687=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM1687
LTDIE_208_REFERENCE:

	.byte 14
LDIFF_SYM1688=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM1688
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.IAsyncResult>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.quad Lme_62

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1689=LTDIE_208_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1689
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1690=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1690
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1691=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1691
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1692=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1692
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1693=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1693
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1694=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1694
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1695=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1695
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1696=Lfde85_end - Lfde85_start
	.long LDIFF_SYM1696
Lfde85_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult

LDIFF_SYM1697=Lme_62 - wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.long LDIFF_SYM1697
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde85_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_209:

	.byte 5
	.asciz "System_Func`3"

	.byte 112,16
LDIFF_SYM1698=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1698
	.byte 2,35,0,0,7
	.asciz "System_Func`3"

LDIFF_SYM1699=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM1699
LTDIE_209_POINTER:

	.byte 13
LDIFF_SYM1700=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM1700
LTDIE_209_REFERENCE:

	.byte 14
LDIFF_SYM1701=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM1701
LTDIE_210:

	.byte 5
	.asciz "System_AsyncCallback"

	.byte 112,16
LDIFF_SYM1702=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1702
	.byte 2,35,0,0,7
	.asciz "System_AsyncCallback"

LDIFF_SYM1703=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM1703
LTDIE_210_POINTER:

	.byte 13
LDIFF_SYM1704=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM1704
LTDIE_210_REFERENCE:

	.byte 14
LDIFF_SYM1705=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM1705
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`3<System.AsyncCallback,_object,_System.IAsyncResult>:invoke_TResult_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.quad Lme_63

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1706=LTDIE_209_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1706
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1707=LTDIE_210_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1707
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1708=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1708
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1709=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1709
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1710=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1710
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1711=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1711
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1712=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1712
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1713=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1713
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM1714=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1714
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1715=Lfde86_end - Lfde86_start
	.long LDIFF_SYM1715
Lfde86_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object

LDIFF_SYM1716=Lme_63 - wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.long LDIFF_SYM1716
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde86_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_211:

	.byte 5
	.asciz "_InternalEnumerator`1"

	.byte 32,16
LDIFF_SYM1717=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM1717
	.byte 2,35,0,6
	.asciz "array"

LDIFF_SYM1718=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1718
	.byte 2,35,16,6
	.asciz "idx"

LDIFF_SYM1719=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1719
	.byte 2,35,24,0,7
	.asciz "_InternalEnumerator`1"

LDIFF_SYM1720=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM1720
LTDIE_211_POINTER:

	.byte 13
LDIFF_SYM1721=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM1721
LTDIE_211_REFERENCE:

	.byte 14
LDIFF_SYM1722=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM1722
	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array"

	.byte 2,217,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
	.quad Lme_65

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1723=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1723
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1724=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1724
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1725=Lfde87_end - Lfde87_start
	.long LDIFF_SYM1725
Lfde87_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array

LDIFF_SYM1726=Lme_65 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
	.long LDIFF_SYM1726
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde87_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 2,223,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_66

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1727=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1727
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1728=Lfde88_end - Lfde88_start
	.long LDIFF_SYM1728
Lfde88_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM1729=Lme_66 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM1729
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde88_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 2,227,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_67

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1730=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1730
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1731=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1731
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1732=Lfde89_end - Lfde89_start
	.long LDIFF_SYM1732
Lfde89_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM1733=Lme_67 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM1733
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,154,1
	.align 3
Lfde89_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 2,235,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_68

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1734=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1734
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1735=Lfde90_end - Lfde90_start
	.long LDIFF_SYM1735
Lfde90_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM1736=Lme_68 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM1736
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10
	.align 3
Lfde90_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 2,246,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_69

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1737=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1737
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1738=Lfde91_end - Lfde91_start
	.long LDIFF_SYM1738
Lfde91_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM1739=Lme_69 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM1739
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde91_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 2,251,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_6a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1740=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1740
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1741=Lfde92_end - Lfde92_start
	.long LDIFF_SYM1741
Lfde92_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM1742=Lme_6a - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM1742
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde92_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__IEnumerable_GetEnumerator<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position"

	.byte 2,70
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
	.quad Lme_6b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1743=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1743
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1744=Lfde93_end - Lfde93_start
	.long LDIFF_SYM1744
Lfde93_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position

LDIFF_SYM1745=Lme_6b - System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1745
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde93_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_212:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1746=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1746
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1747=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM1747
LTDIE_212_POINTER:

	.byte 13
LDIFF_SYM1748=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM1748
LTDIE_212_REFERENCE:

	.byte 14
LDIFF_SYM1749=LTDIE_212 - Ldebug_info_start
	.long LDIFF_SYM1749
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
	.quad Lme_6c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1750=LTDIE_212_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1750
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1751=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1751
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1752=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1752
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1753=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1753
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1754=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1754
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1755=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1755
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1756=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1756
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1757=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1757
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1758=Lfde94_end - Lfde94_start
	.long LDIFF_SYM1758
Lfde94_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object

LDIFF_SYM1759=Lme_6c - wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
	.long LDIFF_SYM1759
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde94_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_213:

	.byte 5
	.asciz "System_Func`1"

	.byte 112,16
LDIFF_SYM1760=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1760
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM1761=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM1761
LTDIE_213_POINTER:

	.byte 13
LDIFF_SYM1762=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM1762
LTDIE_213_REFERENCE:

	.byte 14
LDIFF_SYM1763=LTDIE_213 - Ldebug_info_start
	.long LDIFF_SYM1763
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
	.quad Lme_6d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1764=LTDIE_213_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1764
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1765=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1765
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1766=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1766
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1767=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1767
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1768=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1768
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1769=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1769
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1770=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1770
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1771=Lfde95_end - Lfde95_start
	.long LDIFF_SYM1771
Lfde95_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult

LDIFF_SYM1772=Lme_6d - wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
	.long LDIFF_SYM1772
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde95_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_214:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1773=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1773
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1774=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM1774
LTDIE_214_POINTER:

	.byte 13
LDIFF_SYM1775=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM1775
LTDIE_214_REFERENCE:

	.byte 14
LDIFF_SYM1776=LTDIE_214 - Ldebug_info_start
	.long LDIFF_SYM1776
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_6e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1777=LTDIE_214_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1777
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1778=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1778
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1779=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1779
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1780=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1780
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1781=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1781
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1782=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1782
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1783=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1783
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1784=Lfde96_end - Lfde96_start
	.long LDIFF_SYM1784
Lfde96_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM1785=Lme_6e - wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1785
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde96_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_215:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1786=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1786
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1787=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM1787
LTDIE_215_POINTER:

	.byte 13
LDIFF_SYM1788=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM1788
LTDIE_215_REFERENCE:

	.byte 14
LDIFF_SYM1789=LTDIE_215 - Ldebug_info_start
	.long LDIFF_SYM1789
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
	.quad Lme_6f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1790=LTDIE_215_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1790
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1791=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1791
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1792=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1792
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1793=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1793
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1794=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1794
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1795=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1795
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1796=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1796
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1797=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1797
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1798=Lfde97_end - Lfde97_start
	.long LDIFF_SYM1798
Lfde97_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM1799=Lme_6f - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM1799
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde97_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_216:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 112,16
LDIFF_SYM1800=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1800
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM1801=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM1801
LTDIE_216_POINTER:

	.byte 13
LDIFF_SYM1802=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM1802
LTDIE_216_REFERENCE:

	.byte 14
LDIFF_SYM1803=LTDIE_216 - Ldebug_info_start
	.long LDIFF_SYM1803
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<string>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
	.quad Lme_70

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1804=LTDIE_216_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1804
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1805=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1805
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1806=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1806
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1807=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1807
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1808=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1808
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1809=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1809
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1810=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1810
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1811=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1811
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1812=Lfde98_end - Lfde98_start
	.long LDIFF_SYM1812
Lfde98_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string

LDIFF_SYM1813=Lme_70 - wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
	.long LDIFF_SYM1813
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde98_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_217:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1814=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1814
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1815=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM1815
LTDIE_217_POINTER:

	.byte 13
LDIFF_SYM1816=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM1816
LTDIE_217_REFERENCE:

	.byte 14
LDIFF_SYM1817=LTDIE_217 - Ldebug_info_start
	.long LDIFF_SYM1817
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<string>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
	.quad Lme_71

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1818=LTDIE_217_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1818
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1819=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1819
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1820=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1820
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1821=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1821
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1822=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1822
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1823=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1823
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1824=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1824
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1825=Lfde99_end - Lfde99_start
	.long LDIFF_SYM1825
Lfde99_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string

LDIFF_SYM1826=Lme_71 - wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
	.long LDIFF_SYM1826
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde99_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_218:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 112,16
LDIFF_SYM1827=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1827
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM1828=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM1828
LTDIE_218_POINTER:

	.byte 13
LDIFF_SYM1829=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM1829
LTDIE_218_REFERENCE:

	.byte 14
LDIFF_SYM1830=LTDIE_218 - Ldebug_info_start
	.long LDIFF_SYM1830
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<string>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
	.quad Lme_72

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1831=LTDIE_218_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1831
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1832=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1832
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1833=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1833
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1834=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1834
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1835=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1835
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1836=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1836
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1837=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1837
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1838=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1838
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM1839=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1839
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1840=Lfde100_end - Lfde100_start
	.long LDIFF_SYM1840
Lfde100_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string

LDIFF_SYM1841=Lme_72 - wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
	.long LDIFF_SYM1841
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde100_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_219:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1842=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1842
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1843=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM1843
LTDIE_219_POINTER:

	.byte 13
LDIFF_SYM1844=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM1844
LTDIE_219_REFERENCE:

	.byte 14
LDIFF_SYM1845=LTDIE_219 - Ldebug_info_start
	.long LDIFF_SYM1845
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<CoreLocation.CLPlacemark,_string>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark
	.quad Lme_73

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1846=LTDIE_219_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1846
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1847=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1847
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1848=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1848
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1849=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1849
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1850=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1850
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1851=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1851
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1852=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1852
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1853=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1853
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1854=Lfde101_end - Lfde101_start
	.long LDIFF_SYM1854
Lfde101_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark

LDIFF_SYM1855=Lme_73 - wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_string_invoke_TResult_T_CoreLocation_CLPlacemark
	.long LDIFF_SYM1855
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde101_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_220:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1856=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1856
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1857=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM1857
LTDIE_220_POINTER:

	.byte 13
LDIFF_SYM1858=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM1858
LTDIE_220_REFERENCE:

	.byte 14
LDIFF_SYM1859=LTDIE_220 - Ldebug_info_start
	.long LDIFF_SYM1859
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark
	.quad Lme_78

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1860=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1860
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1861=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1861
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1862=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1862
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1863=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1863
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1864=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1864
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1865=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1865
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1866=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1866
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1867=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1867
	.byte 3,141,136,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1868=Lfde102_end - Lfde102_start
	.long LDIFF_SYM1868
Lfde102_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark

LDIFF_SYM1869=Lme_78 - wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_invoke_TResult_T_CoreLocation_CLPlacemark
	.long LDIFF_SYM1869
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,150,20,151,19,68,152,18,153,17,68,154,16
	.align 3
Lfde102_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_221:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerable`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerable`1"

LDIFF_SYM1870=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM1870
LTDIE_221_POINTER:

	.byte 13
LDIFF_SYM1871=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM1871
LTDIE_221_REFERENCE:

	.byte 14
LDIFF_SYM1872=LTDIE_221 - Ldebug_info_start
	.long LDIFF_SYM1872
LTDIE_222:

	.byte 5
	.asciz "_Iterator`1"

	.byte 32,16
LDIFF_SYM1873=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1873
	.byte 2,35,0,6
	.asciz "_threadId"

LDIFF_SYM1874=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1874
	.byte 2,35,24,6
	.asciz "_state"

LDIFF_SYM1875=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1875
	.byte 2,35,28,6
	.asciz "_current"

LDIFF_SYM1876=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1876
	.byte 2,35,16,0,7
	.asciz "_Iterator`1"

LDIFF_SYM1877=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM1877
LTDIE_222_POINTER:

	.byte 13
LDIFF_SYM1878=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM1878
LTDIE_222_REFERENCE:

	.byte 14
LDIFF_SYM1879=LTDIE_222 - Ldebug_info_start
	.long LDIFF_SYM1879
LTDIE_223:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM1880=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM1880
LTDIE_223_POINTER:

	.byte 13
LDIFF_SYM1881=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM1881
LTDIE_223_REFERENCE:

	.byte 14
LDIFF_SYM1882=LTDIE_223 - Ldebug_info_start
	.long LDIFF_SYM1882
LTDIE_224:

	.byte 17
	.asciz "System_Linq_IPartition`1"

	.byte 16,7
	.asciz "System_Linq_IPartition`1"

LDIFF_SYM1883=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM1883
LTDIE_224_POINTER:

	.byte 13
LDIFF_SYM1884=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM1884
LTDIE_224_REFERENCE:

	.byte 14
LDIFF_SYM1885=LTDIE_224 - Ldebug_info_start
	.long LDIFF_SYM1885
LTDIE_225:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM1886=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1886
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1887=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1887
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1888=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1888
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM1889=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1889
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM1890=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1890
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1891=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM1891
LTDIE_225_POINTER:

	.byte 13
LDIFF_SYM1892=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM1892
LTDIE_225_REFERENCE:

	.byte 14
LDIFF_SYM1893=LTDIE_225 - Ldebug_info_start
	.long LDIFF_SYM1893
LTDIE_226:

	.byte 17
	.asciz "System_Linq_IPartition`1"

	.byte 16,7
	.asciz "System_Linq_IPartition`1"

LDIFF_SYM1894=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM1894
LTDIE_226_POINTER:

	.byte 13
LDIFF_SYM1895=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM1895
LTDIE_226_REFERENCE:

	.byte 14
LDIFF_SYM1896=LTDIE_226 - Ldebug_info_start
	.long LDIFF_SYM1896
	.byte 2
	.asciz "System.Linq.Enumerable:Select<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>"
	.asciz "System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,16
	.quad System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_79

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM1897=LTDIE_221_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1897
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1898=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1898
	.byte 1,106,11
	.asciz "iterator"

LDIFF_SYM1899=LTDIE_222_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1899
	.byte 1,104,11
	.asciz "ilist"

LDIFF_SYM1900=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1900
	.byte 1,104,11
	.asciz "partition"

LDIFF_SYM1901=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1901
	.byte 1,104,11
	.asciz "array"

LDIFF_SYM1902=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1902
	.byte 1,103,11
	.asciz "list"

LDIFF_SYM1903=LTDIE_225_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1903
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1904=LTDIE_226_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1904
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1905=Lfde103_end - Lfde103_start
	.long LDIFF_SYM1905
Lfde103_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM1906=Lme_79 - System_Linq_Enumerable_Select_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1906
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde103_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_227:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM1907=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1907
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1908=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM1908
LTDIE_227_POINTER:

	.byte 13
LDIFF_SYM1909=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM1909
LTDIE_227_REFERENCE:

	.byte 14
LDIFF_SYM1910=LTDIE_227 - Ldebug_info_start
	.long LDIFF_SYM1910
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<CoreLocation.CLPlacemark,_bool>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark
	.quad Lme_7e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1911=LTDIE_227_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1911
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1912=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1912
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1913=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1913
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1914=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1914
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1915=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1915
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1916=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1916
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1917=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1917
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1918=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1918
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1919=Lfde104_end - Lfde104_start
	.long LDIFF_SYM1919
Lfde104_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark

LDIFF_SYM1920=Lme_7e - wrapper_delegate_invoke_System_Func_2_CoreLocation_CLPlacemark_bool_invoke_TResult_T_CoreLocation_CLPlacemark
	.long LDIFF_SYM1920
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde104_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_228:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 112,16
LDIFF_SYM1921=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1921
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM1922=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM1922
LTDIE_228_POINTER:

	.byte 13
LDIFF_SYM1923=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM1923
LTDIE_228_REFERENCE:

	.byte 14
LDIFF_SYM1924=LTDIE_228 - Ldebug_info_start
	.long LDIFF_SYM1924
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<CoreLocation.CLPlacemark>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark
	.quad Lme_7f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1925=LTDIE_228_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1925
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1926=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1926
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1927=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1927
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1928=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1928
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1929=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1929
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1930=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1930
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1931=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1931
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1932=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1932
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1933=Lfde105_end - Lfde105_start
	.long LDIFF_SYM1933
Lfde105_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark

LDIFF_SYM1934=Lme_7f - wrapper_delegate_invoke_System_Predicate_1_CoreLocation_CLPlacemark_invoke_bool_T_CoreLocation_CLPlacemark
	.long LDIFF_SYM1934
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde105_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_229:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM1935=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1935
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1936=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM1936
LTDIE_229_POINTER:

	.byte 13
LDIFF_SYM1937=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM1937
LTDIE_229_REFERENCE:

	.byte 14
LDIFF_SYM1938=LTDIE_229 - Ldebug_info_start
	.long LDIFF_SYM1938
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<CoreLocation.CLPlacemark>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark
	.quad Lme_80

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1939=LTDIE_229_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1939
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1940=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1940
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1941=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1941
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1942=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1942
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1943=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1943
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1944=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1944
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1945=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1945
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1946=Lfde106_end - Lfde106_start
	.long LDIFF_SYM1946
Lfde106_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark

LDIFF_SYM1947=Lme_80 - wrapper_delegate_invoke_System_Action_1_CoreLocation_CLPlacemark_invoke_void_T_CoreLocation_CLPlacemark
	.long LDIFF_SYM1947
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde106_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_230:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 112,16
LDIFF_SYM1948=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM1948
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM1949=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM1949
LTDIE_230_POINTER:

	.byte 13
LDIFF_SYM1950=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM1950
LTDIE_230_REFERENCE:

	.byte 14
LDIFF_SYM1951=LTDIE_230 - Ldebug_info_start
	.long LDIFF_SYM1951
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<CoreLocation.CLPlacemark>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark
	.quad Lme_81

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1952=LTDIE_230_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1952
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1953=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1953
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1954=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1954
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1955=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1955
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1956=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1956
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1957=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1957
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1958=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1958
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1959=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1959
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM1960=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1960
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1961=Lfde107_end - Lfde107_start
	.long LDIFF_SYM1961
Lfde107_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark

LDIFF_SYM1962=Lme_81 - wrapper_delegate_invoke_System_Comparison_1_CoreLocation_CLPlacemark_invoke_int_T_T_CoreLocation_CLPlacemark_CoreLocation_CLPlacemark
	.long LDIFF_SYM1962
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde107_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_231:

	.byte 5
	.asciz "_InternalEnumerator`1"

	.byte 32,16
LDIFF_SYM1963=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM1963
	.byte 2,35,0,6
	.asciz "array"

LDIFF_SYM1964=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1964
	.byte 2,35,16,6
	.asciz "idx"

LDIFF_SYM1965=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1965
	.byte 2,35,24,0,7
	.asciz "_InternalEnumerator`1"

LDIFF_SYM1966=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM1966
LTDIE_231_POINTER:

	.byte 13
LDIFF_SYM1967=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM1967
LTDIE_231_REFERENCE:

	.byte 14
LDIFF_SYM1968=LTDIE_231 - Ldebug_info_start
	.long LDIFF_SYM1968
	.byte 2
	.asciz "System.Array/InternalEnumerator`1<T_REF>:.ctor"
	.asciz "System_Array_InternalEnumerator_1_T_REF__ctor_System_Array"

	.byte 2,217,1
	.quad System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
	.quad Lme_87

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1969=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1969
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM1970=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1970
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1971=Lfde108_end - Lfde108_start
	.long LDIFF_SYM1971
Lfde108_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_T_REF__ctor_System_Array

LDIFF_SYM1972=Lme_87 - System_Array_InternalEnumerator_1_T_REF__ctor_System_Array
	.long LDIFF_SYM1972
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde108_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__get_Item<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int"

	.byte 2,175,1
	.quad System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
	.quad Lme_88

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1973=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1973
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM1974=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1974
	.byte 3,141,216,0,11
	.asciz "value"

LDIFF_SYM1975=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1975
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1976=Lfde109_end - Lfde109_start
	.long LDIFF_SYM1976
Lfde109_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int

LDIFF_SYM1977=Lme_88 - System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
	.long LDIFF_SYM1977
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde109_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 2,150,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_89

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1978=Lfde110_end - Lfde110_start
	.long LDIFF_SYM1978
Lfde110_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM1979=Lme_89 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM1979
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde110_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_233:

	.byte 5
	.asciz "_Iterator`1"

	.byte 40,16
LDIFF_SYM1980=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM1980
	.byte 2,35,0,6
	.asciz "_threadId"

LDIFF_SYM1981=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1981
	.byte 2,35,16,6
	.asciz "_state"

LDIFF_SYM1982=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1982
	.byte 2,35,20,6
	.asciz "_current"

LDIFF_SYM1983=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1983
	.byte 2,35,24,0,7
	.asciz "_Iterator`1"

LDIFF_SYM1984=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM1984
LTDIE_233_POINTER:

	.byte 13
LDIFF_SYM1985=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM1985
LTDIE_233_REFERENCE:

	.byte 14
LDIFF_SYM1986=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM1986
LTDIE_234:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerator`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerator`1"

LDIFF_SYM1987=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM1987
LTDIE_234_POINTER:

	.byte 13
LDIFF_SYM1988=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM1988
LTDIE_234_REFERENCE:

	.byte 14
LDIFF_SYM1989=LTDIE_234 - Ldebug_info_start
	.long LDIFF_SYM1989
LTDIE_232:

	.byte 5
	.asciz "_SelectEnumerableIterator`2"

	.byte 64,16
LDIFF_SYM1990=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM1990
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM1991=LTDIE_221_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1991
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM1992=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1992
	.byte 2,35,48,6
	.asciz "_enumerator"

LDIFF_SYM1993=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1993
	.byte 2,35,56,0,7
	.asciz "_SelectEnumerableIterator`2"

LDIFF_SYM1994=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM1994
LTDIE_232_POINTER:

	.byte 13
LDIFF_SYM1995=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM1995
LTDIE_232_REFERENCE:

	.byte 14
LDIFF_SYM1996=LTDIE_232 - Ldebug_info_start
	.long LDIFF_SYM1996
	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,98
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_8a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1997=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1997
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1998=LTDIE_221_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1998
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM1999=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1999
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2000=Lfde111_end - Lfde111_start
	.long LDIFF_SYM2000
Lfde111_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2001=Lme_8a - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2001
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde111_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,107
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_8b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2002=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2002
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2003=Lfde112_end - Lfde112_start
	.long LDIFF_SYM2003
Lfde112_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2004=Lme_8b - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2004
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde112_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose"

	.byte 3,111
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_8c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2005=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2005
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2006=Lfde113_end - Lfde113_start
	.long LDIFF_SYM2006
Lfde113_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2007=Lme_8c - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2007
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde113_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,122
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_8d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2008=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2008
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2009=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2009
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2010=Lfde114_end - Lfde114_start
	.long LDIFF_SYM2010
Lfde114_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2011=Lme_8d - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2011
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde114_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,147,1
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_8e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2012=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2012
	.byte 1,106,11
	.asciz "builder"

LDIFF_SYM2013=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2013
	.byte 3,141,200,0,11
	.asciz "V_1"

LDIFF_SYM2014=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2014
	.byte 3,141,248,0,11
	.asciz "item"

LDIFF_SYM2015=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2015
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2016=Lfde115_end - Lfde115_start
	.long LDIFF_SYM2016
Lfde115_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2017=Lme_8e - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2017
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,152,22,153,21,68,154,20
	.align 3
Lfde115_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_235:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM2018=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM2018
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM2019=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2019
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM2020=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2020
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM2021=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2021
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM2022=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2022
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM2023=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2023
LTDIE_235_POINTER:

	.byte 13
LDIFF_SYM2024=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2024
LTDIE_235_REFERENCE:

	.byte 14
LDIFF_SYM2025=LTDIE_235 - Ldebug_info_start
	.long LDIFF_SYM2025
	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,159,1
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_8f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2026=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2026
	.byte 1,106,11
	.asciz "list"

LDIFF_SYM2027=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2027
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM2028=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2028
	.byte 3,141,216,0,11
	.asciz "item"

LDIFF_SYM2029=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2029
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2030=Lfde116_end - Lfde116_start
	.long LDIFF_SYM2030
Lfde116_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2031=Lme_8f - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2031
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153,15,68,154,14
	.align 3
Lfde116_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectEnumerableIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,174,1
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_90

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2032=LTDIE_232_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2032
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2033=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2033
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2034=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2034
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM2035=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2035
	.byte 2,141,56,11
	.asciz "item"

LDIFF_SYM2036=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2036
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2037=Lfde117_end - Lfde117_start
	.long LDIFF_SYM2037
Lfde117_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2038=Lme_90 - System_Linq_Enumerable_SelectEnumerableIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2038
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,68,154,12
	.align 3
Lfde117_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 4,41
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_91

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2039=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2039
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2040=Lfde118_end - Lfde118_start
	.long LDIFF_SYM2040
Lfde118_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2041=Lme_91 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2041
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde118_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 4,49
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_92

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2042=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2042
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2043=Lfde119_end - Lfde119_start
	.long LDIFF_SYM2043
Lfde119_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM2044=Lme_92 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM2044
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde119_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 4,68
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_94

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2045=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2045
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2046=Lfde120_end - Lfde120_start
	.long LDIFF_SYM2046
Lfde120_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2047=Lme_94 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2047
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde120_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:GetEnumerator"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator"

	.byte 4,82
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.quad Lme_95

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2048=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2048
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2049=Lfde121_end - Lfde121_start
	.long LDIFF_SYM2049
Lfde121_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator

LDIFF_SYM2050=Lme_95 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.long LDIFF_SYM2050
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde121_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_236:

	.byte 5
	.asciz "System_Func`2"

	.byte 112,16
LDIFF_SYM2051=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM2051
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2052=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2052
LTDIE_236_POINTER:

	.byte 13
LDIFF_SYM2053=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2053
LTDIE_236_REFERENCE:

	.byte 14
LDIFF_SYM2054=LTDIE_236 - Ldebug_info_start
	.long LDIFF_SYM2054
	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:Where"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool"

	.byte 4,109
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.quad Lme_97

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2055=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2055
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2056=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2056
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2057=Lfde122_end - Lfde122_start
	.long LDIFF_SYM2057
Lfde122_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool

LDIFF_SYM2058=Lme_97 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.long LDIFF_SYM2058
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde122_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 4,112
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_98

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2059=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2059
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2060=Lfde123_end - Lfde123_start
	.long LDIFF_SYM2060
Lfde123_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM2061=Lme_98 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM2061
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde123_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerable.GetEnumerator"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator"

	.byte 4,114
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.quad Lme_99

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2062=LTDIE_233_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2062
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2063=Lfde124_end - Lfde124_start
	.long LDIFF_SYM2063
Lfde124_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator

LDIFF_SYM2064=Lme_99 - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.long LDIFF_SYM2064
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde124_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 4,116
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_9a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2065=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2065
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2066=Lfde125_end - Lfde125_start
	.long LDIFF_SYM2066
Lfde125_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM2067=Lme_9a - System_Linq_Enumerable_Iterator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM2067
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde125_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 5,93
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_9b

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2068=Lfde126_end - Lfde126_start
	.long LDIFF_SYM2068
Lfde126_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM2069=Lme_9b - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM2069
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde126_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_237:

	.byte 5
	.asciz "_SelectIPartitionIterator`2"

	.byte 64,16
LDIFF_SYM2070=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2070
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2071=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2071
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM2072=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2072
	.byte 2,35,48,6
	.asciz "_enumerator"

LDIFF_SYM2073=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2073
	.byte 2,35,56,0,7
	.asciz "_SelectIPartitionIterator`2"

LDIFF_SYM2074=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2074
LTDIE_237_POINTER:

	.byte 13
LDIFF_SYM2075=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2075
LTDIE_237_REFERENCE:

	.byte 14
LDIFF_SYM2076=LTDIE_237 - Ldebug_info_start
	.long LDIFF_SYM2076
	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,235,4
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_9c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2077=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2077
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2078=LTDIE_224_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2078
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2079=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2079
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2080=Lfde127_end - Lfde127_start
	.long LDIFF_SYM2080
Lfde127_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2081=Lme_9c - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Linq_IPartition_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2081
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde127_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,244,4
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_9d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2082=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2082
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2083=Lfde128_end - Lfde128_start
	.long LDIFF_SYM2083
Lfde128_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2084=Lme_9d - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2084
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde128_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,248,4
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_9e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2085=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2085
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2086=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2086
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2087=Lfde129_end - Lfde129_start
	.long LDIFF_SYM2087
Lfde129_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2088=Lme_9e - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2088
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde129_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose"

	.byte 3,142,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_9f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2089=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2089
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2090=Lfde130_end - Lfde130_start
	.long LDIFF_SYM2090
Lfde130_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2091=Lme_9f - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2091
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde130_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 3,157,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_a0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2092=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2092
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2093=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2093
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2094=Lfde131_end - Lfde131_start
	.long LDIFF_SYM2094
Lfde131_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2095=Lme_a0 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2095
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde131_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int"

	.byte 3,161,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_a1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2096=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2096
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2097=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2097
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2098=Lfde132_end - Lfde132_start
	.long LDIFF_SYM2098
Lfde132_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2099=Lme_a1 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2099
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde132_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 3,166,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_a2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2100=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2100
	.byte 3,141,216,0,3
	.asciz "param0"

LDIFF_SYM2101=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2101
	.byte 3,141,224,0,3
	.asciz "param1"

LDIFF_SYM2102=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2102
	.byte 3,141,232,0,11
	.asciz "sourceFound"

LDIFF_SYM2103=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2103
	.byte 3,141,144,1,11
	.asciz "input"

LDIFF_SYM2104=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2104
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2105=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2105
	.byte 3,141,128,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2106=Lfde133_end - Lfde133_start
	.long LDIFF_SYM2106
Lfde133_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2107=Lme_a2 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2107
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,68,153,20
	.align 3
Lfde133_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 3,174,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_a3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2108=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2108
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2109=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2109
	.byte 3,141,216,0,11
	.asciz "sourceFound"

LDIFF_SYM2110=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2110
	.byte 3,141,128,1,11
	.asciz "input"

LDIFF_SYM2111=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2111
	.byte 3,141,136,1,11
	.asciz "V_2"

LDIFF_SYM2112=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2112
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2113=Lfde134_end - Lfde134_start
	.long LDIFF_SYM2113
Lfde134_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2114=Lme_a3 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2114
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29
	.align 3
Lfde134_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 3,182,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_a4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2115=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2115
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2116=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2116
	.byte 3,141,216,0,11
	.asciz "sourceFound"

LDIFF_SYM2117=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2117
	.byte 3,141,128,1,11
	.asciz "input"

LDIFF_SYM2118=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2118
	.byte 3,141,136,1,11
	.asciz "V_2"

LDIFF_SYM2119=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2119
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2120=Lfde135_end - Lfde135_start
	.long LDIFF_SYM2120
Lfde135_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2121=Lme_a4 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2121
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29
	.align 3
Lfde135_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:LazyToArray"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray"

	.byte 3,191,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray
	.quad Lme_a5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2122=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2122
	.byte 1,106,11
	.asciz "builder"

LDIFF_SYM2123=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2123
	.byte 3,141,200,0,11
	.asciz "V_1"

LDIFF_SYM2124=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2124
	.byte 3,141,248,0,11
	.asciz "input"

LDIFF_SYM2125=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2125
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2126=Lfde136_end - Lfde136_start
	.long LDIFF_SYM2126
Lfde136_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray

LDIFF_SYM2127=Lme_a5 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_LazyToArray
	.long LDIFF_SYM2127
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,152,22,153,21,68,154,20
	.align 3
Lfde136_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:PreallocatingToArray"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int"

	.byte 3,204,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int
	.quad Lme_a6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2128=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2128
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2129=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2129
	.byte 1,106,11
	.asciz "array"

LDIFF_SYM2130=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2130
	.byte 1,106,11
	.asciz "index"

LDIFF_SYM2131=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2131
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2132=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2132
	.byte 3,141,192,0,11
	.asciz "input"

LDIFF_SYM2133=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2133
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2134=Lfde137_end - Lfde137_start
	.long LDIFF_SYM2134
Lfde137_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int

LDIFF_SYM2135=Lme_a6 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_PreallocatingToArray_int
	.long LDIFF_SYM2135
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde137_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,217,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_a7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2136=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2136
	.byte 2,141,24,11
	.asciz "count"

LDIFF_SYM2137=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2137
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2138=Lfde138_end - Lfde138_start
	.long LDIFF_SYM2138
Lfde138_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2139=Lme_a7 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2139
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde138_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,231,5
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_a8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2140=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2140
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2141=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2141
	.byte 1,105,11
	.asciz "list"

LDIFF_SYM2142=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2142
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2143=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2143
	.byte 3,141,216,0,11
	.asciz "input"

LDIFF_SYM2144=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2144
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2145=Lfde139_end - Lfde139_start
	.long LDIFF_SYM2145
Lfde139_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2146=Lme_a8 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2146
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153,15,68,154,14
	.align 3
Lfde139_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,130,6
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_a9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2147=LTDIE_237_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2147
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2148=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2148
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM2149=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2149
	.byte 2,141,56,11
	.asciz "item"

LDIFF_SYM2150=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2150
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2151=Lfde140_end - Lfde140_start
	.long LDIFF_SYM2151
Lfde140_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2152=Lme_a9 - System_Linq_Enumerable_SelectIPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2152
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13
	.align 3
Lfde140_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_238:

	.byte 5
	.asciz "_SelectIListIterator`2"

	.byte 64,16
LDIFF_SYM2153=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2153
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2154=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2154
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM2155=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2155
	.byte 2,35,48,6
	.asciz "_enumerator"

LDIFF_SYM2156=LTDIE_234_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2156
	.byte 2,35,56,0,7
	.asciz "_SelectIListIterator`2"

LDIFF_SYM2157=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2157
LTDIE_238_POINTER:

	.byte 13
LDIFF_SYM2158=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2158
LTDIE_238_REFERENCE:

	.byte 14
LDIFF_SYM2159=LTDIE_238 - Ldebug_info_start
	.long LDIFF_SYM2159
	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,212,3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_aa

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2160=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2160
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2161=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2161
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2162=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2162
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2163=Lfde141_end - Lfde141_start
	.long LDIFF_SYM2163
Lfde141_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2164=Lme_aa - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2164
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde141_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,220,3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_ab

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2165=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2165
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2166=Lfde142_end - Lfde142_start
	.long LDIFF_SYM2166
Lfde142_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2167=Lme_ab - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2167
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde142_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,224,3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_ac

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2168=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2168
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2169=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2169
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2170=Lfde143_end - Lfde143_start
	.long LDIFF_SYM2170
Lfde143_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2171=Lme_ac - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2171
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde143_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose"

	.byte 3,246,3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_ad

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2172=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2172
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2173=Lfde144_end - Lfde144_start
	.long LDIFF_SYM2173
Lfde144_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2174=Lme_ad - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2174
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde144_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,132,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_ae

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2175=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2175
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2176=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2176
	.byte 1,105,11
	.asciz "results"

LDIFF_SYM2177=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2177
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2178=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2178
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2179=Lfde145_end - Lfde145_start
	.long LDIFF_SYM2179
Lfde145_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2180=Lme_ae - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2180
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde145_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,149,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_af

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2181=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2181
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2182=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2182
	.byte 1,105,11
	.asciz "results"

LDIFF_SYM2183=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2183
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM2184=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2184
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2185=Lfde146_end - Lfde146_start
	.long LDIFF_SYM2185
Lfde146_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2186=Lme_af - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2186
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde146_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,164,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_b0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2187=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2187
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2188=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2188
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2189=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2189
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM2190=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2190
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2191=Lfde147_end - Lfde147_start
	.long LDIFF_SYM2191
Lfde147_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2192=Lme_b0 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2192
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde147_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 3,180,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_b1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2193=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2193
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2194=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2194
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2195=Lfde148_end - Lfde148_start
	.long LDIFF_SYM2195
Lfde148_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2196=Lme_b1 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2196
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde148_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int"

	.byte 3,184,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_b2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2197=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2197
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2198=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2198
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2199=Lfde149_end - Lfde149_start
	.long LDIFF_SYM2199
Lfde149_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2200=Lme_b2 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2200
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde149_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 3,188,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_b3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2201=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2201
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2202=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2202
	.byte 3,141,216,0,3
	.asciz "param1"

LDIFF_SYM2203=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2203
	.byte 3,141,224,0,11
	.asciz "V_0"

LDIFF_SYM2204=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2204
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2205=Lfde150_end - Lfde150_start
	.long LDIFF_SYM2205
Lfde150_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2206=Lme_b3 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2206
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde150_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 3,200,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_b4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2207=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2207
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2208=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2208
	.byte 3,141,216,0,11
	.asciz "V_0"

LDIFF_SYM2209=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2209
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2210=Lfde151_end - Lfde151_start
	.long LDIFF_SYM2210
Lfde151_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2211=Lme_b4 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2211
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde151_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectIListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 3,212,4
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_b5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2212=LTDIE_238_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2212
	.byte 3,141,216,0,3
	.asciz "param0"

LDIFF_SYM2213=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2213
	.byte 3,141,224,0,11
	.asciz "len"

LDIFF_SYM2214=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2214
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2215=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2215
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2216=Lfde152_end - Lfde152_start
	.long LDIFF_SYM2216
Lfde152_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2217=Lme_b5 - System_Linq_Enumerable_SelectIListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2217
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18
	.align 3
Lfde152_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_239:

	.byte 5
	.asciz "_SelectListIterator`2"

	.byte 80,16
LDIFF_SYM2218=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2218
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2219=LTDIE_225_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2219
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM2220=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2220
	.byte 2,35,48,6
	.asciz "_enumerator"

LDIFF_SYM2221=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2221
	.byte 2,35,56,0,7
	.asciz "_SelectListIterator`2"

LDIFF_SYM2222=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2222
LTDIE_239_POINTER:

	.byte 13
LDIFF_SYM2223=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2223
LTDIE_239_REFERENCE:

	.byte 14
LDIFF_SYM2224=LTDIE_239 - Ldebug_info_start
	.long LDIFF_SYM2224
	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,200,2
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_b6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2225=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2225
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2226=LTDIE_225_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2226
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2227=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2227
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2228=Lfde153_end - Lfde153_start
	.long LDIFF_SYM2228
Lfde153_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2229=Lme_b6 - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_List_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2229
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde153_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,208,2
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_b7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2230=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2230
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2231=Lfde154_end - Lfde154_start
	.long LDIFF_SYM2231
Lfde154_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2232=Lme_b7 - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2232
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde154_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,212,2
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_b8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2233=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2233
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2234=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2234
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2235=Lfde155_end - Lfde155_start
	.long LDIFF_SYM2235
Lfde155_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2236=Lme_b8 - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2236
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,153,14,154,13
	.align 3
Lfde155_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,237,2
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_b9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2237=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2237
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2238=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2238
	.byte 1,105,11
	.asciz "results"

LDIFF_SYM2239=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2239
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2240=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2240
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2241=Lfde156_end - Lfde156_start
	.long LDIFF_SYM2241
Lfde156_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2242=Lme_b9 - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2242
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde156_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,254,2
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_ba

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2243=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2243
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2244=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2244
	.byte 1,105,11
	.asciz "results"

LDIFF_SYM2245=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2245
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM2246=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2246
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2247=Lfde157_end - Lfde157_start
	.long LDIFF_SYM2247
Lfde157_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2248=Lme_ba - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2248
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde157_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,141,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_bb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2249=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2249
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2250=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2250
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2251=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2251
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM2252=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2252
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2253=Lfde158_end - Lfde158_start
	.long LDIFF_SYM2253
Lfde158_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2254=Lme_bb - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2254
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde158_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 3,157,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_bc

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2255=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2255
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2256=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2256
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2257=Lfde159_end - Lfde159_start
	.long LDIFF_SYM2257
Lfde159_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2258=Lme_bc - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2258
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde159_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int"

	.byte 3,161,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_bd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2259=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2259
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2260=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2260
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2261=Lfde160_end - Lfde160_start
	.long LDIFF_SYM2261
Lfde160_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2262=Lme_bd - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2262
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde160_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 3,165,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_be

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2263=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2263
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2264=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2264
	.byte 3,141,216,0,3
	.asciz "param1"

LDIFF_SYM2265=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2265
	.byte 3,141,224,0,11
	.asciz "V_0"

LDIFF_SYM2266=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2266
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2267=Lfde161_end - Lfde161_start
	.long LDIFF_SYM2267
Lfde161_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2268=Lme_be - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2268
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde161_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 3,177,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_bf

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2269=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2269
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2270=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2270
	.byte 3,141,216,0,11
	.asciz "V_0"

LDIFF_SYM2271=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2271
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2272=Lfde162_end - Lfde162_start
	.long LDIFF_SYM2272
Lfde162_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2273=Lme_bf - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2273
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde162_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 3,189,3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_c0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2274=LTDIE_239_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2274
	.byte 3,141,216,0,3
	.asciz "param0"

LDIFF_SYM2275=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2275
	.byte 3,141,224,0,11
	.asciz "len"

LDIFF_SYM2276=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2276
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2277=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2277
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2278=Lfde163_end - Lfde163_start
	.long LDIFF_SYM2278
Lfde163_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2279=Lme_c0 - System_Linq_Enumerable_SelectListIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2279
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18
	.align 3
Lfde163_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_240:

	.byte 5
	.asciz "_SelectArrayIterator`2"

	.byte 56,16
LDIFF_SYM2280=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2280
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2281=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2281
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM2282=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2282
	.byte 2,35,48,0,7
	.asciz "_SelectArrayIterator`2"

LDIFF_SYM2283=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2283
LTDIE_240_POINTER:

	.byte 13
LDIFF_SYM2284=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2284
LTDIE_240_REFERENCE:

	.byte 14
LDIFF_SYM2285=LTDIE_240 - Ldebug_info_start
	.long LDIFF_SYM2285
	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 3,204,1
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_c1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2286=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2286
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2287=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2287
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2288=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2288
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2289=Lfde164_end - Lfde164_start
	.long LDIFF_SYM2289
Lfde164_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2290=Lme_c1 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_CoreLocation_CLPlacemark___System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2290
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde164_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,213,1
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_c2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2291=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2291
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2292=Lfde165_end - Lfde165_start
	.long LDIFF_SYM2292
Lfde165_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2293=Lme_c2 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2293
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde165_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,217,1
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_c3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2294=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2294
	.byte 1,106,11
	.asciz "index"

LDIFF_SYM2295=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2295
	.byte 2,141,48,11
	.asciz "V_1"

LDIFF_SYM2296=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2296
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2297=Lfde166_end - Lfde166_start
	.long LDIFF_SYM2297
Lfde166_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2298=Lme_c3 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2298
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde166_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,237,1
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_c4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2299=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2299
	.byte 1,106,11
	.asciz "results"

LDIFF_SYM2300=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2300
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2301=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2301
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2302=Lfde167_end - Lfde167_start
	.long LDIFF_SYM2302
Lfde167_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2303=Lme_c4 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2303
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde167_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,248,1
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_c5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2304=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2304
	.byte 1,106,11
	.asciz "source"

LDIFF_SYM2305=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2305
	.byte 1,105,11
	.asciz "results"

LDIFF_SYM2306=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2306
	.byte 1,104,11
	.asciz "i"

LDIFF_SYM2307=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2307
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2308=Lfde168_end - Lfde168_start
	.long LDIFF_SYM2308
Lfde168_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2309=Lme_c5 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2309
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde168_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,135,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_c6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2310=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2310
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2311=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2311
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2312=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2312
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM2313=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2313
	.byte 1,104,11
	.asciz "item"

LDIFF_SYM2314=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2314
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2315=Lfde169_end - Lfde169_start
	.long LDIFF_SYM2315
Lfde169_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2316=Lme_c6 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2316
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,151,10,152,9,68,153,8,154,7
	.align 3
Lfde169_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 3,149,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_c7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2317=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2317
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2318=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2318
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2319=Lfde170_end - Lfde170_start
	.long LDIFF_SYM2319
Lfde170_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2320=Lme_c7 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2320
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde170_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int"

	.byte 3,158,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_c8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2321=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2321
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2322=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2322
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2323=LTDIE_226_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2323
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2324=Lfde171_end - Lfde171_start
	.long LDIFF_SYM2324
Lfde171_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2325=Lme_c8 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2325
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5
	.align 3
Lfde171_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 3,162,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_c9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2326=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2326
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2327=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2327
	.byte 3,141,216,0,3
	.asciz "param1"

LDIFF_SYM2328=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2328
	.byte 3,141,224,0,11
	.asciz "V_0"

LDIFF_SYM2329=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2329
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2330=Lfde172_end - Lfde172_start
	.long LDIFF_SYM2330
Lfde172_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2331=Lme_c9 - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2331
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde172_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 3,176,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_ca

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2332=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2332
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2333=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2333
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2334=Lfde173_end - Lfde173_start
	.long LDIFF_SYM2334
Lfde173_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2335=Lme_ca - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2335
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde173_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectArrayIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 3,184,2
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_cb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2336=LTDIE_240_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2336
	.byte 3,141,208,0,3
	.asciz "param0"

LDIFF_SYM2337=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2337
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2338=Lfde174_end - Lfde174_start
	.long LDIFF_SYM2338
Lfde174_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2339=Lme_cb - System_Linq_Enumerable_SelectArrayIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2339
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde174_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/Iterator`1<CoreLocation.CLPlacemark>:Select<Xamarin.Forms.Maps.Position>"
	.asciz "System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position"

	.byte 4,100
	.quad System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.quad Lme_cc

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2340=LTDIE_222_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2340
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2341=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2341
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2342=Lfde175_end - Lfde175_start
	.long LDIFF_SYM2342
Lfde175_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position

LDIFF_SYM2343=Lme_cc - System_Linq_Enumerable_Iterator_1_CoreLocation_CLPlacemark_Select_Xamarin_Forms_Maps_Position_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2343
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde175_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_241:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Position"

	.byte 32,16
LDIFF_SYM2344=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM2344
	.byte 2,35,0,6
	.asciz "<Latitude>k__BackingField"

LDIFF_SYM2345=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM2345
	.byte 2,35,0,6
	.asciz "<Longitude>k__BackingField"

LDIFF_SYM2346=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM2346
	.byte 2,35,8,0,7
	.asciz "Xamarin_Forms_Maps_Position"

LDIFF_SYM2347=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2347
LTDIE_241_POINTER:

	.byte 13
LDIFF_SYM2348=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2348
LTDIE_241_REFERENCE:

	.byte 14
LDIFF_SYM2349=LTDIE_241 - Ldebug_info_start
	.long LDIFF_SYM2349
	.byte 2
	.asciz "(wrapper_managed-to-native)_System.Array:GetGenericValueImpl"
	.asciz "wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_"

	.byte 0,0
	.quad wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_
	.quad Lme_cd

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2350=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2350
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2351=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2351
	.byte 2,141,24,3
	.asciz "param2"

LDIFF_SYM2352=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2352
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2353=Lfde176_end - Lfde176_start
	.long LDIFF_SYM2353
Lfde176_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_

LDIFF_SYM2354=Lme_cd - wrapper_managed_to_native_System_Array_GetGenericValueImpl_System_Array_int_Xamarin_Forms_Maps_Position_
	.long LDIFF_SYM2354
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,76,147,13,148,12,68,149,11,150,10,68,151,9,152,8,68,153,7
	.byte 154,6,68,155,5,156,4
	.align 3
Lfde176_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_242:

	.byte 5
	.asciz "_EmptyInternalEnumerator`1"

	.byte 16,16
LDIFF_SYM2355=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM2355
	.byte 2,35,0,0,7
	.asciz "_EmptyInternalEnumerator`1"

LDIFF_SYM2356=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2356
LTDIE_242_POINTER:

	.byte 13
LDIFF_SYM2357=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2357
LTDIE_242_REFERENCE:

	.byte 14
LDIFF_SYM2358=LTDIE_242 - Ldebug_info_start
	.long LDIFF_SYM2358
	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 2,154,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_ce

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2359=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2359
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2360=Lfde177_end - Lfde177_start
	.long LDIFF_SYM2360
Lfde177_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2361=Lme_ce - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2361
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde177_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 2,159,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_cf

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2362=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2362
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2363=Lfde178_end - Lfde178_start
	.long LDIFF_SYM2363
Lfde178_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2364=Lme_cf - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2364
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde178_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 2,164,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_d0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2365=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2365
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2366=Lfde179_end - Lfde179_start
	.long LDIFF_SYM2366
Lfde179_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM2367=Lme_d0 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM2367
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde179_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 2,170,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_d1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2368=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2368
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2369=Lfde180_end - Lfde180_start
	.long LDIFF_SYM2369
Lfde180_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM2370=Lme_d1 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM2370
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde180_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 2,176,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_d2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2371=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2371
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2372=Lfde181_end - Lfde181_start
	.long LDIFF_SYM2372
Lfde181_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM2373=Lme_d2 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM2373
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde181_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 0,0
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_d3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2374=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2374
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2375=Lfde182_end - Lfde182_start
	.long LDIFF_SYM2375
Lfde182_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2376=Lme_d3 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2376
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde182_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_243:

	.byte 5
	.asciz "System_Collections_Generic_LargeArrayBuilder`1"

	.byte 64,16
LDIFF_SYM2377=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM2377
	.byte 2,35,0,6
	.asciz "_maxCapacity"

LDIFF_SYM2378=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2378
	.byte 2,35,16,6
	.asciz "_first"

LDIFF_SYM2379=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2379
	.byte 2,35,24,6
	.asciz "_buffers"

LDIFF_SYM2380=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2380
	.byte 2,35,32,6
	.asciz "_current"

LDIFF_SYM2381=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2381
	.byte 2,35,48,6
	.asciz "_index"

LDIFF_SYM2382=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2382
	.byte 2,35,56,6
	.asciz "_count"

LDIFF_SYM2383=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2383
	.byte 2,35,60,0,7
	.asciz "System_Collections_Generic_LargeArrayBuilder`1"

LDIFF_SYM2384=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2384
LTDIE_243_POINTER:

	.byte 13
LDIFF_SYM2385=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2385
LTDIE_243_REFERENCE:

	.byte 14
LDIFF_SYM2386=LTDIE_243 - Ldebug_info_start
	.long LDIFF_SYM2386
	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray"

	.byte 6,185,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_d4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2387=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2387
	.byte 1,106,11
	.asciz "array"

LDIFF_SYM2388=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2388
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2389=Lfde183_end - Lfde183_start
	.long LDIFF_SYM2389
Lfde183_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2390=Lme_d4 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2390
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde183_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool"

	.byte 6,86
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
	.quad Lme_d5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2391=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2391
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2392=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2392
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2393=Lfde184_end - Lfde184_start
	.long LDIFF_SYM2393
Lfde184_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool

LDIFF_SYM2394=Lme_d5 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_bool
	.long LDIFF_SYM2394
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde184_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int"

	.byte 6,101
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
	.quad Lme_d6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2395=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2395
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2396=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2396
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM2397=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2397
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2398=Lfde185_end - Lfde185_start
	.long LDIFF_SYM2398
Lfde185_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int

LDIFF_SYM2399=Lme_d6 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__ctor_int
	.long LDIFF_SYM2399
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde185_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:get_Count"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count"

	.byte 6,112
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count
	.quad Lme_d7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2400=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2400
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2401=Lfde186_end - Lfde186_start
	.long LDIFF_SYM2401
Lfde186_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count

LDIFF_SYM2402=Lme_d7 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_get_Count
	.long LDIFF_SYM2402
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde186_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:Add"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position"

	.byte 6,127
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
	.quad Lme_d8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2403=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2403
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2404=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2404
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM2405=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2405
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2406=Lfde187_end - Lfde187_start
	.long LDIFF_SYM2406
Lfde187_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position

LDIFF_SYM2407=Lme_d8 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2407
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde187_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_244:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerator`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerator`1"

LDIFF_SYM2408=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2408
LTDIE_244_POINTER:

	.byte 13
LDIFF_SYM2409=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2409
LTDIE_244_REFERENCE:

	.byte 14
LDIFF_SYM2410=LTDIE_244 - Ldebug_info_start
	.long LDIFF_SYM2410
	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:AddRange"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 6,148,1
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_d9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2411=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2411
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2412=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2412
	.byte 1,106,11
	.asciz "enumerator"

LDIFF_SYM2413=LTDIE_244_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2413
	.byte 2,141,56,11
	.asciz "destination"

LDIFF_SYM2414=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2414
	.byte 1,106,11
	.asciz "index"

LDIFF_SYM2415=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2415
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2416=Lfde188_end - Lfde188_start
	.long LDIFF_SYM2416
Lfde188_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2417=Lme_d9 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AddRange_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2417
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,68,154,12
	.align 3
Lfde188_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:CopyTo"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int"

	.byte 6,189,1
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
	.quad Lme_da

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2418=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2418
	.byte 1,103,3
	.asciz "param0"

LDIFF_SYM2419=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2419
	.byte 1,104,3
	.asciz "param1"

LDIFF_SYM2420=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2420
	.byte 1,105,3
	.asciz "param2"

LDIFF_SYM2421=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2421
	.byte 1,106,11
	.asciz "i"

LDIFF_SYM2422=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2422
	.byte 1,102,11
	.asciz "buffer"

LDIFF_SYM2423=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2423
	.byte 1,101,11
	.asciz "toCopy"

LDIFF_SYM2424=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2424
	.byte 1,100,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2425=Lfde189_end - Lfde189_start
	.long LDIFF_SYM2425
Lfde189_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int

LDIFF_SYM2426=Lme_da - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int_int
	.long LDIFF_SYM2426
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,147,8,148,7,68,149,6,150,5,68,151,4,152,3,68,153,2,154
	.byte 1
	.align 3
Lfde189_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:CopyTo"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int"

	.byte 6,0
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int
	.quad Lme_db

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2427=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2427
	.byte 1,103,3
	.asciz "param0"

LDIFF_SYM2428=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2428
	.byte 3,141,200,0,3
	.asciz "param1"

LDIFF_SYM2429=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2429
	.byte 1,104,3
	.asciz "param2"

LDIFF_SYM2430=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2430
	.byte 1,105,3
	.asciz "param3"

LDIFF_SYM2431=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2431
	.byte 1,106,11
	.asciz "CS$<>8__locals0"

LDIFF_SYM2432=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2432
	.byte 3,141,240,0,11
	.asciz "row"

LDIFF_SYM2433=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2433
	.byte 1,106,11
	.asciz "column"

LDIFF_SYM2434=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2434
	.byte 1,105,11
	.asciz "buffer"

LDIFF_SYM2435=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2435
	.byte 1,104,11
	.asciz "copied"

LDIFF_SYM2436=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2436
	.byte 1,102,11
	.asciz "V_5"

LDIFF_SYM2437=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2437
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2438=Lfde190_end - Lfde190_start
	.long LDIFF_SYM2438
Lfde190_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int

LDIFF_SYM2439=Lme_db - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_CopyTo_System_Collections_Generic_CopyPosition_Xamarin_Forms_Maps_Position___int_int
	.long LDIFF_SYM2439
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,150,16,151,15,68,152,14,153,13,68,154,12
	.align 3
Lfde190_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:GetBuffer"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int"

	.byte 6,164,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
	.quad Lme_dc

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2440=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2440
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2441=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2441
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2442=Lfde191_end - Lfde191_start
	.long LDIFF_SYM2442
Lfde191_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int

LDIFF_SYM2443=Lme_dc - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_GetBuffer_int
	.long LDIFF_SYM2443
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde191_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:SlowAdd"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position"

	.byte 6,178,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position
	.quad Lme_dd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2444=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2444
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2445=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2445
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2446=Lfde192_end - Lfde192_start
	.long LDIFF_SYM2446
Lfde192_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position

LDIFF_SYM2447=Lme_dd - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_SlowAdd_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2447
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,154,11
	.align 3
Lfde192_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:TryMove"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___"

	.byte 6,203,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
	.quad Lme_de

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2448=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2448
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2449=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2449
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2450=Lfde193_end - Lfde193_start
	.long LDIFF_SYM2450
Lfde193_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___

LDIFF_SYM2451=Lme_de - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_TryMove_Xamarin_Forms_Maps_Position___
	.long LDIFF_SYM2451
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde193_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:AllocateBuffer"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer"

	.byte 6,220,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
	.quad Lme_df

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2452=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2452
	.byte 1,106,11
	.asciz "nextCapacity"

LDIFF_SYM2453=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2453
	.byte 1,104,11
	.asciz "nextCapacity"

LDIFF_SYM2454=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2454
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2455=Lfde194_end - Lfde194_start
	.long LDIFF_SYM2455
Lfde194_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer

LDIFF_SYM2456=Lme_df - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position_AllocateBuffer
	.long LDIFF_SYM2456
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3,68,154,2
	.align 3
Lfde194_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_245:

	.byte 5
	.asciz "_<>c__DisplayClass15_0"

	.byte 40,16
LDIFF_SYM2457=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM2457
	.byte 2,35,0,6
	.asciz "count"

LDIFF_SYM2458=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2458
	.byte 2,35,16,6
	.asciz "array"

LDIFF_SYM2459=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2459
	.byte 2,35,24,6
	.asciz "arrayIndex"

LDIFF_SYM2460=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2460
	.byte 2,35,32,0,7
	.asciz "_<>c__DisplayClass15_0"

LDIFF_SYM2461=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2461
LTDIE_245_POINTER:

	.byte 13
LDIFF_SYM2462=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2462
LTDIE_245_REFERENCE:

	.byte 14
LDIFF_SYM2463=LTDIE_245 - Ldebug_info_start
	.long LDIFF_SYM2463
	.byte 2
	.asciz "System.Collections.Generic.LargeArrayBuilder`1<Xamarin.Forms.Maps.Position>:<CopyTo>g__CopyToCore_15_0"
	.asciz "System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_"

	.byte 6,143,2
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
	.quad Lme_e0

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2464=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2464
	.byte 2,141,40,3
	.asciz "param1"

LDIFF_SYM2465=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2465
	.byte 2,141,48,3
	.asciz "param2"

LDIFF_SYM2466=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2466
	.byte 1,106,11
	.asciz "copyCount"

LDIFF_SYM2467=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2467
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2468=Lfde195_end - Lfde195_start
	.long LDIFF_SYM2468
Lfde195_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_

LDIFF_SYM2469=Lme_e0 - System_Collections_Generic_LargeArrayBuilder_1_Xamarin_Forms_Maps_Position__CopyTog__CopyToCore_15_0_Xamarin_Forms_Maps_Position___int_System_Collections_Generic_LargeArrayBuilder_1__c__DisplayClass15_0_Xamarin_Forms_Maps_Position_
	.long LDIFF_SYM2469
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,154,4
	.align 3
Lfde195_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:AddWithResize"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position"

	.byte 7,249,1
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
	.quad Lme_e1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2470=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2470
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2471=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2471
	.byte 2,141,24,11
	.asciz "size"

LDIFF_SYM2472=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2472
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2473=Lfde196_end - Lfde196_start
	.long LDIFF_SYM2473
Lfde196_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position

LDIFF_SYM2474=Lme_e1 - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2474
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,154,12
	.align 3
Lfde196_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Add<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 2,83
	.quad System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_e9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2475=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2475
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2476=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2476
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2477=Lfde197_end - Lfde197_start
	.long LDIFF_SYM2477
Lfde197_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM2478=Lme_e9 - System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2478
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde197_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Remove<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 2,88
	.quad System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_ea

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2479=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2479
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2480=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2480
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2481=Lfde198_end - Lfde198_start
	.long LDIFF_SYM2481
Lfde198_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM2482=Lme_ea - System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2482
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde198_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Contains<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 2,93
	.quad System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_eb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2483=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2483
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2484=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2484
	.byte 2,141,40,11
	.asciz "length"

LDIFF_SYM2485=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2485
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2486=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2486
	.byte 1,104,11
	.asciz "value"

LDIFF_SYM2487=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2487
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2488=Lfde199_end - Lfde199_start
	.long LDIFF_SYM2488
Lfde199_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM2489=Lme_eb - System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2489
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18,153,17,68,154,16
	.align 3
Lfde199_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_CopyTo<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int"

	.byte 2,118
	.quad System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
	.quad Lme_ec

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2490=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2490
	.byte 2,141,24,3
	.asciz "param0"

LDIFF_SYM2491=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2491
	.byte 2,141,32,3
	.asciz "param1"

LDIFF_SYM2492=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2492
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2493=Lfde200_end - Lfde200_start
	.long LDIFF_SYM2493
Lfde200_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int

LDIFF_SYM2494=Lme_ec - System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
	.long LDIFF_SYM2494
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6
	.align 3
Lfde200_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_246:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 112,16
LDIFF_SYM2495=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM2495
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM2496=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2496
LTDIE_246_POINTER:

	.byte 13
LDIFF_SYM2497=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2497
LTDIE_246_REFERENCE:

	.byte 14
LDIFF_SYM2498=LTDIE_246 - Ldebug_info_start
	.long LDIFF_SYM2498
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<Xamarin.Forms.Maps.Position>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
	.quad Lme_f1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2499=LTDIE_246_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2499
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2500=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2500
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM2501=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2501
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2502=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2502
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2503=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2503
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2504=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2504
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2505=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2505
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM2506=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2506
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2507=Lfde201_end - Lfde201_start
	.long LDIFF_SYM2507
Lfde201_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position

LDIFF_SYM2508=Lme_f1 - wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2508
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde201_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_247:

	.byte 5
	.asciz "System_Action`1"

	.byte 112,16
LDIFF_SYM2509=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM2509
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM2510=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2510
LTDIE_247_POINTER:

	.byte 13
LDIFF_SYM2511=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2511
LTDIE_247_REFERENCE:

	.byte 14
LDIFF_SYM2512=LTDIE_247 - Ldebug_info_start
	.long LDIFF_SYM2512
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<Xamarin.Forms.Maps.Position>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
	.quad Lme_f6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2513=LTDIE_247_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2513
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2514=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2514
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM2515=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2515
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2516=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2516
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2517=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2517
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2518=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2518
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2519=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2519
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2520=Lfde202_end - Lfde202_start
	.long LDIFF_SYM2520
Lfde202_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position

LDIFF_SYM2521=Lme_f6 - wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2521
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde202_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_248:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 112,16
LDIFF_SYM2522=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM2522
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM2523=LTDIE_248 - Ldebug_info_start
	.long LDIFF_SYM2523
LTDIE_248_POINTER:

	.byte 13
LDIFF_SYM2524=LTDIE_248 - Ldebug_info_start
	.long LDIFF_SYM2524
LTDIE_248_REFERENCE:

	.byte 14
LDIFF_SYM2525=LTDIE_248 - Ldebug_info_start
	.long LDIFF_SYM2525
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<Xamarin.Forms.Maps.Position>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_fd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2526=LTDIE_248_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2526
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2527=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2527
	.byte 2,141,48,3
	.asciz "param1"

LDIFF_SYM2528=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2528
	.byte 3,141,240,0,11
	.asciz "V_0"

LDIFF_SYM2529=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2529
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2530=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2530
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2531=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2531
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2532=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2532
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2533=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2533
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM2534=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2534
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2535=Lfde203_end - Lfde203_start
	.long LDIFF_SYM2535
Lfde203_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM2536=Lme_fd - wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2536
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,151,22,152,21,68,153,20,154,19
	.align 3
Lfde203_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 7,34
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_fe

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2537=Lfde204_end - Lfde204_start
	.long LDIFF_SYM2537
Lfde204_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM2538=Lme_fe - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM2538
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde204_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_249:

	.byte 5
	.asciz "_WhereEnumerableIterator`1"

	.byte 64,16
LDIFF_SYM2539=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2539
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2540=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2540
	.byte 2,35,40,6
	.asciz "_predicate"

LDIFF_SYM2541=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2541
	.byte 2,35,48,6
	.asciz "_enumerator"

LDIFF_SYM2542=LTDIE_244_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2542
	.byte 2,35,56,0,7
	.asciz "_WhereEnumerableIterator`1"

LDIFF_SYM2543=LTDIE_249 - Ldebug_info_start
	.long LDIFF_SYM2543
LTDIE_249_POINTER:

	.byte 13
LDIFF_SYM2544=LTDIE_249 - Ldebug_info_start
	.long LDIFF_SYM2544
LTDIE_249_REFERENCE:

	.byte 14
LDIFF_SYM2545=LTDIE_249 - Ldebug_info_start
	.long LDIFF_SYM2545
	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool"

	.byte 8,87
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.quad Lme_ff

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2546=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2546
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2547=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2547
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2548=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2548
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2549=Lfde205_end - Lfde205_start
	.long LDIFF_SYM2549
Lfde205_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool

LDIFF_SYM2550=Lme_ff - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.long LDIFF_SYM2550
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde205_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<Xamarin.Forms.Maps.Position,_bool>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.quad Lme_104

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2551=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2551
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM2552=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2552
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM2553=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2553
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2554=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2554
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2555=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2555
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2556=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2556
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2557=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2557
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM2558=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2558
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2559=Lfde206_end - Lfde206_start
	.long LDIFF_SYM2559
Lfde206_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position

LDIFF_SYM2560=Lme_104 - wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_bool_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2560
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde206_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone"

	.byte 8,95
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_105

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2561=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2561
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2562=Lfde207_end - Lfde207_start
	.long LDIFF_SYM2562
Lfde207_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2563=Lme_105 - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2563
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde207_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 8,99
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_106

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2564=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2564
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2565=Lfde208_end - Lfde208_start
	.long LDIFF_SYM2565
Lfde208_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2566=Lme_106 - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2566
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde208_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 8,110
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_107

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2567=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2567
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2568=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2568
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2569=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2569
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM2570=LTDIE_244_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2570
	.byte 2,141,48,11
	.asciz "item"

LDIFF_SYM2571=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2571
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2572=Lfde209_end - Lfde209_start
	.long LDIFF_SYM2572
Lfde209_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2573=Lme_107 - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2573
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12,154,11
	.align 3
Lfde209_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 8,133,1
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_108

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2574=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2574
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2575=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2575
	.byte 1,105,11
	.asciz "item"

LDIFF_SYM2576=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2576
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2577=Lfde210_end - Lfde210_start
	.long LDIFF_SYM2577
Lfde210_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2578=Lme_108 - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2578
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde210_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray"

	.byte 8,162,1
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_109

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2579=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2579
	.byte 1,106,11
	.asciz "builder"

LDIFF_SYM2580=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2580
	.byte 3,141,200,0,11
	.asciz "V_1"

LDIFF_SYM2581=LTDIE_244_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2581
	.byte 3,141,248,0,11
	.asciz "item"

LDIFF_SYM2582=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2582
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2583=Lfde211_end - Lfde211_start
	.long LDIFF_SYM2583
Lfde211_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2584=Lme_109 - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2584
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,152,22,153,21,68,154,20
	.align 3
Lfde211_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList"

	.byte 8,177,1
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_10a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2585=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2585
	.byte 1,106,11
	.asciz "list"

LDIFF_SYM2586=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2586
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM2587=LTDIE_244_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2587
	.byte 3,141,216,0,11
	.asciz "item"

LDIFF_SYM2588=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2588
	.byte 3,141,200,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2589=Lfde212_end - Lfde212_start
	.long LDIFF_SYM2589
Lfde212_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2590=Lme_10a - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2590
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153,15,68,154,14
	.align 3
Lfde212_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/WhereEnumerableIterator`1<Xamarin.Forms.Maps.Position>:Where"
	.asciz "System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool"

	.byte 8,191,1
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.quad Lme_10b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2591=LTDIE_249_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2591
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2592=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2592
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2593=Lfde213_end - Lfde213_start
	.long LDIFF_SYM2593
Lfde213_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool

LDIFF_SYM2594=Lme_10b - System_Linq_Enumerable_WhereEnumerableIterator_1_Xamarin_Forms_Maps_Position_Where_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.long LDIFF_SYM2594
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde213_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_250:

	.byte 5
	.asciz "System_Linq_EmptyPartition`1"

	.byte 16,16
LDIFF_SYM2595=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM2595
	.byte 2,35,0,0,7
	.asciz "System_Linq_EmptyPartition`1"

LDIFF_SYM2596=LTDIE_250 - Ldebug_info_start
	.long LDIFF_SYM2596
LTDIE_250_POINTER:

	.byte 13
LDIFF_SYM2597=LTDIE_250 - Ldebug_info_start
	.long LDIFF_SYM2597
LTDIE_250_REFERENCE:

	.byte 14
LDIFF_SYM2598=LTDIE_250 - Ldebug_info_start
	.long LDIFF_SYM2598
	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 5,95
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_10c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2599=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2599
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2600=Lfde214_end - Lfde214_start
	.long LDIFF_SYM2600
Lfde214_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2601=Lme_10c - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2601
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde214_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:GetEnumerator"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator"

	.byte 5,99
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.quad Lme_10d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2602=LTDIE_250_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2602
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2603=Lfde215_end - Lfde215_start
	.long LDIFF_SYM2603
Lfde215_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator

LDIFF_SYM2604=Lme_10d - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.long LDIFF_SYM2604
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde215_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerable.GetEnumerator"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator"

	.byte 5,101
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.quad Lme_10e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2605=LTDIE_250_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2605
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2606=Lfde216_end - Lfde216_start
	.long LDIFF_SYM2606
Lfde216_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator

LDIFF_SYM2607=Lme_10e - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.long LDIFF_SYM2607
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde216_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 5,103
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_10f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2608=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2608
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2609=Lfde217_end - Lfde217_start
	.long LDIFF_SYM2609
Lfde217_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2610=Lme_10f - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2610
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde217_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 5,106
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_110

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2611=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2611
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM2612=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2612
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2613=Lfde218_end - Lfde218_start
	.long LDIFF_SYM2613
Lfde218_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM2614=Lme_110 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM2614
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde218_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 5,109
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_111

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2615=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2615
	.byte 0,11
	.asciz "V_0"

LDIFF_SYM2616=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2616
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2617=Lfde219_end - Lfde219_start
	.long LDIFF_SYM2617
Lfde219_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM2618=Lme_111 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM2618
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde219_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 5,111
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_112

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2619=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2619
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2620=Lfde220_end - Lfde220_start
	.long LDIFF_SYM2620
Lfde220_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM2621=Lme_112 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM2621
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde220_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:System.IDisposable.Dispose"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose"

	.byte 5,116
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose
	.quad Lme_113

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2622=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2622
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2623=Lfde221_end - Lfde221_start
	.long LDIFF_SYM2623
Lfde221_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose

LDIFF_SYM2624=Lme_113 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_System_IDisposable_Dispose
	.long LDIFF_SYM2624
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde221_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 5,118
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_114

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2625=LTDIE_250_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2625
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2626=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2626
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2627=Lfde222_end - Lfde222_start
	.long LDIFF_SYM2627
Lfde222_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2628=Lme_114 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2628
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde222_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int"

	.byte 5,120
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_115

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2629=LTDIE_250_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2629
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2630=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2630
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2631=Lfde223_end - Lfde223_start
	.long LDIFF_SYM2631
Lfde223_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2632=Lme_115 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2632
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde223_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 5,124
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_116

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2633=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2633
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2634=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2634
	.byte 0,3
	.asciz "param1"

LDIFF_SYM2635=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2635
	.byte 3,141,224,0,11
	.asciz "V_0"

LDIFF_SYM2636=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2636
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2637=Lfde224_end - Lfde224_start
	.long LDIFF_SYM2637
Lfde224_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2638=Lme_116 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2638
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde224_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 5,130,1
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_117

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2639=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2639
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2640=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2640
	.byte 3,141,216,0,11
	.asciz "V_0"

LDIFF_SYM2641=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2641
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2642=Lfde225_end - Lfde225_start
	.long LDIFF_SYM2642
Lfde225_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2643=Lme_117 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2643
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde225_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 5,136,1
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_118

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2644=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2644
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2645=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2645
	.byte 3,141,216,0,11
	.asciz "V_0"

LDIFF_SYM2646=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2646
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2647=Lfde226_end - Lfde226_start
	.long LDIFF_SYM2647
Lfde226_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2648=Lme_118 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2648
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde226_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray"

	.byte 5,140,1
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_119

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2649=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2649
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2650=Lfde227_end - Lfde227_start
	.long LDIFF_SYM2650
Lfde227_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2651=Lme_119 - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2651
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde227_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList"

	.byte 5,142,1
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_11a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2652=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2652
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2653=Lfde228_end - Lfde228_start
	.long LDIFF_SYM2653
Lfde228_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2654=Lme_11a - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2654
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde228_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.EmptyPartition`1<Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 5,144,1
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_11b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2655=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2655
	.byte 0,3
	.asciz "param0"

LDIFF_SYM2656=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2656
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2657=Lfde229_end - Lfde229_start
	.long LDIFF_SYM2657
Lfde229_start:

	.long 0
	.align 3
	.quad System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2658=Lme_11b - System_Linq_EmptyPartition_1_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2658
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde229_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.EmptyArray`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 9,33
	.quad System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_11c

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2659=Lfde230_end - Lfde230_start
	.long LDIFF_SYM2659
Lfde230_start:

	.long 0
	.align 3
	.quad System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM2660=Lme_11c - System_EmptyArray_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM2660
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde230_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:Empty<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_Empty_Xamarin_Forms_Maps_Position"

	.byte 2,135,5
	.quad System_Array_Empty_Xamarin_Forms_Maps_Position
	.quad Lme_11d

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2661=Lfde231_end - Lfde231_start
	.long LDIFF_SYM2661
Lfde231_start:

	.long 0
	.align 3
	.quad System_Array_Empty_Xamarin_Forms_Maps_Position

LDIFF_SYM2662=Lme_11d - System_Array_Empty_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2662
	.long 0
	.byte 12,31,0,68,14,16,157,2,158,1,68,13,29
	.align 3
Lfde231_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int"

	.byte 7,49
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int
	.quad Lme_11e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2663=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2663
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2664=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2664
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2665=Lfde232_end - Lfde232_start
	.long LDIFF_SYM2665
Lfde232_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int

LDIFF_SYM2666=Lme_11e - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_int
	.long LDIFF_SYM2666
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde232_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_251:

	.byte 5
	.asciz "_SelectListPartitionIterator`2"

	.byte 64,16
LDIFF_SYM2667=LTDIE_233 - Ldebug_info_start
	.long LDIFF_SYM2667
	.byte 2,35,0,6
	.asciz "_source"

LDIFF_SYM2668=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2668
	.byte 2,35,40,6
	.asciz "_selector"

LDIFF_SYM2669=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2669
	.byte 2,35,48,6
	.asciz "_minIndexInclusive"

LDIFF_SYM2670=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2670
	.byte 2,35,56,6
	.asciz "_maxIndexInclusive"

LDIFF_SYM2671=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2671
	.byte 2,35,60,0,7
	.asciz "_SelectListPartitionIterator`2"

LDIFF_SYM2672=LTDIE_251 - Ldebug_info_start
	.long LDIFF_SYM2672
LTDIE_251_POINTER:

	.byte 13
LDIFF_SYM2673=LTDIE_251 - Ldebug_info_start
	.long LDIFF_SYM2673
LTDIE_251_REFERENCE:

	.byte 14
LDIFF_SYM2674=LTDIE_251 - Ldebug_info_start
	.long LDIFF_SYM2674
	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int"

	.byte 3,154,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int
	.quad Lme_11f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2675=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2675
	.byte 1,102,3
	.asciz "param0"

LDIFF_SYM2676=LTDIE_223_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2676
	.byte 2,141,24,3
	.asciz "param1"

LDIFF_SYM2677=LTDIE_220_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2677
	.byte 2,141,32,3
	.asciz "param2"

LDIFF_SYM2678=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2678
	.byte 2,141,40,3
	.asciz "param3"

LDIFF_SYM2679=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2679
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2680=Lfde233_end - Lfde233_start
	.long LDIFF_SYM2680
Lfde233_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int

LDIFF_SYM2681=Lme_11f - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_CoreLocation_CLPlacemark_System_Func_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_int_int
	.long LDIFF_SYM2681
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6
	.align 3
Lfde233_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Clone"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone"

	.byte 3,167,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.quad Lme_120

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2682=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2682
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2683=Lfde234_end - Lfde234_start
	.long LDIFF_SYM2683
Lfde234_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone

LDIFF_SYM2684=Lme_120 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Clone
	.long LDIFF_SYM2684
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,154,8
	.align 3
Lfde234_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 3,174,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_121

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2685=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2685
	.byte 1,106,11
	.asciz "index"

LDIFF_SYM2686=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2686
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2687=Lfde235_end - Lfde235_start
	.long LDIFF_SYM2687
Lfde235_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2688=Lme_121 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2688
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde235_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Skip"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int"

	.byte 3,192,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.quad Lme_122

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2689=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2689
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2690=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2690
	.byte 2,141,40,11
	.asciz "minIndex"

LDIFF_SYM2691=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2691
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2692=LTDIE_226_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2692
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2693=Lfde236_end - Lfde236_start
	.long LDIFF_SYM2693
Lfde236_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int

LDIFF_SYM2694=Lme_122 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Skip_int
	.long LDIFF_SYM2694
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde236_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:Take"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int"

	.byte 3,198,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.quad Lme_123

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2695=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2695
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2696=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2696
	.byte 1,106,11
	.asciz "maxIndex"

LDIFF_SYM2697=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2697
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2698=Lfde237_end - Lfde237_start
	.long LDIFF_SYM2698
Lfde237_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int

LDIFF_SYM2699=Lme_123 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_Take_int
	.long LDIFF_SYM2699
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5
	.align 3
Lfde237_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetElementAt"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_"

	.byte 3,204,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.quad Lme_124

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2700=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2700
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2701=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2701
	.byte 3,141,216,0,3
	.asciz "param1"

LDIFF_SYM2702=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2702
	.byte 3,141,224,0,11
	.asciz "V_0"

LDIFF_SYM2703=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2703
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2704=Lfde238_end - Lfde238_start
	.long LDIFF_SYM2704
Lfde238_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_

LDIFF_SYM2705=Lme_124 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetElementAt_int_bool_
	.long LDIFF_SYM2705
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,152,18
	.align 3
Lfde238_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetFirst"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_"

	.byte 3,216,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.quad Lme_125

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2706=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2706
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2707=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2707
	.byte 3,141,216,0,11
	.asciz "V_0"

LDIFF_SYM2708=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2708
	.byte 3,141,240,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2709=Lfde239_end - Lfde239_start
	.long LDIFF_SYM2709
Lfde239_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_

LDIFF_SYM2710=Lme_125 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetFirst_bool_
	.long LDIFF_SYM2710
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,153,18
	.align 3
Lfde239_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:TryGetLast"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_"

	.byte 3,228,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.quad Lme_126

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2711=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2711
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2712=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2712
	.byte 1,106,11
	.asciz "lastIndex"

LDIFF_SYM2713=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2713
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2714=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2714
	.byte 3,141,128,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2715=Lfde240_end - Lfde240_start
	.long LDIFF_SYM2715
Lfde240_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_

LDIFF_SYM2716=Lme_126 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_TryGetLast_bool_
	.long LDIFF_SYM2716
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,151,18,152,17,68,153,16,154,15
	.align 3
Lfde240_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:get_Count"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count"

	.byte 3,243,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count
	.quad Lme_127

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2717=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2717
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2718=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2718
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2719=Lfde241_end - Lfde241_start
	.long LDIFF_SYM2719
Lfde241_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count

LDIFF_SYM2720=Lme_127 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_get_Count
	.long LDIFF_SYM2720
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3,68,154,2
	.align 3
Lfde241_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToArray"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray"

	.byte 3,255,6
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.quad Lme_128

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2721=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2721
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2722=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2722
	.byte 1,105,11
	.asciz "array"

LDIFF_SYM2723=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2723
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2724=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2724
	.byte 1,104,11
	.asciz "curIdx"

LDIFF_SYM2725=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2725
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2726=Lfde242_end - Lfde242_start
	.long LDIFF_SYM2726
Lfde242_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray

LDIFF_SYM2727=Lme_128 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToArray
	.long LDIFF_SYM2727
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,151,10,152,9,68,153,8,154,7
	.align 3
Lfde242_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:ToList"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList"

	.byte 3,144,7
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.quad Lme_129

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2728=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2728
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2729=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2729
	.byte 1,105,11
	.asciz "list"

LDIFF_SYM2730=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2730
	.byte 1,104,11
	.asciz "end"

LDIFF_SYM2731=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2731
	.byte 1,103,11
	.asciz "i"

LDIFF_SYM2732=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2732
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2733=Lfde243_end - Lfde243_start
	.long LDIFF_SYM2733
Lfde243_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList

LDIFF_SYM2734=Lme_129 - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_ToList
	.long LDIFF_SYM2734
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,148,14,149,13,68,150,12,151,11,68,152,10,153,9,68,154,8
	.align 3
Lfde243_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Enumerable/SelectListPartitionIterator`2<CoreLocation.CLPlacemark,_Xamarin.Forms.Maps.Position>:GetCount"
	.asciz "System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool"

	.byte 3,165,7
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.quad Lme_12a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2735=LTDIE_251_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2735
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2736=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM2736
	.byte 1,106,11
	.asciz "count"

LDIFF_SYM2737=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2737
	.byte 1,104,11
	.asciz "end"

LDIFF_SYM2738=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2738
	.byte 1,106,11
	.asciz "i"

LDIFF_SYM2739=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2739
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2740=Lfde244_end - Lfde244_start
	.long LDIFF_SYM2740
Lfde244_start:

	.long 0
	.align 3
	.quad System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool

LDIFF_SYM2741=Lme_12a - System_Linq_Enumerable_SelectListPartitionIterator_2_CoreLocation_CLPlacemark_Xamarin_Forms_Maps_Position_GetCount_bool
	.long LDIFF_SYM2741
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,151,10,152,9,68,153,8,154,7
	.align 3
Lfde244_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:EnsureCapacity"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int"

	.byte 7,190,3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
	.quad Lme_12b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2742=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2742
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2743=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2743
	.byte 2,141,40,11
	.asciz "newCapacity"

LDIFF_SYM2744=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2744
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2745=Lfde245_end - Lfde245_start
	.long LDIFF_SYM2745
Lfde245_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int

LDIFF_SYM2746=Lme_12b - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
	.long LDIFF_SYM2746
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2
	.align 3
Lfde245_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Utilities:CombinePredicates<Xamarin.Forms.Maps.Position>"
	.asciz "System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool"

	.byte 10,0
	.quad System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.quad Lme_12c

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2747=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2747
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2748=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2748
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2749=Lfde246_end - Lfde246_start
	.long LDIFF_SYM2749
Lfde246_start:

	.long 0
	.align 3
	.quad System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool

LDIFF_SYM2750=Lme_12c - System_Linq_Utilities_CombinePredicates_Xamarin_Forms_Maps_Position_System_Func_2_Xamarin_Forms_Maps_Position_bool_System_Func_2_Xamarin_Forms_Maps_Position_bool
	.long LDIFF_SYM2750
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde246_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:set_Capacity"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int"

	.byte 7,104
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
	.quad Lme_12d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2751=LTDIE_235_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2751
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2752=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2752
	.byte 1,106,11
	.asciz "newItems"

LDIFF_SYM2753=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2753
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2754=Lfde247_end - Lfde247_start
	.long LDIFF_SYM2754
Lfde247_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int

LDIFF_SYM2755=Lme_12d - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
	.long LDIFF_SYM2755
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,154,1
	.align 3
Lfde247_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_252:

	.byte 5
	.asciz "_<>c__DisplayClass1_0`1"

	.byte 32,16
LDIFF_SYM2756=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM2756
	.byte 2,35,0,6
	.asciz "predicate1"

LDIFF_SYM2757=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2757
	.byte 2,35,16,6
	.asciz "predicate2"

LDIFF_SYM2758=LTDIE_236_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2758
	.byte 2,35,24,0,7
	.asciz "_<>c__DisplayClass1_0`1"

LDIFF_SYM2759=LTDIE_252 - Ldebug_info_start
	.long LDIFF_SYM2759
LTDIE_252_POINTER:

	.byte 13
LDIFF_SYM2760=LTDIE_252 - Ldebug_info_start
	.long LDIFF_SYM2760
LTDIE_252_REFERENCE:

	.byte 14
LDIFF_SYM2761=LTDIE_252 - Ldebug_info_start
	.long LDIFF_SYM2761
	.byte 2
	.asciz "System.Linq.Utilities/<>c__DisplayClass1_0`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 0,0
	.quad System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_12e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2762=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2762
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2763=Lfde248_end - Lfde248_start
	.long LDIFF_SYM2763
Lfde248_start:

	.long 0
	.align 3
	.quad System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2764=Lme_12e - System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2764
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde248_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Linq.Utilities/<>c__DisplayClass1_0`1<Xamarin.Forms.Maps.Position>:<CombinePredicates>b__0"
	.asciz "System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position"

	.byte 10,58
	.quad System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position
	.quad Lme_12f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2765=LTDIE_252_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2765
	.byte 2,141,16,3
	.asciz "param0"

LDIFF_SYM2766=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2766
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2767=Lfde249_end - Lfde249_start
	.long LDIFF_SYM2767
Lfde249_start:

	.long 0
	.align 3
	.quad System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position

LDIFF_SYM2768=Lme_12f - System_Linq_Utilities__c__DisplayClass1_0_1_Xamarin_Forms_Maps_Position__CombinePredicatesb__0_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2768
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde249_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:
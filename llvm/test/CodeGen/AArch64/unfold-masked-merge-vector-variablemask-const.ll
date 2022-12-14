; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-unknown-linux-gnu < %s | FileCheck %s

; ============================================================================ ;
; Various cases with %x and/or %y being a constant
; ============================================================================ ;

define <4 x i32> @out_constant_varx_mone(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_varx_mone:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and v0.16b, v2.16b, v0.16b
; CHECK-NEXT:    orn v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %mask, %x
  %my = and <4 x i32> %notmask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

define <4 x i32> @in_constant_varx_mone(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_varx_mone:
; CHECK:       // %bb.0:
; CHECK-NEXT:    bic v0.16b, v2.16b, v0.16b
; CHECK-NEXT:    mvn v0.16b, v0.16b
; CHECK-NEXT:    ret
  %n0 = xor <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1> ; %x
  %n1 = and <4 x i32> %n0, %mask
  %r = xor <4 x i32> %n1, <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @out_constant_varx_mone_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_varx_mone_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %notmask, %x
  %my = and <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @in_constant_varx_mone_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_varx_mone_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mvn v0.16b, v0.16b
; CHECK-NEXT:    bic v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    mvn v0.16b, v0.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %n0 = xor <4 x i32> %x, <i32 -1, i32 -1, i32 -1, i32 -1> ; %x
  %n1 = and <4 x i32> %n0, %notmask
  %r = xor <4 x i32> %n1, <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %r
}

define <4 x i32> @out_constant_varx_42(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_varx_42:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v1.4s, #42
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %mask, %x
  %my = and <4 x i32> %notmask, <i32 42, i32 42, i32 42, i32 42>
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

define <4 x i32> @in_constant_varx_42(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_varx_42:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v1.4s, #42
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %n0 = xor <4 x i32> %x, <i32 42, i32 42, i32 42, i32 42> ; %x
  %n1 = and <4 x i32> %n0, %mask
  %r = xor <4 x i32> %n1, <i32 42, i32 42, i32 42, i32 42>
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @out_constant_varx_42_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_varx_42_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v1.4s, #42
; CHECK-NEXT:    bit v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %notmask, %x
  %my = and <4 x i32> %mask, <i32 42, i32 42, i32 42, i32 42>
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @in_constant_varx_42_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_varx_42_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v1.4s, #42
; CHECK-NEXT:    bit v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %n0 = xor <4 x i32> %x, <i32 42, i32 42, i32 42, i32 42> ; %x
  %n1 = and <4 x i32> %n0, %notmask
  %r = xor <4 x i32> %n1, <i32 42, i32 42, i32 42, i32 42>
  ret <4 x i32> %r
}

define <4 x i32> @out_constant_mone_vary(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_mone_vary:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %my = and <4 x i32> %notmask, %y
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

define <4 x i32> @in_constant_mone_vary(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_mone_vary:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orr v0.16b, v2.16b, v1.16b
; CHECK-NEXT:    ret
  %n0 = xor <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, %y ; %x
  %n1 = and <4 x i32> %n0, %mask
  %r = xor <4 x i32> %n1, %y
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @out_constant_mone_vary_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_mone_vary_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    and v0.16b, v2.16b, v1.16b
; CHECK-NEXT:    orn v0.16b, v0.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %notmask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %my = and <4 x i32> %mask, %y
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @in_constant_mone_vary_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_mone_vary_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    orn v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %n0 = xor <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, %y ; %x
  %n1 = and <4 x i32> %n0, %notmask
  %r = xor <4 x i32> %n1, %y
  ret <4 x i32> %r
}

define <4 x i32> @out_constant_42_vary(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_42_vary:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v0.4s, #42
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %mask, <i32 42, i32 42, i32 42, i32 42>
  %my = and <4 x i32> %notmask, %y
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

define <4 x i32> @in_constant_42_vary(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_42_vary:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v0.4s, #42
; CHECK-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %n0 = xor <4 x i32> <i32 42, i32 42, i32 42, i32 42>, %y ; %x
  %n1 = and <4 x i32> %n0, %mask
  %r = xor <4 x i32> %n1, %y
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @out_constant_42_vary_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: out_constant_42_vary_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v0.4s, #42
; CHECK-NEXT:    bit v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %mx = and <4 x i32> %notmask, <i32 42, i32 42, i32 42, i32 42>
  %my = and <4 x i32> %mask, %y
  %r = or <4 x i32> %mx, %my
  ret <4 x i32> %r
}

; This is not a canonical form. Testing for completeness only.
define <4 x i32> @in_constant_42_vary_invmask(<4 x i32> %x, <4 x i32> %y, <4 x i32> %mask) {
; CHECK-LABEL: in_constant_42_vary_invmask:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi v0.4s, #42
; CHECK-NEXT:    bit v0.16b, v1.16b, v2.16b
; CHECK-NEXT:    ret
  %notmask = xor <4 x i32> %mask, <i32 -1, i32 -1, i32 -1, i32 -1>
  %n0 = xor <4 x i32> <i32 42, i32 42, i32 42, i32 42>, %y ; %x
  %n1 = and <4 x i32> %n0, %notmask
  %r = xor <4 x i32> %n1, %y
  ret <4 x i32> %r
}

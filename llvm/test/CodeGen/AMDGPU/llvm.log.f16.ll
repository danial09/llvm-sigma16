; RUN: llc -amdgpu-scalarize-global-loads=false -march=amdgcn -mcpu=tahiti -verify-machineinstrs < %s | FileCheck --check-prefixes=SI,FUNC %s
; RUN: llc -amdgpu-scalarize-global-loads=false -march=amdgcn -mcpu=fiji -verify-machineinstrs < %s | FileCheck --check-prefixes=VI,VIGFX9,FUNC %s
; RUN: llc -amdgpu-scalarize-global-loads=false -march=amdgcn -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck --check-prefixes=GFX9,VIGFX9,FUNC %s

declare half @llvm.log.f16(half %a)
declare <2 x half> @llvm.log.v2f16(<2 x half> %a)

; FUNC-LABEL: {{^}}log_f16
; SI:     buffer_load_ushort v[[A_F16_0:[0-9]+]]
; VI:     flat_load_ushort v[[A_F16_0:[0-9]+]]
; GFX9:   global_load_ushort v[[A_F16_0:[0-9]+]]
; SI:     v_cvt_f32_f16_e32 v[[A_F32_0:[0-9]+]], v[[A_F16_0]]
; SI:     v_log_f32_e32 v[[R_F32_0:[0-9]+]], v[[A_F32_0]]
; SI:     v_mul_f32_e32 v[[R_F32_1:[0-9]+]], 0x3f317218, v[[R_F32_0]]
; SI:     v_cvt_f16_f32_e32 v[[R_F16_0:[0-9]+]], v[[R_F32_1]]
; VIGFX9: v_log_f16_e32 v[[R_F16_0:[0-9]+]], v[[A_F16_0]]
; VIGFX9: v_mul_f16_e32 v[[R_F16_0]], 0x398c, v[[R_F16_0]]
; SI:     buffer_store_short v[[R_F16_0]], v{{\[[0-9]+:[0-9]+\]}}
; VI:     flat_store_short v{{\[[0-9]+:[0-9]+\]}}, v[[R_F16_0]]
; GFX9:   global_store_short v{{\[[0-9]+:[0-9]+\]}}, v[[R_F16_0]]
define void @log_f16(
    ptr addrspace(1) %r,
    ptr addrspace(1) %a) {
entry:
  %a.val = load half, ptr addrspace(1) %a
  %r.val = call half @llvm.log.f16(half %a.val)
  store half %r.val, ptr addrspace(1) %r
  ret void
}

; FUNC-LABEL: {{^}}log_v2f16
; SI:     buffer_load_dword v[[A_F16_0:[0-9]+]]
; VI:     flat_load_dword v[[A_F16_0:[0-9]+]]
; GFX9:   global_load_dword v[[A_F16_0:[0-9]+]]
; VI:     v_mov_b32_e32 [[A_F32_2_V:v[0-9]+]], 0x398c
; SI:     v_lshrrev_b32_e32 v[[A_F16_1:[0-9]+]], 16, v[[A_F16_0]]
; SI:     v_cvt_f32_f16_e32 v[[A_F32_0:[0-9]+]], v[[A_F16_1]]
; SI:     v_cvt_f32_f16_e32 v[[A_F32_1:[0-9]+]], v[[A_F16_0]]
; SI:     v_log_f32_e32 v[[R_F32_0:[0-9]+]], v[[A_F32_0]]
; SI:     v_log_f32_e32 v[[R_F32_1:[0-9]+]], v[[A_F32_1]]
; SI:     v_mul_f32_e32 v[[R_F32_5:[0-9]+]], 0x3f317218, v[[R_F32_0]]
; SI:     v_cvt_f16_f32_e32 v[[R_F16_0:[0-9]+]], v[[R_F32_5]]
; SI:     v_mul_f32_e32 v[[R_F32_6:[0-9]+]], 0x3f317218, v[[R_F32_1]]
; SI:     v_cvt_f16_f32_e32 v[[R_F16_1:[0-9]+]], v[[R_F32_6]]
; GFX9:   v_log_f16_e32 v[[R_F16_2:[0-9]+]], v[[A_F16_0]]
; VIGFX9: v_log_f16_sdwa v[[R_F16_1:[0-9]+]], v[[A_F16_0]] dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_1
; VI:     v_log_f16_e32 v[[R_F16_0:[0-9]+]], v[[A_F16_0]]
; VI:     v_mul_f16_sdwa v[[R_F16_2:[0-9]+]], v[[R_F16_1]], [[A_F32_2_V]] dst_sel:WORD_1 dst_unused:UNUSED_PAD src0_sel:DWORD src1_sel:DWORD
; GFX9:   v_mul_f16_e32 v[[R_F32_3:[0-9]+]], 0x398c, v[[R_F16_2]]
; VIGFX9: v_mul_f16_e32 v[[R_F32_2:[0-9]+]], 0x398c, v[[R_F16_0]]
; SI:     v_lshlrev_b32_e32 v[[R_F16_HI:[0-9]+]], 16, v[[R_F16_0]]
; SI-NOT: v_and_b32_e32
; SI:     v_or_b32_e32 v[[R_F32_5:[0-9]+]], v[[R_F16_1]], v[[R_F16_0]]
; VI-NOT: v_and_b32_e32
; VI:     v_or_b32_e32 v[[R_F32_5:[0-9]+]], v[[R_F16_0]], v[[R_F16_2]]
; GFX9:   v_pack_b32_f16 v[[R_F32_5:[0-9]+]], v[[R_F32_3]], v[[R_F32_2]]
; SI:     buffer_store_dword v[[R_F32_5]]
; VI:     flat_store_dword v{{\[[0-9]+:[0-9]+\]}}, v[[R_F32_5]]
; GFX9:   global_store_dword v{{\[[0-9]+:[0-9]+\]}}, v[[R_F32_5]]
define void @log_v2f16(
    ptr addrspace(1) %r,
    ptr addrspace(1) %a) {
entry:
  %a.val = load <2 x half>, ptr addrspace(1) %a
  %r.val = call <2 x half> @llvm.log.v2f16(<2 x half> %a.val)
  store <2 x half> %r.val, ptr addrspace(1) %r
  ret void
}

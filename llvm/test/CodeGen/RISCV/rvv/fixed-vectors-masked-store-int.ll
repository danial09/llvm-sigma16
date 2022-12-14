; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+m,+v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+m,+v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define void @masked_store_v1i8(<1 x i8>* %val_ptr, <1 x i8>* %a, <1 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x i8>, <1 x i8>* %m_ptr
  %mask = icmp eq <1 x i8> %m, zeroinitializer
  %val = load <1 x i8>, <1 x i8>* %val_ptr
  call void @llvm.masked.store.v1i8.p0v1i8(<1 x i8> %val, <1 x i8>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1i8.p0v1i8(<1 x i8>, <1 x i8>*, i32, <1 x i1>)

define void @masked_store_v1i16(<1 x i16>* %val_ptr, <1 x i16>* %a, <1 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, mf4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x i16>, <1 x i16>* %m_ptr
  %mask = icmp eq <1 x i16> %m, zeroinitializer
  %val = load <1 x i16>, <1 x i16>* %val_ptr
  call void @llvm.masked.store.v1i16.p0v1i16(<1 x i16> %val, <1 x i16>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1i16.p0v1i16(<1 x i16>, <1 x i16>*, i32, <1 x i1>)

define void @masked_store_v1i32(<1 x i32>* %val_ptr, <1 x i32>* %a, <1 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, mf2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x i32>, <1 x i32>* %m_ptr
  %mask = icmp eq <1 x i32> %m, zeroinitializer
  %val = load <1 x i32>, <1 x i32>* %val_ptr
  call void @llvm.masked.store.v1i32.p0v1i32(<1 x i32> %val, <1 x i32>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1i32.p0v1i32(<1 x i32>, <1 x i32>*, i32, <1 x i1>)

define void @masked_store_v1i64(<1 x i64>* %val_ptr, <1 x i64>* %a, <1 x i64>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v1i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e64, m1, ta, ma
; CHECK-NEXT:    vle64.v v8, (a2)
; CHECK-NEXT:    vle64.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse64.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <1 x i64>, <1 x i64>* %m_ptr
  %mask = icmp eq <1 x i64> %m, zeroinitializer
  %val = load <1 x i64>, <1 x i64>* %val_ptr
  call void @llvm.masked.store.v1i64.p0v1i64(<1 x i64> %val, <1 x i64>* %a, i32 8, <1 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v1i64.p0v1i64(<1 x i64>, <1 x i64>*, i32, <1 x i1>)

define void @masked_store_v2i8(<2 x i8>* %val_ptr, <2 x i8>* %a, <2 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x i8>, <2 x i8>* %m_ptr
  %mask = icmp eq <2 x i8> %m, zeroinitializer
  %val = load <2 x i8>, <2 x i8>* %val_ptr
  call void @llvm.masked.store.v2i8.p0v2i8(<2 x i8> %val, <2 x i8>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2i8.p0v2i8(<2 x i8>, <2 x i8>*, i32, <2 x i1>)

define void @masked_store_v2i16(<2 x i16>* %val_ptr, <2 x i16>* %a, <2 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x i16>, <2 x i16>* %m_ptr
  %mask = icmp eq <2 x i16> %m, zeroinitializer
  %val = load <2 x i16>, <2 x i16>* %val_ptr
  call void @llvm.masked.store.v2i16.p0v2i16(<2 x i16> %val, <2 x i16>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2i16.p0v2i16(<2 x i16>, <2 x i16>*, i32, <2 x i1>)

define void @masked_store_v2i32(<2 x i32>* %val_ptr, <2 x i32>* %a, <2 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x i32>, <2 x i32>* %m_ptr
  %mask = icmp eq <2 x i32> %m, zeroinitializer
  %val = load <2 x i32>, <2 x i32>* %val_ptr
  call void @llvm.masked.store.v2i32.p0v2i32(<2 x i32> %val, <2 x i32>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2i32.p0v2i32(<2 x i32>, <2 x i32>*, i32, <2 x i1>)

define void @masked_store_v2i64(<2 x i64>* %val_ptr, <2 x i64>* %a, <2 x i64>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e64, m1, ta, ma
; CHECK-NEXT:    vle64.v v8, (a2)
; CHECK-NEXT:    vle64.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse64.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <2 x i64>, <2 x i64>* %m_ptr
  %mask = icmp eq <2 x i64> %m, zeroinitializer
  %val = load <2 x i64>, <2 x i64>* %val_ptr
  call void @llvm.masked.store.v2i64.p0v2i64(<2 x i64> %val, <2 x i64>* %a, i32 8, <2 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v2i64.p0v2i64(<2 x i64>, <2 x i64>*, i32, <2 x i1>)

define void @masked_store_v4i8(<4 x i8>* %val_ptr, <4 x i8>* %a, <4 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x i8>, <4 x i8>* %m_ptr
  %mask = icmp eq <4 x i8> %m, zeroinitializer
  %val = load <4 x i8>, <4 x i8>* %val_ptr
  call void @llvm.masked.store.v4i8.p0v4i8(<4 x i8> %val, <4 x i8>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4i8.p0v4i8(<4 x i8>, <4 x i8>*, i32, <4 x i1>)

define void @masked_store_v4i16(<4 x i16>* %val_ptr, <4 x i16>* %a, <4 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x i16>, <4 x i16>* %m_ptr
  %mask = icmp eq <4 x i16> %m, zeroinitializer
  %val = load <4 x i16>, <4 x i16>* %val_ptr
  call void @llvm.masked.store.v4i16.p0v4i16(<4 x i16> %val, <4 x i16>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4i16.p0v4i16(<4 x i16>, <4 x i16>*, i32, <4 x i1>)

define void @masked_store_v4i32(<4 x i32>* %val_ptr, <4 x i32>* %a, <4 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x i32>, <4 x i32>* %m_ptr
  %mask = icmp eq <4 x i32> %m, zeroinitializer
  %val = load <4 x i32>, <4 x i32>* %val_ptr
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %val, <4 x i32>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4i32.p0v4i32(<4 x i32>, <4 x i32>*, i32, <4 x i1>)

define void @masked_store_v4i64(<4 x i64>* %val_ptr, <4 x i64>* %a, <4 x i64>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; CHECK-NEXT:    vle64.v v8, (a2)
; CHECK-NEXT:    vle64.v v10, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse64.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <4 x i64>, <4 x i64>* %m_ptr
  %mask = icmp eq <4 x i64> %m, zeroinitializer
  %val = load <4 x i64>, <4 x i64>* %val_ptr
  call void @llvm.masked.store.v4i64.p0v4i64(<4 x i64> %val, <4 x i64>* %a, i32 8, <4 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v4i64.p0v4i64(<4 x i64>, <4 x i64>*, i32, <4 x i1>)

define void @masked_store_v8i8(<8 x i8>* %val_ptr, <8 x i8>* %a, <8 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x i8>, <8 x i8>* %m_ptr
  %mask = icmp eq <8 x i8> %m, zeroinitializer
  %val = load <8 x i8>, <8 x i8>* %val_ptr
  call void @llvm.masked.store.v8i8.p0v8i8(<8 x i8> %val, <8 x i8>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8i8.p0v8i8(<8 x i8>, <8 x i8>*, i32, <8 x i1>)

define void @masked_store_v8i16(<8 x i16>* %val_ptr, <8 x i16>* %a, <8 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x i16>, <8 x i16>* %m_ptr
  %mask = icmp eq <8 x i16> %m, zeroinitializer
  %val = load <8 x i16>, <8 x i16>* %val_ptr
  call void @llvm.masked.store.v8i16.p0v8i16(<8 x i16> %val, <8 x i16>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8i16.p0v8i16(<8 x i16>, <8 x i16>*, i32, <8 x i1>)

define void @masked_store_v8i32(<8 x i32>* %val_ptr, <8 x i32>* %a, <8 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x i32>, <8 x i32>* %m_ptr
  %mask = icmp eq <8 x i32> %m, zeroinitializer
  %val = load <8 x i32>, <8 x i32>* %val_ptr
  call void @llvm.masked.store.v8i32.p0v8i32(<8 x i32> %val, <8 x i32>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8i32.p0v8i32(<8 x i32>, <8 x i32>*, i32, <8 x i1>)

define void @masked_store_v8i64(<8 x i64>* %val_ptr, <8 x i64>* %a, <8 x i64>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v8i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e64, m4, ta, ma
; CHECK-NEXT:    vle64.v v8, (a2)
; CHECK-NEXT:    vle64.v v12, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse64.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <8 x i64>, <8 x i64>* %m_ptr
  %mask = icmp eq <8 x i64> %m, zeroinitializer
  %val = load <8 x i64>, <8 x i64>* %val_ptr
  call void @llvm.masked.store.v8i64.p0v8i64(<8 x i64> %val, <8 x i64>* %a, i32 8, <8 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v8i64.p0v8i64(<8 x i64>, <8 x i64>*, i32, <8 x i1>)

define void @masked_store_v16i8(<16 x i8>* %val_ptr, <16 x i8>* %a, <16 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v9, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x i8>, <16 x i8>* %m_ptr
  %mask = icmp eq <16 x i8> %m, zeroinitializer
  %val = load <16 x i8>, <16 x i8>* %val_ptr
  call void @llvm.masked.store.v16i8.p0v16i8(<16 x i8> %val, <16 x i8>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16i8.p0v16i8(<16 x i8>, <16 x i8>*, i32, <16 x i1>)

define void @masked_store_v16i16(<16 x i16>* %val_ptr, <16 x i16>* %a, <16 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e16, m2, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v10, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x i16>, <16 x i16>* %m_ptr
  %mask = icmp eq <16 x i16> %m, zeroinitializer
  %val = load <16 x i16>, <16 x i16>* %val_ptr
  call void @llvm.masked.store.v16i16.p0v16i16(<16 x i16> %val, <16 x i16>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16i16.p0v16i16(<16 x i16>, <16 x i16>*, i32, <16 x i1>)

define void @masked_store_v16i32(<16 x i32>* %val_ptr, <16 x i32>* %a, <16 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v12, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x i32>, <16 x i32>* %m_ptr
  %mask = icmp eq <16 x i32> %m, zeroinitializer
  %val = load <16 x i32>, <16 x i32>* %val_ptr
  call void @llvm.masked.store.v16i32.p0v16i32(<16 x i32> %val, <16 x i32>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16i32.p0v16i32(<16 x i32>, <16 x i32>*, i32, <16 x i1>)

define void @masked_store_v16i64(<16 x i64>* %val_ptr, <16 x i64>* %a, <16 x i64>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v16i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; CHECK-NEXT:    vle64.v v8, (a2)
; CHECK-NEXT:    vle64.v v16, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse64.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <16 x i64>, <16 x i64>* %m_ptr
  %mask = icmp eq <16 x i64> %m, zeroinitializer
  %val = load <16 x i64>, <16 x i64>* %val_ptr
  call void @llvm.masked.store.v16i64.p0v16i64(<16 x i64> %val, <16 x i64>* %a, i32 8, <16 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v16i64.p0v16i64(<16 x i64>, <16 x i64>*, i32, <16 x i1>)

define void @masked_store_v32i8(<32 x i8>* %val_ptr, <32 x i8>* %a, <32 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v32i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e8, m2, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v10, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v10, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <32 x i8>, <32 x i8>* %m_ptr
  %mask = icmp eq <32 x i8> %m, zeroinitializer
  %val = load <32 x i8>, <32 x i8>* %val_ptr
  call void @llvm.masked.store.v32i8.p0v32i8(<32 x i8> %val, <32 x i8>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32i8.p0v32i8(<32 x i8>, <32 x i8>*, i32, <32 x i1>)

define void @masked_store_v32i16(<32 x i16>* %val_ptr, <32 x i16>* %a, <32 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e16, m4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v12, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <32 x i16>, <32 x i16>* %m_ptr
  %mask = icmp eq <32 x i16> %m, zeroinitializer
  %val = load <32 x i16>, <32 x i16>* %val_ptr
  call void @llvm.masked.store.v32i16.p0v32i16(<32 x i16> %val, <32 x i16>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32i16.p0v32i16(<32 x i16>, <32 x i16>*, i32, <32 x i1>)

define void @masked_store_v32i32(<32 x i32>* %val_ptr, <32 x i32>* %a, <32 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v32i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e32, m8, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse32.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <32 x i32>, <32 x i32>* %m_ptr
  %mask = icmp eq <32 x i32> %m, zeroinitializer
  %val = load <32 x i32>, <32 x i32>* %val_ptr
  call void @llvm.masked.store.v32i32.p0v32i32(<32 x i32> %val, <32 x i32>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32i32.p0v32i32(<32 x i32>, <32 x i32>*, i32, <32 x i1>)

define void @masked_store_v32i64(<32 x i64>* %val_ptr, <32 x i64>* %a, <32 x i64>* %m_ptr) nounwind {
; RV32-LABEL: masked_store_v32i64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi sp, sp, -16
; RV32-NEXT:    csrr a3, vlenb
; RV32-NEXT:    slli a3, a3, 4
; RV32-NEXT:    sub sp, sp, a3
; RV32-NEXT:    addi a3, a2, 128
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV32-NEXT:    vle64.v v8, (a3)
; RV32-NEXT:    csrr a3, vlenb
; RV32-NEXT:    slli a3, a3, 3
; RV32-NEXT:    add a3, sp, a3
; RV32-NEXT:    addi a3, a3, 16
; RV32-NEXT:    vs8r.v v8, (a3) # Unknown-size Folded Spill
; RV32-NEXT:    vle64.v v24, (a2)
; RV32-NEXT:    li a2, 32
; RV32-NEXT:    vsetvli zero, a2, e32, m8, ta, ma
; RV32-NEXT:    vmv.v.i v8, 0
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV32-NEXT:    vmseq.vv v1, v24, v8
; RV32-NEXT:    addi a2, a0, 128
; RV32-NEXT:    vle64.v v24, (a2)
; RV32-NEXT:    vle64.v v16, (a0)
; RV32-NEXT:    addi a0, sp, 16
; RV32-NEXT:    vs8r.v v16, (a0) # Unknown-size Folded Spill
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a0, a0, 3
; RV32-NEXT:    add a0, sp, a0
; RV32-NEXT:    addi a0, a0, 16
; RV32-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; RV32-NEXT:    vmseq.vv v0, v16, v8
; RV32-NEXT:    addi a0, a1, 128
; RV32-NEXT:    vse64.v v24, (a0), v0.t
; RV32-NEXT:    vmv1r.v v0, v1
; RV32-NEXT:    addi a0, sp, 16
; RV32-NEXT:    vl8r.v v8, (a0) # Unknown-size Folded Reload
; RV32-NEXT:    vse64.v v8, (a1), v0.t
; RV32-NEXT:    csrr a0, vlenb
; RV32-NEXT:    slli a0, a0, 4
; RV32-NEXT:    add sp, sp, a0
; RV32-NEXT:    addi sp, sp, 16
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_store_v32i64:
; RV64:       # %bb.0:
; RV64-NEXT:    addi sp, sp, -16
; RV64-NEXT:    csrr a3, vlenb
; RV64-NEXT:    slli a3, a3, 4
; RV64-NEXT:    sub sp, sp, a3
; RV64-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV64-NEXT:    vle64.v v8, (a2)
; RV64-NEXT:    addi a2, a2, 128
; RV64-NEXT:    vle64.v v16, (a2)
; RV64-NEXT:    csrr a2, vlenb
; RV64-NEXT:    slli a2, a2, 3
; RV64-NEXT:    add a2, sp, a2
; RV64-NEXT:    addi a2, a2, 16
; RV64-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; RV64-NEXT:    vmseq.vi v0, v8, 0
; RV64-NEXT:    vle64.v v24, (a0)
; RV64-NEXT:    addi a0, a0, 128
; RV64-NEXT:    vle64.v v8, (a0)
; RV64-NEXT:    addi a0, sp, 16
; RV64-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a0, a0, 3
; RV64-NEXT:    add a0, sp, a0
; RV64-NEXT:    addi a0, a0, 16
; RV64-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; RV64-NEXT:    vmseq.vi v8, v16, 0
; RV64-NEXT:    vse64.v v24, (a1), v0.t
; RV64-NEXT:    addi a0, a1, 128
; RV64-NEXT:    vmv1r.v v0, v8
; RV64-NEXT:    addi a1, sp, 16
; RV64-NEXT:    vl8r.v v8, (a1) # Unknown-size Folded Reload
; RV64-NEXT:    vse64.v v8, (a0), v0.t
; RV64-NEXT:    csrr a0, vlenb
; RV64-NEXT:    slli a0, a0, 4
; RV64-NEXT:    add sp, sp, a0
; RV64-NEXT:    addi sp, sp, 16
; RV64-NEXT:    ret
  %m = load <32 x i64>, <32 x i64>* %m_ptr
  %mask = icmp eq <32 x i64> %m, zeroinitializer
  %val = load <32 x i64>, <32 x i64>* %val_ptr
  call void @llvm.masked.store.v32i64.p0v32i64(<32 x i64> %val, <32 x i64>* %a, i32 8, <32 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v32i64.p0v32i64(<32 x i64>, <32 x i64>*, i32, <32 x i1>)

define void @masked_store_v64i8(<64 x i8>* %val_ptr, <64 x i8>* %a, <64 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v64i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e8, m4, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v12, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v12, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <64 x i8>, <64 x i8>* %m_ptr
  %mask = icmp eq <64 x i8> %m, zeroinitializer
  %val = load <64 x i8>, <64 x i8>* %val_ptr
  call void @llvm.masked.store.v64i8.p0v64i8(<64 x i8> %val, <64 x i8>* %a, i32 8, <64 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v64i8.p0v64i8(<64 x i8>, <64 x i8>*, i32, <64 x i1>)

define void @masked_store_v64i16(<64 x i16>* %val_ptr, <64 x i16>* %a, <64 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v64i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e16, m8, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse16.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <64 x i16>, <64 x i16>* %m_ptr
  %mask = icmp eq <64 x i16> %m, zeroinitializer
  %val = load <64 x i16>, <64 x i16>* %val_ptr
  call void @llvm.masked.store.v64i16.p0v64i16(<64 x i16> %val, <64 x i16>* %a, i32 8, <64 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v64i16.p0v64i16(<64 x i16>, <64 x i16>*, i32, <64 x i1>)

define void @masked_store_v64i32(<64 x i32>* %val_ptr, <64 x i32>* %a, <64 x i32>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v64i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    csrr a3, vlenb
; CHECK-NEXT:    slli a3, a3, 4
; CHECK-NEXT:    sub sp, sp, a3
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e32, m8, ta, ma
; CHECK-NEXT:    vle32.v v8, (a2)
; CHECK-NEXT:    addi a2, a2, 128
; CHECK-NEXT:    vle32.v v16, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    add a2, sp, a2
; CHECK-NEXT:    addi a2, a2, 16
; CHECK-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vle32.v v24, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle32.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmseq.vi v8, v16, 0
; CHECK-NEXT:    vse32.v v24, (a1), v0.t
; CHECK-NEXT:    addi a0, a1, 128
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vl8r.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vse32.v v8, (a0), v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %m = load <64 x i32>, <64 x i32>* %m_ptr
  %mask = icmp eq <64 x i32> %m, zeroinitializer
  %val = load <64 x i32>, <64 x i32>* %val_ptr
  call void @llvm.masked.store.v64i32.p0v64i32(<64 x i32> %val, <64 x i32>* %a, i32 8, <64 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v64i32.p0v64i32(<64 x i32>, <64 x i32>*, i32, <64 x i1>)

define void @masked_store_v128i8(<128 x i8>* %val_ptr, <128 x i8>* %a, <128 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v128i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 128
; CHECK-NEXT:    vsetvli zero, a3, e8, m8, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    vle8.v v16, (a0)
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vse8.v v16, (a1), v0.t
; CHECK-NEXT:    ret
  %m = load <128 x i8>, <128 x i8>* %m_ptr
  %mask = icmp eq <128 x i8> %m, zeroinitializer
  %val = load <128 x i8>, <128 x i8>* %val_ptr
  call void @llvm.masked.store.v128i8.p0v128i8(<128 x i8> %val, <128 x i8>* %a, i32 8, <128 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v128i8.p0v128i8(<128 x i8>, <128 x i8>*, i32, <128 x i1>)

define void @masked_store_v128i16(<128 x i16>* %val_ptr, <128 x i16>* %a, <128 x i16>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v128i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    csrr a3, vlenb
; CHECK-NEXT:    slli a3, a3, 4
; CHECK-NEXT:    sub sp, sp, a3
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e16, m8, ta, ma
; CHECK-NEXT:    vle16.v v8, (a2)
; CHECK-NEXT:    addi a2, a2, 128
; CHECK-NEXT:    vle16.v v16, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    add a2, sp, a2
; CHECK-NEXT:    addi a2, a2, 16
; CHECK-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vle16.v v24, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle16.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmseq.vi v8, v16, 0
; CHECK-NEXT:    vse16.v v24, (a1), v0.t
; CHECK-NEXT:    addi a0, a1, 128
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vl8r.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vse16.v v8, (a0), v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %m = load <128 x i16>, <128 x i16>* %m_ptr
  %mask = icmp eq <128 x i16> %m, zeroinitializer
  %val = load <128 x i16>, <128 x i16>* %val_ptr
  call void @llvm.masked.store.v128i16.p0v128i16(<128 x i16> %val, <128 x i16>* %a, i32 8, <128 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v128i16.p0v128i16(<128 x i16>, <128 x i16>*, i32, <128 x i1>)

define void @masked_store_v256i8(<256 x i8>* %val_ptr, <256 x i8>* %a, <256 x i8>* %m_ptr) nounwind {
; CHECK-LABEL: masked_store_v256i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    csrr a3, vlenb
; CHECK-NEXT:    slli a3, a3, 4
; CHECK-NEXT:    sub sp, sp, a3
; CHECK-NEXT:    li a3, 128
; CHECK-NEXT:    vsetvli zero, a3, e8, m8, ta, ma
; CHECK-NEXT:    vle8.v v8, (a2)
; CHECK-NEXT:    addi a2, a2, 128
; CHECK-NEXT:    vle8.v v16, (a2)
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    add a2, sp, a2
; CHECK-NEXT:    addi a2, a2, 16
; CHECK-NEXT:    vs8r.v v16, (a2) # Unknown-size Folded Spill
; CHECK-NEXT:    vmseq.vi v0, v8, 0
; CHECK-NEXT:    vle8.v v24, (a0)
; CHECK-NEXT:    addi a0, a0, 128
; CHECK-NEXT:    vle8.v v8, (a0)
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add a0, sp, a0
; CHECK-NEXT:    addi a0, a0, 16
; CHECK-NEXT:    vl8r.v v16, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vmseq.vi v8, v16, 0
; CHECK-NEXT:    vse8.v v24, (a1), v0.t
; CHECK-NEXT:    addi a0, a1, 128
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vl8r.v v8, (a1) # Unknown-size Folded Reload
; CHECK-NEXT:    vse8.v v8, (a0), v0.t
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 4
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %m = load <256 x i8>, <256 x i8>* %m_ptr
  %mask = icmp eq <256 x i8> %m, zeroinitializer
  %val = load <256 x i8>, <256 x i8>* %val_ptr
  call void @llvm.masked.store.v256i8.p0v256i8(<256 x i8> %val, <256 x i8>* %a, i32 8, <256 x i1> %mask)
  ret void
}
declare void @llvm.masked.store.v256i8.p0v256i8(<256 x i8>, <256 x i8>*, i32, <256 x i1>)

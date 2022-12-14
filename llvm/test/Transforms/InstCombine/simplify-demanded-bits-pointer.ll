; RUN: opt < %s -passes=instcombine -disable-output

; SimplifyDemandedBits should cope with pointer types.

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
	%struct.VEC_rtx_base = type { i32, i32, [1 x ptr] }
	%struct.VEC_rtx_gc = type { %struct.VEC_rtx_base }
	%struct.block_symbol = type { [3 x %struct.rtunion], ptr, i64 }
	%struct.object_block = type { ptr, i32, i64, ptr, ptr }
	%struct.omp_clause_subcode = type { i32 }
	%struct.rtunion = type { ptr }
	%struct.rtx_def = type { i16, i8, i8, %struct.u }
	%struct.section = type { %struct.unnamed_section }
	%struct.u = type { %struct.block_symbol }
	%struct.unnamed_section = type { %struct.omp_clause_subcode, ptr, ptr, ptr }

define fastcc void @cse_insn(ptr %insn, ptr %libcall_insn, ptr %ptr, i1 %c1, i1 %c2, i1 %c3, i1 %c4, i1 %c5, i1 %c6, i1 %c7, i1 %c8, i1 %c9) nounwind {
entry:
	br i1 %c1, label %bb43, label %bb88

bb43:		; preds = %entry
	br label %bb88

bb88:		; preds = %bb43, %entry
	br i1 %c2, label %bb95, label %bb107

bb95:		; preds = %bb88
	unreachable

bb107:		; preds = %bb88
	%0 = load i16, ptr %ptr, align 8		; <i16> [#uses=1]
	%1 = icmp eq i16 %0, 38		; <i1> [#uses=1]
	%src_eqv_here.0 = select i1 %1, ptr null, ptr null		; <ptr> [#uses=1]
	br i1 %c3, label %bb127, label %bb125

bb125:		; preds = %bb107
	br i1 %c4, label %bb127, label %bb126

bb126:		; preds = %bb125
	br i1 %c5, label %bb129, label %bb133

bb127:		; preds = %bb125, %bb107
	unreachable

bb129:		; preds = %bb126
	br label %bb133

bb133:		; preds = %bb129, %bb126
	br i1 %c6, label %bb134, label %bb146

bb134:		; preds = %bb133
	unreachable

bb146:		; preds = %bb133
	br i1 %c7, label %bb180, label %bb186

bb180:		; preds = %bb146
	%2 = icmp eq ptr null, null		; <i1> [#uses=1]
	%3 = zext i1 %2 to i8		; <i8> [#uses=1]
	%4 = icmp ne ptr %src_eqv_here.0, null		; <i1> [#uses=1]
	%5 = zext i1 %4 to i8		; <i8> [#uses=1]
	%toBool181 = icmp ne i8 %3, 0		; <i1> [#uses=1]
	%toBool182 = icmp ne i8 %5, 0		; <i1> [#uses=1]
	%6 = and i1 %toBool181, %toBool182		; <i1> [#uses=1]
	%7 = zext i1 %6 to i8		; <i8> [#uses=1]
	%toBool183 = icmp ne i8 %7, 0		; <i1> [#uses=1]
	br i1 %toBool183, label %bb184, label %bb186

bb184:		; preds = %bb180
	br i1 %c8, label %bb185, label %bb186

bb185:		; preds = %bb184
	br label %bb186

bb186:		; preds = %bb185, %bb184, %bb180, %bb146
	br i1 %c9, label %bb190, label %bb195

bb190:		; preds = %bb186
	unreachable

bb195:		; preds = %bb186
	unreachable
}

// RUN: %clang_cc1 -triple x86_64-apple-darwin -O1 -no-struct-path-tbaa -disable-llvm-passes %s -emit-llvm -o - | FileCheck %s
// RUN: %clang_cc1 -triple x86_64-apple-darwin -O1 -disable-llvm-passes %s -emit-llvm -o - | FileCheck %s -check-prefixes=PATH,OLD-PATH
// RUN: %clang_cc1 -triple x86_64-apple-darwin -O1 -new-struct-path-tbaa -disable-llvm-passes %s -emit-llvm -o - | FileCheck %s -check-prefixes=PATH,NEW-PATH
// RUN: %clang_cc1 -triple x86_64-apple-darwin -O0 -disable-llvm-passes %s -emit-llvm -o - | FileCheck %s -check-prefix=NO-TBAA
// RUN: %clang_cc1 -triple x86_64-apple-darwin -O1 -relaxed-aliasing -disable-llvm-passes %s -emit-llvm -o - | FileCheck %s -check-prefix=NO-TBAA
// Test TBAA metadata generated by front-end.
//
// NO-TBAA-NOT: !tbaa

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef struct
{
   uint16_t f16;
   uint32_t f32;
   uint16_t f16_2;
   uint32_t f32_2;
} StructA;
typedef struct
{
   uint16_t f16;
   StructA a;
   uint32_t f32;
} StructB;
typedef struct
{
   uint16_t f16;
   StructB b;
   uint32_t f32;
} StructC;
typedef struct
{
   uint16_t f16;
   StructB b;
   uint32_t f32;
   uint8_t f8;
} StructD;

typedef struct
{
   uint16_t f16;
   uint32_t f32;
} StructS;
typedef struct
{
   uint16_t f16;
   uint32_t f32;
} StructS2;

uint32_t g(uint32_t *s, StructA *A, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z1g
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32:!.*]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z1g
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32:!.*]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32:!.*]]
  *s = 1;
  A->f32 = 4;
  return *s;
}

uint32_t g2(uint32_t *s, StructA *A, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g2
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i16:!.*]]
// PATH-LABEL: define{{.*}} i32 @_Z2g2
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f16:!.*]]
  *s = 1;
  A->f16 = 4;
  return *s;
}

uint32_t g3(StructA *A, StructB *B, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g3
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z2g3
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_B_a_f32:!.*]]
  A->f32 = 1;
  B->a.f32 = 4;
  return A->f32;
}

uint32_t g4(StructA *A, StructB *B, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g4
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i16]]
// PATH-LABEL: define{{.*}} i32 @_Z2g4
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_B_a_f16:!.*]]
  A->f32 = 1;
  B->a.f16 = 4;
  return A->f32;
}

uint32_t g5(StructA *A, StructB *B, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g5
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z2g5
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_B_f32:!.*]]
  A->f32 = 1;
  B->f32 = 4;
  return A->f32;
}

uint32_t g6(StructA *A, StructB *B, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g6
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z2g6
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_B_a_f32_2:!.*]]
  A->f32 = 1;
  B->a.f32_2 = 4;
  return A->f32;
}

uint32_t g7(StructA *A, StructS *S, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g7
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z2g7
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f32:!.*]]
  A->f32 = 1;
  S->f32 = 4;
  return A->f32;
}

uint32_t g8(StructA *A, StructS *S, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g8
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i16]]
// PATH-LABEL: define{{.*}} i32 @_Z2g8
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_A_f32]]
// PATH: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f16:!.*]]
  A->f32 = 1;
  S->f16 = 4;
  return A->f32;
}

uint32_t g9(StructS *S, StructS2 *S2, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z2g9
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z2g9
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_S2_f32:!.*]]
  S->f32 = 1;
  S2->f32 = 4;
  return S->f32;
}

uint32_t g10(StructS *S, StructS2 *S2, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z3g10
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i16]]
// PATH-LABEL: define{{.*}} i32 @_Z3g10
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f32]]
// PATH: store i16 4, ptr %{{.*}}, align 4, !tbaa [[TAG_S2_f16:!.*]]
  S->f32 = 1;
  S2->f16 = 4;
  return S->f32;
}

uint32_t g11(StructC *C, StructD *D, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z3g11
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z3g11
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_C_b_a_f32:!.*]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_D_b_a_f32:!.*]]
  C->b.a.f32 = 1;
  D->b.a.f32 = 4;
  return C->b.a.f32;
}

uint32_t g12(StructC *C, StructD *D, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z3g12
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// TODO: differentiate the two accesses.
// PATH-LABEL: define{{.*}} i32 @_Z3g12
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_B_a_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_B_a_f32]]
  StructB *b1 = &(C->b);
  StructB *b2 = &(D->b);
  // b1, b2 have different context.
  b1->a.f32 = 1;
  b2->a.f32 = 4;
  return b1->a.f32;
}

// Make sure that zero-length bitfield works.
#define ATTR __attribute__ ((ms_struct))
struct five {
  char a;
  int :0;        /* ignored; prior field is not a bitfield. */
  char b;
  char c;
} ATTR;
char g13(struct five *a, struct five *b) {
  return a->b;
// CHECK-LABEL: define{{.*}} signext i8 @_Z3g13
// CHECK: load i8, ptr %{{.*}}, align 1, !tbaa [[TAG_char:!.*]]
// PATH-LABEL: define{{.*}} signext i8 @_Z3g13
// PATH: load i8, ptr %{{.*}}, align 1, !tbaa [[TAG_five_b:!.*]]
}

struct six {
  char a;
  int :0;
  char b;
  char c;
};
char g14(struct six *a, struct six *b) {
// CHECK-LABEL: define{{.*}} signext i8 @_Z3g14
// CHECK: load i8, ptr %{{.*}}, align 1, !tbaa [[TAG_char]]
// PATH-LABEL: define{{.*}} signext i8 @_Z3g14
// PATH: load i8, ptr %{{.*}}, align 1, !tbaa [[TAG_six_b:!.*]]
  return a->b;
}

// Types that differ only by name may alias.
typedef StructS StructS3;
uint32_t g15(StructS *S, StructS3 *S3, uint64_t count) {
// CHECK-LABEL: define{{.*}} i32 @_Z3g15
// CHECK: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// CHECK: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_i32]]
// PATH-LABEL: define{{.*}} i32 @_Z3g15
// PATH: store i32 1, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f32]]
// PATH: store i32 4, ptr %{{.*}}, align 4, !tbaa [[TAG_S_f32]]
  S->f32 = 1;
  S3->f32 = 4;
  return S->f32;
}

// CHECK: [[TYPE_char:!.*]] = !{!"omnipotent char", [[TAG_cxx_tbaa:!.*]],
// CHECK: [[TAG_cxx_tbaa]] = !{!"Simple C++ TBAA"}
// CHECK: [[TAG_i32]] = !{[[TYPE_i32:!.*]], [[TYPE_i32]], i64 0}
// CHECK: [[TYPE_i32]] = !{!"int", [[TYPE_char]],
// CHECK: [[TAG_i16]] = !{[[TYPE_i16:!.*]], [[TYPE_i16]], i64 0}
// CHECK: [[TYPE_i16]] = !{!"short", [[TYPE_char]],
// CHECK: [[TAG_char]] = !{[[TYPE_char]], [[TYPE_char]], i64 0}

// OLD-PATH: [[TYPE_CHAR:!.*]] = !{!"omnipotent char", !
// OLD-PATH: [[TAG_i32]] = !{[[TYPE_INT:!.*]], [[TYPE_INT]], i64 0}
// OLD-PATH: [[TYPE_INT]] = !{!"int", [[TYPE_CHAR]]
// OLD-PATH: [[TAG_A_f32]] = !{[[TYPE_A:!.*]], [[TYPE_INT]], i64 4}
// OLD-PATH: [[TYPE_A]] = !{!"_ZTS7StructA", [[TYPE_SHORT:!.*]], i64 0, [[TYPE_INT]], i64 4, [[TYPE_SHORT]], i64 8, [[TYPE_INT]], i64 12}
// OLD-PATH: [[TYPE_SHORT:!.*]] = !{!"short", [[TYPE_CHAR]]
// OLD-PATH: [[TAG_A_f16]] = !{[[TYPE_A]], [[TYPE_SHORT]], i64 0}
// OLD-PATH: [[TAG_B_a_f32]] = !{[[TYPE_B:!.*]], [[TYPE_INT]], i64 8}
// OLD-PATH: [[TYPE_B]] = !{!"_ZTS7StructB", [[TYPE_SHORT]], i64 0, [[TYPE_A]], i64 4, [[TYPE_INT]], i64 20}
// OLD-PATH: [[TAG_B_a_f16]] = !{[[TYPE_B]], [[TYPE_SHORT]], i64 4}
// OLD-PATH: [[TAG_B_f32]] = !{[[TYPE_B]], [[TYPE_INT]], i64 20}
// OLD-PATH: [[TAG_B_a_f32_2]] = !{[[TYPE_B]], [[TYPE_INT]], i64 16}
// OLD-PATH: [[TAG_S_f32]] = !{[[TYPE_S:!.*]], [[TYPE_INT]], i64 4}
// OLD-PATH: [[TYPE_S]] = !{!"_ZTS7StructS", [[TYPE_SHORT]], i64 0, [[TYPE_INT]], i64 4}
// OLD-PATH: [[TAG_S_f16]] = !{[[TYPE_S]], [[TYPE_SHORT]], i64 0}
// OLD-PATH: [[TAG_S2_f32]] = !{[[TYPE_S2:!.*]], [[TYPE_INT]], i64 4}
// OLD-PATH: [[TYPE_S2]] = !{!"_ZTS8StructS2", [[TYPE_SHORT]], i64 0, [[TYPE_INT]], i64 4}
// OLD-PATH: [[TAG_S2_f16]] = !{[[TYPE_S2]], [[TYPE_SHORT]], i64 0}
// OLD-PATH: [[TAG_C_b_a_f32]] = !{[[TYPE_C:!.*]], [[TYPE_INT]], i64 12}
// OLD-PATH: [[TYPE_C]] = !{!"_ZTS7StructC", [[TYPE_SHORT]], i64 0, [[TYPE_B]], i64 4, [[TYPE_INT]], i64 28}
// OLD-PATH: [[TAG_D_b_a_f32]] = !{[[TYPE_D:!.*]], [[TYPE_INT]], i64 12}
// OLD-PATH: [[TYPE_D]] = !{!"_ZTS7StructD", [[TYPE_SHORT]], i64 0, [[TYPE_B]], i64 4, [[TYPE_INT]], i64 28, [[TYPE_CHAR]], i64 32}
// OLD-PATH: [[TAG_five_b]] = !{[[TYPE_five:!.*]], [[TYPE_CHAR]], i64 1}
// OLD-PATH: [[TYPE_five]] = !{!"_ZTS4five", [[TYPE_CHAR]], i64 0, [[TYPE_CHAR]], i64 1, [[TYPE_CHAR]], i64 2}
// OLD-PATH: [[TAG_six_b]] = !{[[TYPE_six:!.*]], [[TYPE_CHAR]], i64 4}
// OLD-PATH: [[TYPE_six]] = !{!"_ZTS3six", [[TYPE_CHAR]], i64 0, [[TYPE_CHAR]], i64 4, [[TYPE_CHAR]], i64 5}

// NEW-PATH-DAG: [[ROOT:!.*]] = !{!"Simple C++ TBAA"}
// NEW-PATH-DAG: [[TYPE_char:!.*]] = !{[[ROOT]], i64 1, !"omnipotent char"}
// NEW-PATH-DAG: [[TYPE_short:!.*]] = !{[[TYPE_char]], i64 2, !"short"}
// NEW-PATH-DAG: [[TYPE_int:!.*]] = !{[[TYPE_char]], i64 4, !"int"}
// NEW-PATH-DAG: [[TAG_i32:!.*]] = !{[[TYPE_int]], [[TYPE_int]], i64 0, i64 4}
// NEW-PATH-DAG: [[TYPE_A:!.*]] = !{[[TYPE_char]], i64 16, !"_ZTS7StructA", [[TYPE_short]], i64 0, i64 2, [[TYPE_int]], i64 4, i64 4, [[TYPE_short]], i64 8, i64 2, [[TYPE_int]], i64 12, i64 4}
// NEW-PATH-DAG: [[TAG_A_f16]] = !{[[TYPE_A]], [[TYPE_short]], i64 0, i64 2}
// NEW-PATH-DAG: [[TAG_A_f32]] = !{[[TYPE_A]], [[TYPE_int]], i64 4, i64 4}
// NEW-PATH-DAG: [[TYPE_B:!.*]] = !{[[TYPE_char]], i64 24, !"_ZTS7StructB", [[TYPE_short]], i64 0, i64 2, [[TYPE_A]], i64 4, i64 16, [[TYPE_int]], i64 20, i64 4}
// NEW-PATH-DAG: [[TAG_B_a_f16]] = !{[[TYPE_B]], [[TYPE_short]], i64 4, i64 2}
// NEW-PATH-DAG: [[TAG_B_a_f32]] = !{[[TYPE_B]], [[TYPE_int]], i64 8, i64 4}
// NEW-PATH-DAG: [[TAG_B_f32]] = !{[[TYPE_B]], [[TYPE_int]], i64 20, i64 4}
// NEW-PATH-DAG: [[TAG_B_a_f32_2]] = !{[[TYPE_B]], [[TYPE_int]], i64 16, i64 4}
// NEW-PATH-DAG: [[TYPE_S:!.*]] = !{[[TYPE_char]], i64 8, !"_ZTS7StructS", [[TYPE_short]], i64 0, i64 2, [[TYPE_int]], i64 4, i64 4}
// NEW-PATH-DAG: [[TAG_S_f16]] = !{[[TYPE_S]], [[TYPE_short]], i64 0, i64 2}
// NEW-PATH-DAG: [[TAG_S_f32]] = !{[[TYPE_S]], [[TYPE_int]], i64 4, i64 4}
// NEW-PATH-DAG: [[TYPE_S2:!.*]] = !{[[TYPE_char]], i64 8, !"_ZTS8StructS2", [[TYPE_short]], i64 0, i64 2, [[TYPE_int]], i64 4, i64 4}
// NEW-PATH-DAG: [[TAG_S2_f16]] = !{[[TYPE_S2]], [[TYPE_short]], i64 0, i64 2}
// NEW-PATH-DAG: [[TAG_S2_f32]] = !{[[TYPE_S2]], [[TYPE_int]], i64 4, i64 4}
// NEW-PATH-DAG: [[TYPE_C:!.*]] = !{[[TYPE_char]], i64 32, !"_ZTS7StructC", [[TYPE_short]], i64 0, i64 2, [[TYPE_B]], i64 4, i64 24, [[TYPE_int]], i64 28, i64 4}
// NEW-PATH-DAG: [[TAG_C_b_a_f32]] = !{[[TYPE_C]], [[TYPE_int]], i64 12, i64 4}
// NEW-PATH-DAG: [[TYPE_D:!.*]] = !{[[TYPE_char]], i64 36, !"_ZTS7StructD", [[TYPE_short]], i64 0, i64 2, [[TYPE_B]], i64 4, i64 24, [[TYPE_int]], i64 28, i64 4, [[TYPE_char]], i64 32, i64 1}
// NEW-PATH-DAG: [[TAG_D_b_a_f32]] = !{[[TYPE_D]], [[TYPE_int]], i64 12, i64 4}
// NEW-PATH-DAG: [[TYPE_five:!.*]] = !{[[TYPE_char]], i64 3, !"_ZTS4five", [[TYPE_char]], i64 0, i64 1, [[TYPE_char]], i64 1, i64 1, [[TYPE_char]], i64 2, i64 1}
// NEW-PATH-DAG: [[TAG_five_b]] = !{[[TYPE_five]], [[TYPE_char]], i64 1, i64 1}
// NEW-PATH-DAG: [[TYPE_six:!.*]] = !{[[TYPE_char]], i64 6, !"_ZTS3six", [[TYPE_char]], i64 0, i64 1, [[TYPE_char]], i64 4, i64 1, [[TYPE_char]], i64 5, i64 1}
// NEW-PATH-DAG: [[TAG_six_b]] = !{[[TYPE_six]], [[TYPE_char]], i64 4, i64 1}

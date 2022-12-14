// expected-no-diagnostics
#ifndef HEADER
#define HEADER

///==========================================================================///
// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -std=c++11 -triple powerpc64le-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-targets=i386-pc-linux-gnu -x c++ -std=c++11 -triple i386-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32

// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-version=45 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-version=45 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -std=c++11 -triple powerpc64le-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-version=45 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-version=45 -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-version=45 -fopenmp-targets=i386-pc-linux-gnu -x c++ -std=c++11 -triple i386-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-version=45 -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32

// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-version=50 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-version=50 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -std=c++11 -triple powerpc64le-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-version=50 -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-64
// RUN: %clang_cc1 -DCK18 -verify -fopenmp -fopenmp-version=50 -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32
// RUN: %clang_cc1 -DCK18 -fopenmp -fopenmp-version=50 -fopenmp-targets=i386-pc-linux-gnu -x c++ -std=c++11 -triple i386-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp -fopenmp-version=50 -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  %s  --check-prefix CK18 --check-prefix CK18-32

// RUN: %clang_cc1 -DCK18 -verify -fopenmp-simd -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  --check-prefix SIMD-ONLY17 %s
// RUN: %clang_cc1 -DCK18 -fopenmp-simd -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -std=c++11 -triple powerpc64le-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp-simd -fopenmp-targets=powerpc64le-ibm-linux-gnu -x c++ -triple powerpc64le-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  --check-prefix SIMD-ONLY17 %s
// RUN: %clang_cc1 -DCK18 -verify -fopenmp-simd -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -emit-llvm %s -o - | FileCheck -allow-deprecated-dag-overlap  --check-prefix SIMD-ONLY17 %s
// RUN: %clang_cc1 -DCK18 -fopenmp-simd -fopenmp-targets=i386-pc-linux-gnu -x c++ -std=c++11 -triple i386-unknown-unknown -emit-pch -o %t %s
// RUN: %clang_cc1 -fopenmp-simd -fopenmp-targets=i386-pc-linux-gnu -x c++ -triple i386-unknown-unknown -std=c++11 -include-pch %t -verify %s -emit-llvm -o - | FileCheck -allow-deprecated-dag-overlap  --check-prefix SIMD-ONLY17 %s
// SIMD-ONLY17-NOT: {{__kmpc|__tgt}}
#ifdef CK18

// CK18-DAG: [[SIZES:@.+]] = {{.+}}constant [1 x i64] [i64 4]
// Map types:
// - OMP_MAP_PRIVATE_VAL + OMP_MAP_TARGET_PARAM | OMP_MAP_IMPLICIT = 800
// CK18-DAG: [[TYPES:@.+]] = {{.+}}constant [1 x i64] [i64 800]

template<typename T>
int foo(T d) {
  #pragma omp target
  {
    d += (T)1;
  }
  return d;
}
// CK18-LABEL: implicit_maps_template_type_capture{{.*}}(
void implicit_maps_template_type_capture (int a){
  int i = a;

  // CK18: define {{.*}}i32 @{{.+}}foo{{.+}}(i32 {{[^,]+}})
  // CK18-DAG: call i32 @__tgt_target_kernel(ptr @{{.+}}, i64 -1, i32 -1, i32 0, ptr @.{{.+}}.region_id, ptr [[ARGS:%.+]])
  // CK18-DAG: [[BPARG:%.+]] = getelementptr inbounds {{.+}}[[ARGS]], i32 0, i32 2
  // CK18-DAG: store ptr [[BPGEP:%.+]], ptr [[BPARG]]
  // CK18-DAG: [[PARG:%.+]] = getelementptr inbounds {{.+}}[[ARGS]], i32 0, i32 3
  // CK18-DAG: store ptr [[PGEP:%.+]], ptr [[PARG]]
  // CK18-DAG: [[BPGEP]] = getelementptr inbounds {{.+}}[[BPS:%[^,]+]], i32 0, i32 0
  // CK18-DAG: [[PGEP]] = getelementptr inbounds {{.+}}[[PS:%[^,]+]], i32 0, i32 0

  // CK18-DAG: [[BP1:%.+]] = getelementptr inbounds {{.+}}[[BPS]], i32 0, i32 0
  // CK18-DAG: [[P1:%.+]] = getelementptr inbounds {{.+}}[[PS]], i32 0, i32 0
  // CK18-DAG: store i[[sz:64|32]] [[VAL:%.+]], ptr [[BP1]]
  // CK18-DAG: store i[[sz]] [[VAL]], ptr [[P1]]
  // CK18-DAG: [[VAL]] = load i[[sz]], ptr [[ADDR:%.+]],
  // CK18-64-DAG: store i32 {{.+}}, ptr [[ADDR]],

  // CK18: call void [[KERNEL:@.+]](i[[sz]] [[VAL]])
  i = foo(i);
}
// CK18: define internal void [[KERNEL]](i[[sz]] noundef [[ARG:%.+]])
// CK18: [[ADDR:%.+]] = alloca i[[sz]],
// CK18: store i[[sz]] [[ARG]], ptr [[ADDR]],
// CK18-64: {{.+}} = load i32, ptr [[ADDR]],
// CK18-32: {{.+}} = load i32, ptr [[ADDR]],

#endif // CK18
#endif

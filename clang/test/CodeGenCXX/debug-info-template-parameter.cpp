// Test for DebugInfo for Defaulted parameters for C++ templates
// Supported: -O0, standalone DI

// RUN: %clang_cc1 -emit-llvm %std_cxx11-14 -dwarf-version=5 -triple x86_64 %s -O0 -disable-llvm-passes -debug-info-kind=standalone -o - | FileCheck %s --check-prefixes=CHECK,PRE17
// RUN: %clang_cc1 -emit-llvm %std_cxx17- -dwarf-version=5 -triple x86_64 %s -O0 -disable-llvm-passes -debug-info-kind=standalone -o - | FileCheck %s --check-prefixes=CHECK,CXX17
// RUN: %clang_cc1 -emit-llvm %std_cxx17- -dwarf-version=4 -triple x86_64 %s -O0 -disable-llvm-passes -debug-info-kind=standalone -o - | FileCheck %s --check-prefixes=CHECK,CXX17

// CHECK: DILocalVariable(name: "f1", {{.*}}, type: ![[TEMPLATE_TYPE:[0-9]+]]
// CHECK: [[TEMPLATE_TYPE]] = {{.*}}!DICompositeType({{.*}}, templateParams: ![[F1_TYPE:[0-9]+]]
// CHECK: [[F1_TYPE]] = !{![[FIRST:[0-9]+]], ![[SECOND:[0-9]+]], ![[THIRD:[0-9]+]], ![[FORTH:[0-9]+]]}
// CHECK: [[FIRST]] = !DITemplateTypeParameter(name: "T", type: !{{[0-9]*}})
// CHECK: [[SECOND]] = !DITemplateValueParameter(name: "i", type: !{{[0-9]*}}, value: i32 6)
// PRE17: [[THIRD]] = !DITemplateValueParameter(name: "b", type: !{{[0-9]*}}, value: i8 0)
// CXX17: [[THIRD]] = !DITemplateValueParameter(name: "b", type: !{{[0-9]*}}, value: i1 false)

// CHECK: DILocalVariable(name: "f2", {{.*}}, type: ![[TEMPLATE_TYPE:[0-9]+]]
// CHECK: [[TEMPLATE_TYPE]] = {{.*}}!DICompositeType({{.*}}, templateParams: ![[F2_TYPE:[0-9]+]]
// CHECK: [[F2_TYPE]] = !{![[FIRST:[0-9]+]], ![[SECOND:[0-9]+]], ![[THIRD:[0-9]+]], ![[FORTH:[0-9]+]]}
// CHECK: [[FIRST]] = !DITemplateTypeParameter(name: "T", type: !{{[0-9]*}}, defaulted: true)
// CHECK: [[SECOND]] = !DITemplateValueParameter(name: "i", type: !{{[0-9]*}}, defaulted: true, value: i32 3)
// PRE17: [[THIRD]] = !DITemplateValueParameter(name: "b", type: !{{[0-9]*}}, defaulted: true, value: i8 1)
// CXX17: [[THIRD]] = !DITemplateValueParameter(name: "b", type: !{{[0-9]*}}, defaulted: true, value: i1 true)

template <typename T = char, int i = 3, bool b = true, int x = sizeof(T)>
class foo {
};

int main() {
  foo<int, 6, false, 3> f1;
  foo<> f2;
  return 0;
}

// RUN: %clang_cc1 -triple i686-pc-mingw32 -fms-extensions -Wmicrosoft %s -emit-llvm -o - | FileCheck %s --check-prefix=CHECK32 --check-prefix=CHECK
// RUN: %clang_cc1 -triple x86_64-pc-windows-msvc19.11.0 -fms-extensions -Wmicrosoft %s -emit-llvm -o - | FileCheck %s --check-prefix=CHECK64 --check-prefix=CHECK

class Test1 {
public:
   int a;
};

void f1() {
  Test1 var;
  var.Test1::Test1();

  // CHECK32:   call void @llvm.memcpy.p0.p0.i32(ptr align 4 %{{.*}}, ptr align 4 %{{.*}}, i32 4, i1 false)
  // CHECK64:   call void @llvm.memcpy.p0.p0.i64(ptr align 4 %{{.*}}, ptr align 4 %{{.*}}, i64 4, i1 false)
  var.Test1::Test1(var);
}

class Test2 {
public:
  Test2() { a = 10; b = 10; }
   int a;
   int b;
};

void f2() {
  // CHECK:  %var = alloca %class.Test2, align 4
  // CHECK32-NEXT:  call x86_thiscallcc void @_ZN5Test2C1Ev(ptr {{[^,]*}} %var)
  // CHECK64-NEXT:  %call = call noundef ptr @"??0Test2@@QEAA@XZ"(ptr {{[^,]*}} %var)
  Test2 var;

  // CHECK32-NEXT:  call x86_thiscallcc void @_ZN5Test2C1Ev(ptr {{[^,]*}} %var)
  // CHECK64-NEXT:  %call1 = call noundef ptr @"??0Test2@@QEAA@XZ"(ptr {{[^,]*}} %var)
  var.Test2::Test2();

  // CHECK32:  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %{{.*}}, ptr align 4 %{{.*}}, i32 8, i1 false)
  // CHECK64:  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %{{.*}}, ptr align 4 %{{.*}}, i64 8, i1 false)
  var.Test2::Test2(var);
}




class Test3 {
public:
  Test3() { a = 10; b = 15; c = 20; }
  Test3(const Test3& that) { a = that.a; b = that.b; c = that.c; }
   int a;
   int b;
   int c;
};

void f3() {
  // CHECK32: call x86_thiscallcc void @_ZN5Test3C1Ev(ptr {{[^,]*}} %var)
  // CHECK64: %call = call noundef ptr @"??0Test3@@QEAA@XZ"(ptr {{[^,]*}} %var)
  Test3 var;

  // CHECK32-NEXT: call x86_thiscallcc void @_ZN5Test3C1Ev(ptr {{[^,]*}} %var2)
  // CHECK64-NEXT: %call1 = call noundef ptr @"??0Test3@@QEAA@XZ"(ptr {{[^,]*}} %var2)
  Test3 var2;

  // CHECK32-NEXT: call x86_thiscallcc void @_ZN5Test3C1Ev(ptr {{[^,]*}} %var)
  // CHECK64-NEXT: %call2 = call noundef ptr @"??0Test3@@QEAA@XZ"(ptr {{[^,]*}} %var)
  var.Test3::Test3();

  // CHECK32-NEXT: call x86_thiscallcc void @_ZN5Test3C1ERKS_(ptr {{[^,]*}} %var, ptr noundef nonnull align {{[0-9]+}} dereferenceable({{[0-9]+}}) %var2)
  // CHECK64-NEXT: %call3 = call noundef ptr @"??0Test3@@QEAA@AEBV0@@Z"(ptr {{[^,]*}} %var, ptr noundef nonnull align {{[0-9]+}} dereferenceable({{[0-9]+}}) %var2)
  var.Test3::Test3(var2);
}

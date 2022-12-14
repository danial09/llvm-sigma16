# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=icelake-server -instruction-tables < %s | FileCheck %s

vpdpbusd    %xmm16, %xmm17, %xmm19
vpdpbusd    (%rax), %xmm17, %xmm19
vpdpbusd    (%rax){1to4}, %xmm17, %xmm19
vpdpbusd    %xmm16, %xmm17, %xmm19 {k1}
vpdpbusd    (%rax), %xmm17, %xmm19 {k1}
vpdpbusd    (%rax){1to4}, %xmm17, %xmm19 {k1}
vpdpbusd    %xmm16, %xmm17, %xmm19 {z}{k1}
vpdpbusd    (%rax), %xmm17, %xmm19 {z}{k1}
vpdpbusd    (%rax){1to4}, %xmm17, %xmm19 {z}{k1}

vpdpbusd    %ymm16, %ymm17, %ymm19
vpdpbusd    (%rax), %ymm17, %ymm19
vpdpbusd    (%rax){1to8}, %ymm17, %ymm19
vpdpbusd    %ymm16, %ymm17, %ymm19 {k1}
vpdpbusd    (%rax), %ymm17, %ymm19 {k1}
vpdpbusd    (%rax){1to8}, %ymm17, %ymm19 {k1}
vpdpbusd    %ymm16, %ymm17, %ymm19 {z}{k1}
vpdpbusd    (%rax), %ymm17, %ymm19 {z}{k1}
vpdpbusd    (%rax){1to8}, %ymm17, %ymm19 {z}{k1}

vpdpbusds   %xmm16, %xmm17, %xmm19
vpdpbusds   (%rax), %xmm17, %xmm19
vpdpbusds   (%rax){1to4}, %xmm17, %xmm19
vpdpbusds   %xmm16, %xmm17, %xmm19 {k1}
vpdpbusds   (%rax), %xmm17, %xmm19 {k1}
vpdpbusds   (%rax){1to4}, %xmm17, %xmm19 {k1}
vpdpbusds   %xmm16, %xmm17, %xmm19 {z}{k1}
vpdpbusds   (%rax), %xmm17, %xmm19 {z}{k1}
vpdpbusds   (%rax){1to4}, %xmm17, %xmm19 {z}{k1}

vpdpbusds   %ymm16, %ymm17, %ymm19
vpdpbusds   (%rax), %ymm17, %ymm19
vpdpbusds   (%rax){1to8}, %ymm17, %ymm19
vpdpbusds   %ymm16, %ymm17, %ymm19 {k1}
vpdpbusds   (%rax), %ymm17, %ymm19 {k1}
vpdpbusds   (%rax){1to8}, %ymm17, %ymm19 {k1}
vpdpbusds   %ymm16, %ymm17, %ymm19 {z}{k1}
vpdpbusds   (%rax), %ymm17, %ymm19 {z}{k1}
vpdpbusds   (%rax){1to8}, %ymm17, %ymm19 {z}{k1}

vpdpwssd    %xmm16, %xmm17, %xmm19
vpdpwssd    (%rax), %xmm17, %xmm19
vpdpwssd    (%rax){1to4}, %xmm17, %xmm19
vpdpwssd    %xmm16, %xmm17, %xmm19 {k1}
vpdpwssd    (%rax), %xmm17, %xmm19 {k1}
vpdpwssd    (%rax){1to4}, %xmm17, %xmm19 {k1}
vpdpwssd    %xmm16, %xmm17, %xmm19 {z}{k1}
vpdpwssd    (%rax), %xmm17, %xmm19 {z}{k1}
vpdpwssd    (%rax){1to4}, %xmm17, %xmm19 {z}{k1}

vpdpwssd    %ymm16, %ymm17, %ymm19
vpdpwssd    (%rax), %ymm17, %ymm19
vpdpwssd    (%rax){1to8}, %ymm17, %ymm19
vpdpwssd    %ymm16, %ymm17, %ymm19 {k1}
vpdpwssd    (%rax), %ymm17, %ymm19 {k1}
vpdpwssd    (%rax){1to8}, %ymm17, %ymm19 {k1}
vpdpwssd    %ymm16, %ymm17, %ymm19 {z}{k1}
vpdpwssd    (%rax), %ymm17, %ymm19 {z}{k1}
vpdpwssd    (%rax){1to8}, %ymm17, %ymm19 {z}{k1}

vpdpwssds   %xmm16, %xmm17, %xmm19
vpdpwssds   (%rax), %xmm17, %xmm19
vpdpwssds   (%rax){1to4}, %xmm17, %xmm19
vpdpwssds   %xmm16, %xmm17, %xmm19 {k1}
vpdpwssds   (%rax), %xmm17, %xmm19 {k1}
vpdpwssds   (%rax){1to4}, %xmm17, %xmm19 {k1}
vpdpwssds   %xmm16, %xmm17, %xmm19 {z}{k1}
vpdpwssds   (%rax), %xmm17, %xmm19 {z}{k1}
vpdpwssds   (%rax){1to4}, %xmm17, %xmm19 {z}{k1}

vpdpwssds   %ymm16, %ymm17, %ymm19
vpdpwssds   (%rax), %ymm17, %ymm19
vpdpwssds   (%rax){1to8}, %ymm17, %ymm19
vpdpwssds   %ymm16, %ymm17, %ymm19 {k1}
vpdpwssds   (%rax), %ymm17, %ymm19 {k1}
vpdpwssds   (%rax){1to8}, %ymm17, %ymm19 {k1}
vpdpwssds   %ymm16, %ymm17, %ymm19 {z}{k1}
vpdpwssds   (%rax), %ymm17, %ymm19 {z}{k1}
vpdpwssds   (%rax){1to8}, %ymm17, %ymm19 {z}{k1}

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusd	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusd	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpbusds	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpbusds	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssd	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssd	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  2      11    0.50    *                   vpdpwssds	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  2      12    0.50    *                   vpdpwssds	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}

# CHECK:      Resources:
# CHECK-NEXT: [0]   - ICXDivider
# CHECK-NEXT: [1]   - ICXFPDivider
# CHECK-NEXT: [2]   - ICXPort0
# CHECK-NEXT: [3]   - ICXPort1
# CHECK-NEXT: [4]   - ICXPort2
# CHECK-NEXT: [5]   - ICXPort3
# CHECK-NEXT: [6]   - ICXPort4
# CHECK-NEXT: [7]   - ICXPort5
# CHECK-NEXT: [8]   - ICXPort6
# CHECK-NEXT: [9]   - ICXPort7
# CHECK-NEXT: [10]  - ICXPort8
# CHECK-NEXT: [11]  - ICXPort9

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]
# CHECK-NEXT:  -      -     36.00  36.00  24.00  24.00   -      -      -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   Instructions:
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusd	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusd	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpbusds	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpbusds	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssd	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssd	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%xmm16, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to4}, %xmm17, %xmm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%xmm16, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to4}, %xmm17, %xmm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%xmm16, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to4}, %xmm17, %xmm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%ymm16, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to8}, %ymm17, %ymm19
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%ymm16, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to8}, %ymm17, %ymm19 {%k1}
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -      -      -     vpdpwssds	%ymm16, %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax), %ymm17, %ymm19 {%k1} {z}
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -      -      -     vpdpwssds	(%rax){1to8}, %ymm17, %ymm19 {%k1} {z}

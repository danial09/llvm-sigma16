// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sme < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump --no-print-imm-hex -d --mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:   | llvm-objdump --no-print-imm-hex -d --mattr=-sve - | FileCheck %s --check-prefix=CHECK-UNKNOWN

ldff1d  { z31.d }, p7/z, [sp]
// CHECK-INST: ldff1d  { z31.d }, p7/z, [sp]
// CHECK-ENCODING: [0xff,0x7f,0xff,0xa5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a5ff7fff <unknown>

ldff1d  { z31.d }, p7/z, [sp, xzr, lsl #3]
// CHECK-INST: ldff1d  { z31.d }, p7/z, [sp]
// CHECK-ENCODING: [0xff,0x7f,0xff,0xa5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a5ff7fff <unknown>

ldff1d  { z0.d }, p0/z, [x0, x0, lsl #3]
// CHECK-INST: ldff1d  { z0.d }, p0/z, [x0, x0, lsl #3]
// CHECK-ENCODING: [0x00,0x60,0xe0,0xa5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a5e06000 <unknown>

ldff1d  { z31.d }, p7/z, [sp, z31.d]
// CHECK-INST: ldff1d  { z31.d }, p7/z, [sp, z31.d]
// CHECK-ENCODING: [0xff,0xff,0xdf,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5dfffff <unknown>

ldff1d  { z23.d }, p3/z, [x13, z8.d, lsl #3]
// CHECK-INST: ldff1d  { z23.d }, p3/z, [x13, z8.d, lsl #3]
// CHECK-ENCODING: [0xb7,0xed,0xe8,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5e8edb7 <unknown>

ldff1d  { z21.d }, p5/z, [x10, z21.d, uxtw]
// CHECK-INST: ldff1d  { z21.d }, p5/z, [x10, z21.d, uxtw]
// CHECK-ENCODING: [0x55,0x75,0x95,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5957555 <unknown>

ldff1d  { z21.d }, p5/z, [x10, z21.d, sxtw]
// CHECK-INST: ldff1d  { z21.d }, p5/z, [x10, z21.d, sxtw]
// CHECK-ENCODING: [0x55,0x75,0xd5,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5d57555 <unknown>

ldff1d  { z0.d }, p0/z, [x0, z0.d, uxtw #3]
// CHECK-INST: ldff1d  { z0.d }, p0/z, [x0, z0.d, uxtw #3]
// CHECK-ENCODING: [0x00,0x60,0xa0,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5a06000 <unknown>

ldff1d  { z0.d }, p0/z, [x0, z0.d, sxtw #3]
// CHECK-INST: ldff1d  { z0.d }, p0/z, [x0, z0.d, sxtw #3]
// CHECK-ENCODING: [0x00,0x60,0xe0,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5e06000 <unknown>

ldff1d  { z31.d }, p7/z, [z31.d, #248]
// CHECK-INST: ldff1d  { z31.d }, p7/z, [z31.d, #248]
// CHECK-ENCODING: [0xff,0xff,0xbf,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5bfffff <unknown>

ldff1d  { z0.d }, p0/z, [z0.d]
// CHECK-INST: ldff1d  { z0.d }, p0/z, [z0.d]
// CHECK-ENCODING: [0x00,0xe0,0xa0,0xc5]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c5a0e000 <unknown>

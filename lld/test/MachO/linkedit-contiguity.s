# REQUIRES: x86
# RUN: rm -rf %t; split-file %s %t

## codesign requires that each section in __LINKEDIT ends where the next one
## starts and that they follow a certain order. This test enforces that invariant.
## It also checks that the last section in __LINKEDIT covers the last byte of
## the segment.

# RUN: llvm-mc -filetype=obj -triple=x86_64-apple-darwin %t/foo.s -o %t/foo.o
# RUN: %lld %t/foo.o -dylib -o %t/libfoo.dylib

# RUN: llvm-mc -filetype=obj -triple=x86_64-apple-darwin %t/test.s -o %t/test.o

# RUN: %lld -lSystem -adhoc_codesign -o %t/test %t/libfoo.dylib %t/test.o
# RUN: llvm-objdump --macho --all-headers %t/test | FileCheck --check-prefixes=CHECK,OPCODE %s

# RUN: %lld -lSystem -adhoc_codesign -fixup_chains -o %t/chained_test %t/libfoo.dylib %t/test.o
# RUN: llvm-objdump --macho --all-headers %t/chained_test | FileCheck --check-prefixes=CHECK,CHAINED %s

# CHECK:      segname __LINKEDIT
# CHECK-NEXT: vmaddr
# CHECK-NEXT: vmsize
# CHECK-NEXT: fileoff [[#LINKEDIT_OFF:]]
# CHECK-NEXT: filesize [[#LINKEDIT_SIZE:]]

# OPCODE:      cmd LC_DYLD_INFO_ONLY
# OPCODE-NEXT: cmdsize 48
# OPCODE-NEXT: rebase_off [[#REBASE_OFF:]]
# OPCODE-NEXT: rebase_size [[#REBASE_SIZE:]]
# OPCODE-NEXT: bind_off [[#BIND_OFF: REBASE_OFF + REBASE_SIZE]]
# OPCODE-NEXT: bind_size [[#BIND_SIZE:]]
# OPCODE-NEXT: weak_bind_off [[#WEAK_OFF: BIND_OFF + BIND_SIZE]]
# OPCODE-NEXT: weak_bind_size [[#WEAK_SIZE:]]
# OPCODE-NEXT: lazy_bind_off [[#LAZY_OFF: WEAK_OFF + WEAK_SIZE]]
# OPCODE-NEXT: lazy_bind_size [[#LAZY_SIZE:]]
# OPCODE-NEXT: export_off [[#EXPORT_OFF: LAZY_OFF + LAZY_SIZE]]
# OPCODE-NEXT: export_size [[#EXPORT_SIZE:]]

# CHAINED:      cmd LC_DYLD_CHAINED_FIXUPS
# CHAINED-NEXT: cmdsize
# CHAINED-NEXT: dataoff [[#FIXUPS_OFF: LINKEDIT_OFF]]
# CHAINED-NEXT: datasize [[#FIXUPS_SIZE:]]

# CHAINED:      cmd LC_DYLD_EXPORTS_TRIE
# CHAINED-NEXT: cmdsize
# CHAINED-NEXT: dataoff [[#EXPORT_OFF: FIXUPS_OFF + FIXUPS_SIZE]]
# CHAINED-NEXT: datasize [[#EXPORT_SIZE:]]

# CHECK:      cmd LC_FUNCTION_STARTS
# CHECK-NEXT: cmdsize
# CHECK-NEXT: dataoff [[#FUNCSTARTS_OFF: EXPORT_OFF + EXPORT_SIZE]]
# CHECK-NEXT: datasize [[#FUNCSTARTS_SIZE:]]

# CHECK:      cmd LC_DATA_IN_CODE
# CHECK-NEXT: cmdsize
# CHECK-NEXT: dataoff [[#DIC_OFF: FUNCSTARTS_OFF + FUNCSTARTS_SIZE]]

# CHECK:      cmd LC_CODE_SIGNATURE
# CHECK-NEXT: cmdsize 16
# CHECK-NEXT: dataoff [[#SIG_OFF:]]
# CHECK-NEXT: datasize [[#SIG_SIZE: LINKEDIT_OFF + LINKEDIT_SIZE - SIG_OFF]]

#--- foo.s
.globl _foo, _weak_foo
.weak_definition _weak_foo
_foo:
_weak_foo:

#--- test.s
.globl _main
_main:
  callq _foo
  callq _weak_foo
  ret

.p2align 2, 0x90
.data_region jt32
.long 0
.end_data_region

//===-- Sigma16SEFrameLowering.cpp - Sigma16 Frame Information ------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Sigma16 implementation of TargetFrameLowering class.
//
//===----------------------------------------------------------------------===//

#include "Sigma16SEFrameLowering.h"

#include "Sigma16MachineFunction.h"
#include "Sigma16SEInstrInfo.h"
#include "Sigma16Subtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Target/TargetOptions.h"

using namespace llvm;

Sigma16SEFrameLowering::Sigma16SEFrameLowering(const Sigma16Subtarget &STI)
    : Sigma16FrameLowering(STI, STI.stackAlignment()) {}

//@emitPrologue {
void Sigma16SEFrameLowering::emitPrologue(MachineFunction &MF,
                                          MachineBasicBlock &MBB) const {}
//}

//@emitEpilogue {
void Sigma16SEFrameLowering::emitEpilogue(MachineFunction &MF,
                                          MachineBasicBlock &MBB) const {}
//}

const Sigma16FrameLowering *
llvm::createSigma16SEFrameLowering(const Sigma16Subtarget &ST) {
  return new Sigma16SEFrameLowering(ST);
}

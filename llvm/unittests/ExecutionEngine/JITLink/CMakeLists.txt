set(LLVM_LINK_COMPONENTS
  ${LLVM_TARGETS_TO_BUILD}
  JITLink
  Object
  OrcJIT
  OrcShared
  OrcTargetProcess
  RuntimeDyld
  Support
  )

add_llvm_unittest(JITLinkTests
    EHFrameSupportTests.cpp
    LinkGraphTests.cpp
  )

target_link_libraries(JITLinkTests PRIVATE LLVMTestingSupport)

set_property(TARGET JITLinkTests PROPERTY FOLDER "Tests/UnitTests/ExecutionTests")

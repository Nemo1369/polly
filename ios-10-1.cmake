# Copyright (c) 2015, Tomas Zemaitis
# All rights reserved.

if(DEFINED POLLY_IOS_10_1_CMAKE_)
    return()
else()
    set(POLLY_IOS_10_1_CMAKE_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_clear_environment_variables.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

set(IOS_SDK_VERSION 10.1)
set(POLLY_XCODE_COMPILER "clang")
polly_init(
    "iOS ${IOS_SDK_VERSION} Universal (iphoneos + iphonesimulator) / \
    ${POLLY_XCODE_COMPILER}"
    "Xcode"
    )

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_fatal_error)

set(APPLE_BUNDLE_GUI_IDENTIFIER "" CACHE STRING "Bundle GUI identifier")
set(APPLE_CODE_SIGN_IDENTITY "" CACHE STRING "Code sign identity")

# Fix try_compile
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${APPLE_BUNDLE_GUI_IDENTIFIER})
set(CMAKE_MACOSX_BUNDLE YES)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ${APPLE_CODE_SIGN_IDENTITY})

set(IPHONEOS_ARCHS armv7;armv7s;arm64)
set(IPHONESIMULATOR_ARCHS i386;x86_64)

include("${CMAKE_CURRENT_LIST_DIR}/compiler/xcode.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/iphone.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_ios_development_team.cmake")
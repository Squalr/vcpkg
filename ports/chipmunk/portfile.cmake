include(vcpkg_common_functions)

#architecture detection
if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
   set(CHIPMUNK_ARCH Win32)
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
   set(CHIPMUNK_ARCH x64)
else()
   message(FATAL_ERROR "unsupported architecture")
endif()

#linking
if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    set(CHIPMUNK_CONFIGURATION_SUFFIX " DLL")
else()
    if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
        set(CHIPMUNK_CONFIGURATION_SUFFIX "")
    else()
        set(CHIPMUNK_CONFIGURATION_SUFFIX " SCRT")
    endif()
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO slembcke/Chipmunk2D
    REF Chipmunk-7.0.1
    SHA512 33b5afa56adfe693e5115c9b73fa65a51ccbc20a22b23bfaf58bf7e8ff9b2af4c06d4af89ca5958a2d6c5c20c757c7b834593589289325d480d90e9eff1909d7
    HEAD_REF master
    PATCHES cocos2d.patch
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    set(LIBRARY_OPTIONS -DBUILD_SHARED=OFF -DBUILD_STATIC=ON)
else()
    set(LIBRARY_OPTIONS -DBUILD_SHARED=ON -DBUILD_STATIC=OFF)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DBUILD_DEMOS=OFF ${LIBRARY_OPTIONS}
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

# Cleanup
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/chipmunk RENAME copyright)


message(STATUS "Installing done")

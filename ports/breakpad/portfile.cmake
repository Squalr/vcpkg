include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/breakpad
    REF 54fa71efbe50fb2b58096d871575b59e12edba6d
    SHA512 ecd1c6c5cc0e3984d05fe86ec11172e93b0e31c39ce0af9d0de08b8d03083686e2288e0cd787180c599446c277e58f48550ce4ab718019576c64fc403a592745
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/unofficial-breakpad TARGET_PATH share/unofficial-breakpad)

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/breakpad RENAME copyright)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/Breakpad.xcodeproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/gcov)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/handler/minidump_test.xcodeproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/da.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/de.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/English.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/es.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/fr.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/ja.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/it.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/nl.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/no.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/sl.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/sv.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/sender/tr.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/client/mac/testapp/English.lproj)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

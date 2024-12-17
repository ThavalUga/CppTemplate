function(target_set_warnings TARGET ENABLE ENABLE_AS_ERRORS)
    if(NOT ${ENABLE})
        message(STATUS "Warnings disabled for: ${TARGET}")
        return()
    else()
        message(STATUS "Warnings enabled for: ${TARGET}")
    endif()

    set(MSVC_WARINGS
        /W4
        /permissive-
    )

    set(CLANG_WARINGS
        /Wall
        /Wextra
        /Wpedantic
    )

    set(GCC_WARINGS ${CLANG_WARNINGS})

    if(${ENABLE_AS_ERRORS})
        message(STATUS "Warnings as errors enabled for: ${TARGET}")
        set(MSVC_WARINGS ${MSVC_WARINGS} /WX)
        set(CLANG_WARINGS ${CLANG_WARNINGS} -Werror)
        set(GCC_WARINGS ${GCC_WARINGS} -Werror)
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        set(WARNINGS ${MSVC_WARINGS})
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "CLANG")
        set(WARNINGS ${CLANG_WARNINGS})
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        set(WARNINGS ${GCC_WARINGS})
    endif()

    target_compile_options(${TARGET} PRIVATE ${WARNINGS})
    message(STATUS ${WARNINGS})

endfunction(target_set_warnings TARGET ENABLE ENABLED_AS_ERRORS)

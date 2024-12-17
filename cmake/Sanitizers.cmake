function(add_sanitizer_flag)
    if(NOT ${ENABLE_SANITIZE_ADR} AND NOT ${ENABLE_SANITIZE_UNDEF})
        message(STATUS "Sanitizers disabled")
        return()
    else()
        message(STATUS "Sanitizers enabled")
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "CLANG" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        add_compile_options("-fno-omit-frame-pointer")
        add_link_options("-fno-omit-frame-pointer")

        if(${ENABLE_SANITIZE_ADR})
            add_compile_options("-fsanitize=address")
            add_link_options("-fsanitize=address")
        endif()

        if(${ENABLE_SANITIZE_UNDEF})
            add_compile_options("-fsanitize=undefined")
            add_link_options("-fsanitize=undefined")
        endif()

    elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        if(${ENABLE_SANITIZE_ADR})
            add_compile_options("/fsanitize=address")
        endif()

        if(${ENABLE_SANITIZE_UNDEF})
            message(STATUS "Undefined sanitizer not implemented for MSVC")
        endif()

    else()
        message(STATUS "Compiler not supported for sanitizers")
    endif()

endfunction()
set(EXE_SOURCES
    main.cpp
)

add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES})

if(${ENABLE_WARNINGS})
    target_set_warnings(${EXECUTABLE_NAME} ${ENABLE_WARNINGS} ${ENABLE_WARNINGS_AS_ERRORS})
endif()

if(${ENABLE_LTO})
    target_enable_lto(${EXECUTABLE_NAME} ${ENABLE_LTO})
endif()
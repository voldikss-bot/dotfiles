cmake_minimum_required(VERSION 3.5)

project(%HERE%%FDIR%)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(%FDIR%
    main.cpp
    )

# ============================================================================
# For Qt
# ----------------------------------------------------------------------------
# find_package(Qt5 COMPONENTS Widgets REQUIRED)
# target_link_libraries(%FDIR% PRIVATE Qt5::Widgets)
# ============================================================================

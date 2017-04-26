PROJECT(cross-compile-test)
cmake_minimum_required(VERSION 3.3)
SET(BOOST_INCLUDEDIR       "${CMAKE_SOURCE_DIR}/boost/include")
SET(BOOST_LIBRARYDIR       "${CMAKE_SOURCE_DIR}/boost/lib")
SET(Boost_NO_SYSTEM_PATHS  ON)


add_definitions(-DBOOST_ALL_DYN_LINK)
find_package(OpenSSL REQUIRED)
find_package(Boost 1.54 COMPONENTS system unit_test_framework filesystem thread date_time chrono regex REQUIRED)

add_definitions(-std=c++11)

include_directories(
    ${Boost_INCLUDE_DIRS}
)



ADD_EXECUTABLE(${CMAKE_PROJECT_NAME} src/main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME} ${CMAKE_DL_LIBS} ${Boost_LIBRARIES})

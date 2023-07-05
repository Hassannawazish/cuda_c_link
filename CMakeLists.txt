cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(vector_addition LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CUDA_STANDARD 11)

add_executable(vector_add main.cpp vector_add.cu)

target_link_libraries(vector_add PRIVATE ${CUDART_LIBRARY})

set_target_properties(vector_add PROPERTIES CUDA_SEPARABLE_COMPILATION ON)





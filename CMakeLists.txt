#
# Mbed CE Hello World Project
# To compile this project, please change the target name inside the batch/bash script file, and run the script
#
cmake_minimum_required(VERSION 3.19)
cmake_policy(VERSION 3.19)

#Define project name : TODO Change the name 
set(PROJECT_NAME  "HelloWorld")

# Initialize Mbed OS build system. 
# Note: This block must be before the project() call.
set(MBED_APP_JSON_PATH mbed_app.json)
# set(CUSTOM_TARGETS_JSON_PATH custom_targets.json) # If you need a custom target, use this line to specify the custom_targets.json

include(mbed-os/tools/cmake/app.cmake) # Load Mbed CE toolchain file and basic build system

# If you need any custom upload method configuration for your target, do that here

add_subdirectory(mbed-os) # Load Mbed OS build targets.  Must be added before any other subdirectories

#Keep files inside /src directory
file(GLOB_RECURSE SOURCES
     src/*.cpp
     src/*.h
)

#Project name is based on the previous definition
project(MbedCEHelloWorld) 

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} mbed-os) # Can also link to mbed-baremetal here
mbed_set_post_build(${PROJECT_NAME}) # Must call this for each target to set up bin file creation, code upload, etc

mbed_finalize_build() # Make sure this is the last line of the top-level buildscript
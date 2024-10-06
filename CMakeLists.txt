#
# Mbed CE Hello World Project
#
cmake_minimum_required(VERSION 3.19)
cmake_policy(VERSION 3.19)

#### Initialize Mbed OS build system. ####
######################################################################################################
### Block of including .json5 files. Files of this block must be included before the app.cmake

#[[ Set path of mbed_app.json (necessary everytime if mbed_app.json5 is in project) ]]
set(MBED_APP_JSON_PATH mbed_app.json5)

###--------------------------------------------------------------------------------------------------- 
#[[ This part is dedicated for custom targets only! Settings below activate targets from
    custom_targets.json5 and upload method config, otherwise functions below should be commented. ]]

#[[ Here set path for custom_targets.json5 (this is our default) ]]
#set(CUSTOM_TARGETS_JSON_PATH custom_targets/custom_targets.json5) 

#[[ Here you can set path for custom upload config .cmake (optional example) ]]
#set(CUSTOM_UPLOAD_CFG_PATH ${CMAKE_SOURCE_DIR}/${MBED_TARGET}/${MBED_TARGET}.cmake)

#[[ Note: For custom target you need also an upload method and we have few options how you can do that
    - use the variable CUSTOM_UPLOAD_CFG_PATH above
    - use default expected path for custom targets upload methods where you create your own config
      MY_PROJECT/custom_targets/upload_method_cfg
    - of course you can do it by yourself directly via cmake in this file
   For more visit https://github.com/mbed-ce/mbed-os/wiki/Upload-Methods ]]
   
### End of block
######################################################################################################

### include app.cmake (necessary everytime) ###
include(mbed-os/tools/cmake/app.cmake)

######################################################################################################
### Block of including project folders

#[[ If using a custom target, the subdirectory containing the custom target must be included before 
    the mbed-os subdir, otherwise the next line should be commented]]
#add_subdirectory(custom_targets)

###--------------------------------------------------------------------------------------------------
## Add mbed-os subdirectory (necessary everytime)
add_subdirectory(mbed-os)

###--------------------------------------------------------------------------------------------------
## Add another subdirectory, for example subdirectory of a library (if needed)
#add_subdirectory(YourLibrary)

### End of block
######################################################################################################

### Set up your project name (necessary everytime)
project(MbedCEHelloWorld)

### add executable (necessary everytime)
add_executable(${CMAKE_PROJECT_NAME} main.cpp)

### Set post build (necessary everytime)
mbed_set_post_build(${CMAKE_PROJECT_NAME})
#[[Or in case of custom linker script which should be placed like this
   directory PROJECT_NAME/custom_targets/MBED_TARGET/MBED_TARGET.ld]]
#mbed_set_post_build(${CMAKE_PROJECT_NAME}  ${CMAKE_SOURCE_DIR}/custom_targets/${MBED_TARGET}/${MBED_TARGET}.ld)

######################################################################################################
### Link libraries block
#[[For more about this configuraion visit wiki page MbedOS-configuration
https://github.com/mbed-ce/mbed-os/wiki/MbedOS-configuration#configuration-via-cmake-files]]

#[[link MbedOS and its libraries (necessary everytime)]]
target_link_libraries(${CMAKE_PROJECT_NAME}  mbed-os) 

### link user library (if needed)
#target_link_libraries(${CMAKE_PROJECT_NAME} YourLibrary) 

### End of block
######################################################################################################

### Build finalize does necessary configuration for debug in most cases (necessary everytime)
mbed_finalize_build()

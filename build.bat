REM  Create the build directory to save our object files and the bin/hex file
mkdir build
REM Change directory to the created build direcotry
cd build
REM Run cmake command that configure the project: Change your target dependently. Do not use '-', you should use '_'
cmake .. -GNinja -DCMAKE_BUILD_TYPE=Develop -DMBED_TARGET=NUCLEO_F207ZG
REM Run 'ninja' to start compiling the project
ninja
REM  go back to the root directory 
cd ..
REM Wait for user to press ENTER or any other key
pause
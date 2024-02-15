#First we create the build directory
mkdir -p build;
#change directory to the created folder
cd build;
#Run cmake to configure the project and compile the project after that
cmake .. -GNinja -DCMAKE_BUILD_TYPE=Develop -DMBED_TARGET=NUCLEO_F207ZG && ninja;
#Go back to the root directory
cd ..;
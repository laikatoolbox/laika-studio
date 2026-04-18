cmake -G Ninja -DCMAKE_INSTALL_PREFIX="src/lib/KDDockWidgets" "submodules/KDDockWidgets" -DKDDockWidgets_FRONTENDS="qtquick"
cmake --build .
cmake --build . --target install
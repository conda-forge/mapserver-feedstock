setlocal ENABLEDELAYEDEXPANSION
REM export PKG_CONFIG_LIBDIR=%PREFIX/lib
set Python_ROOT_DIR=%PREFIX%

mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

echo "src_DIR %SRC_DIR%"
echo "cd %cd%"

REM -DCMAKE_CXX_FLAGS="/w4004"

cmake -G "Ninja" %CMAKE_ARGS%                        ^
    -DCMAKE_INSTALL_PREFIX:PATH=%PREFIX%             ^
    -DCMAKE_BUILD_TYPE=Release                       ^
    -DBUILD_SHARED_LIBS=ON                           ^
    -DBUILD_DYNAMIC=ON                               ^
    -DWITH_APACHE_MODULE=0                           ^
    -DWITH_CAIRO=1                                   ^
    -DWITH_CLIENT_WFS=1                              ^
    -DWITH_CLIENT_WMS=1                              ^
    -DWITH_CSHARP=0                                  ^
    -DWITH_CURL=1                                    ^
    -DWITH_EXEMPI=0                                  ^
    -DWITH_FCGI=1                                    ^
    -DWITH_FREETYPE=1                                ^
    -DWITH_FRIBIDI=1                                 ^
    -DWITH_GDAL=1                                    ^
    -DWITH_GEOS=1                                    ^
    -DWITH_GIF=1                                     ^
    -DWITH_HARFBUZZ=1                                ^
    -DWITH_ICONV=1                                   ^
    -DWITH_JAVA=0                                    ^
    -DWITH_JPEG=1                                    ^
    -DWITH_LIBXML2=1                                 ^
    -DWITH_MSSQL2008=1                               ^
    -DWITH_MYSQL=1                                   ^
    -DWITH_ORACLESPATIAL=0                           ^
    -DWITH_PERL=0                                    ^
    -DWITH_PHP=0                                     ^
    -DWITH_PIXMAN=1                                  ^
    -DWITH_PNG=1                                     ^
    -DWITH_POSTGIS=1                                 ^
    -DWITH_POSTGRESQL=1                              ^
    -DWITH_PROJ=1                                    ^
    -DWITH_PROTOBUFC=1                               ^
    -DWITH_PYTHON=1                                  ^
    -DWITH_RSVG=0                                    ^
    -DWITH_SOS=1                                     ^
    -DWITH_SVGCAIRO=0                                ^
    -DWITH_V8=0                                      ^
    -DWITH_XMLMAPFILE=0                              ^
    -DWITH_ZLIB=1                                    ^
    -DWITH_PCRE2=ON                                  ^
    %SRC_DIR%
if errorlevel 1 exit /b 1


cmake --build . -j %CPU_COUNT% --verbose --config Release
if errorlevel 1 exit /b 1

cmake --install . --verbose --config Release
if errorlevel 1 exit /b 1

REM manually install mapserver.dll because MapServer's install is broken right now
copy mapserver.dll %PREFIX%\bin

cd src\mapscript\python
%PYTHON% -m pip install .

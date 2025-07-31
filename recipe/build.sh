#!/usr/bin/env bash

set +x

export PKG_CONFIG_LIBDIR=$PREFIX/lib
export Python_ROOT_DIR=$PREFIX

mkdir -p build
cd build


cmake                                                \
    -DSWIG_EXECUTABLE=$BUILD_PREFIX/bin/swig4.0      \
    -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX              \
    -DCMAKE_BUILD_TYPE=Release                       \
    -DWITH_APACHE_MODULE=0                           \
    -DWITH_CAIRO=1                                   \
    -DWITH_CLIENT_WFS=1                              \
    -DWITH_CLIENT_WMS=1                              \
    -DWITH_CSHARP=0                                  \
    -DWITH_CURL=1                                    \
    -DWITH_EXEMPI=0                                  \
    -DWITH_FASTCGI=1                                 \
    -DWITH_FCGI=0                                    \
    -DWITH_FREETYPE=1                                \
    -DWITH_FRIBIDI=1                                 \
    -DWITH_GDAL=1                                    \
    -DWITH_GEOS=1                                    \
    -DWITH_GIF=1                                     \
    -DWITH_HARFBUZZ=1                                \
    -DWITH_ICONV=1                                   \
    -DWITH_JAVA=0                                    \
    -DWITH_JPEG=1                                    \
    -DWITH_LIBXML2=1                                 \
    -DWITH_MSSQL2008=1                               \
    -DWITH_MYSQL=1                                   \
    -DWITH_ORACLESPATIAL=0                           \
    -DWITH_PERL=0                                    \
    -DWITH_PHP=0                                     \
    -DWITH_PIXMAN=1                                  \
    -DWITH_PNG=1                                     \
    -DWITH_POSTGIS=1                                 \
    -DWITH_POSTGRESQL=1                              \
    -DWITH_PROJ=1                                    \
    -DWITH_PROTOBUFC=1                               \
    -DWITH_PYTHON=1                                  \
    -DWITH_RSVG=0                                    \
    -DWITH_SOS=1                                     \
    -DWITH_SVGCAIRO=0                                \
    -DWITH_V8=0                                      \
    -DWITH_XMLMAPFILE=0                              \
    -DWITH_ZLIB=1                                    \
    -DPROTOBUF_PROTOC_EXECUTABLE=$BUILD_PREFIX/bin/protoc \
    ${SRC_DIR}

make -j${CPU_COUNT}
make install

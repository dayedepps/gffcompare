#!/bin/bash -e
ver=$(fgrep '#define VERSION ' gffcompare.cpp)
ver=${ver#*\"}
ver=${ver%%\"*}
srcpack=gffcompare-$ver
source prep_source.sh
linpack=$pack.Linux_x86_64
echo "preparing $linpack.tar.gz"
echo "-------------------"
/bin/rm -rf $linpack
/bin/rm -f $linpack.tar.gz
mkdir $linpack
cd $srcpack
make clean
make static
cp LICENSE gffcompare ../$linpack/
cd ..
tar cvfz $linpack.tar.gz $linpack
ls -l $srcpack.tar.gz $linpack.tar.gz
echo "If you're on igmN machines you can also update the web files:"
echo "cp $linpack.tar.gz $srcpack.tar.gz  ~/html/software/stringtie/dl/"
echo "perl -i -pe 's/gffcompare\-\d+\.\d+\.\d+\w?\./gffcompare-$ver./g' ~/html/software/stringtie/gff.shtml"

MYPATH=`readlink -f "$0"`
CWD=`dirname $MYPATH`
cd $CWD

NW_HOME=~/opt/node-webkit
PROJECT_NAME=`basename $CWD`
SRC=$CWD/app
DEST=$CWD/build/
RELEASE=$DEST/$PROJECT_NAME

mkdir -p $RELEASE

cd $SRC
srcfiles=`find . -regex ".*.\(html\|js\|css\|gif\|png\|jpeg\)$"`
zip $DEST/app.nw package.json $srcfiles

\cp -Rf $NW_HOME/icudtl.dat $RELEASE/
\cp -Rf $NW_HOME/libffmpegsumo.so $RELEASE/
\cp -Rf $NW_HOME/locales $RELEASE/
\cp -Rf $NW_HOME/nw.pak $RELEASE/

cat $NW_HOME/nw $DEST/app.nw > $RELEASE/app && chmod +x $RELEASE/app


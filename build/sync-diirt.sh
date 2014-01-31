#!/bin/bash

# sync_dir dir src_location dest_location
# e.g. sync_dir util $HGDIR/src/main/java/org/epics ../core/plugins/org.epics.util/src/org/epics/
function sync_dir {
    find $2/$1 -type f -exec grep -qI '' {} ';' -exec perl -pi -e 's/\r\n/\n/g' {} '+'
    rsync -r --delete $2/$1 $3
    git add $3/$1
}

# Go into build directory
BASEDIR=$(dirname $0)
cd $BASEDIR

HGDIR=diirt_tmp
rm -rf $HGDIR
hg clone http://hg.code.sf.net/p/epics-util/code $HGDIR
echo Synching epics-util
sync_dir util $HGDIR/src/main/java/org/epics ../core/plugins/org.epics.util/src/org/epics/
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "org.epics.util: update to current SNAPSHOT" ../core/plugins/org.epics.util
echo Done epics-util

rm -rf $HGDIR
echo pvmanager repo
hg clone http://hg.code.sf.net/p/pvmanager/pvmanager $HGDIR

echo Synching epics-vtype
sync_dir vtype $HGDIR/epics-vtype/src/main/java/org/epics ../core/plugins/org.epics.vtype/src/org/epics/
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "org.epics.vtype: update to current SNAPSHOT" ../core/plugins/org.epics.vtype
echo Done epics-vtype

echo Synching pvmanager-core
sync_dir pvmanager $HGDIR/pvmanager-core/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager/src/org/epics/
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanager: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager
echo Done pvmanager-core

echo Synching pvmanager-exec
sync_dir pvmanager $HGDIR/pvmanager-exec/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.exec/src/org/epics/
sync_dir . $HGDIR/pvmanager-exec/src/main/javadoc/org/epics/pvmanager/exec/doc-files ../core/plugins/org.csstudio.utility.pvmanager.exec/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.exec: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.exec
echo Done pvmanager-exec

echo Synching pvmanager-file
sync_dir pvmanager $HGDIR/pvmanager-file/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.file/src/org/epics/
sync_dir . $HGDIR/pvmanager-file/src/main/javadoc/org/epics/pvmanager/file/doc-files ../core/plugins/org.csstudio.utility.pvmanager.file/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.file: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.file
echo Done pvmanager-file

# NB: pvmanager-extra needs to be fixed to build the parser and copy everything
#echo Synching pvmanager-extra
#sync_dir pvmanager $HGDIR/pvmanager-extra/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.extra/src/org/epics/
#sync_dir . $HGDIR/pvmanager-extra/src/main/javadoc/org/epics/pvmanager/formula/doc-files ../core/plugins/org.csstudio.utility.pvmanager.extra/html
#git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.extra: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.extra
#echo Done pvmanager-extra

echo Synching pvmanager-graphene
sync_dir pvmanager $HGDIR/pvmanager-graphene/src/main/java/org/epics ../applications/plugins/org.csstudio.utility.pvmanager.graphene/src/org/epics/
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanager.graphene: update to current SNAPSHOT" ../applications/plugins/org.csstudio.utility.pvmanager.graphene
echo Done pvmanager-graphene

echo Synching pvmanager-jca
sync_dir pvmanager $HGDIR/pvmanager-jca/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.epics/src/org/epics/
sync_dir . $HGDIR/pvmanager-jca/src/main/javadoc/org/epics/pvmanager/jca/doc-files ../core/plugins/org.csstudio.utility.pvmanager.epics/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.jca: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.epics
echo Done pvmanager-jca

echo Synching pvmanager-jdbc
sync_dir pvmanager $HGDIR/pvmanager-jdbc/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.jdbc/src/org/epics/
sync_dir . $HGDIR/pvmanager-jdbc/src/main/javadoc/org/epics/pvmanager/jdbc/doc-files ../core/plugins/org.csstudio.utility.pvmanager.jdbc/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.jdbc: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.jdbc
echo Done pvmanager-jdbc

echo Synching pvmanager-loc
sync_dir pvmanager $HGDIR/pvmanager-loc/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.loc/src/org/epics/
sync_dir . $HGDIR/pvmanager-loc/src/main/javadoc/org/epics/pvmanager/loc/doc-files ../core/plugins/org.csstudio.utility.pvmanager.loc/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.loc: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.loc
echo Done pvmanager-loc

echo Synching pvmanager-pva
sync_dir pvmanager $HGDIR/pvmanager-pva/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.pva/src/org/epics/
sync_dir . $HGDIR/pvmanager-pva/src/main/javadoc/org/epics/pvmanager/pva/doc-files ../core/plugins/org.csstudio.utility.pvmanager.pva/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.pva: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.pva
echo Done pvmanager-pva

echo Synching pvmanager-sim
sync_dir pvmanager $HGDIR/pvmanager-sim/src/main/java/org/epics ../core/plugins/org.csstudio.utility.pvmanager.sim/src/org/epics/
sync_dir . $HGDIR/pvmanager-sim/src/main/javadoc/org/epics/pvmanager/sim/doc-files ../core/plugins/org.csstudio.utility.pvmanager.sim/html
git commit --author="Gabriele Carcassi <gabriele.carcassi@gmail.com>" -m "o.c.u.pvmanage.sim: update to current SNAPSHOT" ../core/plugins/org.csstudio.utility.pvmanager.sim
echo Done pvmanager-sim



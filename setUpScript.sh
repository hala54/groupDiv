#!/bin/bash
# setUpScrit.sh
# SetUp environnment to test groupDiv: three users diva1, diva2, diva3
# diva2 and diva3 clone diva1 
# Configuration

# Put your own directory ..
DIR='/Users/hala/tmp' 
DIVA1='diva1'
DIVA2='diva2'
DIVA3='diva3'

FDIVA1='diva1.txt'


# Setup diva1 repo
 
echo "--"
echo "-- Creating  diva1 repo at:"
echo "-- $DIR/$DIVA1"
echo "--"

if [  -d  $DIR'/'$DIVA1 ]; then 
echo "remove $DIR/$DIVA1"
rm -rf $DIR'/'$DIVA1
fi

mkdir  $DIR'/'$DIVA1 && cd $DIR'/'$DIVA1 && git init && echo "diva1" > $FDIVA1 && git add $FDIVA1 && git commit -am "initial commit"

echo "--"


#Setup diva2 repo

echo "--"
echo "-- Creating  diva2 repo at:"
echo "-- $DIR/$DIVA2"
echo "--"

if [  -d  $DIR'/'$DIVA2 ]; then 
echo "remove $DIR'/'$DIVA2"
rm -rf $DIR'/'$DIVA2
fi

cd $DIR 
git clone $DIVA1 $DIVA2


#Setup diva3 repo

echo "--"
echo "-- Creating  diva3 repo at:"
echo "-- $DIR/$DIVA3"
echo "--"

if [  -d  $DIR'/'$DIVA3 ]; then 
echo "remove $DIR/$DIVA3"
rm -rf $DIR'/'$DIVA3
fi

cd $DIR
git clone $DIVA1 $DIVA3

#setup remote diva1
echo "--"
echo "-- Creating remote"
echo "-- $DIR/$DIVA1"
echo "--"
cd $DIR'/'$DIVA1
git remote add $DIVA2 $DIR'/'$DIVA2
git remote add $DIVA3 $DIR'/'$DIVA3


#setup remote diva2
echo "--"
echo "-- Creating remote"
echo "-- $DIR/$DIVA2"
echo "--"

cd $DIR'/'$DIVA2
git remote add $DIVA3 $DIR'/'$DIVA3

#setup remote diva3
echo "--"
echo "-- Creating remote"
echo "-- $DIR/$DIVA3"
echo "--"

cd $DIR'/'$DIVA3
git remote add $DIVA2 $DIR'/'$DIVA2

echo "--"






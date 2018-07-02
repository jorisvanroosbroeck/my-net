# =============
# INFO: file.sh
# =============


# =================
# FUNCTION: file.sh
# =================
function file.line.change {
    FILE=$1
    SEARCHSTR=$2
    REPLACESTR=$3

    sudo sed -i "s/$SEARCHSTR/$REPLACESTR/g" $FILE
}

function file.line.check {
    CHECKFILE=$1
    CHECKSTRING=$2

    unset CHECK
    CHECK=`cat $CHECKFILE | grep -P "(^|\s)\K$CHECKSTRING(?=\s|$)"`

    if [ ${#CHECK} -gt 0 ]
    then
        echo "---------- $CHECKSTRING --------- OK"
    fi
    if [ ${#CHECK} == 0 ]
    then
        echo "---------- $CHECKSTRING --------- Not OK"
    fi
}

# =================
case $1 in
    "$1")
        $1
        ;;
esac
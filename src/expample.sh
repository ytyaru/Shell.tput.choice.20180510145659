. $(cd $(dirname $0); pwd)/choice.sh
Choice "はい" "いいえ"
res=$?
[ $? -eq 0 ] && echo YES
[ $? -eq 1 ] && echo NO
echo $res

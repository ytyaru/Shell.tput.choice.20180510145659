. $(cd $(dirname $0); pwd)/choice.sh
Choice "はい" "いいえ"
res=$?
[ $res -eq 0 ] && echo YES
[ $res -eq 1 ] && echo NO
echo $res

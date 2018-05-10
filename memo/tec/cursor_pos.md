# カーソル位置を取得する

https://unix.stackexchange.com/questions/88296/get-vertical-cursor-position/183121#183121

```bash
GetRow(){
    { local ROW; local COL; }
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    echo "${ROW#*[}"
}
GetCol(){
    { local ROW; local COL; }
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    echo "${COL#*[}"
}
GetRows(){ local v=`tput lines`; echo $v; }
GetCols(){ local v=`tput cols`; echo $v; }
```


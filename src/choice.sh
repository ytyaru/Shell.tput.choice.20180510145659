Choice(){
    GetCol(){
        { local ROW; local COL; }
        IFS=';' read -sdR -p $'\E[6n' ROW COL
        echo "${COL#*[}"
    }
    End(){ { tput cud $(($#)); tput cnorm; tput sgr0; stty echo 2>/dev/null; } }
    trap "End; exit 1;" {1,2,3,15}
    PrintChars(){ printf %${2}s | tr ' ' "$1"; }
    tput civis 
    local cursor=0
    while : ; do
        for ((i=0; i<$#; i++)); do
            [ $i -eq $cursor ] && local pre='>'
            [ $i -ne $cursor ] && local pre=' '
            local msg="$pre ${@:((i+1)):1}"
            echo -n "$msg"
            local diff=$((`tput cols` - `GetCol`))
            local diff=$(($diff - 2))
            echo "`PrintChars ' ' $diff`"
        done
        local input=''
        local input2=''
        while : ; do
            read -r -s -n1 input
            if [[ $input == $'\x1b' ]]; then
                read -r -s -n2 input2
                input2=`echo -n $input2 | xxd -p`
                case "$input2" in
                    '5b41') { [ 0 -lt $cursor ] && { ((cursor--)); break; } };;
                    '5b42') { [ $cursor -lt $(($# - 1)) ] && { ((cursor++)); break; } };;
                esac
            fi
            [[ '' == $input ]] && { return $cursor; }
        done
        tput cuu $(($#))
        tput cub `tput cols`
    done
}

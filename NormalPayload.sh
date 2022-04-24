RED="\e[91m"
GREEN="\e[92m"
NC="\e[0m"
clear
if [[ $i_host == "" ]]
then
    read -p $'\e[0mHost : \e[92m' i_host
fi
i_Ver="1.1"
i_UA="[ua]"
customH=()
sameMethods=()
sameMethods+=("Connect ")
sameMethods+=("GET ")
sameMethods+=("POST ")
sameMethods+=("PUT ")
sameMethods+=("HEAD ")
sameMethods+=("TRACE ")
sameMethods+=("OPTIONS ")
sameMethods+=("PATCH ")
sameMethods+=("PROPATCH ")
sameMethods+=("DELETE ")
sameMethods+=("MOVE ")
sameMethods+=("PATCH ")
sameMethods+=("PROPFIND ")
sameMethods+=("ACL ")
sameMethods+=("BASELINE-CONTROL ")
sameMethods+=("BDELETE ")
sameMethods+=("BIND ")
sameMethods+=("BMOVE ")
sameMethods+=("BPROPFIND ")
sameMethods+=("CHECKIN ")
sameMethods+=("CHECKOUT ")
sameMethods+=("LABEL ")
sameMethods+=("LINK ")
sameMethods+=("LOCK ")
sameMethods+=("MERGE ")
sameMethods+=("MKACTIVITY ")
sameMethods+=("MKCALENDAR ")
sameMethods+=("MKCOL ")
sameMethods+=("MKREDIRECTREF ")
sameMethods+=("MKWORKSPACE ")
sameMethods+=("NOTIFY ")
sameMethods+=("ORDERPATCH ")
sameMethods+=("PRI ")
sameMethods+=("REBIND ")
sameMethods+=("REPORT ")
sameMethods+=("SEARCH ")
sameMethods+=("SUBSCRIBE ")
sameMethods+=("UNBIND ")
sameMethods+=("UNCHECKOUT ")
sameMethods+=("UNLINK ")
sameMethods+=("UNLOCK ")
sameMethods+=("UNSUBSCRIBE ")
sameMethods+=("UPDATE ")
sameMethods+=("UPDATEREDIRECTREF ")
sameMethods+=("VERSION-CONTROL ")
GenSameMethods () {
	allH=""
	for h in "${customH[@]}"
	do
		allH+=$h"[crlf]"
	done
	echo -e "${RED}------------------------------------"
	echo "GENERAL PAYLOADS"
	echo -e "------------------------------------${GREEN}"
	echo "HTTP/"$i_Ver" [crlf]Host: "$i_host"/"$i_get"[crlf]"$allH" User-Agent: "$i_UA" [crlf][crlf]"
	echo ""
	for meth in "${sameMethods[@]}"
	do
	echo ""
		echo $meth"http://"$i_host"/"$i_get" HTTP/"$i_Ver"[crlf]Host: "$i_host"[crlf]"$allH"Connection: Kepp-Alive[crlf]User-Agent: "$i_UA"[crlf][crlf]CONNECT [host_port][protocol][crlf][crlf]"
		echo ""
	done
}
GenHC () {
        allH=""
	for h in "${customH[@]}"
	do
		allH+=$h"\r"
	done
	echo -e "${RED}------------------------------------"
	echo "HTTP Custom PAYLOADS"
	echo -e "------------------------------------${GREEN}"
	echo "HTTP/"$i_Ver" \rHost: "$i_host"/"$i_get"\r"$allH" User-Agent: "$i_UA" \r\r"
	echo ""
	for meth in "${sameMethods[@]}"
	do
	echo ""
		echo $meth"http://"$i_host"/"$i_get" HTTP/"$i_Ver"[crlf]Host: "$i_host"/"$i_get"[crlf]"$allH"Connection: Kepp-Alive[crlf]User-Agent: "$i_UA"[crlf][crlf]CONNECT [host_port][protocol][crlf][crlf]"
		echo ""
	done
}
TestPayload () {
        userAgent=$i_UA
        Headers=""
        for header in "${customH[@]}"
        do
                Headers+=" -H ${header}"
        done
        echo -e "${NC}"
        if [[ $userAgent != "[ua]" ]]
        then
                respone=`curl -I -A $userAgent $Headers "http://"$i_host"/"$i_get --silent`
                echo "$respone"
                if [[ "$respone" = *"200 OK"* ]]; then
                        echo " Respone Success"
                        else
                        echo "Respone Failed"
                fi
        else
                respone=`curl -I $Headers "http://"$i_host"/"$i_get --silent`
                echo "$respone"
                if [[ "$respone" = *"200 OK"* ]]; then
                        echo " Respone Success"
                        else
                        echo "Respone Failed"
                fi
        fi 
}
echo -e "${RED}------------------------------------"
echo "    By Mafia - @SD_MAFIA"
echo "------------------------------------"
GenSameMethods
read -p "Test Payload ? " i_tp
if [[ $i_tp != "" ]]
then
        TestPayload
fi
echo -e "${NC} Enjoy ðŸ¤—ðŸ˜˜"
termux-open-url http://barsoocm.com/1mvT
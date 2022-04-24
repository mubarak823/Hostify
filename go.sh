RED="\e[91m"
GREEN="\e[92m"
NC="\e[0m"
echo "Hi Mafia Members"
declare -i hostRate=0
read -p $'Enter Password : \e[92m' EnterPass
GetHostHeaders() {
        echo -e "$NC Getting Headers.... (using GET)$GREEN"
        
        CUZ=""
        hdrs=`curl -X GET http://$i_host/$i_get -I --silent`
        
        
        if [[ "$hdrs" == *"Server: Apache"* ]]
        then
            echo " info: Host Using Apache Server"
            elif [[ "$hdrs" == *"Server: Cloudflare"* ]]
            then
                echo " info: Host Using Cloudflare Server"
                hostRate=${hostRate+10}
        fi
        if [[ "$hdrs" == *"HTTP/1.1 404"* ]]
        then
                echo " Page Not Found"
        fi
        #200 Ok Found
        if [[ "$hdrs" == *"HTTP/1.1 200 OK"* ]]
        then
                echo " Found 200 ok"
                hostRate=$((hostRate+40))
                if [[ "$hdrs" == *"Content-Length:"* ]]
                then
                     if [[ "$hdrs" == *"Content-Length: 0"* ]]
                     then
                         
                         CUZ=" No Content | Content Length 0"
                         else
                             hostRate=$((hostRate+10))
                     fi
                     if [[ "$hdrs" == *"Connection:"* ]]
                     then
                         if [[ "$hdrs" == *"Connection: close"* ]]
                         then
                         hostRate=$((0))
                         CUZ=" Connection Closed By Server"
                         elif [[ "$hdrs" == *"Connection: keep-alive"* ]]
                         then
                             hostRate=$((hostRate+20))
                         fi
                     fi
                 fi
            fi
            #302 Found
            if [[ "$hdrs" == *"HTTP/1.1 302"* ]]
            then
                if [[ "$hdrs" == *"HTTP/1.1 302 Object moved"* ]]
                then
                    echo " Status Code : 302 Object moved"
                    CUZ=" Host Switched To https Port 443 "
                fi
            fi
        
        echo -e " "$hostRate"% Success Rate "$CUZ"\e[0m"
}
FindOpenPorts() {
        echo -e "$NC Finding Open Ports...."
        nmap_respone=`nmap -Pn $i_host -p 80,443,8080 --open`
        p_80="80/tcp"
        p_443="443/tcp"
        p_8080="8080/tcp"
        ConnType=""
        isProxy="no"
        if [[ $nmap_respone == *$p_80* ]]
        then
            echo -e "$GREEN Port 80 Opened";
            ConnType="yes"
         fi
        if [[ $nmap_respone == *$p_443* ]]
        then
            echo -e "$GREEN Port 443 Opened";
         fi
         if [[ $nmap_respone == *$p_8080* ]]
        then
            echo -e "$GREEN Port 8080 Opened";
            isProxy="yes"
         fi
         if [[ $isProxy == "yes" ]] 
         then
             echo " This Can Be Used As Proxy"
         fi
         if [[ $ConnType != "" ]] 
         then
             GetHostHeaders
             if [[ $hostRate > 0 ]]
	             then
		             echo -e "$NC [1] Normal Payloads"
		             echo -e "$NC [2] Advanced Payloads"
		             echo -e "$NC [3] Reverse IP"
		             read -p $'Choose Payload Type : \e[92m ' i_p
		             if [[ $i_p == "1" ]]
			             then
				             export i_host
				             export i_get
				             bash NormalPayload.sh
			             elif [[ $i_p == 2 ]]
			                 then
			                 export i_get
			                 export i_host
			                 bash AdvancedPayload.sh
		            fi
		     fi
		     if [[ $hostRate == 0 ]]
			     then
			     read -p $'Look for Near Hosts? : \e[92m' n_hosts
			     if [[ $n_hosts != "" ]]
				     then
				     rm file.txt
				     touch file.txt
				     echo $i_host>>file.txt
				     clear
				     python2 FSD.py
				fi
			fi
		fi
}
if [[ $EnterPass == "MB" ]] 
then
        clear
        echo -e "${RED}------------------------------------"
		echo "    By Mafia - @SD_MAFIA"
		echo "------------------------------------"
        echo -e "\e[0mWelcome To Mafia's"
        echo  "[1] Find Subdomains  " 
        echo  "[2] Generate Payloads  " 
        echo  "[3] Scan Host  " 
        read -p $'Choose Option : \e[92m' i_s
        if [[ $i_s == "1" ]]
	        then
	            python2 MafiaEdit.py
	            elif [[ $i_s == "2" ]]
	                then
	                    bash AdvancedPayload.sh
	            elif [[ $i_s == "3" ]]
	                then
	                    clear
	                    echo -e "${RED}------------------------------------"
						echo "    By Mafia - @SD_MAFIA"
						echo "------------------------------------"
	                    read -p $'\e[0mHost : \e[92m' i_host
				        read -p $'\e[0mGET : \e[92m' i_get
				        if [[ $i_host != "" ]] 
				        then
				            FindOpenPorts
				        fi
	        fi
        
        else
        echo "You Should Join to Our Community @SD_Mafia"
        echo "Exiting..."
fi
        
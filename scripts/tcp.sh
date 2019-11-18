if [ $# -ne 1 ];then
    echo "Follow the script name with an argument "
fi

case $1 in 
    established)   #socket已经建立连接 
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep "ESTAB" |awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    listen)        #监听状态  
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w LISTEN | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    timewait)     #表示收到了对方的FIN报文，并发送出了ACK报文，等待2MSL后就可回到CLOSED状态 
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w TIME-WAIT | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    closed)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}'| grep -w CLOSED | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    closewait)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}'| grep -w CLOSE-WAIT | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    closing)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}'| grep -w CLOSING | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    finwait1)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w 'FIN-WAIT-1' | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    finwait2)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w 'FIN-WAIT-2' | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    lastack)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w LAST-ACK | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    synrecv)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w SYN-RECV | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;
    synsent)
        result=`ss -ant | awk 'NR>1 {a[$1]++} END {for (b in a) print b,a[b]}' | grep -w SYN-SENT | awk '{print $2}'`
        if [ "$result" == "" ];then
               echo 0
        else
           echo $result
        fi
        ;;  
    *)
        echo -e "\e[033mUsage: sh  $0 [closed|closing|closewait|synrecv|synsent|finwait1|finwait2|listen|established|lastack|timewait]\e[0m"
esac

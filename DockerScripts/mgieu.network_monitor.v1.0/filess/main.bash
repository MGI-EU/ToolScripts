touch internetlogg.txt
touch netk.txt
touch file.txt
touch withnoaddress.csv
touch fsd.txt
touch withspace.csv
touch withspace.txt
touch netlog.txt
echo "Active Internet connections (w/o servers)" >>netlog.txt
#echo "Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name" >>netlog.txt   
echo "Protocal Reveive-Queue Send-Queue LocalIPAddress ForeignIPAddress State PID" >>netlog.txt
echo "Iface/Interface MTU/StandsforMaximumTransmissionUnit RX-ok/Packagegot RX-ERR/Packageerror RX-DRP/Packagedrope RX-OVR/Packageoverwrite TX-OK/meanssendpackage TX-ERROR/SendError TX-DRP/SendDrop TX-OVR/Sendoverwrite FLG/BROADCASTflag"  >>netlog.txt
      while :
      do
      netstat -t -p | sed -n '2,3p'  >catch.txt
      awk '{print NR}' catch.txt|tail -n1  >number.txt 

      read number <number.txt
if [ "$number" = "1" ]; then
  echo "no process"
else
      netstat -t -p | sed -n '2,3p'  >> netlog.txt
fi   
      sleep 5s 
      ifconfig -s >> netlog.txt
      sleep 5s
#      cat netlog.txt | tr "[[:space:]]" ";" >internetlog.txt
    
       sed 's/Address//g' netlog.txt > netK.txt
      
       sed -e 's/[[:space:]][[:space:]]*/ /g' netK.txt > withspace.csv

       sed -e 's/[[:space:]][[:space:]]*/ /g' netK.txt > withspace.txt


       cat netK.txt | sed -e 's/[[:space:]][[:space:]]*/ /g'  > withspace.csv
       cat netK.txt | sed -e 's/[[:space:]][[:space:]]*/ /g'  > withspace.txt
     # cat netlog.txt | sed -e 's/[["Address"]][[::]]*/ /g' > withnoaddress.csv
#      sed 's/Address//g' withspace.csv
#      sed 's/Foreign Address/ForeignAddress/' withspace.csv
    #  sed 's/Address//g' withspace.csv
       sed -i 's/\s\+/,/g' withspace.csv
       sed -i 's/\s\+/,/g' withspace.txt
    #  sed -t 's/\s\+/,/g' withnoaddress.csv      
      cat withspace.csv > internetlogg.csv 
      cat withspace.txt > internetlogg.txt 
     done
 

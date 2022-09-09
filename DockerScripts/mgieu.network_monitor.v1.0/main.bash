
#创建文件夹并在文件夹目录下储存缓存/日志文件
mkdir web_monitor_log
cd web_monitor_log
touch internetlogg.txt
touch netk.txt
touch withnoaddress.csv
touch withspace.csv
touch withspace.txt
touch netlog.txt

#写入抬头，各种参数的含义
echo "Active Internet connections (w/o servers)" >>netlog.txt
echo "Protocal Reveive-Queue Send-Queue LocalIPAddress ForeignIPAddress State PID" >>netlog.txt
echo "Iface/Interface MTU/StandsforMaximumTransmissionUnit RX-ok/Packagegot RX-ERR/Packageerror RX-DRP/Packagedrope RX-OVR/Packageoverwrite TX-OK/meanssendpackage TX-ERROR/SendError TX-DRP/SendDrop TX-OVR/Sendoverwrite FLG/BROADCASTflag"  >>netlog.txt
      
#剔除无关数据，定义表格格式
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

#如果需要修改后台刷新时间 可以修改下面的 sleep 时间即可
      sleep 5s 
      ifconfig -s >> netlog.txt
      sleep 5s

#修改格式 准备CSV格式输出      
       sed 's/Address//g' netlog.txt > netK.txt
      
       sed -e 's/[[:space:]][[:space:]]*/ /g' netK.txt > withspace.csv

       sed -e 's/[[:space:]][[:space:]]*/ /g' netK.txt > withspace.txt

       cat netK.txt | sed -e 's/[[:space:]][[:space:]]*/ /g'  > withspace.csv
       cat netK.txt | sed -e 's/[[:space:]][[:space:]]*/ /g'  > withspace.txt
       sed -i 's/\s\+/,/g' withspace.csv
       sed -i 's/\s\+/,/g' withspace.txt
      cat withspace.csv > internetlogg.csv 
      cat withspace.txt > internetlogg.txt 
     done
 

#!/usr/bin/env bash

E_ABNORMAL_STATE=2
TRUE=0
FALSE=1
# it might take long time to get disk usage, so disable by default
SHOW_DISK_USAGE=$FALSE

percentage(){
    local var1="$1"
    local var2="$2"
    if [ $var2 -le 0 ];then
        echo "0.00%"
        return $E_ABNORMAL_STATE
    fi
	declare result
    local awk_script='{ printf( "%3.2f%%\n", ($1/$2)*100 ) }'
    result=$(echo $var1 $var2 | env awk "$awk_script")
    echo "$result"
}

resource_usage(){
    cpu_usage="$(ps -eo %cpu,pid,cmd --sort -%cpu | sed -e '1d' | awk '{sum +=\
    $1};END {print sum}')%"
    cpu_usage="CPU:$cpu_usage "
    disk_usage_percentage=""
    if [ $SHOW_DISK_USAGE -eq $TRUE ];then
        disk_usage_percentage=$(df -h | grep rootvg-root | sed -E -e's/\s+/ /g' | cut -d ' '\
            -f5)
        disk_usage_percentage="Disk:${disk_usage_percentage} "
    fi
    mem_total_and_used=$(free | grep Mem | sed -E -e's/\s+/ /g' | cut -d' ' -f2,3)
    mem_total=$(echo $mem_total_and_used | cut -d' ' -f1)
    mem_used=$(echo $mem_total_and_used | cut -d' ' -f2)
    mem_usage_percentage=$(percentage $mem_used $mem_total)
    mem_usage_percentage="Mem: ${mem_usage_percentage}"
    echo "${cpu_usage}${disk_usage_percentage}${mem_usage_percentage}"
}

sys_uptime(){
    neofetch uptime --uptime_shorthand tiny | grep -Eo '[0-9]+.*'
}

status_info="$(sys_uptime) $(resource_usage)"
echo "$status_info"

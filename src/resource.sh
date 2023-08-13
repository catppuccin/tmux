#!/usr/bin/env bash
_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../" && pwd)"
E_ABNORMAL_STATE=2
TRUE=0
FALSE=1
# it might take long time to get disk usage, so disable by default
SHOW_DISK_USAGE=$TRUE
ONLY_SHOW_DAYS_IN_UP_TIME=$TRUE

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

_is_highly_used(){
  local usage=$1
  local total=$2

  _is_high=`bc << EOF
    scale = 2
    benchmark = .60
    quotient = $usage / $total
    define flag(q){
      if (q < benchmark) return $FALSE
      return $TRUE
    }
    flag(quotient)
EOF
`
  echo $_is_high
}

resource_usage(){
    source "$_DIR/default.conf"
    source "$PLUGIN_DIR/palette.theme"
    source "$PLUGIN_DIR/catppuccin-violet.tmuxtheme"
    COLOR_HIGHLY_USED=$light_red

    cpu_total=100
    cpu_usage="$(ps -eo %cpu,pid,cmd --sort -%cpu | sed -e '1d' | awk '{sum +=\
    $1};END {print sum}')"
    str_cpu_usage="$(ps -eo %cpu,pid,cmd --sort -%cpu | sed -e '1d' | awk '{sum +=\
    $1};END {print sum}')%"
    cpu_highly_used=$(_is_highly_used $cpu_usage $cpu_total)
    if [ $cpu_highly_used -eq $TRUE ];then
      fg_cpu=$COLOR_HIGHLY_USED
    else
      fg_cpu=$strong_green
    fi
    cpu_usage="#[fg=$fg_icon] #[fg=$fg_cpu,bg=$thm_gray]$str_cpu_usage "

    disk_usage_percentage=""
    if [ $SHOW_DISK_USAGE -eq $TRUE ];then
        disk_usage=$(df -h | grep rootvg-root | sed -E -e's/\s+/ /g' | cut -d ' '\
            -f5 | cut -d% -f1)
        disk_usage_percentage="${disk_usage}%"
        disk_total=100
        disk_highly_used=$(_is_highly_used $disk_usage $disk_total)
        if [ $disk_highly_used -eq $TRUE ];then
          fg_disk=$COLOR_HIGHLY_USED
        else
          fg_disk=$strong_green
        fi
        disk_usage_percentage="#[fg=$fg_icon] #[fg=$fg_disk]${disk_usage_percentage} "
    fi

    mem_total_and_used=$(free | grep Mem | sed -E -e's/\s+/ /g' | cut -d' ' -f2,3)
    mem_total=$(echo $mem_total_and_used | cut -d' ' -f1)
    mem_used=$(echo $mem_total_and_used | cut -d' ' -f2)
    mem_usage_percentage=$(percentage $mem_used $mem_total)
    mem_highly_used=$(_is_highly_used $mem_used $mem_total)
    if [ $mem_highly_used -eq $TRUE ];then
      fg_mem=$COLOR_HIGHLY_USED
    else
      fg_mem=$strong_green
    fi
    mem_usage_percentage="#[fg=$fg_icon] #[fg=$fg_mem,bg=$thm_gray]${mem_usage_percentage}"
    echo "${disk_usage_percentage}${cpu_usage}${mem_usage_percentage}"
}

sys_uptime(){
  if [ $ONLY_SHOW_DAYS_IN_UP_TIME -eq $TRUE ];then
    neofetch uptime --uptime_shorthand tiny | grep -Eo '[0-9]+.*' | cut -d' ' -f1
  else
    neofetch uptime --uptime_shorthand tiny | grep -Eo '[0-9]+.*'
  fi
}

status_info="$(sys_uptime) $(resource_usage)"
echo "$status_info"

gen-fib() {
  a=1; b=1; c=2; d=0
  local -n arr=$1

  arr+=("$b");

  n=$(cat ./db/titles | wc -l)
  n=$(($n + 2))

  while (( c< n )); do
    d=$(( a + b ))
    [ $d -ne 2 ] && arr+=($d)
    a=$b
    b=$d
    c=$(( c + 1 ))
  done
}

fib-index-value() {
  local array
  gen-fib array
  for i in "${!array[@]}"; do
    if [ $1 -lt ${array[$i]} ]; then
      index=$i;
      reqdHours=$((${array[$i]} - $1));
      break ;
    fi
  done

  echo "$index $reqdHours"
}

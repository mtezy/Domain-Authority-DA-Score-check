#!/bin/bash
banner()
{
  printf " %-40s \n" "`python3 logo.py`"
}
banner


merah='\e[91m'
cyan='\e[96m'
kuning='\e[93m'
oren='\033[0;33m' 
margenta='\e[95m'
biru='\e[94m'
ijo="\e[92m"
putih="\e[97m"
normal='\033[0m'
bold='\e[1m'
labelmerah='\e[41m'
labelijo='\e[42m'
labelkuning='\e[43m'
labelpp='\e[45m'
# RATIO


res1=$(date +%s)
register(){
    res1=$(date +%s)
    empas="${biru}${1}/${2}"
    stats="${margenta}[$(date +"%T")]"
	rand1=$(echo $((RANDOM%9999)))
	auth=$(curl -s "https://greatseotools.net/domain-authority-checker" -i \
	-H "user-agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7")
	authna=$(echo "$auth" | grep authCode | grep -Po '(?<=value=")[^"]*' | head -n 1)
	cookie=$(echo "$auth" | grep -Po '(?<=PHPSESSID=)[^;]*')
	postdata="{\"id\":\"\",\"email\":\"${1}\",\"password\":\"${2}\",\"2fa_code\":\"\",\"step\":1,\"checkout_by_login\":true}";
      gas=$(curl -s "https://greatseotools.net/ajax" -X POST \
     -H "user-agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7" \
     -H "content-type: application/x-www-form-urlencoded; charset=UTF-8" \
     -H "referer: https://greatseotools.net/domain-authority-checker" \
     -H "x-requested-with: XMLHttpRequest" \
     -H "origin: https://greatseotools.net" \
     -H "sec-fetch-site: same-origin" \
     -H "sec-fetch-mode: cors" \
     -H "sec-fetch-dest: empty" \
     -H "accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" \
     -H "accept: */*" \
     -H "cookie: PHPSESSID=$cookie" \
     -d "mozAuthority=1&domainAuthority=1&sitelink=$1&authcode=$authna")
      if [[ -z "$gas" ]]; then
      printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${1}  => ${merah}DIE${normal}\n" 
      elif [[ $gas == *"Invalid authentication code!"* ]]; then
      printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${1}  => ${merah}DIE${normal} | Status: authCode\n" 
      else
    printf "${stats} ${margenta}[${3}/${totallines}]${normal} ${1}  => Score: ${ijo}${gas}${normal}\n"
    echo "${1} | $gas" >> da_list.txt
    fi
}
printf "${white}[+] Input MAILPASS List : "; read LIST 
if [[ ! -f $LIST ]]; then
    echo "[-] File $LIST Not Exist" 
    exit 10
fi

totallines=$(wc -l < ${LIST});
itung=1
index=$((pp++))
printf " '-> Total MAILPASS On List :${white} ${bgreen} $(grep "" -c $LIST) ${cbg}\n" | lolcat --force
printf "${white}[+] Threads          : "; read THREADS
printf "${white} '-> Set Threads To ${bgreen} $THREADS ${cbg}\n" | lolcat --force
pp=1
IFS=$'\r\n' GLOBIGNORE='*' command eval 'mailist=($(cat $LIST))'
for (( i = 0; i < ${#mailist[@]}; i++ )); do
  index=$((itung++))
    username="${mailist[$i]}"
    IFS=' ' read -r -a array <<< "$username"
    email=${array[0]}
    password=${array[1]}
   tt=$(expr $pp % $THREADS)
   if [[ $tt == 0 && $pp > 0 ]]; then
   sleep 5
   fi
   let pp++
   jam=$(date '+%H')
   menit=$(date '+%M')
   detik=$(date '+%S')
   

	register "${email}" "${password}" "${index}" &
	
	
done
wait




termin=$(date +%s)
difftimelps=$(($termin-$res1))
echo -e "Finished at ${ijo}$(($difftimelps / 60)) menit dan ${ijo}$(($difftimelps % 60)) detik"



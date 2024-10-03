#!/bin/bash

# ___| |_   _| | ___ _ __
#/ __| \ \ / / |/ _ \ '__|
#\__ \ |\ V /| |  __/ |
#|___/_| \_/ |_|\___|_|
#A script written by slvler in September 2024 under GNU GENERAL PUBLIC LICENSE
#
set -u

COLORED_MESSAGES=""

# curl control
function curl_check()
{
  curl -V foo >/dev/null 2>&1 || { echo "I require foo but it's not installed.  Aborting." >&2; exit 1; }
}
# check connection
function check_connection()
{
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo -e " Checking the Internet:"
    echo "internet connection not available"
    exit 1
  else
    echo "Checking internet: CONNECTED"
    sleep 0.5
  fi
}
# jq control
function jq_check()
{
  jq=$(which jq)
  if [ -z "$jq" ]; then
    echo "jq not installed"
    exit 1
  fi
}

function definition()
{
    curl_check
    check_connection
    jq_check
}

definition

# Help
function help()
{
    echo ""
    echo -e "Bash script to Plaintext query api to retrieve data from github.com"
    echo -e "to make it work ${GREEN}sudo bash github.sh$NC"
    echo "----------------------------------------------------------"
    echo -e $CYAN"    Create by           $WHITE":" $RED slvler$NC"
    echo -e $CYAN"    Developer           $WHITE":" $RED https://github.com/slvler$NC"
    echo -e $CYAN"    Version             $WHITE":" $RED v1.0.0$NC"
    echo ""
}

# Exit
function qt(){
    clear
    echo ""
    echo "----------------------------------------------------------"
    echo -e $REDBg"EXİT$NC"
    echo ""
    exit 0
}

# Setting
function setting()
{
  echo -e "Create coloring settings: "
  read choice
  if [ $choice -eq 1 ]; then
    COLORED_MESSAGES="yes"
  fi

  echo "Coloring settings have been created"
}

function load_colors()
{
 if [[ $COLORED_MESSAGES == "yes" ]];
 then

  NC="\e[0m"

  # Background
  REDBg="\e[0;41m"
  GREENBg="\e[0;42m"
  YELLOWBg="\e[0;43m"
  BLUEBg="\e[0;44m"
  PINKBg="\e[0;45m"
  CYANBg="\e[0;46m"
  WHITEBg="\e[0;47m"

  # Color
  RED="\e[31m"
  GREEN="\e[32m"
  YELLOW="\e[33m"
  BLUE="\e[0;34m"
  MAGENTA="\e[35m"
  CYAN="\e[36m"
  WHITE="\e[37m"
  GRAY="\e[38;5;242m"

  # Underline
  URED="\e[4;31m"
  UGREEN="\e[4;32m"
  UYELLOW="\e[4;33m"
  UBLUE="\e[4;34m"
  UPINK="\e[4;35m"
  UCYAN="\e[4;36m"
  UWHITE="\e[4;37m"

 else
  NC=""
  # Background
  REDBg=""
  GREENBg=""
  YELLOWBg=""
  BLUEBg=""
  PINKBg=""
  CYANBg=""
  WHITEBg=""

  # Color
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  MAGENTA=""
  CYAN=""
  WHITE=""
  GRAY=""

  # Underline
  URED=""
  UGREEN=""
  UYELLOW=""
  UBLUE=""
  UPINK=""
  UCYAN=""
  UWHITE=""
 fi;
}
load_colors

function login()
{
  LOGIN=$(jq ".login" $json_data);
  echo "LOGIN:" $LOGIN
}
function id()
{
  ID=$(jq ".id" $json_data);
  echo -e "${RED}ID: $ID ${NC}"
}
function node_id()
{
  NODE_ID=$(jq ".node_id" $json_data);
  echo -e "${RED}NODE_ID: $NODE_ID ${NC}"
}
function avatar_url()
{
  AVATAR_URL=$(jq ".avatar_url" $json_data);
  echo -e "${RED}AVATAR_URL: $AVATAR_URL ${NC}"
}
function gravatar_id()
{
  GRAVATAR_ID=$(jq ".gravatar_id" $json_data);
  echo -e "${RED}GRAVATAR_ID: $GRAVATAR_ID ${NC}"
}
function url()
{
  URL=$(jq ".url" $json_data);
  echo -e "${RED}URL: $URL ${NC}"
}
function html_url()
{
  HTML_URL=$(jq ".html_url" $json_data);
  echo -e "${RED}HTML_URL: $HTML_URL ${NC}"
}
function followers_url()
{
  FOLLOWERS_URL=$(jq ".followers_url" $json_data);
  echo -e "${RED}FOLLOWERS_URL: $FOLLOWERS_URL ${NC}"
}
function following_url()
{
  FOLLOWING_URL=$(jq ".following_url" $json_data);
  echo -e "${RED}FOLLOWING_URL: $FOLLOWING_URL ${NC}"
}
function gists_url()
{
  GISTS_URL=$(jq ".gists_url" $json_data);
  echo -e "${RED}GISTS_URL: $GISTS_URL ${NC}"
}
function starred_url()
{
  STARRED_URL=$(jq ".starred_url" $json_data);
  echo -e "${RED}STARRED_URL: $STARRED_URL ${NC}"
}
function subscriptions_url()
{
  SUBSCRIPTIONS_URL=$(jq ".subscriptions_url" $json_data);
  echo -e "${RED}SUBSCRIPTIONS_URL: $SUBSCRIPTIONS_URL ${NC}"
}
function organizations_url()
{
  ORGANIZATIONS_URL=$(jq ".organizations_url" $json_data);
  echo -e "${RED}ORGANIZATIONS_URL: $ORGANIZATIONS_URL ${NC}"
}
function repos_url()
{
  REPOS_URL=$(jq ".repos_url" $json_data);
  echo -e "${RED}REPOS_URL: $REPOS_URL ${NC}"
}
function events_url()
{
  EVENTS_URL=$(jq ".events_url" $json_data);
  echo -e "${RED}EVENTS_URL: $EVENTS_URL ${NC}"
}
function received_events_url()
{
  RECEIVED_EVENTS_URL=$(jq ".received_events_url" $json_data);
  echo -e "${RED}RECEIVED_EVENTS_URL: $RECEIVED_EVENTS_URL ${NC}"
}
function type()
{
  TYPE=$(jq ".type" $json_data);
  echo -e "${RED}TYPE: $TYPE ${NC}"
}
function site_admin()
{
  SITE_ADMIN=$(jq ".site_admin" $json_data);
  echo -e "${RED}SITE_ADMIN: $SITE_ADMIN ${NC}"
}
function name()
{
  NAME=$(jq ".name" $json_data);
  echo -e "${RED}NAME: $NAME ${NC}"
}
function company()
{
  COMPANY=$(jq ".company" $json_data);
  echo -e "${RED}COMPANY: $COMPANY ${NC}"
}
function blog()
{
  BLOG=$(jq ".blog" $json_data);
  echo -e "${RED}BLOG: $BLOG ${NC}"
}
function location()
{
  LOCATION=$(jq ".location" $json_data);
  echo -e "${RED}LOCATION: $LOCATION ${NC}"
}
function email()
{
  EMAIL=$(jq ".email" $json_data);
  echo -e "${RED}EMAIL: $EMAIL ${NC}"
}
function hireable()
{
  HIREABLE=$(jq ".hireable" $json_data);
  echo -e "${RED}HIREABLE: $HIREABLE ${NC}"
}
function bio()
{
  BIO=$(jq ".bio" $json_data);
  echo -e "${RED}BIO: $BIO ${NC}"
}
function twitter_username()
{
  TWITTER_USERNAME=$(jq ".twitter_username" $json_data);
  echo -e "${RED}TWITTER_USERNAME: $TWITTER_USERNAME ${NC}"
}
function public_repos()
{
  PUBLIC_REPOS=$(jq ".public_repos" $json_data);
  echo -e "${RED}PUBLIC_REPOS: $PUBLIC_REPOS ${NC}"
}
function public_gists()
{
  PUBLIC_GISTS=$(jq ".public_gists" $json_data);
  echo -e "${RED}PUBLIC_GISTS: $PUBLIC_GISTS ${NC}"
}
function followers()
{
  FOLLERWERS=$(jq ".followers" $json_data);
  echo -e "${RED}FOLLERWERS: $FOLLERWERS ${NC}"
}
function following()
{
  FOLLOWING=$(jq ".following" $json_data);
  echo -e "${RED}FOLLOWING: $FOLLOWING ${NC}"
}
function created_at()
{
  CREATED_AT=$(jq ".created_at" $json_data);
  echo -e "${RED}CREATED_AT: $CREATED_AT ${NC}"
}
function updated_at()
{
  UPDATED_AT=$(jq ".updated_at" $json_data);
  echo -e "${RED}UPDATED_AT: $UPDATED_AT ${NC}"
}

while :
do
echo ""
echo "  ~~~~~~ Plaintext query api to retrieve data from github.com ~~~~~~"
echo ""
echo " [] ✔ Github user name "
echo " [x] ✔ Exit "
echo " [*] ✔ Help "
echo " [+] ✔ Setting "
echo ""
echo "enter username or process:  "
read type

load_colors $COLORED_MESSAGES

if [ "$type" == "x" ]; then
    qt
elif [ "$type" == "*" ]; then
    help
elif [ "$type" == "+" ]; then
    setting
else
    API_ENDPOINT="https://api.github.com/users/$type"
    RESPONSE=$(curl -s "$API_ENDPOINT" --output /tmp/response.json)
    json_data="/tmp/response.json";
    clear
    login
    id
    node_id
    avatar_url
    gravatar_id
    url
    html_url
    followers_url
    following_url
    gists_url
    starred_url
    subscriptions_url
    organizations_url
    repos_url
    events_url
    received_events_url
    type
    site_admin
    name
    company
    blog
    location
    email
    hireable
    bio
    twitter_username
    public_repos
    public_gists
    followers
    following
    created_at
    updated_at
fi

done


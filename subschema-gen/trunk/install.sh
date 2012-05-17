echo on
die () {
    echo >&2 "$@"
    exit 1
}

if [[ ! -n "$1" ]];
then
 die "parameter 1 deployment folder path required ; e.g. ./install.sh ../web_live ";
fi


if [[ -n "$2" ]]
then 
  if [[ $2 == /* ]]
  then 
     echo "Web root setting to ${2}"
     export WEB_ROOT=$2;
  else
     die "${2} is not a valid web root, it must start with backlash or be left blank";
  fi
else
  export WEB_ROOT=''
  echo "Web root is set to server root";
fi


if [[ -d $1 ]]
then echo "Deploying in ${1}";
else die "${1} is not a folder !";
fi

ROOT_DIR=`cd $1 && pwd`

#WEB_ROOT=$2

./scripts/deploy $ROOT_DIR
# delete .svn files
find $ROOT_DIR -name '.svn' | xargs rm -rf
cp ./web/html/htaccess $ROOT_DIR
#export ROOT_DIR=`cd $1 && pwd`
sed -i "s|WEB_ROOT|$WEB_ROOT|g" $ROOT_DIR/htaccess
mv $ROOT_DIR/htaccess $ROOT_DIR/.htaccess
sed -i "s|\$root_dir_path = '';|\$root_dir_path = '$ROOT_DIR/data/aknssg';|g" $ROOT_DIR/cgi-bin/aknssg/aknssg-conf.php 
sudo chown www-data:www-data -R $ROOT_DIR/data/aknssg/html
mkdir -p $ROOT_DIR/data/tmp
sudo chown www-data:www-data -R $ROOT_DIR/data/tmp

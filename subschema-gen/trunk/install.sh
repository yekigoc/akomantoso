echo on
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "1 deployment folder path required, and 1 web root required $# provided"

if [[ -d $1 ]]
then echo "Deploying in ${1}";
else die "${1} is not a folder !";
fi



ROOT_DIR=`cd $1 && pwd`

WEB_ROOT=$2

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

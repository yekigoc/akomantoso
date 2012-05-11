./scripts/deploy $1
# delete .svn files
find $1 -name '.svn' | xargs rm -rf
cp ./web/html/htaccess $1/.htaccess
export ROOT_DIR=`cd $1 && pwd`
sed -i "s|\$root_dir_path = '';|\$root_dir_path = '$ROOT_DIR/data/aknssg';|g" $ROOT_DIR/cgi-bin/aknssg/aknssg-conf.php 
sudo chown www-data:www-data -R $ROOT_DIR/data/aknssg/html


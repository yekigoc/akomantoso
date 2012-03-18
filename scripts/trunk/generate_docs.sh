# path to OXYGEN 13.1
#OXYGEN=/home/ashok/apps/oxygen-13
if [ -z "$OXYGEN" ]; then
  echo "You need to set the OXYGEN to the path to your Oxygen 13.1 installation ! "
  echo "Exiting : Requires Oxygen 13.1 !"
  exit 1
fi
OXYDOCS_FOLDER=oxydocs
DOCS_FOLDER=docs
echo "creating required folders "
mkdir -p $DOCS_FOLDER
mkdir -p $OXYDOCS_FOLDER
echo "These scripts require xsltproc php5-cli wget "
echo "Attempting to get akomantoso schema"
wget -O akomantoso20_original.xsd http://akomantoso.googlecode.com/svn/release/trunk/schemas2.0/akomantoso20.xsd
echo "Attempting to convert annotations in schema"
xsltproc -o akomantoso20.xsd reform_annotation.xsl akomantoso20_original.xsd
echo "Converted ! Use the generated akomantoso.xsd for step_one and step_two "
echo "Generating settings for conversion from template"
CURRENT_DIR=`pwd`
# this updates the output path for oxygen generator configuration
sed "s|___PWD___|$CURRENT_DIR|g" settings.xml.tmpl | sed "s|___OXYDOCS___|$OXYDOCS_FOLDER|g"  > settings.xml
echo "Calling Oxygen documentation generator"
$OXYGEN/schemaDocumentation.sh `pwd`/akomantoso20.xsd  -cfg:$CURRENT_DIR/settings.xml
#the commented code works only on oxygen 13
echo "Reformatting Oxygen generated documentation"
echo "Step 1 ... "
./step_one.php ./$OXYDOCS_FOLDER/akomantoso20.html ./$DOCS_FOLDER/newakoma.html ./$DOCS_FOLDER/newakoma.csv
echo "Step 2 ... "
./step_two.php ./$DOCS_FOLDER/newakoma.html 
cp -R ./$OXYDOCS_FOLDER/img ./$DOCS_FOLDER

#PATH_TO_OXYGEN=/home/undesa/apps/oxygen-13
#mkdir -p docs
#
echo "These scripts require xsltproc and wget "
echo "Attempting to get akomantoso schema"
wget -O akomantoso20_original.xsd http://akomantoso.googlecode.com/svn/release/trunk/schemas2.0/akomantoso20.xsd
echo "Attempting to convert annotations in schema"
xsltproc -o akomantoso20.xsd reform_annotation.xsl akomantoso20_original.xsd
echo "Converted ! Use the generated akomantoso.xsd for step_one and step_two "
#$PATH_TO_OXYGEN/schemaDocumentation.sh -cfg:./settings.xml
#the commented code works only on oxygen 13

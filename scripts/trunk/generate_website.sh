if [ !  -d docs ];then
  echo generated document does not exist, run ./generate_docs.sh first ! 
  exit 1
fi
echo getting latest website template
svn export http://akomantoso.googlecode.com/svn/examples_website/trunk website
mkdir -p website/doc_html
mkdir -p website/img
echo copying oxygen generated docs
cp -R docs/*.html website/doc_html
cp -R docs/img/* website/img
echo website generatd in website folder

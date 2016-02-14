# Introduction #

oXygen documentation tool generates a single, large html file from a given xsd. This page describes how to split up the file into separate pages for each element for use on schemadocs.akomantoso.org.

# Procedure #

  1. Check out the scripts from SVN
```
     svn checkout http://bungeni-portal.googlecode.com/svn/akomadocs 
```
  1. Generate the oXygen documentation. Instructions to do this can be found [here](http://www.oxygenxml.com/xml_schema_documentation.html)
  1. Copy akomantoso100.html file from the oXygen documentation folder into the akomadocs folder
  1. Run the following commands in the akomadocs folder. The generated docs will be in the akomadocs/docs and the CSV will be akomadocs/docs.csv
```
php links.php
php akomadoc.php
php csv.php
```
  1. Copy the img folder from the oXygen documentation folder into the docs folder


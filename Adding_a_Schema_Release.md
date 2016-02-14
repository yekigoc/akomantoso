# Introduction #

The Schema releases website is a PHP/XML website for showing the release notes and provide a diff feature on the schema-releases.


# Checkout from repository #

```
svn co https://akomantoso.googlecode.com/svn/examples_website/trunk examples_website
```

After the checkout, the directory structure should be similar to this:
```
examples_website/
├── alphabetical.html
├── categorical.html
├── schema-releases.html
├── usage.html
├── favicon.ico
├── css/
├── doc/
├── images/
├── loader/
├── release_notes/
├── php/
├── releases/
├── script/
├── tmp/
└── xslt/
```

In order add a new schema-release to the website, you only work with **doc/** and **releases/** directories

## releases.xml ##

**doc/releases.xml** is the file that contains a list of all the akoma ntoso releases.

Open **doc/releases.xml** file, it will have a this structure:
```
<?xml version="1.0" encoding="UTF-8"?>
<releases>
    <release number="23">
        <title>Latest Release: May 2013</title>
        <notes>
           Release notes release notes...                    
        </notes>
    </release>     
    <release number="22">
        <title>Diff:May 2013 & Feb 2013</title>
        <notes>
           Release notes release notes...                    
        </notes>
    </release>     
    ...
</releases>
```

Duplicate the top-most **`<release/>`** node and increment the `number` value by one. Update the **`<title/>`** and **`<notes/>`** nodes appropriately and save the document.

## Adding a release schema ##

Copy the latest **akomantoso30.xsd** file you have downloaded into **releases/** directory

Rename it to **release-#.xsd"**

**NB:** The number should be the same as the one used in **`<release number="#"/>`** in the prior step.

Finally checkin the changes and regenerate the website.

## Next Step ##
[Generating documentation and examples website](WebsiteDocumentation.md)
# Pre-requisites #
Generating the latest documentation may require the website files and the Akoma Ntoso schema be added into the repository. The two items below will guide on how to accomplish this:
  * [Adding a new release tag to the repository](Tagging_a_New_Release.md)
  * [Updating schema-releases website](Adding_a_Schema_Release.md)

# Introduction #

You will need to install xsltproc wget and php5-cli

Run :
```
sudo apt-get install xsltproc wget php5-cli
```

You will also need to install Oxygen 13.1

# Generate the documentation for the site #

## Step 1 ##
Next checkout the scripts for generating the documentation:
```
svn co http://akomantoso.googlecode.com/svn/scripts/trunk akoma-scripts
```

## Step 2 ##
Change directory into **akoma-scripts**

Within the directory open `generate_docs.sh` script-file and make necessary changes, one in particular:

```
wget -O akomantoso20_original.xsd http://akomantoso.googlecode.com/svn/release/trunk/schema/akomantoso30.xsd
```

The http path should be edited appropriately to schema you want to generate documentation from (see [How to Tag a new release](Tagging_a_New_Release.md)). It will be downloaded in the process of generating the docs.

## Step 3 ##
From the folder with this readme, run :

OXYGEN=/path/to/oxygen/13.1 ./generate\_docs.sh

## Step 4 ##

The above step (3) will generate a folder called ./docs
with the generated and reformatted documentation.

# Generate the website #

Generating the website merges both the documentation and the changes made in website (see [How to add a release](Adding_a_Schema_Release.md)) into one directory used to update the live website.

While still in the **akoma-scripts** directory, run:

```
./generate_website.sh 
```

which will create the website in a sub-folder called:

"website"

Essentially, this script will:

  * Checkout the website from http://akomantoso.googlecode.com/svn/examples_website/trunk
  * Copy the newly generated documentation on "Generate the documentation for the site" step above
  * Create a sub-directory "website" to be used in updating http://examples.akomantoso.org
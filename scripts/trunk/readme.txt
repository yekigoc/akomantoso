1)

You will need to install xsltproc wget and php5-cli

Run :

sudo apt-get install xsltproc wget php5-cli

You will also need to install Oxygen 13.1


2)
From the folder with this readme, run :

OXYGEN=/path/to/oxygen/13.1 ./generate_docs.sh


3) The above (2) will generate a folder called ./docs 
with the generated and reformatted documentation.

4) For generating the examples website , run :

./generate_website.sh 

which will create the website in a sub-folder called 

"website" 

You will need to run ./generate_docs.sh before running 
./generate_website.sh
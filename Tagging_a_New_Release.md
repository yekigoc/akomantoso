# Introduction #

New Akoma Ntoso releases are tagged with their release date and checked-into the release repository (see [list of releases](http://akomantoso.googlecode.com/svn/release/tags/)).

**NB:** Replace every instance of YYYY-MM-DD with the release date.


## Preparing the release folder ##

Unzip the release`*`.zip files, the hierarchy should be similar to this:
```
Release YYYYMMDD/
├── gpl-3.0.txt
├── release_notes/
├── schemas/
└── styles/
```

## Create and tag the new release in the repository ##

```
svn mkdir https://akomantoso.googlecode.com/svn/release/tags/release-YYYY-MM-DD --username your@email.address
```

## Checkout and commit the new release ##

Checkout from the newly created tag above:

```
svn co https://akomantoso.googlecode.com/svn/release/tags/release-YYYY-MM-DD --username your@email.address
```

This will create a folder release-YYYY-MM-DD. Copy the contents your unzipped above into release-YYYY-MM-DD:
```
cp /path/to/Release YYYYMMDD/* release-YYYY-MM-DD/
```

Then change directory into the release-YYYY-MM-DD, add the contents and checkin to the repository as shown below in three steps:
```
cd release-YYYY-MM-DD

svn add *

svn commit -m "Tagging YYYY-MM-DD release" --username your@email.address
```

**NB:** You will be prompted for a password which you can retrieve from here https://code.google.com/hosting/settings when you are logged into your google account.


## Next Steps ##
  * [Updating schema-releases website](Adding_a_Schema_Release.md)
  * [Generating documentation and examples website](WebsiteDocumentation.md)
# Introduction #

There is a typical legal problem concerning the privacy in the judgments and also in some parliamentary acts (when the parliament approves some special administrative orders for a single person, like name of a witness in some special proceeding, victim of political persecution, refugees, etc.) Akoma Ntoso provides a way to mark these up.

# Method 1 #

The XML preserves the original text but we would like to obfuscate the information in the presentation. So, we use some attributes for filtering the view of the document from the presentation side.

Status=ignore and class=anonymizer (the legal phenomena for clean the legal documents from any critical information, usually name of the people).

```
<person id="prs1" refersTo="#Smith" status="ignore" class="anonimizer">John Smith </person> 
```

Where 'John Smith' is a minor person part of the fact of this judgment.


# Method 2 #

In case you would like to provide an XML to other institutions as interchange format you need to obfuscate the text directly, but have some metadata for the searching (es. give me all the judgments that have minor persons involved):
```
<omissis status="omissis" refersTo="#minorPerson" class="anonimizer">....</omissis>
```
We use omissis for stressed the point that the document has a missing part with respect the original version and for connecting the metadata/ontology.
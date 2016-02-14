# Introduction #

It is possible to use RDF (as well as, limitedly, RDFa) in Akoma Ntoso, but there are good and bad ways to do so.

## The concrete syntax ##

According to the RDF (and RDFa) approach, statements can be placed anywhere you want, as long as they completely and correctly identify the elements of the triple. In particular, they are not necessarily near the part of the document they refer to.

Akoma Ntoso provides you with a very nice position for putting whatever data and structure you fancy, the metadata/proprietary section. There, you can define your own XML GRDDL-compliant syntax (including RDF/XML itself) to express whatever statement you need, as long as you use a different namespace than Akoma Ntoso. If you do not want to use an XML syntax (e.g., Manchester syntax or Turtle), you need to invent your own XML wrapper, i.e., a single XML element placed within the proprietary section, that contains your RDF block.

## The triples ##

Since all relevant elements of the Akoma Ntoso document are provided with IDs, it is very simple to specify an RDF triple that refers to any element of the document. For instance, the following fragment

```
<meta>
...
 <proprietary>
   <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:time="http://www.example.com/nonAkomaNtosoNamespaceForTime#">
     <rdf:Description rdf:about="#q1">
       <time:duration>12m15s</time:duration>
     </rdf:Description>
   </rdf:RDF>
 </proprietary>
...
</meta>
...
<question id="q1" by="#Sibande" to="#deputyPresident">
 <from> Mr M P Sibande (ANC-Mpumalanga)</from>
 <p>  ask the Deputy President:</p>
 <p> blah blah</p>
</question>
```

associates the question whose id is "q1" to the statement that its duration was 12 minutes and 15 seconds.

## The ontology ##

A different situation is where the RDF statement regards, addresses, identifies or mentions an entity recognized by the ontology. Akoma Ntoso has a 14 classes' ontology, including person (TLCPerson), concept (TLCconcept) and event (TLCevent). Each entity of the AN ontology has an identifier in the form of the URI /ontology/class/identifier. If the rdf statement you want to express refers (either as its subject or as its object) to an entity of the ontology, you CANNOT use its URI directly, but MUST pass through the references section. For instance, if you want to say that Mr Sibande is 65 years old at the moment in which he put the question, the following statements are three different ways to say so, two of which are wrong, and the third one correct:

```
<meta>
...
 <proprietary>
   <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:time="http://www.example.com/nonAkomaNtosoNamespaceForTime#">
     <rdf:Description rdf:about="#q1">                          <!-- WRONG  -->
       <time:age>65</time:age>
     </rdf:Description>
     <rdf:Description rdf:about="/ontology/person/Sibande">     <!-- WRONG  -->
       <time:age>65</time:age>
     </rdf:Description>
     <rdf:Description rdf:about="#Sibande">                     <!-- CORRECT  -->
       <time:age>65</time:age>
     </rdf:Description>
   </rdf:RDF>
 </proprietary>
 <references>
   <TLCPerson id="Sibande" href="/ontology/person/Sibande" showAs="Mr M P Sibande"/>
   ...
 </references>
...
</meta>
...
<question id="q1" by="#Sibande" to="#deputyPresident">
 <from> Mr M P Sibande (ANC-Mpumalanga)</from>
 <p>  ask the Deputy President:</p>
 <p> blah blah</p>
</question>
```

So whenever you make an RDF statement about an entity of the ontology, or using an entity of the ontology as its value, you need to specify such entity in the `<references>` section, and use its id in your RDF statement.
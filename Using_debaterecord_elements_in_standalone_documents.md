# Introduction #

Sometimes there is a need to represent a motion or a question from a debate in a standalone Akoma Ntoso document. This document discusses the possiblities of doing this -- and the semantically correct approach of doing this.


# Usage #

It is by all means possible to put a question in the main content of a doc, as follows:

```
<akomaNtoso xmlns="http://www.akomantoso.org/1.0"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.akomantoso.org/1.0 akomantoso10.xsd">
<doc>
       <meta>
               <identification source="#FV">
                       <FRBRWork>
                               <FRBRthis value=""/>
                               <FRBRuri value=""/>
                               <FRBRdate date="" name=""/>
                               <FRBRauthor href=""/>
                       </FRBRWork>
                       <FRBRExpression>
                               <FRBRthis value=""/>
                               <FRBRuri value=""/>
                               <FRBRdate date="" name=""/>
                               <FRBRauthor href=""/>
                       </FRBRExpression>
                       <FRBRManifestation>
                               <FRBRthis value=""/>
                               <FRBRuri value=""/>
                               <FRBRdate date="" name=""/>
                               <FRBRauthor href=""/>
                       </FRBRManifestation>
               </identification>
               <publication date="" showAs="" name=""/>
               <references source="#FV">
                       <TLCPerson id="FV" href="/ontology/person/FabioVitali" showAs="Fabio Vitali"/>
                       <TLCPerson id="JS" href="/ontology/person/JohnSmith" showAs="John Smith"/>
               </references>
       </meta>
       <mainContent>
               <question by="#JS">
                       <from>John Smith</from>
                       <p>What time is it?</p>
               </question>
       </mainContent>
</doc>
</akomaNtoso>
```

The above is a complete document except for a few things, namely, the URI and identifiers of the document itself.

However, this is not neccessarily the right way --

While the syntactical approach to putting a 

&lt;question&gt;

 element in the body of a 

&lt;doc&gt;

 element may be correct, but what is not clear in the above is the actual nature of such document, if it is not a debate -- why is the question even being put there ?

In fact, if is not a report on a debate of some form,  

&lt;question&gt;

 is the wrong element to use.

For instance, if the document is the formal submission of a question to the government, expecting an answer, then the whole document is the question, and not one of its section within the body. As such, you should NOT use the element 

&lt;question&gt;

, but you should use just plain paragraphs in the body, and the document should be described as a question by its metadata.

A 

&lt;question&gt;

 element should only be used when describing some debate, where one speaker asks specifically a question and another speaker provides the answer and then some further debate ensues using 

&lt;speech&gt;

 elements.
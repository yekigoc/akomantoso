# Introduction #

The `by` attribute in speech and question supports different kinds of usage for different scenarios

## Question, Speech made by a single person ##

This is the common straightforward usage of the `by` attribute :

```

<question by="#WilliamNdogo" >
....
</question>
```

## Question made by multiple persons ##

The recommended way to do this :

```
<question by="#WilliamNdogo #JohnSmith" >
....
</question>
```

For a question proposed by 'William Ndogo' and 'John Smith'

There are other (less elegant) ways to represent the same -- these have been discussed below.


From an ontological point of view, a question from a number of MPs is really a debate fragment whose author is not a person (represented by a TLCPerson in the AN ontology), but a group of persons (represented by a TLCOrganization in AN), which in turn is composed of a number of individuals. Thus, the real appropriate way to do so would be to state that --
  1. the question is by #arbitraryName1
  1. arbitraryName1 is the ID of a transient TLCOrganization whose name is not relevant
  1. The TLCPerson referred as #Kofa is a member of the TLCOrganization #arbitraryName1
  1. The TLCPerson referred as #Libe is a member of the TLCOrganization #arbitraryName1

This is even clunkier, but it is ontologically precise and correct. The corresponding XML would require the specification of the members of transient TLCOrganizations, for instance as follows:

```
   </meta>
     <analysis source="#fv">
       <localConcepts>
         <fact rel="#memberOf" about="#kofa" href="#arbitraryName1"/>
         <fact rel="#memberOf" about="#libe" href="#arbitraryName1"/>
       </localConcepts>
     </analysis>
     <references source="#fv">
       <TLCPerson id="fv" href="/ontology/person/FabioVitali" showAs="Fabio Vitali"/>
       <TLCPerson id="kofa" href="/ontology/person/JohnKofa" showAs="John Kofa"/>
       <TLCPerson id="libe" href="/ontology/person/BrianLibe" showAs="Brian Libe"/>
       <TLCOrganization id="arbitraryName1" showAs="John Kofa and Brian Libe"/>
       <TLCConcept id="memberOf" href="/ontology/concept/property/memberOf" showAs="is a member of"/>
     </references>
   </meta>
   ...
   <question by="#arbitraryName1">
      <from>John Kofa and Brian Libe</from>
      <p>When is lunch?</p>
   </question>
```


Here we can note several things:
  1. I have added a new syntax for expressing arbitrary ontological statements. The syntax is clearly immediately derived from RDFA and in fact is totally RDFA-compliant.
  1. In the analysis section we add a container of arbitrary, local facts (global facts should be placed in the ontology and not here. Here we only record local facts). The local facts are that the entity called `#kofa` is in the `#memberOf` relationship with the entity called `#arbitraryName1`, and the entity called `#kofa` is in the `#memberOf` relationship with the entity called `#arbitraryName1`.
  1. In the references section, we then find that `#memberOf` is the TLCconcept memberOf of the ontology which presumably maps the member of relationship linking TCLPerson to TLCOrganization, that `#kofa` is the person John Kofa, that `#libe` is the person Brian Libe.
  1. We also find that `#arbitraryName1` is a TLCOrganization, but since `#TLCOrganization` does NOT have a href attribute, we must assume that it is not part of the ontology at large, but a local concept that is only relevant in this document, i.e., that this is not a persistent organization, but a syntactical trick to put Kofa and Libe together.
  1. In the content we find that the question has been posed by the TLCOrganization called `#arbitraryName1`.


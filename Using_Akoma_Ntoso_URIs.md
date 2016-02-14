

## Resolving Akoma Ntoso URIs ##

The AKOMA NTOSO naming architecture is built so as not to rely on the existence of a single storage architecture, since the URIs stored within documents are differentiated from the ones physically representing the resource being sought.

The mapping from architecture-independent URIs into accessible architecture-dependent URLs (representing the best ITEM for the document being sought) are realized through specific applications called URI resolvers.

The AKOMA NTOSO naming architecture is built so as not to rely on the existence of any individual URI resolver, but assumes that all URIs are always correctly resolved to the best available ITEM regardless of the resolving mechanisms. In fact, each naming authority is given the global task of resolving any possible Akoma Ntoso URIs, regardless of whether it belongs or not to the country or countries managed by the naming authority.

This implies that the authority-specific details of URIs are purposefully omitted in this specification, and need to be considered only when first accessing a document.

For this reason, all URIs in this specification are prefixed with the arbitrary domain name http://www.authority.org that stands for any of an arbitrarily large number of equivalent naming authorities.

## The URI of a Work ##

### The URI for the Work as a whole ###


The URI for the WORK is the baseline for building the URI for the EXPRESSION, which is the baseline for the URI of the MANIFESTATION.

The URI for the WORK consists of the following pieces:

  * The base URL of a naming authority with URI-resolving capabilities (not relevant for the Naming Convention)
  * A detail fragment organizing in a hierarchical fashion the additional data:
    * Country (a two-letter code according to ISO 3166-1 alpha-2)
    * Type of document
    * Date (expressed in YYYY-MM-DD format or just YYYY if the year is enough for identification purposes)
    * Number (when appropriate, otherwise the string nn)

All components are separated by forward slashes (“/”) so as to exploit relative URIs in references.

  * http://www.authority.org/dz/debaterecord/2004-12-21[http://www.authority.org/dz/debaterecord/2004-12-21
> ]Algerian parliamentary debate record, 21st December 2004.
  * http://www.authority.org/sl/act/2004-02-13/2[http://www.authority.org/sl/act/2004-02-13/2
> ]Sierra Leone enacted Legislation. Act number 2 of 2004.
  * http://www.authority.org/ng/bill/2003-05-14/19[http://www.authority.org/ng/bill/2003-05-14/19
> ]Namibia Bill number 19 of 2003
  * http://www.authority.org/mg/act/2003-03-12/3[http://www.authority.org/mg/act/2003-03-12/3
> ]Madagascar. Act 3 from 2003

### The URI for WorkComponents ###

Although components are really belonging to expressions only, it often happens that the legislator makes work-level references to components, which thus need to have work-level URIs as well. Not only, but it may happen (and it has happened in the past several times) that the component (e.g., an attachment) may change name, or position, or even hierarchical placement, time after time.

For instance, we could have that an original act refers to table A of schedule 1, and after a little time schedule 1 is completely abrogated, and thus table A becomes (implicitly) an attachment of the main document. As such, it is important that all references to table A of schedule 1 are considered as references to table A of the main document after that event.

This brings about the necessity to have URIs for Work Components. These are to be used when referring in a work-level fashion to components that have official names and positions, but may change in name and position with time.

One problem is that a work-level component URI has no expression-level part, and yet the component part is AFTER the expression level part. Therefore, it is necessary to make sure that a work-level URI fragment is never mistaken for an expression-level or a component-level URI fragment.

But since:

  1. The number part of the work-level URI (/nn/) is required even in unnumbered documents ("/nn/"  for not numbered).
  1. The expression fragment, if present, always has at least the language and the "@" character, and the @ character can only be used for expression fragments,

the absence of a part containing the "@" character indicates a work-level component reference after the 4th component (the number).

  * http://www.authority.org/kn/act/2007-01-01/1/schedule1

Kenya, schedule 1 of act 1 from 2007 (WorkComponent)

## The URI of an Expression ##

Characterizing the Expression is the specific identification of a content with respect to another content. This includes specifications of the version and the language of the expression. Therefore, different versions of the same work, or the same version of the same work expressed in different languages correspond to different Expressions and will have different URIs.

Expressions are organized in components (the ExpressionComponents), and therefore we need to identify separately the Expression as a whole from the individual URIs for each ExpressionComponent. All of them are all immediately derived from the baseline, which is the URI for the Work.

### The URI for the expression as a whole ###

The URI for the EXPRESSION as a whole consists of the following pieces:

  * The URI of the corresponding WORK
  * The character “/”
  * The human language code in which the expression is drafted (a three-letter code according to ISO 639-2 alpha-3)
  * The “@” character (required)
  * An optional version identifier:
    * If an approved act, the version date of the expression in syntax YYYY-MM-DD.
    * If a bill, the presentation date is appropriate, or the stage in the approval process that the current draft is the result of.

The absence of the version identifiers signals two different situations depending on the type of document:

  * If the document is not versioned (e.g., the debate record of an assembly) then version identifier need not and cannot be present.
  * If the document is versioned (e.g., an act in force), then the lack of version identifiers refers to the version in force at the moment of the resolution of the URI (i.e., the “current” version of the act, where “current” refers to the moment in time in which the URI is dereferenced, rather than the moment in time in which the document containing the URI was created: _today_ for the reader, as opposed to today for the author of the references).

A particular expression is the first version of a Work. This expression should not be confused with the Work itself (which considers the first Expression in no special way to all other possible Expressions), and it is a very specific, although peculiar, Expression.

The original version of an expression is referred to with an URI with a dangling "@" character (which implies that the actual version date is the first appropriate date for that work).

  * http://www.authority.org/dz/debaterecord/2004-12-21/fra
> Algerian parliamentary debate record, 21st December 2004., French version
  * http://www.authority.org/sl/act/2004-02-13/2/eng
> Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, current version (as accessed today [to the reader](according.md))
  * http://www.authority.org/sl/act/2004-02-13/2/eng@
> Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, original version
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21
> Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004
  * http://www.authority.org/ng/bill/2003-05-14/19/eng@first
> Namibia Bill number 19 of 2003, first stage, English version
  * http://www.authority.org/mg/act/2003-03-12/3/mul
> Madagascar. Act 3 from 2003 in French and Malagasy.

### The URIs for ExpressionComponents ###

Some expressions have many components, some are only composed of a main document. In order to explicitly refer to individual components, it is therefore necessary to introduce a naming convention that identifies individual components, and still allows an easy connection between the component and the expression it belongs t

There are therefore two subcases

#### The expression is only composed of one component ####

In this case, the URI for the expression as a whole and for its main component are identical plus the name “main”.

#### The expression is composed of many components ####

The URI for each ExpressionComponent consist in this case of the following pieces:

  * The URI of the corresponding EXPRESSION as a whole
  * The character “/”
  * Either
    1. A unique name for the attachment
    1. The name “main” which is reserved for the main document. It we have different main they are numbered sequentially: main1, main2, etc.

  * http://www.authority.org/dz/minutes/2004-12-21/fra/main
> Algerian parliamentary debate record, 21st December 2004., French version, main document
  * http://www.authority.org/sl/act/2004-02-13/2/eng/main
> Main body of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, current version (as accessed today)
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1
> Attachment “schedule01” of Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004
  * http://www.authority.org/ng/bill/2003-05-14/19/eng@first/main/schedule3
> Third attachment of Namibia Bill number 19 of 2003, first stage, English version

### Hierarchies of components in ExpressionComponents ###

A frequent situation occurs when an attachment has itself further attachments. This creates a complex hierarchical situation in which the component should be considered, in a way, as an expression by itself, whose components need to be listed and properly differentiated. The process can be further iterated whenever not only an attachment has further attachments, but its attachments also have further attachments and so on. The situation must also foresee the situation in which attachments at different levels of the hierarchy end up having the same name (e.g., table A in schedule 1 and table A in schedule 2).

In such situations, each ExpressionComponent must be considered as an expression by itself. Recursively, the URI of attachments are as follows:

  * if the attachment does not have further attachments, its URI is provided as detailed in the previous section, without further addenda.
  * If the attachment has further attachments, the URI as detailed in the previous section refers to the whole attachment, including its own attachments.
  * To refer to the main document of an attachment that has further attachments, a further “/main” part should be added.
  * To refer to any further attachment of an attachment, a further “/” followed by a unique name for the attachment must be added to the attachment itself.


  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1
> Whole attachment “schedule01” of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, English version, as amended on July 2004.
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1/main
> Main document of the attachment “schedule01” of Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1/tableA
> Attachment “Table A” of the attachment “schedule01” of Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1/attachment1/main
> Main document of the attachment “attachment01” of the attachment “schedule01” of Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, amended on July 2004

### The URIs for virtual expressions ###

In some situations the actual enter-in-force date of the expression is not known in advance, and it is necessary to create references or mentions of documents whose URI is now known completely (possibly, because their exact delivery date is not known yet). These are called virtual expressions (i.e., references to expressions that probably do not exist yet or ever, but can be unambiguously deduced once all relevant information are made available).

There are at least three cases where such situation may take place:

  * the information is not known by the author of the expression (e.g., the legislator), in which case the act of actually retrieving the correct information is in itself an act of interpretation;
  * the information is not known by the editor of the expression (e.g., the publisher of the XML version of the document), in which case the information can theoretically be available, but is too much of a burden for the publisher to retrieve it.
  * the information is not know by the query system.

In all these cases, the syntax for the URI of the virtual expression uses a similar syntax to the specification of the actual expression, but the character “:” is used instead of the “@” after the specification of the work URI.

For instance, if we need to reference the expression of an act in force on date “1/1/2007”, we will probably need to refer to some expression whose enter in force date was in a previous date to 1/1/2007.

  * http://www.authority.org/sl/act/2004-02-13/2/eng:2004-07-21
> Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on the closest date before July 21, 2004

## The URI of a Manifestation ##

Characterizing the Manifestation is the specific process that generated an electronic document in some specific format(s). This includes specifications of the data format(s) used. Therefore, different manifestations of the same expression generated using different data formats correspond to different manifestations and will have different URIs.

Manifestations are organized in components (the ManifestationComponents), and therefore we must identify separately the Manifestation as a whole and the individual URIs for each ManifestationComponent. All of them are all immediately derived from the baseline, which is the URI for the EXPRESSION.

### The URI for the manifestation as a whole ###

The URI for the Manifestation as a whole consists of the following pieces:

  * The URI of the corresponding EXPRESSION as a whole
  * The character “.”
  * A unique three letter acronym of the data format in which the manifestation is drafted. The acronym can be “pdf” for PDF, “doc” for MS Word, or “xml” for the XML manifestation.
  * The akn for the package of all documents including XML version of the main document(s) according to the Akoma Ntoso rules.

  * http://www.authority.org/dz/debaterecord/2004-12-21/fra/main.doc
> Word version of the Algerian parliamentary debate record, 21st December 2004., French version
  * http://www.authority.org/sl/act/2004-02-13/2/eng/main.pdf
> PDF version of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, current version (as accessed today)
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main.akn
> Package of all documents including XML versions of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended in July 2004

### The URIs for ManifestationComponents ###

Each ManifestationComponent is an independent electronic structure (e.g., a file) in a single data format. Every type of manifestation has of course a different data structure and file structure. Therefore the actual format of the URIs of the components of the manifestation depend on the data format and cannot be formalized in general. In this section we therefore provide a grammar but not an exhaustive list of formats, that depends on the data format chosen for the manifestation.

The URI for each ManifestationComponent consists of the following pieces:

  * The URI of the corresponding EXPRESSION as a whole
  * The character “/”
  * Some unique identification of the ManifestationComponent with respect either to the manifestation as a whole or to the ExpressionComponent the component is the manifestation of.
  * The character “.“
  * A unique extension of the data format in which the manifestation is drafted. The acronym can be “pdf” for PDF, “doc” for MS Word, “xml” for XML documents, “tif” for image formats, etc.

In the next section we will examine the format of the package and the relevant URIs for a specific manifestation of Akoma Ntoso documents, the XML format.

### The URIs for the components in the Akoma Ntoso package manifestation ###

The Akoma Ntoso package manifestation is a very specific manifestation using a number of data formats (mainly XML but could include other multimedia formats as needed) with a very specific organization of parts and components. Since it makes explicit choices in terms of data formats and reciprocal references, it is important to provide clear and non-ambiguous rules as to the internal naming mechanism and its overall structure.

An Akoma Ntoso package manifestation is a package composed of one or more files organized in a flat fashion. The transportable format is a ZIP file whose extension is “.akn”. Other formats are possible and acceptable as long as they adhere to these rules.

The following are alternative options for the Akoma Ntoso package:

  * If the document is just composed of text and does not refer to any multimedia fragment of any form, then the ZIP package contains a single document called “main.xml”.
  * If the document is composed of many ManifestationComponents but does not refer to any multimedia fragment of any form, then the zip package is composed of many XML files, one for each ExpressionComponent. Each ManifestationComponent is then called as its corresponding ExpressionComponent, plus the “.xml” extension. The name “main” is reserved for the main component. Numbers are never used except when they are already part of the ExpressionComponent’s name.
  * If the document contains multimedia fragments of any kind, then each individual fragment does not have a corresponding ExpressionComponent, but is just a ManifestationComponent referred to in the img or object element. All multimedia components must be stored within an inner structure (e.g., a folder) called “media”. Multimedia components can be called freely, but must use the appropriate extension to refer to their content type. Thus a logo can be called “logtif” or any other name, as long as the extension is correctly specifying the content type.

Reciprocal references to ManifestationComponents are necessary within a specific manifestation. For instance, the manifestation of the main document refers to the manifestations of its attachments via the attachment elements, and the schedule showing an image refers to the file of the image via the img element. In these cases, all references MUST be relative to the package (i.e., the manifestation as a whole):

  * attachment1.xml
> Manifestation of the first attachment of the current document
  * schedule3.xml
> Manifestation of the third attachment of the current document
  * media/logtif
> Manifestation of an image within the current document

References to ManifestationComponents are rarely, if ever, needed outside of the manifestation themselves. But if needed, they will refer to the file as follows:

  * The URI of the corresponding EXPRESSION as a whole
  * The character “/”
  * The relative reference to the required ManifestationComponent as specified above.

## The URI of an Item ##

Akoma Ntoso makes no assumption on the physical storage mechanism employed to record actual manifestations. As such, there is NO rule for URIs of the items, which are free to assume any form whatsoever and correspond to whatever storage mechanism has been employed locally.

On the other hand, the actual URL for the item must be provided to a resolution mechanism in order for the hypertextual feature of the Akoma Ntoso publication systems to work correctly and automatically.

## The URI of non-document entities ##

The object of all discourses within the Akoma Ntoso framework can be described as a set of abstract classes and their instances and of the relationship among them. Cumulatively, definition of classes, relationships and instances are called an ontology.

The four most important classes of the Akoma Ntoso ontology are surely connected to documents,  Work, Expression and Manifestation, but many more exist, even if they are not connected directly to physical documents. The purpose of this section is to provide a syntax for non-document entities, i.e., instances of non-document classes, such as people, organizations, concepts, etc. Furthermore, the syntax described here can also be used for document entities as an equivalent syntax to the one specified in the previous sections.

Akoma Ntoso entities are always associated to a class, which provides a structure of properties and relationships to other instances of the same and other classes. Classes in the Akoma Ntoso ontology are organized in a complex maze of sub/superclasses. These are useful to give shape and meaning to a domain, and to provide structure to the overall set of instances of a base class. It is important to notice that sub/superclasses do not form necessarily a tree, but can form a more complex structure, namely a directed graph.

For instance, the class of Kenyan judges can be considered a sub class of both Kenyan persons and of persons whose job description is judge. That is, there is a (implicit or explicit) subclass of Judges and a (implicit or explicit) subclasses of Kenyans, both of which are in turn subclasses of Person, and Kenyan Judges is a subclass of both. In fact, we immediately derive the principle that every different value in every different property or relationship implicitly generates a class, that turns into an explicit class only because of our whim or need. For instance, the class of all persons named “Joe” exists implicitly, identifies all persons whose first name is “Joe”, and, if so desired, can be made explicit through the definition of a subclass of Person.

While this is very useful for determining relationships between entities, it affects interestingly the mechanism to associate URIs to such entities. In particular, there being no single hierarchy of classes, it is not appropriate to propose a single path of specifications from the super class to the final class. As such, ideally /person/judge/ken/JoeSmith must point to the same individual as /person/ken/judge/JoeSmith.

In order to maintain meaningfulness, permanence and invariance (which are the main requirements for our naming convention, as specified in the introduction of this document) we need to find a reliable naming mechanism for clearly identifying entities that does not depend on the sub/superclass organization except when strictly necessary.

In particular, we define the concept of Top Level Classes (TLC) that are guaranteed to be a partition of the overall domain of the Akoma Ntoso standard. TLC include Work, Expression, Manifestation, Item, Person, Organization, Concept, Object, Event and Place. The list of TLC may include in future more classes (e.g., Process, Role, Term, and more yet to be determined), as long as they keep on generating a partition (i.e., that they are disjoint and cumulatively describe all possible instance of the Akoma Ntoso domain). Members of the TLC classes can be subclassed at will and with no theoretical constraints.

Given the high number of foreseeable subclasses of the TLC, and the pointlessness of determining a fixed hierarchy in such number, the naming of entities should not depend on the presence or absence of a given class except for TLC. This means that it is necessary that each instance of each TLC is provided with an ID string that is guaranteed to be unique within the TLC. The syntax of this ID is dependent of the TLC class, and the syntax for each of the existing TLC is provided  in the next section.

Therefore, the URI for non-document entities consists of the following pieces:

  * The base URL of a naming authority with URI-resolving capabilities
  * A detail fragment organizing in a hierarchical fashion the additional data:
    * The string “/ontology”
    * The official name of the appropriate TLC
    * Any number (including none) of slash-separated subclasses of the TLC, as long as they all refer to correct properties of the corresponding instance
    * The ID of the instance, guaranteed to be unique within the TLC.

All components are separated by forward slashes (“/”) so as to exploit relative URIs in references.

  * http://www.authority.org/ontology/person/kn.joe.smith.1964-12-22
> Joe Smith
  * http://www.authority.org/ontology/person/kn/kn.joe.smith.1964-12-22
> Joe Smith (implying that he is a Kenyan)
  * http://www.authority.org/ontology/person/kn/judge/kn.joe.smith.1964-12-22
> Joe Smith (implying that he is a Kenyan who is a judge)
  * http://www.authority.org/ontology/person/judge/kn/kn.joe.smith.1964-12-22
> Joe Smith (implying that he is a judge who is a Kenyan)
  * http://www.authority.org/ontology/person/kenyanjudge/kn.joe.smith.1964-12-22
> Joe Smith (implying that he is a Kenyan judge)

Please note that the classes Work, Expression, Manifestation and Item belong to the ontology as much as the other classes. As such, each Work, Expression and Manifestation can also be indicated with an ontology-based URI that refers to exactly the same entity.

Therefore, the following URIs are equivalent pair-wise, and refer to the same entities:

  * http://www.authority.org/sl/act/2004-02-13/2
> http://www.authority.org/ontology/work/sl.act.2004-02-13.2
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21
> http://www.authority.org/ontology/expression/sl.act.2004-02-13.2.eng@2004-07-21
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main/schedule1
> http://www.authority.org/ontology/expression.component/sl.act.2004-02-13.2.eng@2004-07-21.main.schedule1
  * http://www.authority.org/sl/act/2004-02-13/2/eng@2004-07-21/main.akn
> http://www.authority.org/ontology/manifestation/sl.act.2004-02-13.2.eng@2004-07-21.main.akn

## The IDs for Top Level Classes ##

As mentioned in the previous section, the hierarchy of path elements is of no use for identifying instances of each TLC, given the fact that there can be no unique hierarchy of subclasses in the Akoma Ntoso ontology.

Thus each instance of the ontology needs to be provided with an ID guaranteed to be unique within the TLC it belongs t The syntax of the ID depends on the actual TLC, and is briefly explained in the following schema.

### TLC Person ###

A dot-separated string composed of the country of citizenship, the first name, the family name, the birth date in yyyy-mm-dd format, and an optional arbitrary string if ambiguity exists (e.g., if two individuals with the same name and the same birth date exist in the same country).

  * kn.joe.smith.1964-12-22
> Mr. Joe Smith, the only Kenyan citizen with that name born on December 22nd, 1964

### TLC Organization ###

A dot-separated string composed of the country of registration (or the string “int” if international, or the string “unreg” if not registered anywhere), a recognizable form of the organization name and an optional arbitrary string if ambiguity exists (e.g., if two organizations with the same name exist in the same country).

  * kn.parliament
> the Kenyan Parliament

### TLC Concept ###

Concepts differ from terms as they are referring to a specific word or collection of words embodying some concept, rather than to the concept embodied by different words. Therefore, for instance, pope and pontiff are different terms for the same concept, while date is a single term referring to two different concepts (a calendar date as opposed to a type of fruit). Concepts must refer to an specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. No country specifications are necessary for concepts.

  * wikipedia.Presidential.election
> the concept of Presidential Election as defined in Wikipedia

### TLC Object ###

Objects must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. No country specifications are necessary for objects.

  * wikipedia.weapon
> a weapon (as a physical object) as defined in Wikipedia

### TLC Event ###

Events must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. No country specifications are necessary for events.

  * wikipedia.world.war.ii
> The second World War as defined in Wikipedia

### TLC Place ###

Places must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. No country specifications are necessary for places.

  * wikipedia.rome
> The city of Rome as defined in Wikipedia

### TLC Process ###

Processes must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. Country specifications are necessary for processes since processes with the same name may exist with different steps across different countries.

  * wikipedia.kn.promulgation
> The promulgation as defined in Wikipedia and as carried out in Kenya.

### TLC Role ###

Roles must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. Country specifications are necessary for roles since roles with the same name may exist with different characteristics across different countries.

  * wikipedia.kn.speaker
> The role of the speaker of the house as defined in Wikipedia and as conceived in Kenya.

### TLC Term ###

Terms differ from concepts as they are referring to a specific word or collection of words embodying some concept, rather than to the concept embodied by different words. Therefore, for instance, pope and pontiff are different terms for the same concept, while date is a single terms referring to two different concepts (a calendar date as opposed to a type of fruit). Terms must refer to a specific reference resource that can be used to disambiguate the object being referred t This must be either a thesaurus, an encyclopedia or a commonly available dictionary. A unique form of the terms specifying the concept joined with dots preceded by an unambiguous name for the resource being used. No country specifications are necessary for places but a language reference is necessary for the correct attribution.

  * wikipedia.eng.speaker
> The role of the speaker of the house as defined in Wikipedia and expressed in English.

### TLC Work ###

The domain-less URI of the Work as specified in this document, with all slash substituted by dots.

  * sl.act.2004-02-13.2
> Sierra Leone enacted Legislation. Act number 2 of 2004.

### TLC Expression ###

The domain-less URI of the Expression as specified in this document, with all slash substituted by dots.

  * sl.act.2004-02-13.2.eng@2004-07-21
> Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004

### TLC Expression Component ###

The domain-less URI of the Expression Component as specified in this document, with all slash substituted by dots.

  * sl.act.2004-02-13.2.eng@2004-07-21.schedule1
> Attachment “schedule01” of Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended on July 2004

### TLC Manifestation ###

The domain-less URI of the Manifestation as specified in this document, with all slash substituted by dots.

  * sl.act.2004-02-13.2.eng@2004-07-21.akn
> Package of all documents including XML versions of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended in July 2004

### TLC Manifestation Component ###

The domain-less URI of the Manifestation Component as specified in this document, with all slash substituted by dots.

  * sl.act.2004-02-13.2.eng@2004-07-21.main.xml
> The main document (in XML) of the Sierra Leone enacted Legislation. Act number 2 of 2004.  English version, as amended in July 2004

### TLC Item ###

The exact URL of the item as specified in the document, with all slashes substituted by dots.
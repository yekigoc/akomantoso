# Introduction #

We have some cases where questions are presented in a debate and they are presented in tranches as :
```
"Questions by Private Notice"
  Question 1 What .... ?
   ...
  Question 2 How .......?

"Oral Questions"
  Question 1 What .... ?
   ...
  Question 2 How .......?
```

# Usage in Akoma Ntoso #

The sections "Questions by Private Notice" and "Oral Questions" have a specific ontologically-relevant meaning (i.e. that the sections are not simply containers of questions, but that the sections themselves are relevant as concepts).

```
<meta>
....
<references source="#parliament-ke">
<TLCConcept id="questions-private-notice" href="/ontology/concept/akoma.questions.private.notice" showAs="Questions by private notice"/>
<TLCConcept id="questions-oral" href="/ontology/concept/akoma.oral.questions" showAs="Oral"/>
....
</references>
</meta>

<debate>
....
<questions id="ques-1" refersTo="#questions-private-notice">
  <heading>Questions by Private Notice</heading>
  ............
</questions>

<questions id="ques-2" refersTo="#questions-oral">
  <heading>Oral Questions </heading>
  ............
</questions>

...
</debate>

```

Another way to represent the same with less semantic undertones :

```

<debate>
....
<debateSection id="ques-1" name="questionsByPrivateNotice">
 <heading>Questions by Private Notice</heading>
 ............
</debateSection>

<debateSection id="ques-2" name="oralQuestions">
 <heading>Oral Questions </heading>
 ............
</debateSection>

...
</debate>
```
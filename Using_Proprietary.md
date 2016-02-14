# Introduction #

Akoma Ntoso allows using proprietary metadata namespaces.

# Usage #

Proprietary metadata is added using the `<proprietary>` element.

```
<references>
        <TLCconcept id="bungeni" href="http://proprietary.akomantoso.org/bungeni
" showAs="The Bungeni editor"/>
        ...
</references>
<proprietary source="#bungeni" xmlns:bg="http://proprietary.akomantoso.org/bungeni
">
   <bg:mymeta>
      <bg:meta name="..">....</bg:meta>
      <bg:meta name="..">....</bg:meta>
      <bg:meta name="..">....</bg:meta>
   </bg:mymeta>
</proprietary>
```


The `@source` attribute is a reference to an element in the TLC ontology -- it is a  human or a organization (a TLCPerson or TLCOrganization) that  provides, because of intelligent processes, the information needed to  populate the relevant metadata section.

This allows different  individuals with different opinions to fill the metadata section with  overlapping and incompatible information without problems.

Note -- it is incorrect to use a global URI in source, like the below :

```
<proprietary source="http://proprietary.akomantoso.org/bungeni" xmlns:bg="
http://proprietary.akomantoso.org/bungeni">
  <bg:mymeta>
     <bg:meta name="..">....</bg:meta>
     <bg:meta name="..">....</bg:meta>
     <bg:meta name="..">....</bg:meta>
  </bg:mymeta>
</proprietary> 
```

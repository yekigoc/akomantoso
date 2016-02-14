# Introduction #

A quorum usually appears in a debate record :

```
QUORUM

Mr. Miruka: On a point of order, Madam Temporary Deputy Speaker, is there a quorum in the House?

The Temporary Deputy Speaker (Mrs. Ndetei): No, we do not have a quorum. Ring the Division Bell.

(The Division Bell was rung)

The Temporary Deputy Speaker (Mrs. Ndetei): There is now a quorum. Continue, Mr. Muhoho.
```

A quorum is a semantic part of parliamentaru debate and it is an important information to markup in a proper way.

**A quorum is the minimum number of members of a deliberative assembly (a body that uses parliamentary procedure, such as a legislature) necessary to conduct the business of that group**.

The rules for calculating the quorum are complex and different from tradition, situation, type of voting, type of assembly, etc.


# Usage #

First option:

```
<speech>
	<from>The Temporary Deputy Speaker (Mrs. Ndetei):</from>
	<p>No, <quorum result="negative" refersTo="#majorityOfMemebers" value="129">
we do not have a quorum</quorum>. Ring the Division Bell.</p>
</speech>

<speech>
	<from>The Temporary Deputy Speaker (Mrs. Ndetei):</from>
	<p>There is now a <quorum result="positive" refersTo="#majorityOfAttendees" value="234">quorum</quorum>. Continue, Mr. Muhoho</p>
</speech>
```

Second option (preferable, because we have more flexibility, cleaness, and separation between content and semantic, without redundancy):

```
<analysis>
	<parliamentary>
		<quorum id="q1" refersTo="#majorityOfMemebers" result="negative" value="129"/>
		<quorum id="q2" refersTo="#majorityOfMemebers" result="positive" value="234"/>
		<quorum id="q3" refersTo="#majorityOfAttendees" result="negative" value="89"/>
	</parliamentary>
</analsysi>


<speech>
	<from>The Temporary Deputy Speaker (Mrs. Ndetei):</from>
	<p>No, we do not have a <quantity href="#q1">
quorum</quantity>. Ring the Division Bell.</p>
</speech>

<speech>
	<from>The Temporary Deputy Speaker (Mrs. Ndetei):</from>
	<p>There is now a <quantity href="#q2">quorum</quantity>. Continue, Mr. Muhoho</p>
</speech>
```
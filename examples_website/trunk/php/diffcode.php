<pre>
&lt;?php
/*
	Ross Scrivener http://scrivna.com
	PHP file diff implementation
	
	Much credit goes to...
	
	Paul's Simple Diff Algorithm v 0.1
	(C) Paul Butler 2007 &lt;http://www.paulbutler.org/&gt;
	May be used and distributed under the zlib/libpng license.
	
	... for the actual diff code, i changed a few things and implemented a pretty interface to it.
*/
class diff {

	var $changes = array();
	var $diff = array();
	var $linepadding = null;
	
	function doDiff($old, $new){
		if (!is_array($old)) $old = file($old);
		if (!is_array($new)) $new = file($new);
	
		foreach($old as $oindex =&gt; $ovalue){
			$nkeys = array_keys($new, $ovalue);
			foreach($nkeys as $nindex){
				$matrix[$oindex][$nindex] = isset($matrix[$oindex - 1][$nindex - 1]) ? $matrix[$oindex - 1][$nindex - 1] + 1 : 1;
				if($matrix[$oindex][$nindex] &gt; $maxlen){
					$maxlen = $matrix[$oindex][$nindex];
					$omax = $oindex + 1 - $maxlen;
					$nmax = $nindex + 1 - $maxlen;
				}
			}       
		}
		if($maxlen == 0) return array(array('d'=&gt;$old, 'i'=&gt;$new));
		
		return array_merge(
						$this-&gt;doDiff(array_slice($old, 0, $omax), array_slice($new, 0, $nmax)),
						array_slice($new, $nmax, $maxlen),
						$this-&gt;doDiff(array_slice($old, $omax + $maxlen), array_slice($new, $nmax + $maxlen)));
						
	}
	
	function diffWrap($old, $new){
		$this-&gt;diff = $this-&gt;doDiff($old, $new);
		$this-&gt;changes = array();
		$ndiff = array();
		foreach ($this-&gt;diff as $line =&gt; $k){
			if(is_array($k)){
				if (isset($k['d'][0]) || isset($k['i'][0])){
					$this-&gt;changes[] = $line;
					$ndiff[$line] = $k;
				}
			} else {
				$ndiff[$line] = $k;
			}
		}
		$this-&gt;diff = $ndiff;
		return $this-&gt;diff;
	}
	
	function formatcode($code){
		$code = htmlentities($code);
		$code = str_replace(&quot; &quot;,'&amp;nbsp;',$code);
		$code = str_replace(&quot;\t&quot;,'&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;',$code);
		return $code;
	}
	
	function showline($line){
		if ($this-&gt;linepadding === 0){
			if (in_array($line,$this-&gt;changes)) return true;
			return false;
		}
		if(is_null($this-&gt;linepadding)) return true;

		$start = (($line - $this-&gt;linepadding) &gt; 0) ? ($line - $this-&gt;linepadding) : 0;
		$end = ($line + $this-&gt;linepadding);
		//echo '&lt;br /&gt;'.$line.': '.$start.': '.$end;
		$search = range($start,$end);
		//pr($search);
		foreach($search as $k){
			if (in_array($k,$this-&gt;changes)) return true;
		}
		return false;

	}
	
	function inline($old, $new, $linepadding=null){
		$this-&gt;linepadding = $linepadding;
		
		$ret = '&lt;pre&gt;&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; class=&quot;code&quot;&gt;';
		$ret.= '&lt;tr&gt;&lt;td&gt;Old&lt;/td&gt;&lt;td&gt;New&lt;/td&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;';
		$count_old = 1;
		$count_new = 1;
		
		$insert = false;
		$delete = false;
		$truncate = false;
		
		$diff = $this-&gt;diffWrap($old, $new);

		foreach($diff as $line =&gt; $k){
			if ($this-&gt;showline($line)){
				$truncate = false;
				if(is_array($k)){
					foreach ($k['d'] as $val){
						$class = '';
						if (!$delete){
							$delete = true;
							$class = 'first';
							if ($insert) $class = '';
							$insert = false;
						}
						$ret.= '&lt;tr&gt;&lt;th&gt;'.$count_old.'&lt;/th&gt;';
						$ret.= '&lt;th&gt;&amp;nbsp;&lt;/th&gt;';
						$ret.= '&lt;td class=&quot;del '.$class.'&quot;&gt;'.$this-&gt;formatcode($val).'&lt;/td&gt;';
						$ret.= '&lt;/tr&gt;';
						$count_old++;
					}
					foreach ($k['i'] as $val){
						$class = '';
						if (!$insert){
							$insert = true;
							$class = 'first';
							if ($delete) $class = '';
							$delete = false;
						}
						$ret.= '&lt;tr&gt;&lt;th&gt;&amp;nbsp;&lt;/th&gt;';
						$ret.= '&lt;th&gt;'.$count_new.'&lt;/th&gt;';
						$ret.= '&lt;td class=&quot;ins '.$class.'&quot;&gt;'.$this-&gt;formatcode($val).'&lt;/td&gt;';
						$ret.= '&lt;/tr&gt;';
						$count_new++;
					}
				} else {
					$class = ($delete) ? 'del_end' : '';
					$class = ($insert) ? 'ins_end' : $class;
					$delete = false;
					$insert = false;
					$ret.= '&lt;tr&gt;&lt;th&gt;'.$count_old.'&lt;/th&gt;';
					$ret.= '&lt;th&gt;'.$count_new.'&lt;/th&gt;';
					$ret.= '&lt;td class=&quot;'.$class.'&quot;&gt;'.$this-&gt;formatcode($k).'&lt;/td&gt;';
					$ret.= '&lt;/tr&gt;';
					$count_old++;
					$count_new++;
				}
			} else {
				$class = ($delete) ? 'del_end' : '';
				$class = ($insert) ? 'ins_end' : $class;
				$delete = false;
				$insert = false;
				
				if (!$truncate){
					$truncate = true;
					$ret.= '&lt;tr&gt;&lt;th&gt;...&lt;/th&gt;';
					$ret.= '&lt;th&gt;...&lt;/th&gt;';
					$ret.= '&lt;td class=&quot;truncated '.$class.'&quot;&gt;&amp;nbsp;&lt;/td&gt;';
					$ret.= '&lt;/tr&gt;';
				}
				$count_old++;
				$count_new++;

			}
		}
		$ret.= '&lt;/table&gt;&lt;/pre&gt;';
		return $ret;
	}
}
?&gt;
&lt;style type=&quot;text/css&quot;&gt;

table.code {
	border: 1px solid #ddd;
	border-spacing: 0;
	border-top: 0;
	empty-cells: show;
	font-size: 12px;
	line-height: 110%;
	padding: 0;
	margin: 0;
	width: 100%;
}

table.code th {
	background: #eed;
	color: #886;
	font-weight: normal;
	padding: 0 .5em;
	text-align: right;
	border-right: 1px solid #d7d7d7;
	border-top: 1px solid #998;
	font-size: 11px;
	width: 35px;
}

table.code td {
	background: #fff;
	font: normal 11px monospace;
	overflow: auto;
	padding: 1px 2px;
}

table.code td.del {
	background-color: #FDD;
	border-left: 1px solid #C00;
	border-right: 1px solid #C00;
}
table.code td.del.first {
	border-top: 1px solid #C00;
}
table.code td.ins {
	background-color: #DFD;
	border-left: 1px solid #0A0;
	border-right: 1px solid #0A0;
}
table.code td.ins.first {
	border-top: 1px solid #0A0;
}
table.code td.del_end {
	border-top: 1px solid #C00;
}
table.code td.ins_end {
	border-top: 1px solid #0A0;
}
table.code td.truncated {
	background-color: #f7f7f7;
}
&lt;/style&gt;
&lt;?php
$diff = new diff;
$text = $diff-&gt;inline('users_controller.42.php','users_controller.45.php',2);
echo count($diff-&gt;changes).' changes';
echo $text;
?&gt;
</pre>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-2396995-2");
pageTracker._initData();
pageTracker._trackPageview();
</script>
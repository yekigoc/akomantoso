$(function(){
				$('#tabs').tabs();
}) ;
$(document).ready(function(){
	$("#filename")[0].fullname = "akn-complete"
	$("#filename")[0].baseValue = "akn-subschema"
	$("#filename")[0].internalValue = "1"
	$("#filename")[0].value = $("#filename")[0].baseValue + "-" + $("#filename")[0].internalValue

	var updateModuleList = function(e) {
		var hash = 0;
		var doCheckbox = true; 
		if (e=="radio") {
			var r =$("form input:radio:checked")
			if (r.length>0){
				if (r[0].value=="complete") {
					doCheckbox = false
					$("form input:checkbox").each(function(index) {this.checked=false});
					$("#filename")[0].value = $("#filename")[0].fullname ;
					$(".f").each(function(){this.innerHTML=$("#filename")[0].value}) ;
					$("#selectionShown")[0].innerHTML = r[0].value
				} else {
					$("form input:checkbox").each(function(index) {this.checked=false});
					var x = r.val().split(" ");
					for (i in x) {
						if ($("#check-"+x[i]).length >0) {
							$("#check-"+x[i])[0].checked=true
						}
					}
				}
			}
		} else {
		        //!+NOTE (ao, 25-May-2012) uncomment this to have all options deselected
				//$("form input:radio").each(function(index) {this.checked=false});
		}
		if (doCheckbox) {
			$("#selection")[0].value = ""
			$("form input:checkbox").each(function(index) {
				if (this.checked) {
					$("#selection")[0].value += this.value+" "
					$("."+this.value).each(function() {    // attribute dependsOn
						this.disabled=false
					}) ;
					if (!this.disabled) {
						hash += Math.pow(2,index)
					}
				} else {
					$("."+this.value).each(function() {   // attribute dependsOn
						this.checked=false;
						this.disabled=true
					}) ;
				}
			}) ;
			$("#selectionShown")[0].innerHTML = $("#selection")[0].value
			if (($("#filename")[0].value == "") || ($("#filename")[0].value == $("#filename")[0].fullname)) {	
				$("#filename")[0].value = $("#filename")[0].baseValue + "-" + hash
			}
			if ($("#filename")[0].value.search($("#filename")[0].internalValue)>-1) {
				$("#filename")[0].value = $("#filename")[0].value.replace($("#filename")[0].internalValue, hash)
			}
			$(".f").each(function(){this.innerHTML=$("#filename")[0].value}) ;
			$("#filename")[0].internalValue =  hash
		}
	};
	$("form input:text").change(function() { updateModuleList("text")})
	$("form input:checkbox").change(function() { updateModuleList("checkbox")})
	$("form input:radio").change(function() { updateModuleList("radio")})
	$("form input:reset").click( function() {setTimeout('updateModuleList("reset")',100)})
	updateModuleList("start");

	$(".description").hide();
	$(".item").append(' <a class="details" href="">More details</a>');
	$(".details").click(function(event){
		$(this).parent().siblings(".description").toggle();
		if (this.innerHTML=="More details") {
			this.innerHTML="Less details"
		} else {
			this.innerHTML="More details"
		}
		event.preventDefault();
	});

	$(".alldetails").click(function(event){
		if (this.innerHTML=="Show all details") {
			this.innerHTML="Hide all details"
			$(".description").show();
			$(".details").each(function(){
				this.innerHTML = "Less details"
			})
		} else {
			this.innerHTML="Show all details"
			$(".description").hide();
			$(".details").each(function(){
				this.innerHTML = "More details"
			})
		}
		event.preventDefault();
	});
});

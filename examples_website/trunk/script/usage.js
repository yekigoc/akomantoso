var isFullscreen = false;
function fullscreen() {
    var d = {};
    var speed = 900; 
    
    if(!isFullscreen) 
    { // MAXIMIZATION
        
        //originals
        header_height = $("#docu-header").height();
        orig_container = $("#documaincontainer").height();
        orig_lpane = $("#DocuLeftPane").height();
        orig_rpane = $("#DocuRightPane").height();
        orig_htmldoc = $(".doc-pane-area").height();
        orig_tecdoc = $(".toggle-content-b").height();
        orig_splitbar = $(".splitter-bar").height();
    
        /*comment to have smooth transition from centre but loose covering the header*/
        document.getElementById('scrn-toggle').style.float= "right";
        
        $("#docu-header").animate({
            opacity: 0.0,
            height: 0
        }, speed);
        $(".helpers-wrapper").hide();

        $("#documaincontainer").animate(d,speed);
        $("#toggling-scrn").removeClass('contained');
        $("#toggling-scrn").addClass('full');
        scrnh = $(window).height();
        cut_margin = scrnh-60;
        cut_border = cut_margin-40;
        
        $('#documaincontainer').height(cut_margin);
        $('#documaincontainer').width('99.4%');
        $("#DocuLeftPane").height(cut_margin);
        $("#DocuRightPane").height(cut_margin);
        $(".splitter-bar").height(cut_margin);
        $(".toggle-content-b").height(cut_border);
        $(".qtip-wrapper, .qtip-tip").hide();
        
        // hack for ie9 misbehaviours
        $(".related-sites").css('position' , 'relative');
        $("#wip-tip").css('position' , 'relative');        
        isFullscreen = true;
    }
    else
    { // MINIMIZATION
        d.height="284px";
        d.margin="0 auto";
        d.position="absolute";
        /* comment to have smooth minimze transition but not be placed below header */
        document.getElementById('scrn-toggle').style.position= "relative";
        
        $("#docu-header").animate({
            opacity: 1.0,
            height: header_height
            }, speed);
            
        $(".helpers-wrapper").show();
        $("#documaincontainer").animate(d,speed);
        $("#toggling-scrn").removeClass('full');
        $("#toggling-scrn").addClass('contained');    

        $("#documaincontainer").height(orig_container);
        $("#DocuLeftPane").height(orig_lpane);
        $("#DocuRightPane").height(orig_rpane);
        $(".splitter-bar").height(orig_splitbar);
        $(".toggle-content-b").height(orig_htmldoc-20);
        $(".qtip-wrapper, .qtip-tip").show();
        
        // hack for ie9 misbehaviours
        $(".related-sites").css('position' , 'absolute');
        $("#wip-tip").css('position' , 'absolute');           
        isFullscreen = false;
    }
} 
/**
 * Used to collapse or expand the XML fragment with the given id
 * @param anId the id that must be collapsed/expanded
 * @param aButton the button that dispatch the collapse/expand of the fragment
 * @return void
 */
function collapse(anId,aButton)
{
	//alert(aButton.parentNode.nextSibling.nodeName)
	//the current displaying mode of the fragment
	var elementToCollapse = aButton.parentNode.nextSibling;
	var currentDisplay = elementToCollapse.style.display;

	//if the fragment is expanded collapse it
	if (currentDisplay =='inline' || currentDisplay == '')
	{
		elementToCollapse.style.display = 'none';
		aButton.innerHTML = '[ + ] ';
	}
	//else expand the fragment
	else 
	{
		elementToCollapse.style.display = 'inline';
		aButton.innerHTML = '[ -&nbsp; ] ';
	}
}

/**
 * open all the elements
 */
function collapseAll()
{
	//get all the elements in the XML div
	var xmlElements = document.getElementById("alisting_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if (xmlElements[i].innerHTML == '[ - ] ')
			xmlElements[i].innerHTML = '[ + ] ';
		if (xmlElements[i].style.display == 'inline')
			xmlElements[i].style.display = 'none';
	}
}

/**
 * open all the elements
 */
function expandAll()
{
	//get all the elements in the XML div
	var xmlElements = document.getElementById("alisting_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if (xmlElements[i].innerHTML == '[ + ] ')
			xmlElements[i].innerHTML = '[ - ] ';
		if (xmlElements[i].style.display == 'none')
			xmlElements[i].style.display = 'inline';
	}
}

/**
 * Expands all the parents of a given element
 */
function expandParents(anElement)
{
	var xmlElements = document.getElementById("alisting_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i < xmlElements.length; i++) 
	{
		if(inArray(xmlElements[i].getElementsByTagName("span"),anElement))
		{
			xmlElements[i].style.display = 'inline';
			xmlElements[i].previousSibling.firstChild.innerHTML = '[ - ] '; 
		}
	}
}

function inArray(anArray,value)
{
	var i;
	for (i=0; i < anArray.length; i++) 
	{
		//use === to check for Matches. ie., identical (===),	
		if (anArray[i] == value) 
		{
			return true;
		}
	}
	return false;
};

/**
 * Used to collapse all the element that are not in the given outline level
 */
function outline(aLevel)
{
		
	//expand all the elements
	expandAll();
	//if the outline is all return
	if (aLevel == 'all') 
	{
		//switch off the loader
		document.getElementById("loader_div").style.display = 'none';
		document.getElementById("xml_doc").style.display = 'block';
		return;
	}
	//get all the elements in the XML div
	var xmlElements = document.getElementById("xml_doc").getElementsByTagName("span");
	
	//for each element if it has the properly outline level show it 
	for (var i = 0; i <xmlElements.length; i++)
	{
		if(xmlElements[i].getAttribute("id") == null)
			continue;
		if(xmlElements[i].getAttribute("id").split("@")[0].split("/").length - 2 < aLevel)
			/*if(xmlElements[i].style.display == 'none' && xmlElements[i].previousSibling != null)
				collapse(xmlElements[i].id, xmlElements[i].previousSibling);*/
				continue;
		else
			if (xmlElements[i].previousSibling != null)
				collapse(xmlElements[i].id, xmlElements[i].previousSibling);
	}
	
	//switch off the loader
	document.getElementById("loader_div").style.display = 'none';
	document.getElementById("xml_doc").style.display = 'block';
}

function switch_tabs(obj)
{
	$('.tab-content').hide();
	$('.tabs a').removeClass("selected");
	var id = obj.attr("rel");
 
	$('#'+id).show();
	obj.addClass("selected");
}

//http://craigsworks.com/projects/simpletip/#

$().ready(function() {

	$('#click-diff').click(function(){
        if($("#tab-diff > span:first-child").length > 0) {	
            $.get('php/get-diff.php', function(data) {
                $('#tab-diff').html(data);
                $("#tab-diff .headbg, #tab-diff meta, #tab-diff title").remove();
            });
        }
	});    
    
	$('.tabs a').click(function(){
		switch_tabs($(this));
	});
	switch_tabs($('.defaulttab'));
    
    
    $('#ajax_loader')
        .hide()  // hide it initially
        .ajaxStart(function() {
            $(this).show();
        })
        .ajaxStop(function() {
            $(this).hide();
        })
    ;
    
    /* The Examples tool-tips */
    $('#leftist').qtip(
    {
        content: {
        text: $('#intro_xml'),
         title: {
            text: 'left pane',
            button: true
         }
        },
        style: { 
            border: {
                 width: 2,
                 radius: 2
            },          
            name: 'cream',
            tip: 'topLeft',
        }     
    });
    $('#rightist').qtip(
    {
      content: {
         text: $('#intro_html'),
         title: {
            text: 'right pane',
            button: true
         }
      },
       position: {
          corner: {
             target: 'bottomLeft',
             tooltip: 'topRight'
          }
       },
        style: { 
            border: {
                 width: 2,
                 radius: 2
            },        
            name: 'cream',
            tip: 'topRight',
        }        
    });

    $.get('php/listings.php?tec_documentation=null&type=generic', function(data) {
        $('#alisting_doc').html(data);
        
        if(window.location.hash) {
            doc = window.location.hash.slice(1);

            get_docs_and_highlight(doc);     
            
            $('#alisting_doc').find('a[name="'+doc+'"]').closest('span').css('display', 'inline');
            if($(this).attr("href") !== "#") {
                    $('#alisting_doc').find('.expander').html('[ + ] ');
                    $('#alisting_doc').find('a[name="'+doc+'"]').closest('span').prev("pre").children(".expander").html('[ -&nbsp; ] ');
             }
            else { }    
            $("#alisting_doc").stop().scrollTo('a[name="'+doc+'"]', {speed:1000});
        }          
    });    
    
    var get_docs_and_highlight = function(doc) {
        $.get('php/search.php?el_documentation='+doc+'&type=technical', function(data) {
            $('#tec_doc').html(data);
            collapseAllinDiv('tec_doc');             
        });
        
        //highlight left pane with active tech_doc  
        $('#alisting_doc').find('a').css('color', '#008000');
        $('#alisting_doc').find('a[name="'+doc+'"]').css({color: '#b32b13',display: 'block'});            
    };  
        
    /**
     * open all the elements given id of div
     */
    var collapseAllinDiv = function(div_id) {
    	//get all the elements in the XML div
    	var $allSpanElements = $('span[class="expander"]');    	
    	$allSpanElements.html('[ + ] ');
    	$allSpanElements.parent().next().css('display', 'none');
    };    
    
   //JQUERY AJAX MUMBO-JUMBO    
   $("#alisting_doc a, #tec_doc area").live("click", function(){
        doc = $(this).attr('name');
        $("#current_el").html(doc);
        get_docs_and_highlight(doc);
        
        $('#alisting_doc').find('a[name="'+doc+'"]').closest('span').css('display', 'inline');
        if($(this).attr("href") !== "#") {
                $('#alisting_doc').find('.expander').html('[ + ] ');
                $('#alisting_doc').find('a[name="'+doc+'"]').closest('span').prev("pre").children(".expander").html('[ -&nbsp; ] ');
         }
        else { }
        //scroll to the section
        $("#alisting_doc").stop().scrollTo('a[name="'+doc+'"]', {speed:1000}); 
            
        return false;
    }); 

    $("#documaincontainer").splitter({
        type: "v",
        outline: true,
        minLeft: 100, 
        sizeLeft: 200, 
        minRight: 860,
        resizeToWidth: true,
        dock: "left",
        dockSpeed: 200,
        //cookie: "vsplitter",
        dockKey: 'Z',	// Alt-Shift-Z in FF/IE
        accessKey: 'I'	// Alt-Shift-I in FF/IE		
    });
    //$("#maincontainer").css("height", "100% !important").trigger("resize");  
    
    /* The Documentation tool-tips */ 
    $("#documaincontainer #leftist").css({marginLeft: '150px',display: 'block'})      
    $("#documaincontainer #rightist").css({marginRight: '250px',display: 'block'})     

    //borrowed from jQuery easing plugin
    //http://gsgd.co.uk/sandbox/jquery.easing.php
    $.easing.elasout = function(x, t, b, c, d) {
        var s=1.70158;var p=0;var a=c;
        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
        if (a < Math.abs(c)) { a=c; var s=p/4; }
        else var s = p/(2*Math.PI) * Math.asin (c/a);
        return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
    };
    
    $('button').click(function(){//this is not the cleanest way to do this, I'm just keeping it short.
        var index = $(this).prev('input').val() || "#doc-notes";
        var $c = $("body");
        $c.stop().scrollTo('#'+index+'', {speed:1000});
    });  
    
});
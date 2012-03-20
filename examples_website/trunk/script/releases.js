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
        orig_splitbar = $(".splitter-bar").height();
    
        /*comment to have smooth transition from centre but loose covering the header*/
        document.getElementById('scrn-toggle').style.float= "right";
        
        $("#docu-header").animate({
            opacity: 0.0,
            zIndex: "-1000",
            height: 0
        }, speed);
        $(".helpers-wrapper").hide();

        $("#documaincontainer").animate(d,speed);
        $("#toggling-scrn").removeClass('contained');
        $("#toggling-scrn").addClass('full');
        scrnh = $(window).height();
        cut_margin = scrnh-60;
        cut_border = cut_margin-70;
        
        $('#documaincontainer').height(cut_margin);
        $('#documaincontainer').width('99.4%');
        $("#DocuLeftPane").height(cut_margin);
        $("#DocuRightPane").height(cut_margin);
        $(".splitter-bar").height(cut_margin);
        $(".toggle-content-b").height(cut_border);
        $("#releases_doc").height(cut_border+20);
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
        d.position="relative";
        
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
        $(".toggle-content-b").height(orig_htmldoc-45);
        $(".qtip-wrapper, .qtip-tip").show();
        
        // hack for ie9 misbehaviours
        $(".related-sites").css('position' , 'absolute');
        $("#wip-tip").css('position' , 'absolute');           
        isFullscreen = false;
    }
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

	$('#click-notes').click(function() {
            $(".diff-legend").css('display','none');  
	}); 
	
	$('#click-source').click(function() {
        if($("#tab-source").length >= 0) {	
            if($("#active-source").html() != $('#active-release').html()) { 
                //return focus to diff if bizarrely has lost it
                doc = $('#active-release').html();
        	    //set this for comparison with aactive-release to knwo when to get the diffs
        	    $('#active-source').html(doc);
        	    switch_tabs($('.sourcetab'));
        	    $(".diff-legend").css('display','none');        	    
                
                /*
                    The Dojo within The JQuery
                    https://github.com/cemerick/jsdifflib
                */
                var $dj = dojo.byId;
                var url = window.location.toString().split("#")[0];       
                var act_rel = $('#active-release').html();
                
                $jq162.ajax({
                    url: 'releases/release-'+act_rel+'.xsd',
                    data: "ensemble",
                    success: function(result){
                        var base = difflib.stringAsLines(result);
                        var newtxt = difflib.stringAsLines(result);
                        var sm = new difflib.SequenceMatcher(base, newtxt);
                        var opcodes = sm.get_opcodes();
                        var diffoutputdiv = $dj("tab-source");
                        $jq162('#ajax_loader').show();                    
                        while (diffoutputdiv.firstChild) diffoutputdiv.removeChild(diffoutputdiv.firstChild);
                        diffoutputdiv.appendChild(
                            singleview.buildView(
                                {   baseTextLines:base,
                                    newTextLines:newtxt,
                                    opcodes:opcodes,
                                    baseTextName:"Release",
                                    newTextName:"This Release",
                                    contextSize:10000, //the allowed no. of lines
                                    viewType: 0 }
                            )
                        );
                        //window.location = url + "#diff";
                        $jq162('#ajax_loader').hide();
                    },
                  dataType: 'text'
                });              
            }
        }
	}); 

	$('#click-diff').click(function() {	
	   $(".diff-legend").css('display','inline');
        if($("#tab-diff").length >= 0) {	
            if($("#active-diff").html() != $('#active-release').html()) { 
                //return focus to diff if bizarrely has lost it
                doc = $('#active-release').html();
        	    //set this for comparison with active-release to knwow when to get the diffs
        	    $('#active-diff').html(doc);  
        	    switch_tabs($('.difftab'));
        	    
                /*
                    The Dojo within The JQuery
                    https://github.com/cemerick/jsdifflib
                */
                var $dj = dojo.byId;
                var url = window.location.toString().split("#")[0];       
                var act_rel = $('#active-release').html();
                                
                function showData(data1, data2) {
                    var base = difflib.stringAsLines(data1[0]);
                    var newtxt = difflib.stringAsLines(data2[0]);
                    var sm = new difflib.SequenceMatcher(base, newtxt);
                    var opcodes = sm.get_opcodes();
                    var diffoutputdiv = $dj("tab-diff");
                    $jq162('#ajax_loader').show();                    
                    while (diffoutputdiv.firstChild) diffoutputdiv.removeChild(diffoutputdiv.firstChild);
                    diffoutputdiv.appendChild(
                        diffview.buildView(
                            {   baseTextLines:base,
                                newTextLines:newtxt,
                                opcodes:opcodes,
                                baseTextName:"Previous Release",
                                newTextName:"This Release",
                                contextSize:10000, //the allowed no. of lines
                                viewType: 0 }
                        )
                    );
                    //window.location = url + "#diff";
                    $jq162('#ajax_loader').hide();
                }
                
                function method1() {
                    return $jq162.ajax("releases/release-"+(act_rel-1)+".xsd", {
                        //data: new Date().getTime(),
                        data: "prio-rel",
                        dataType: 'text'
                    });
                }
                
                function method2() {
                    return $jq162.ajax("releases/release-"+act_rel+".xsd", {
                        //data: new Date().getTime(),
                        data: "currrent",
                        dataType: 'text'
                    });
                }
                
                $jq162.when(method1(), method2()).then(showData);
            }
        }
	});    
    
	$('.tabs a').click(function() {
		switch_tabs($(this));
	});
	switch_tabs($('.defaulttab'));
    
    $jq162('#ajax_loader')
        .hide()  // hide it initially
        .ajaxStart(function() {
            $jq162(this).show();
        })
        .ajaxStop(function() {
            $jq162(this).hide();
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

    //Releases on load get list
    $.get('php/listings.php?type=releases', function(data) {
        $('#releases_doc').html(data);
        
        if(window.location.hash) {
            rel_no = window.location.hash.slice(1);
            
            get_notes_and_highlight(rel_no.slice(1));
            
            //highlight left pane with active release  
            $('#releases_doc').find('a[name="'+rel_no.slice(1)+'"]').css('color', '#b32c13');        
        }        
    });   
    
     var get_notes_and_highlight = function(rel_no) {
        $('#active-release').html(rel_no);
        $jq162.get('php/listings.php?no='+rel_no+'&type=releases', function(data) {
        	switch_tabs($('.defaulttab'));
            $('#tab-notes').html(data);
        });
        $('#releases_doc').find('a').css('color', '#000096');
     };    
    
   //JQUERY AJAX MUMBO-JUMBO    
   $("#releases_doc a").live("click", function(){
        rel_no = $(this).attr('name');
        $(".diff-legend").css('display','none');
        //store tmp vals        

        get_notes_and_highlight(rel_no);

        //highlight left pane with active release  
        $(this).css('color', '#b32c13');
  
        return false;
    }); 

    $("#documaincontainer").splitter({
        type: "v",
        outline: true,
        minLeft: 100, 
        maxLeft: 250,
        sizeLeft: 200, 
        minRight: 860,
        resizeToWidth: true,
        dock: "left",
        dockSpeed: 200,
        //cookie: "vsplitter",
        dockKey: 'Z',	// Alt-Shift-Z in FF/IE
        accessKey: 'I'	// Alt-Shift-I in FF/IE		
    });   

    /* The Documentation tool-tips */ 
    $("#documaincontainer #leftist").css({marginLeft: '150px',display: 'block'});      
    $("#documaincontainer #rightist").css({marginRight: '250px',display: 'block'}); 
});
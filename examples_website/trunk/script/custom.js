var isFullscreen = false;
function fullscreen() {
    var d = {};
    var speed = 900;               
    
    if(!isFullscreen) 
    { // MAXIMIZATION
        
        //originals
        header_height = $("#header").height();
        orig_container = $("#maincontainer").height();
        orig_lpane = $("#LeftPane").height();
        orig_rpane = $("#RightPane").height();
        orig_htmldoc = $("#html_doc").height();
        orig_tecdoc = $("#tec_doc").height();
        orig_xmldoc = $("#xml_doc").height(); 
        orig_splitbar = $(".splitter-bar").height();
    
        /*comment to have smooth transition from centre but loose covering the header*/
        document.getElementById('scrn-toggle').style.float= "right";
        
        $("#header").animate({
            opacity: 0.0,
            height: 0
        }, speed);
        $(".helpers-wrapper").hide();

        $("#maincontainer").animate(d,speed);
        $("#toggling-scrn").removeClass('contained');
        $("#toggling-scrn").addClass('full');
        scrnh = $(window).height();
        cut_margin = scrnh-60;
        cut_border = cut_margin-50;
        
        $('#maincontainer').height(cut_margin);
        $('#maincontainer').width('99.4%');
        $("#LeftPane").height(cut_margin);
        $("#RightPane").height(cut_margin);
        $(".splitter-bar").height(cut_margin);
        $("#html_doc").height(cut_border);
        $("#tec_doc").height(cut_border);
        $("#xml_doc").height(cut_border);
        $(".qtip-wrapper, .qtip-tip").hide();
        
        // hack for ie9 misbehaviours
        $(".related-sites").css('position' , 'relative');
        $("#wip-tip").css('position' , 'relative');           
        isFullscreen = true;
    }
    else
    { // MINIMIZATION
        //d.height="284px";
        d.margin="0 auto";
        d.position="relative";
        
        /* comment to have smooth minimze transition but not be placed below header */
        document.getElementById('scrn-toggle').style.position= "relative";
        
        $("#header").animate({
            opacity: 1.0,
            height: header_height
            }, speed);
            
        $(".helpers-wrapper").show();
        $("#maincontainer").animate(d,speed);
        $("#toggling-scrn").removeClass('full');
        $("#toggling-scrn").addClass('contained');    

        $("#maincontainer").height(orig_container);
        $("#LeftPane").height(orig_lpane);
        $("#RightPane").height(orig_rpane);
        $(".splitter-bar").height(orig_splitbar);
        $("#html_doc").height(orig_htmldoc);
        $("#tec_doc").height(orig_tecdoc);
        $("#xml_doc").height(orig_xmldoc);
        $(".qtip-wrapper, .qtip-tip").show();
        
        // hack for ie9 misbehaviours
        $(".related-sites").css('position' , 'absolute');
        $("#wip-tip").css('position' , 'absolute');           
        isFullscreen = false;
    }
} 
//http://craigsworks.com/projects/simpletip/#

$().ready(function() {

    //AJAX MUMBO-JUMBO
   $("#RightPane a,  #tec_doc area").live("click", function(){
        doc = $(this).attr('name');
        $.get('php/sidebyside.php?tec_documentation='+doc+'&type=technical', function(data) {
            $('#tec_doc').html(data);
        });
        return false;
    });   

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
   
    $("#maincontainer").splitter({
        type: "v",
        outline: true,
        minLeft: 100, 
        sizeLeft: 550, 
        minRight: 100,
        resizeToWidth: true,
        dock: "left",
        dockSpeed: 200,
        //cookie: "vsplitter",
        dockKey: 'Z',	// Alt-Shift-Z in FF/IE
        accessKey: 'I'	// Alt-Shift-I in FF/IE		
    });   
   
    //$("#maincontainer").css("height", "100% !important").trigger("resize");
    //$("#RightPane").css("height", "100% !important").trigger("resize");
    
    //borrowed from jQuery easing plugin
    //http://gsgd.co.uk/sandbox/jquery.easing.php
    $.easing.elasout = function(x, t, b, c, d) {
        var s=1.70158;var p=0;var a=c;
        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
        if (a < Math.abs(c)) { a=c; var s=p/4; }
        else var s = p/(2*Math.PI) * Math.asin (c/a);
        return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
    };
    
    /*$('button').click(function(){
        //this is not the cleanest way to do this, I'm just keeping it short.
        var index = $(this).prev('input').val() || "#doc-notes";
        var $c = $("body");
        $c.stop().scrollTo('#'+index+'', {speed:1000});
    });  
    
    $("button").live("click", function(){ 
        var index = $(this).prev('input').val() || "#doc-notes";
        var $c = $("body #xml_doc");
        $("#xml_doc").stop().scrollTo('span[name="FRBRauthor"]', {speed:1000});
    }); */
    
    $("#map_toggler").click(function() {
      //$("#map").toggleClass("fullscreen")
      scrnh = $(window).height();
      srcnw = $(window).width();
      alert(scrnh);
        $("#map").offset({ top: 0, left: 30 });
        $('#map').animate({
            opacity: 0.25,
            position: 'fixed',
            width: srcnw+'px',
            height: scrnh+'px'
          }, 1000, function() {
            // Animation complete.
          });
           
            
            $("#map").resize();
            //var offset = $(this).offset();
            //alert('top:'+offset.top+'left'+offset.left);
    });  
    
});
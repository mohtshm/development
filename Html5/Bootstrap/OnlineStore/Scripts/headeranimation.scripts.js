 
jQuery.noConflict();
jQuery(document).ready(function() {
 jQuery('header').affix({
      offset: {
        top: jQuery('header').height()
      }
 });	
   jQuery(window).scroll(function(){
     checkScroll();		
   });
   jQuery('header').click(function(){
   jQuery('aside').toggleClass('open');
   	setTimeout(function(){jQuery('aside').toggleClass('open');},300);	
   brandDiv.toggleClass('slideslowUp');					
                     	setTimeout(function(){ var brandDiv = jQuery('header.affix  #topbar');brandDiv.toggleClass('slideslowUp');},300);	
   });

   jQuery('aside').click(function(){
   
  jQuery('#topbar').toggleClass('slideslowUp');
 //  jQuery('article').toggleClass('slideslowUp');
 //                    	setTimeout(function(){  jQuery('article').toggleClass('slideslowUp');},3000);	
   });   

});
function checkScroll(){
var currentPosition = jQuery(window).scrollTop();		
		var topPosition = jQuery('header').height();
		if(arguments && arguments.length > 0 )
		{
		  if(arguments[0]==1 && currentPosition < topPosition)
		  return;
		  else if(arguments[0]==0 && currentPosition > topPosition)
		  return;
		}
		if(currentPosition === jQuery('header').height() || currentPosition < jQuery('header').height()){		
		 removeScrollingChanges();
		    return;
		}
		if(currentPosition > topPosition){		   
		     setScrollDown();	
		}
		else{		    
		    setScrollUp();
		}
		
}
function removeScrollingChanges(){
var navDiv =  jQuery('nav');
var brandDiv = jQuery('#topbar');
navDiv.removeClass('slideUp');	
brandDiv.removeClass('slideslowUp');
}
function setScrollDown(){
var navDiv = jQuery('header.affix  nav');
var brandDiv = jQuery('header.affix  #topbar');
if(!navDiv.hasClass('slideUp')){		
                     	if(brandDiv.hasClass('slideslowUp'))
                     	{ brandDiv.removeClass('slideslowUp');}                 	
                     	
                     	navDiv.addClass('slideUp');	
			 jQuery('#topbar').toggleClass('slideslowUp');			
                     	setTimeout(function(){jQuery('#topbar').toggleClass('slideslowUp');},300);	
                     }	

}
function setScrollUp(){
var navDiv =  jQuery('nav') || jQuery('header.affix  nav');
var brandDiv = jQuery('#topbar')||jQuery('header.affix  #topbar');
 if(navDiv.hasClass('slideUp'))
		     {		
			brandDiv.addClass('slideslowUp');			
			setTimeout(function(){var navDiv =  jQuery('nav') || jQuery('header.affix  nav');
var brandDiv = jQuery('#topbar')||jQuery('header.affix  #topbar');navDiv.removeClass('slideUp');	brandDiv.removeClass('slideslowUp');},400);			   
		     }
}
	
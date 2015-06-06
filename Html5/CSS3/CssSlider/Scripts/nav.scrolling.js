jQuery.noConflict();
jQuery(document).ready(function() {
   jQuery(window).scroll(function(){
     checkScroll();		
   });
   
   jQuery('.contentScroll').click(function(){
   jQuery('nav').toggleClass('slideUp');
   });

});
function checkScroll(){
var currentPosition = jQuery(window).scrollTop();		
		
		if(arguments && arguments.length > 0 )
		{
		  if(arguments[0]==1 && currentPosition < 150)
		  return;
		  else if(arguments[0]==0 && currentPosition > 150)
		  return;
		}
		if(currentPosition > 150){		   
		     setScrollDown();	
		}
		else{		    
		    setScrollUp();
		}
		
}
function setScrollDown(){
if(!jQuery('nav').hasClass('slideUp')){		
                     	if(jQuery('.brand').hasClass('slideslowUp'))
                     	{ jQuery('.brand').removeClass('slideslowUp');}                 	
                     	
                     	jQuery('nav').addClass('slideUp');	
			jQuery('.brand').addClass('slideslowUp');					
                     	setTimeout(function(){ jQuery('.brand').removeClass('slideslowUp');checkScroll(0);},300);	
                     }	

}
function setScrollUp(){
 if(jQuery('nav').hasClass('slideUp'))
		     {		
			jQuery('.brand').addClass('slideslowUp');			
			setTimeout(function(){ 	jQuery('nav').removeClass('slideUp');	jQuery('.brand').removeClass('slideslowUp');checkScroll(1);},400);			   
		     }
}
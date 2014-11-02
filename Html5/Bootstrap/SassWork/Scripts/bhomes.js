$(document).ready(function () {
    $('.navbar-collapse ul li a').hover(function () {
        if ($(this).attr('class').indexOf("headerTextHovering")>-1) {
        } else {         
          $(this).find(">:first-child").next().toggleClass('headerlinehovering');
        }
    });

    $('.navbar-collapse ul li a').click(function () {
       if ($(".headerTextHovering").length > 0) {          
           $('.navbar-collapse ul li a div').removeClass('headerlinehovering').addClass('header-line');
           $('.navbar-collapse ul li a').removeClass('headerTextHovering');
      }           
       $(this).find(">:first-child").next().removeClass('header-line').addClass('headerlinehovering');
       $(this).addClass('headerTextHovering');
    });
    //$('.nav-justified li').hover(function () {
    //    $(this).toggleClass('dvheaderbreadcrumb');

    //});
    //$("header button").click(function (event) {
    //    $(".site-nav-wrapper").toggleClass('hidden');
    //    event.preventDefault();
    //});
  
        //$('.dropdown-menu > li').click(function () {
        //    if ($(this).attr('class') != 'active') {
        //        $('.dropdown-menu li>ul').slideUp();
        //        $(this).next().slideToggle();
        //        $('.dropdown-menu li').removeClass('active');
        //        $(this).addClass('active');
        //    }
    //});
    //$(".navbar_ul_li_xs").on("click", function (e) {
    //    if (($(this).contains('.open'))) {
    //        alert('d');
    //        var current = $(this).find(">:first-child");
    //        alert(current.html());
    //        var grandparent = $(this).parent().parent();
    //        if ($(this).hasClass('left-caret') || $(this).hasClass('right-caret'))
    //            $(this).toggleClass('right-caret left-caret');
    //        grandparent.find('.left-caret').not(this).toggleClass('right-caret left-caret');
    //        grandparent.find(".sub-menu:visible").not(current).hide();
    //        current.toggle();
    //        e.stopPropagation();
    //    }
       
    //});
    //$(".navbar_ul_li_xs a:not(.trigger)").on("click", function () {
    //    alert('where');
    //    var root = $(this).closest('.dropdown');
    //    root.find('.left-caret').toggleClass('right-caret left-caret');
    //    root.find('.sub-menu:visible').hide();
    //});
   
});
$(document).ready(function () {
        $('.navbar-collapse ul .navbar_ul_li_lg a').hover(function () {
            if ($(this).find("headerTextHovering") > -1) {
            } else {
                $(this).find(">:first-child").next().toggleClass('headerlinehovering');
            }
            if ($(this).find(">:first-child").next().find("headerlinehovering") > -1) {
            } else {
                $(this).toggleClass('headerTextHovering');
            }
        });

        $('.navbar-collapse ul .navbar_ul_li_lg a').click(function () {
            if ($(".headerTextHovering").length > 0) {
                $('.navbar-collapse ul li a div').removeClass('headerlinehovering').addClass('header-lines');
                $('.navbar-collapse ul li a').removeClass('headerTextHovering');
            }
            $(this).find(">:first-child").next().removeClass('header-lines').addClass('headerlinehovering');
            $(this).addClass('headerTextHovering');
        });
  
        $('ul.dropdown-menu .dropdown a').on('click', function (event) {
            var hasToggle = typeof $(this).attr('data-toggle') !== "undefined";
            if (hasToggle) {
                event.preventDefault();
                event.stopPropagation();
            }
            $(this).parent().toggleClass('open');
            $(this).toggleClass('open');
        });
    
    
            $(window).scroll(function () {
                var scroll = $(window).scrollTop();
                if (scroll >= 100) {
                    if (!$('header').hasClass('show')) {


                        $('header').addClass('show');
                    }
                }

                else {
                    if ($('header').hasClass('show')) {
                        $('header').removeClass('show');
                    }

                }
            });      
});



 

    function change_icons_position() {
        $("div.countryReference").addClass('display_none');
        $("div.signInSignUp").addClass('display_none');
        $("div.menuMobileLine").addClass('display_none');
        $("button#btn").addClass('navbar_toggle_collaspe');
        $("span.collaspeMenu").addClass('icon_bar_collaspe');
        $("div#btns").addClass('width_lines');
        $("div.headerNavBar").addClass('margin_left');
    }

    function revert_icons_position() {
        $("div.signInSignUp").removeClass('display_none');
        $("div.countryReference").removeClass('display_none');
        $("div.menuMobileLine").removeClass('display_none');
        $("button#btn").removeClass('navbar_toggle_collaspe');
        $("span.collaspeMenu").removeClass('icon_bar_collaspe');
        $("div.headerNavBar").removeClass('margin_left');
        $("div#btns").removeClass('width_lines');
    }
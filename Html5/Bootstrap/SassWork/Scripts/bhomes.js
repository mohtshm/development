$(document).ready(function () {
   
    $('ul.dropdown-menu .dropdown a').on('click', function (event) {
        var hasToggle = typeof $(this).attr('data-toggle') !== "undefined";
        if (hasToggle) {
            event.preventDefault();
            event.stopPropagation();
        }        
        $(this).parent().toggleClass('open');
        $(this).toggleClass('open');
    });
});
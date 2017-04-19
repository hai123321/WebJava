/*Template Name: Opportunities A Mega Job Board TemplateAuthor: ScriptsBundleVersion: 2.0Designed and Development by: ScriptsBundle====================================[ CSS TABLE CONTENT ]------------------------------------    		1.0 - Pre Loader	2.0 - Counter Up	3.0 - OUR CLIENTS CAROUSEL	4.0 - TESTIMONIAL 1	5.0 - TESTIMONIAL 2	6.0 - ACCORDIAN	7.0 - FOOTER REVEAL	8.0 - SEACRH FIXED	9.0 - MENU	10.0 - SCROLL TO TOP	11.0 - FILE UPLOADER		-------------------------------------[ END CSS TABLE CONTENT ]=====================================*/(function($) {    "use strict";	    /*--- PRE LOADER JS ---*/    window.onload = function() {        document.getElementById('spinner').style.display = 'none';    };    /*--- Counter Up---*/    $('.counter').counterUp({        delay: 10,        time: 2000    });	/*--- OUR CLIENTS CAROUSEL---*/	    $(".clients-list").owlCarousel({        autoPlay: true,        slideSpeed: 2000,        pagination: false,        navigation: false,        loop: true,        items: 6,        itemsDesktop: [1199, 4],        itemsDesktopSmall: [980, 3],        itemsTablet: [768, 4],        itemsTabletSmall: false,        itemsMobile: [479, 2],    });	/*--- TESTIMONIAL 1---*/	    $("#owl-testimonial").owlCarousel({        navigation: false, // Show next and prev buttons        slideSpeed: 600,        paginationSpeed: 700,        autoPlay: 5000,        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],        pagination: false,        responsive: true,        loop: true,        // "singleItem:true" is a shortcut for:        items: 2    });/*--- TESTIMONIAL 2---*/    $(".owl-testimonial-2").owlCarousel({        autoPlay: true,        slideSpeed: 2000,        pagination: false,        navigation: false,        loop: true,        items: 3,        itemsDesktop: [1199, 3],        itemsDesktopSmall: [980, 2],        itemsTablet: [768, 2],        itemsTabletSmall: false,        itemsMobile: [479, 1]    });    /*--- ACCORDIAN---*/    $('.panel-heading').click(function(e) {        $('.panel-heading').removeClass('tab-collapsed');        var collapsCrnt = $(this).find('.collapse-controle').attr('aria-expanded');        if (collapsCrnt != 'true') {            $(this).addClass('tab-collapsed');        }    });    /*--- FOOTER REVEAL---*/	    $('.fixed-footer').footerReveal({        shadow: false,        zIndex: -101    });   /* --- SEACRH FIXED---*/	    $(window).scroll(function() {        var scrollTop = $(window).scrollTop();        if (scrollTop > 300) {            $(".search").addClass("navbar-fixed-top");        } else if (scrollTop < 300) {            $(".search").removeClass("navbar-fixed-top");        }    });    $(".questions-category").select2({        placeholder: "Select Post Category",        allowClear: true,        maximumSelectionLength: 3,    });    $(".select-category ").select2({        placeholder: "Select Job Category",        allowClear: true,        maximumSelectionLength: 3,    });    $(".select-location ").select2({        placeholder: "Select Job Location",        allowClear: true,        maximumSelectionLength: 3,    });    $(".select-resume").select2({        placeholder: "Select Job Resume",        allowClear: true,    });    /*--- MENU---*/		$('.mega-menu').megaMenu({                // DESKTOP MODE SETTINGS                logo_align          : 'left',    // align the logo left or right. options (left) or (right)                links_align         : 'left',    // align the links left or right. options (left) or (right)                socialBar_align     : 'left',    // align the socialBar left or right. options (left) or (right)                searchBar_align     : 'right',   // align the search bar left or right. options (left) or (right)                trigger             : 'hover',   // show drop down using click or hover. options (hover) or (click)                effect              : 'fade',    // drop down effects. options (fade), (scale), (expand-top), (expand-bottom), (expand-left), (expand-right)                effect_speed        : 400,       // drop down show speed in milliseconds                sibling             : true,      // hide the others showing drop downs if this option true. this option works on if the trigger option is "click". options (true) or (false)                outside_click_close : true,      // hide the showing drop downs when user click outside the menu. this option works if the trigger option is "click". options (true) or (false)                top_fixed           : false,     // fixed the menu top of the screen. options (true) or (false)                sticky_header       : true,     // menu fixed on top when scroll down down. options (true) or (false)                sticky_header_height: 200,       // sticky header height top of the screen. activate sticky header when meet the height. option change the height in px value.                menu_position       : 'horizontal',    // change the menu position. options (horizontal), (vertical-left) or (vertical-right)                full_width          : false,            // make menu full width. options (true) or (false)                // MOBILE MODE SETTINGS                mobile_settings     : {                    collapse            : true, // collapse the menu on click. options (true) or (false)                    sibling             : true,  // hide the others showing drop downs when click on current drop down. options (true) or (false)                    scrollBar           : true,  // enable the scroll bar. options (true) or (false)                    scrollBar_height    : 400,   // scroll bar height in px value. this option works if the scrollBar option true.                    top_fixed           : false, // fixed menu top of the screen. options (true) or (false)                    sticky_header       : false, // menu fixed on top when scroll down down. options (true) or (false)                    sticky_header_height: 200    // sticky header height top of the screen. activate sticky header when meet the height. option change the height in px value.                }            });    /*--- SCROLL TO TOP---*/	    $(document).ready(function() {        $(window).scroll(function() {            if ($(this).scrollTop() > 100) {                $('.scrollup').fadeIn();            } else {                $('.scrollup').fadeOut();            }        });        $('.scrollup').click(function() {            $("html, body").animate({                scrollTop: 0            }, 600);            return false;        });    });    /*--- FILE UPLOADER---*/	    $('.image-preview-clear').click(function() {        $('.image-preview-filename').val("");        $('.image-preview-clear').hide();        $('.image-preview-input input:file').val("");        $(".image-preview-input-title").text("Browse");    });    // Create the preview image    $(".image-preview-input input:file").change(function() {        var img = $('<img/>', {            id: 'dynamic',            width: 250,            height: 200        });        var file = this.files[0];        var reader = new FileReader();        // Set preview image into the popover data-content        reader.onload = function(e) {            $(".image-preview-input-title").text("Change");            $(".image-preview-clear").show();            $(".image-preview-filename").val(file.name);            img.attr('src', e.target.result);        }        reader.readAsDataURL(file);    });})(jQuery);
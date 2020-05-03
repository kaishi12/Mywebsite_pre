﻿/*-----------------------------------------------------------------------------------*/
/*	Go TO TOP
/*-----------------------------------------------------------------------------------*/
var offset = 300,
    //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
    offset_opacity = 1200,
    //duration of the top scrolling animation (in ms)
    scroll_top_duration = 700,
    //grab the "back to top" link
    $back_to_top = $('.cd-top');

//hide or show the "back to top" link
$(window).scroll(function () {
    ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
    if ($(this).scrollTop() > offset_opacity) {
        $back_to_top.addClass('cd-fade-out');
    }
});
//smooth scroll to top
$back_to_top.on('click', function (event) {
    event.preventDefault();
    $('body,html').animate({
        scrollTop: 0,
    }, scroll_top_duration
    );
});
/*-----------------------------------------------------------------------------------*/
/*	Tim kiem
/*-----------------------------------------------------------------------------------*/
var common = {
    init: function () {
        common.registerEvent();
    },
    registerEvent: function () {
        $("#txtKeyword").autocomplete({
            minLength: 1,
            source: function (request, response) {
                $.ajax({
                    url: "/Home/ListName",
                    dataType: "json",
                    data: {
                        term: request.term
                    },
                    success: function (res) {
                        response(res.data);
                    }
                });
            },
            focus: function (event, ui) {
                $("#txtKeyword").val(ui.item.label);
                return false;
            },
            select: function (event, ui) {
                $("#txtKeyword").val(ui.item.label);
                return false;
            }
        })
            .autocomplete("instance")._renderItem = function (ul, item) {
                return $("<li>")
                    .append('<a href="/manga/'+item.Alias+'-'+item.MangaId+'">' + item.FullName + "</a>")
                    .appendTo(ul);
            };
    }
}
common.init();
//.append('<a href="/manga/' + item.Alias + '-' + item.MangaId + '">' + '<img src="/Images/BookCover/' + item.CoverLink + '" onError="this.onerror=null; this.src=/Images/Error404/error-404.jpg" width="60"height="85">' +'<p>'+ item.FullName +'</p>'+"</a>")

/*-----------------------------------------------------------------------------------*/
/* Slide
/*-----------------------------------------------------------------------------------*/
$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 4,
    nav: true,
    autoplay: true,
    navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
    autoplayTimeout: 3000,
    responsive: {
        0: {
            items: 1
        },
        300: {
            items: 2
        },
        600: {
            items: 3
        },
        800: {
            items: 4
        },
        1000: {
            items: 6
        }
    }
})
/*-----------------------------------------------------------------------------------*/
/* Bookmark Toggle Show/Hide
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function () {
    jQuery('.toggle_hide').hide();

    jQuery(".bookmarkb").css('cursor', 'pointer').click(function () {
        var $this = $(this);
        $this.next("div").fadeToggle(200);
        $('.toggle_hide').not($this.next("div")).fadeOut(800);
    });
});
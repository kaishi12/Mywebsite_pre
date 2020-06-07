//import { log } from "util";

/*-----------------------------------------------------------------------------------*/
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
            minLength: 2,
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
                    .append('<a href="/manga/'+item.MangaAlias+'-'+item.MangaId+'/'+item.DefaultLang+'">' + item.FullName + "</a>")
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
/* Bookmark
/*-----------------------------------------------------------------------------------*/
$("#notlogin").click(function() {
    alert('Vui lòng đăng nhập');
    location.href = "/Home";
})

$("#addbookmarkb").click(function() {
    $.ajax({
        url: "/AddBookmark/",
        method: "POST",
        type:"json"
    }).success(function() {
        alert("Đã thêm bookmark");
        location.reload();
    }).error(function() {
        alert("Lỗi vui lòng liên hệ admin");
    });
})

$("[id=delbookmarkb]").click(function () {
    var idManga = $(this).data("manga-id");
    if (confirm('Bạn có chắc muốn xóa khỏi bookmark ?')) {
        $.ajax({
            url: "/DelBookmark/" + idManga,
            method: "POST",
            type:"json"
        }).success(function() {
            alert("Đã xóa khỏi bookmark");
            $("[id=trCheck-" + idManga + "]").css('display', 'none');
        }).error(function() {
            alert("Lỗi vui lòng liên hệ admin");
        });
    }
})

//$("#updatetolast").click(function() {
//    var idManga = $(this).data("manga-id");
//    $.ajax({
//        url: "/UpdateBookmarkToLast/ " + idManga,
//        method: "POST",
//        type: "json",
//    }).success(function() {
//        $("#trCheck").removeClass("table-info");
//    }).error(function() {
//        alert("Lỗi vui lòng liên hệ admin");
//    });
//})


$("[id=updatebookmarkb]").click(function() {
    var idManga = $(this).data("manga-id");
    var idChapter = $(this).data("chapter-id")
    if (idChapter === undefined) {
        var urllink = "/UpdateBookmark/" + idManga;
    } else {
        var urllink = "/UpdateBookmark/" + idManga + "/" + idChapter;
    }
    $.ajax({
        url: urllink,
        method: "POST",
        type: "json",
    }).success(function () {
        //$("[id=trCheck-" + idManga + "]", function () {
        //    var data = $(this).find("td div span .bookmarkb#updatebookmarkb");
        //    data.addClass('alreradyseen');
        //    data.html("<i class='fa fa-check'></i> Đã xem tới chap mới nhất");
        //    $(this).removeClass('table-info');
        //})
        $("[id=trCheck-" + idManga + "]").removeClass("table-info");
        $("[id=trCheck-" + idManga + "]").find("#updatebookmarkb").addClass('alreadyseen');
        $("[id=trCheck-" + idManga + "]").find("#updatebookmarkb").html('<i class="fa fa-check"></i> Đã xem tới chap mới nhất')
        //let data = $("[id=trCheck-" + idManga + "]").find("td div span ")
        //$(`#trCheck-${idManga}`).unbind("click").bind("click", function () {
        //    $(this).find("td div span #updatebookmarkb").addClass('alreadyseen');
        //    $(this).find("td div span #updatebookmarkb").text(' Đã xem tới chap mới nhất');
        //    $(this).removeClass('table-info');
        //})
        //$(`#trCheck-${idManga}`, function () {
        //    let data = $(this).find("td div span:first-child")
        //    data.addClass('alreadyseen');
        //    data.html('<i class="fa fa-check"></i> Đã xem tới chap mới nhất');
        //    $(this).attr('class','test');
        //}) 

    }).error(function() {
        alert("Lỗi vui lòng liên hệ admin");
    });
})




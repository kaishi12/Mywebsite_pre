$(".AllowButton").on("click", function () {
    const thisbutton = $(this);
    $.ajax({
        type: "POST",
        url: "/Translation/AllowChapter",
        data: {
            TranslationId: +$("#Translation").val(),
            ChapterId: +thisbutton.attr("data-chapterid"),
            Status: +thisbutton.attr("data-status") > 0
        },


        dataType: "json",
        success: function (result) {

            alert(Ok);

        }
    });
})
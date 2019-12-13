$(".AllowButton").on("click", function () {
    const thisbutton = $(this);
    $.ajax({
        type: "POST",
        url: "/Translation/AllowChapter",
        data: {
            TranslationId: $("#Translation").val(),
            ChapterId: thisbutton.attr("data-chapterid"),
            Status: thisbutton.attr("data-status")
        },


        dataType: "json",
        success: function (result) {

            alet(Ok);

        }
    });
})
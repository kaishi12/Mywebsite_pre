$(".UpdateChapterIcon").on("click", function () {
     $('#ChapterId').val($(this).attr("data-chapterid"));
    $('#OrderNumber').val($(this).attr("data-ordernumber"));
    $('#FullName').val($(this).attr("data-fullname"));
    $('#StatusId').val($(this).attr("data-status"));
}) 
   

$("#UpdateChapterbtn").on("click", function () {
    $.ajax({
        url: "/Chapter/UpdateInfoChapter",
        type: "post",
        dataType: "json",
        data: $("#UpdateChapterfrm").serialize(),
        success: function (result) {
            alert(result);
        }
    });
})

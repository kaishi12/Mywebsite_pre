var countPageAdd;
$("#addbtn").on("click", function () {

    $("#TotalNumber").val(parseInt($("#TotalNumber").val()) + 1);
    console.log(parseInt($("#TotalNumber").val()));
    let chapterName = $("#FullName").val();
    countPageAdd = parseInt($("#TotalNumber").val());

    let pageorder = "trang " + countPageAdd;
    let pagename = pageorder + " " + chapterName;
    let content = '<div class="Page col-xs-6 col-sm-4 col-md-3" style="padding-left:12px;padding-right:12px"><div class="box p-a-xs"><img id="img' + countPageAdd + '" style="max-height:500px" src="/RootPicture/tenor.gif" alt="" class="img-responsive"> <div class="p-a-sm"><div class="text-ellipsis"> <span>' + pagename + '</span><input id="Upload' + countPageAdd + '" hidden style="margin-left:10px" type="file" name="fileupload" onchange="Upload(this)" /></div><div style="padding-left:0px;padding-right:0px;padding-bottom:0px;" class="box-footer row"><button id="btnupload' + countPageAdd + '" type="button" class="UploadButton md-btn md-raised m-b-sm w-xs primary" style="display: block;margin-left: auto;margin-right: auto;">Tải lên</button></div> </div></div></div>';
    $("#UploadRaw").append(content);
    $(".SaveNewPage").prop('disabled', false);
})
$("#delbtn").on("click", function () {
    $("#TotalNumber").val(countPageAdd - 1);
    $("#UploadRaw").find(".Page:last-child").remove();
    if ($("#UploadRaw").find(".Page:last-child").length == 0) {
        $(".SaveNewPage").prop('disabled', true);
    }
    console.log(countPageAdd - 1);
})
function Upload(input) {
    let value = "#img" + input.id.replace("Upload", "");
    let valuebuttonSave = "#Save" + input.id.replace("file", "");
    console.log(valuebuttonSave);
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $(value).prop("src", reader.result);
        };

        reader.readAsDataURL(input.files[0]);
        $(valuebuttonSave).prop("disabled", false);
    }

}
$(document).on("click", ".UploadButton", function () {

    let str = "#Upload" + this.id.replace("btnupload", "");
    $(str).click();
})
function SavePage(input) {

    let PageId = input.id.replace("Save", "");
    let value = "#UpdatePage" + PageId;
    let formdata = new FormData($(value).get(0));
    console.log(value);
    alert(formdata);
    $.ajax({
        url: "/Chapter/UpdateLinkPage",
        type: "post",

        data: formdata,
        cache: false,
        processData: false,
        contentType: false,
        success: function (result) {
            if (result == "Success") {
                alert("Lưu thành công");
            }
        }
    });
}
function ChangeStatusPage(input, status) {
    let PageId = input.id.replace("Save", "");
    let div;
    if (status == 0) {

        div = "#Restore" + PageId;
    }
    else {
        div = "#Remove" + PageId;
    }
    let value = "#UpdatePage" + PageId;

    $.ajax({
        url: "/Chapter/UpdateStatusPage",
        type: "post",

        data: {
            PageId: +PageId,
            StatusActive: status
        },
        success: function (result) {
            if (result == "Success") {
                if (status == 0) {
                    alert("Khôi phục thành công");
                    $(div).fadeOut();
                    div = "#Remove" + PageId;
                    $(div).show();
                }
                else {
                    alert("Xóa thành công");
                    $(div).fadeOut();
                    div = "#Restore" + PageId;
                    $(div).show();
                }



            }
        }
    });
}

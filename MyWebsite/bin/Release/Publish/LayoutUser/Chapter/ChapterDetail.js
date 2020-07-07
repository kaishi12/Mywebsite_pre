
var countPageAddtmp = +$("#TotalNumber").val();
var countPageAdd;
$("#addbtn").on("click", function () {

    $("#TotalNumber").val(+$("#TotalNumber").val() + 1);
    
    let chapterName = $("#FullName").val();
    countPageAdd = parseInt($("#TotalNumber").val());

    let pageorder = "trang " + countPageAdd;
    let pagename = pageorder + " " + chapterName;
    let content = '<div class="Page col-xs-6 col-sm-4 col-md-3" style="padding-left:12px;padding-right:12px"><div class="box p-a-xs"><img id="imgcur' + countPageAdd + '" style="max-height:500px" src="/RootPicture/tenor.gif" alt="" class="img-responsive"> <div class="p-a-sm"><div class="text-ellipsis"> <span>' + pagename + '</span><input id="AnhTrang" data-count="' + countPageAdd + '" hidden style="margin-left:10px" type="file" name="AnhTrang" onchange="UploadCur(this)" /></div><div style="padding-left:0px;padding-right:0px;padding-bottom:0px;" class="box-footer row"><button id="' + countPageAdd + '" type="button" class="UploadButtonCur md-btn md-raised m-b-sm w-xs primary" style="display: block;margin-left: auto;margin-right: auto;">Tải lên</button></div> </div></div></div>';
    $("#UploadRaw").append(content);
    $(".SaveNewPage").prop('disabled', false);
})
$("#delbtn").on("click", function () {
    console.log(countPageAddtmp);
    if (countPageAddtmp < +$("#TotalNumber").val()) {
      
        $("#TotalNumber").val(+$("#TotalNumber").val() - 1);
    }
   
    $("#UploadRaw").find(".Page:last-child").remove();
    if ($("#UploadRaw").find(".Page:last-child").length == 0) {
        $(".SaveNewPage").prop('disabled', true);
    }
    
})
function Upload(input) {
    let value = "#img" + input.id.replace("file", "");
    let valuebuttonSave = "#Save" + input.id.replace("file", "");
   
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $(value).prop("src", reader.result);
        };

        reader.readAsDataURL(input.files[0]);
        $(valuebuttonSave).prop("disabled", false);
    }

}
function UploadCur(input) {
    let value = "#imgcur" + $(input).data("count");
    //let valuebuttonSave = "#Save" + input.id.replace("file", "");

    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $(value).prop("src", reader.result);
        };

        reader.readAsDataURL(input.files[0]);
        //$(valuebuttonSave).prop("disabled", false);
    }

}
$(document).on("click", ".UploadButtonCur", function () {

    let str = "#AnhTrang" + this.id;
    $(this).parent().parent().find('#AnhTrang').click();
   
})
$(document).on("click", ".UploadButton", function () {

    let str = "#AnhTrang" + this.id;
    $(this).parent().parent().find('#file' + this.id).click();
})
function SavePage(input) {

    let PageId = input.id.replace("Save", "");
    let value = "#UpdatePage" + PageId;
    let formdata = new FormData($(value).get(0));
    
   
    $.ajax({
        url: "/Chapter/UpdateLinkPage",
        type: "post",

        data: formdata,
        cache: false,
        processData: false,
        contentType: false,
        success: function (result) {
            if (result) {
                alert("Lưu thành công");
            }
            else {
                alert("Lỗi server, vui lòng thử lại sau hoặc liên hệ với admin");
            }
        }
    });
}
function ChangeStatusPage(input, status) {
    let PageId = input.id.replace("Save", "");
    let div, div1;
    let active = true;
    console.log(PageId);
    if (status == 1) {
       
        div = "#Restore" + PageId;
    }
    else {
        active = false;
        div = "#Remove" + PageId;
    }
    let value = "#UpdatePage" + PageId;

    $.ajax({
        url: "/Chapter/UpdateStatusPage",
        type: "post",

        data: {
            PageId: +PageId,
            StatusActive: active
        },
        success: function (result) {
            if (result == "Success") {
                if (status == 1) {
                    alert("Khôi phục thành công");
                    $(div).fadeOut();
                    div = "#Remove" + PageId;
                    $(div).show();
                    div1 = "CurPage" + PageId;
                    $(div1).show();
                    $("#TotalNumber").val(+$("#TotalNumber").val() + 1);
                }
                else {
                    alert("Xóa thành công");
                    $(div).fadeOut();
                    div1 = "CurPage" + PageId;
                    $(div1).fadeOut();
                    div = "#Restore" + PageId;
                    $(div).show();
                    $("#TotalNumber").val(+$("#TotalNumber").val() - 1);
                }



            }
        }
    });
}

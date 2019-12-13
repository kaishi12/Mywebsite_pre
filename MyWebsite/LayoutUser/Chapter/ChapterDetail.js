
function Upload(input) {

    let value = "img" + "#" + input.id.replace("file", "");
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
$(".UploadButton").click(function () {

    let str = "#file" + this.id;
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


$(".UploadButton").click(function () {

    let str = "#file" + this.id;
    $(str).click();
})
function Upload(input) {

    let value = "img" + "#" + input.id.replace("file", "");
    let valuebuttonSave = "#Save" + input.id.replace("file", "");
    console.log(input.id.replace("file", ""));
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $(value).prop("src", reader.result);
        };

        reader.readAsDataURL(input.files[0]);
        $(valuebuttonSave).prop("disabled", false);
    }

}
function SavePage(input) {
    let PageId = input.id.replace("Save", "");
    let value = "#AddNewPage" + PageId;
    let formdata = new FormData($(value).get(0));

    $.ajax({
        url: "/Chapter/AddNewCleartextPage",
        type: "post",
        data: formdata,
        cache: false,
        processData: false,
        contentType: false,
        success: function (result) {
            if (result != 0) {
                alert("Lưu thành công");
            }
        }
    });
}
function UpdatePage(input) {
    alert(1);
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
            if (result == true) {
                alert("Lưu thành công");
            }
        }
    });
}
$("#CategoryId").on("change", function () {

    window.location.href = "/Editor/" + $("#ChapterList").val() + "/" + $(this).val();

})
$("#ChapterList").on("change", function () {

    window.location.href = "/Editor/" + $(this).val();

})

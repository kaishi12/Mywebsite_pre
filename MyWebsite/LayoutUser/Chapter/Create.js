$("#addbtn").on("click", function () {
    let numberpage = parseInt($("#Totalpage").val());
    let chapterName = $("#FullName").val();
    let count = 1;
    for (count; count <= numberpage; count++) {
        let pageorder = "trang " + count;
        let pagename = pageorder + " " + chapterName;
        let content = '<div class="col-xs-6 col-sm-4 col-md-3" style="padding-left:12px;padding-right:12px"><div class="box p-a-xs"><img id="img' + count + '" style="max-height:500px" src="/RootPicture/tenor.gif" alt="" class="img-responsive"> <div class="p-a-sm"><div class="text-ellipsis"> <span>' + pagename + '</span><input id="Upload' + count + '" hidden style="margin-left:10px" type="file" name="fileupload" onchange="Upload(this)" /></div><div style="padding-left:0px;padding-right:0px;padding-bottom:0px;" class="box-footer row"><button id="btnupload' + count + '" type="button" class="UploadButton md-btn md-raised m-b-sm w-xs primary" style="display: block;margin-left: auto;margin-right: auto;">Tải lên</button></div> </div></div></div>';
        $("#UploadRaw").append(content);
        
    }
   
})
function Upload(input) {
    let value = "#img"+ input.id.replace("Upload", "");
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

    let str = "#Upload" + this.id.replace("btnupload","");
    $(str).click();
})
               
 function readURL(input) {
                if (input.files && input.files[0]) {

                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $("#Imganhbia").prop("src", reader.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            };
            $("#uploadbutton").click(function () {
                $("#AnhBia").click();
            });
$("#SaveManga").click(function () {
    
    if ($('#AnhBia').val() == "") {
        alert("Vui lòng thêm ảnh bìa");
        return;
    }
    if ($('#FullName').val() == "") {
        alert("Vui lòng nhập tên truyện");
        return;
    }
    if ($('#Alias').val() == "") {
        alert("Vui lòng nhập alias");
        return;
    }
    if ($('#Description').val() == "") {
        alert("Vui lòng nhập mô tả truyện");
        return;
    }
    if ($('#ListGenre').val() == null) {
        alert("Vui lòng chọn thể loại truyện");
      
        return;
    }
    
    $("#form1").submit();
})
$("#CheckNameManga").click(function () {
    let FullName = $("#FullName").val();
    if (FullName == "") {
        alert("Vui lòng nhập tên truyện");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/Manga/CheckNameManga",
        data: JSON.stringify(FullName),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result == true) {
                alert("Cho phép tạo truyện");
                $("#SaveManga").prop("disabled", false);
            }
            else {
                alert("Đã có truyện này");
            }
        }
    });
})
$(document).ready(function () {

    $("#GenreList").change(function (event) {
        alert("You have Selected  :: " + $(this).val());
    });
});
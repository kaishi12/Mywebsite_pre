
$(".ChangeStatus").on("click", function () {
    const btn = $(this);
    console.log($(this).val());
    const str = $(this).val().split(";");
    $.ajax({
        url: "/Account/ChangeStatusMangaDetail",
        type: "post",
        dataType: "json",
        data: {

            UserName: str[0],
            MangaId: +str[1],
            RoleId: +str[2],
            Status: +str[3],
            Language: str[4]
        },
        success: function (result) {
            if (result == 1) {
                alert("Lưu thành công");
                if (str[3] == 1) {

                    btn.removeClass("btn-info");
                    btn.addClass("btn-danger");
                    btn.val(str[0] + ";" + str[1] + ";" + str[2] + ";0;" + str[4]);
                    btn.text("Chưa duyệt");
                }
                else {

                    btn.removeClass("btn-danger");
                    btn.addClass("btn-info");
                    btn.val(str[0] + ";" + str[1] + ";" + str[2] + ";1;" + str[4]);
                    btn.text("Đã duyệt");


                }

            }
            else if (result == 0) {
                alert("Lỗi tại tui");
            }
            else {
                alert("Bản dịch ngôn ngữ này đã có người quản lí, Vui lòng hủy trước khi chọn người quản mới");
            }
        }
    });


})
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

var file;
function readURL(input) {
    console.log(input.files[0]);
    if (input.files && input.files[0]) {

        var reader = new FileReader();
        file = input.files[0];
        reader.onload = function (e) {
            $("#Imganhbia").prop("src", reader.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
};
$("#uploadbutton").click(function () {
    $("#AnhBia").click();
});


$("#UploadImageButton").on("click", function () {
    var formData = new FormData();
    formData.append('file', file);
    formData.append('AccountId', $("#AccountId").val());
    console.log(file);
    $.ajax({
        type: 'post',
        url: '/Account/UpdateAva',
        data: formData,
        success: function (status) {
            if (!status) {
                alert("Vui lòng thử lại sau");
            }
            else {
                location.reload();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });
})
$('#UpdatePassword').on("click", function () {
    $.ajax({
        url: '/Account/UpdatePassWord',
        type: "POST",
        data: {
            AccountId: $("#AccountId").val(),
            OldPassWord: $("#OldPassWord").val(),
            PassWord: $("#PassWord").val()
        },
        success: function (result) {
            if (result == 1) {
                alert("Cập nhật thành công");
            }
            else
                alert("Cập nhật thất bại, vui lòng thử lại sau");
        },

        error: function (result) {
            alert("Cập nhật thất bại, vui lòng thử lại sau");
        }

    });
    return false;
});
$("#formUpdateInfo").submit(function (e) {
    console.log($("#formUpdateInfo").serialize());
    e.preventDefault();
    $.ajax({
        url: "/Account/UpdateInfo",
        type: 'post',
        dataType: 'application/json',
        data: $("#formUpdateInfo").serialize(),
        success: function (result) {
            if (result == 1) {
                alert("Cập nhật thành công!");

            }
            else
                alert("Cập nhật thất bại, vui lòng thử lại sau!");
        },
        error: function () {
            alert("Whoops something went wrong!");
        }
    });
})
$(".ChangeStatus").on("click", function () {

    $(this).hide();
    $(this).parent().find(".Status").fadeIn();
})
$(".Status").on("click", function (e) {
    let thisbutton = $(this);
    e.preventDefault();
    $.ajax({
        url: "/Account/ChangeStatusMangaDetail",
        type: 'post',
        dataType: 'application/json',
        data: {
            UserName: thisbutton.data("username")
            , MangaId: thisbutton.data("mangaid")
            , RoleId: thisbutton.data("roleid")
            , Status: thisbutton.data("status")
            , language: thisbutton.data("language")
        },
        success: function (result) {
            if (result == 1) {
                alert("Cập nhật thành công!");

            }
            else
                alert("Cập nhật thất bại, vui lòng thử lại sau!");
        },
    });
    if (+$(this).data("status") == 1) {
         $(this).parent().find(".Status.Deny").fadeOut();
    }
    else {
        $(this).parent().find(".Status.Accept").fadeOut();
    }
    $(this).parent().find(".ChangeStatus").fadeIn();
})
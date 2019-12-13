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
    if ($('#AnhBia').val()) {
        $("#form1").submit();
    }
    else {
        alert("xyz");
    }         
})
$("#CheckNameManga").click(function () {
    
    if (confirm("abc?")) {
        $("#SaveManga").prop("disabled", false);
    }
    else {
        alert("fine");
    }
})
$(document).ready(function () {

    $("#GenreList").change(function (event) {
        alert("You have Selected  :: " + $(this).val());
    });
});
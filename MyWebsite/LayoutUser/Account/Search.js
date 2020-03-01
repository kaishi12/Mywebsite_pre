$(document).ready(function () {
    $(".TypeSelection").on("click", function () {
        $("#Type").attr("value", this.textContent);
        $("#Type").html(this.textContent);
    })
})
$("#SearchButton").click(function () {
    alert(1);
        let content = "";
        let result1 = "";
        if ($("#Type").val() == "Người dùng") {
            $.ajax({
                url: "/Account/Search",
                type: "post",
                dataType: "json",
                data: {

                    UserName: $("#SearchInput").val()
                },
                success: function (data) {
                    $("#class1").empty();
                    $(".result").empty();
                    result1 += '<p class="m-b-md"><strong>' + data.length + '</strong> Kết quả cho: <strong>' + $("#SearchInput").val() + '</strong></p>';

                    $(".result").append(result1);
                    if (data.length > 0) {

                        $("#class1").css("text-align", "left");
                        for (let i = 0; i < data.length; i++) {
                            content += '<li class="list-item" style="border-bottom:1px solid black">';
                            content += ' <div class="row">';
                            content += '<div class="box col-sm-2"><div class="box-body ">';
                            content += '  <div class="img-responsive">';
                            content += '  <img src="/Avatar/' + data[i].AvatarLink + '" style="max-height:200px" />';
                            content += ' </div></div></div>';
                            content += ' <div class="box col-sm-10">';

                            content += '   <div class="box-header row" style="padding-left:0px"> ';
                            content += ' <h2 class="col-sm-10"><strong>' + data[i].UserName + '</strong></h2> ';
                            content += ' <div class="col-sm-2"><button id="MoiGiaNhap" name="' + data[i].AccountId + ";" + data[i].UserName + '" class="btn btn-info" data-toggle="modal" data-target="#m-a-f-M">Mời gia nhập</button> </div> </div> ';
                            content += '<div class="box-body" style="padding:0px">';
                            content += '<ul class="list">';
                            content += '<li class="list-item" style="padding:0px"><span>Tác giả:</span><span class="text-muted"> ' + data[i].Author + '</span></li>';
                            content += '<li class="list-item" style="padding:0px"><span>Cập nhật:</span><span class="text-muted"> ' + data[i].CreateAt + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Lượt xem:</span><span class="text-muted"> ' + data[i].View + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Thể loại:</span><span class="text-muted"> ' + data[i].Genre + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Mô tả:</span><span class="text-muted"> ' + data[i].Description + '</span></li> ';
                            content += '  </ul> </div></div></div></li>';
                        }
                        $("#class1").append(content);

                    }
                    else {
                        $("#class1").css("text-align", "center");
                        content += '<h3> Nothing to show </h3>';
                        $("#class1").append(content);
                    }

                }
            });
        }
        else {
            alert(1);
            $.ajax({
                url: "/Manga/Search",
                type: "post",
                dataType: "json",
                data: {

                    Name: $("#SearchInput").val()
                },
                success: function (data) {
                   
                    $("#class1").empty();
                    $(".result").empty();
                    result1 += '<p class="m-b-md"><strong>' + data.length + '</strong> Kết quả cho: <strong>' + $("#SearchInput").val() + '</strong></p>';

                    $(".result").append(result1);
                    if (data.length > 0) {
                      
                        $("#class1").css("text-align", "left");
                        for (let i = 0; i < data.length; i++) {

                            content += '<li class="list-item" style="border-bottom:1px solid black">';
                            content += ' <div class="row">';
                            content += '<div class="box col-sm-2"><div class="box-body ">';
                            content += '  <div class="img-responsive">';
                            content += '  <img src="/Cover/' + data[i].CoverLink + '" style="max-height:200px" />';
                            content += ' </div></div></div>';
                            content += ' <div class="box col-sm-10">';

                            content += '   <div class="box-header row" style="padding-left:0px"> ';
                            content += ' <h2 class="col-sm-10"><strong>' + data[i].FullName + '</strong></h2> ';
                            content += ' <div class="col-sm-2"><button id="XinGiaNhap" name="' + data[i].MangaId + "; " + data[i].FullName + '" class="btn btn-info" data-toggle="modal" data-target="#m-a-f-X">Xin gia nhập</button> </div> </div> ';
                            content += '<div class="box-body" style="padding:0px">';
                            content += '<ul class="list">';
                            content += '<li class="list-item" style="padding:0px"><span>Tác giả:</span><span class="text-muted"> ' + data[i].Author + '</span></li>';
                            content += '<li class="list-item" style="padding:0px"><span>Cập nhật:</span><span class="text-muted"> ' + data[i].CreateAt + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Lượt xem:</span><span class="text-muted"> ' + data[i].View + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Thể loại:</span><span class="text-muted"> ' + data[i].Genre + '</span></li> ';
                            content += '<li class="list-item" style="padding:0px"><span>Mô tả:</span><span class="text-muted"> ' + data[i].Description + '</span></li> ';
                            content += '  </ul> </div></div></div></li > ';
                        }
                        $("#class1").append(content);

                    }
                    else {
                        $("#class1").css("text-align", "center");
                        content += '<h3> Nothing to show </h3>';
                        $("#class1").append(content);
                    }
                }
            });
        }
    })
    $(document).on("click", "#XinGiaNhap", function () {
        let str = $(this).attr("name");
        let res = str.split(";");
        $("#MangaId").val(res[0]);
        $("#FullName").val(res[1]);
    })
    $(document).on("click", "#MoiGiaNhap", function () {
        let str = $(this).attr("name");
        
        let res = str.split(";");
        $("#AccountId").val(res[0]);
        $("#UserName").val(res[1]);
    })
    $("#SelectRole").on("change", function () {
        if ($(this).val().trim() == "TM"  )
            $("#SelectLanguage").show("slow");
        else
            $("#SelectLanguage").fadeOut();

    })
    $("#SelectRoleM").on("change", function () {
        if ($(this).val().trim() == "TM")
            $("#SelectLanguageM").show("slow");
        else
            $("#SelectLanguageM").fadeOut();

    })
$("#Join").click(function () {
    let language = -1;
    if ($("#Language").val() != null) {
        language = $("#Language").val();
    }
    console.log(language);
        $.ajax({
            url: "/Manga/Join",
            type: "post",
           
            data: {
                id: +$("#MangaId").val(),
                role: +$("#SelectRole").val(),
                language: +language,
                type: 0
            },
            success: function (data) {
                if (data == 1) {
                    alert("Xin gia nhập thành công");
                }
                else
                    if (data == 2) {
                        alert("Bạn đã xin gia nhập vị trí này");
                    }
                    else if (data == 0) {
                        alert("Lỗi server");
                    }

            }
        });
    })
$("#Invite").click(function () {
        $.ajax({
            url: "/Manga/Join",
            type: "post",
            data: {
                id: +$("#SelectManga").val(),
                role: $("#SelectRoleM").val(),
                language: $("#LanguageM").val(),
                AccountId: +$("#AccountId").val(),
                type: 1
            },
            success: function (data) {
                if (data == 1) {
                    alert("Mời gia gia nhập thành công");
                }
                else
                    if (data == 2) {
                        alert("Bạn đã mời người này vào vị trí này");
                    }
                    else if (data == 0) {
                        alert("Lỗi server");
                    }

            }
        });
    })




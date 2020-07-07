$("#Notifcation").on("click", function () {
    let countsee = 0;
    let flag = $(this).attr("aria-expanded");
    if (flag == "true") {
        $(this).find("i").css("color", "black");
        $("#ABCZ li.white-gray").each(function () {
            $(this).removeClass("white-gray");
            $(this).addClass("gray-white");
        })
        $("#NotificationCount").html("0");
    }
    else {
        $(this).find("i").css("color", "white");
    }
    $("#ABCZ li").each(function () {
        if ($(this).hasClass("white-gray")) {
            countsee++;
        }
    });
    if (countsee != 0) {
        $.ajax({
            type: "GET",
            url: "/Notification/Seen",
            dataType: "json",
            success: function (result) {

            }
        });
    }
})
var count = 0;

$(function () {
    console.log(1);
    // Declare a proxy to reference the hub.
    var notificationHub = $.connection.notificationHub;

    $.connection.hub.start().done(function () {
      
        notificationHub.server.join($("#AccountModel").val());
        notificationHub.server.joinLogin();
        $("#Notifcation").on("click", function () {

            let flag = $("#Notifcation").attr("aria-expanded");
            if (flag == "true") {
                notificationHub.server.send($("#AccountModel").val());
            }

        });
    })
    // Create a function that the hub can call to broadcast messages.
    notificationHub.client.notify = function (message) {
        if (message && message.toLowerCase() == "added") {
            $.ajax({
                type: "GET",
                url: "/Notification/GetNotifications",
                dataType: "json",
                success: function (result) {
                  
                    for (let i = 0; i < result.length; i++) {
                        let content = "";
                        count++;
                        if (result[i].SeenStatus == 1) {
                            content = '<li class="list-group-item white-gray text-color box-shadow-z0 b"> <span class="clear block ">' + result[i].Content + ' <br><small class="text-muted">' + result[i].CreateAt + '</small></span> </li>';
                            $("#ABCZ").prepend(content);

                        }
                        else {
                            content = '<li class="list-group-item gray-white text-color box-shadow-z0 b"> <span class="clear block">' + result[i].Content + ' <br><small class="text-muted">' + result[i].CreateAt + '</small></span> </li>';
                            $("#ABCZ").prepend(content);
                        }
                        notificationHub.server.sendagain($("#AccountModel").val(), content);
                    }
                    if (result.length > 0) {
                    $("#NotificationCount").show();
                    notifycount = parseInt($("#NotificationCount").html()) + result.length;
                    $("#NotificationCount").html(notifycount);
                    $("#Notifcation").addClass("Showed");
                        $("#NotificationCount").css("color", "white");
                    }
                }
            });
        }
    }
    notificationHub.client.Mess = function () {
        $("#ABCZ li.white-gray").each(function () {
            $(this).removeClass("white-gray");
            $(this).addClass("gray-white");
        });
        $("#NotificationCount").html("0");
        $("#NotificationCount").hide();
    };
    notificationHub.client.Mess1 = function (content) {
        $("#NotificationCount").show();
        $("#ABCZ").prepend(content);
        let flagseen = parseInt($("#NotificationCount").html()) + 1;
        $("#NotificationCount").html(flagseen);

    };
});

if (count == 0) {
    $.ajax({
        type: "GET",
        url: "/Notification/GetNotification",
        dataType: "json",
        success: function (result) {
          
            let FlagSeen = 0;
            for (let i = 0; i < result.length; i++) {
                count++;
                if (result[i].SeenStatus == 1) {
                    FlagSeen++;
                    $("#ABCZ").append('<li class="list-group-item white-gray text-color box-shadow-z0 b"> <span class="clear block ">' + result[i].Content + ' <br><small class="text-muted">' + result[i].CreateAt + '</small></span> </li>');
                }
                else {
                    $("#ABCZ").append('<li class="list-group-item gray-white text-color box-shadow-z0 b"> <span class="clear block">' + result[i].Content + ' <br><small class="text-muted">' + result[i].CreateAt + '</small></span> </li>');
                }
            }
            if (FlagSeen > 0) {
                $("#NotificationCount").show();
                $("#NotificationCount").html(FlagSeen);
            }
            else {
                $("#NotificationCount").hide();
            }
            $("#Notifcation").addClass("Showed");
        }
    });
}
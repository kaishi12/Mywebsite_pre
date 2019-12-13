var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d'),
    rect = {},
    drag = false;
var img = new Image();
var ctx1, scale, canvas1, dragselect, rectselect;
var listRect = new Array();

window.onload = function () {

    img = document.getElementById("girl");
    if ($("#DivCanvas").width() > img.width) {
        scale = 1;
    }
    else {
        scale = img.width / $("#DivCanvas").width();
    }

    ctx.canvas.height = img.height / scale;
    ctx.canvas.width = img.width / scale;
    canvas1 = document.createElement('canvas');
    canvas1.height = canvas.height;
    canvas1.width = canvas.width;
    ctx1 = canvas1.getContext('2d');
    var count = 0;
    ctx.strokeStyle = "#FF0000";
    ctx1.strokeStyle = "#FF0000";
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    init();
    if ($("#tblEntAttributes tbody tr").length != 0) {

        LoadTable();
    }
    //LoadTable();
}
function DrawImg() {
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    $('#tblEntAttributes').find('tbody').detach();
    $('#tblEntAttributes').append($('<tbody>'));
}
function init() {
    canvas.addEventListener('mousedown', mouseDown, false);
    canvas.addEventListener('mouseup', mouseUp, false);
    canvas.addEventListener('mousemove', mouseMove, false);
}

function mouseDown(e) {

    const rects = canvas.getBoundingClientRect();
    rect.startX = event.clientX - rects.left;
    rect.startY = event.clientY - rects.top;
    if (listRect.length > 0) {
        drag = true;
        for (let i = 0; i < listRect.length; i++) {
            const rect1 = listRect[i];
            const endX = rect1.CorX + rect1.CorW;
            const endY = rect1.CorY + rect1.CorH;

            if (rect.startX > rect1.CorX && rect.startX < endX && rect.startY > rect1.CorY && rect.startY < endY) {
                dragselect = i;
                drag = false;

            }

        }
        if (dragselect != null) {
            rectselect = listRect[dragselect];
            LoadList();
        }

    }
    else {
        drag = true;
    }

}

function mouseUp(e) {
    if (dragselect == null) {
        drag = false;

        SetRectangle();
        ctx.drawImage(canvas1, 0, 0);
    }
    else {
        rectselect.CorX = rect.startX;
        rectselect.CorY = rect.startY;

        $("#tblEntAttributes tbody tr").each(function () {
            let row = $(this);

            if (row.find("td").eq("0").find("span").text() == dragselect + 1) {
                row.find("td").eq("0").attr("data-attX", rect.startX);
                row.find("td").eq("0").attr("data-attY", rect.startY);
            }

        });
        listRect[dragselect] = rectselect; 
        
        dragselect = null;
        LoadList();
    }
}
function mouseMove(e) {


    if (drag) {
        const rects = canvas.getBoundingClientRect();
        rect.w = (event.clientX - rects.left) - rect.startX;
        rect.h = (event.clientY - rects.top) - rect.startY;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(canvas1, 0, 0);
        draw();
    }
    if (dragselect != null) {

        const rects = canvas.getBoundingClientRect();
        rect.startX = event.clientX - rects.left;
        rect.startY = event.clientY - rects.top;
        rect.w = rectselect.CorW;
        rect.h = rectselect.CorH;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(canvas1, 0, 0);
        draw();

    }
}
function draw() {
    ctx.setLineDash([3]);
    ctx.strokeRect(rect.startX, rect.startY, rect.w, rect.h);


}
function SetRectangle() {

    ctx1.setLineDash([3]);
    ctx1.strokeRect(rect.startX, rect.startY, rect.w, rect.h);
    count++;
    if (rect.w < 0) {
        rect.startX = rect.startX + rect.w;
        rect.w = Math.abs(rect.w);
    }
    if (rect.h < 0) {
        rect.startY = rect.startY + rect.h;
        rect.h = Math.abs(rect.h);
    }
    if (rect.w < 0 && rect.h < 0) {
        rect.startX = rect.startX + rect.w;
        rect.startY = rect.startY + rect.h;
        rect.w = Math.abs(rect.w);
        rect.h = Math.abs(rect.h);
    }
    ctx1.font = "24px Arial";
    ctx1.fillStyle = "red";
    ctx1.fillText("#" + count, rect.startX, rect.startY);
    let newRowContent = '<tr><td class="Att" data-attX="' + rect.startX * scale + '" data-attY="' + rect.startY * scale + '" data-attW="' + rect.w * scale + '" data-attH="' + rect.h * scale + '"><span class="form-control">' + count + ' </span> </td> <td><input  style="width:60px" value=90 class = "attDe form-control" type=number id=' + count + ' /> <td><button class="btn btn-fw danger" onclick="Remove(this)">Xóa</button> </td> </tr>';
    NewTextBox(rect.startX * scale, rect.startY * scale, rect.w * scale, rect.h * scale, 0);

    $(newRowContent).appendTo($("#tblEntAttributes"));
}
var count = 0;
function RotateRec(cete, X, Y, W, H, degrees, cx, cy) {


    cete.save();
    cete.translate(cx, cy);              //translate to center of shape
    cete.rotate(degrees);  //rotate 25 degrees.
    cete.translate(-cx, -cy);
    //translate center back to 0,0
    cete.setLineDash([3]);
    cete.strokeRect(X, Y, W, H);
    cete.font = "24px Arial";
    cete.fillStyle = "red";
    cete.fillText("#" + count, X, Y);
    cete.restore();
}

function LoadList() {
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    for (let i = 0; i < listRect.length; i++) {
        count++;
        if (i != dragselect) {
            let CorX = listRect[i].CorX / scale;
            let CorY = listRect[i].CorY / scale;
            let CorW = listRect[i].CorW / scale;
            let CorH = listRect[i].CorH / scale;

            let De = parseInt(listRect[i].De) * (Math.PI / 180);
            let cx = CorX + 0.5 * CorW;   // x of shape center
            let cy = CorY + 0.5 * CorH;
            RotateRec(ctx, CorX, CorY, CorW, CorH, De, cx, cy);
            RotateRec(ctx1, CorX, CorY, CorW, CorH, De, cx, cy);
        }
    }


}


function LoadTable(type) {
    listRect = new Array();
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    $("#tblEntAttributes tbody tr").each(function (a, b) {
        count++;
        let CorX = parseInt($(".Att", b).attr("data-attX")) / scale;
        let CorY = parseInt($(".Att", b).attr("data-attY")) / scale;
        let CorW = parseInt($(".Att", b).attr("data-attW")) / scale;
        let CorH = parseInt($(".Att", b).attr("data-attH")) / scale;
        let De = parseInt($(".attDe", b).val() - 90) * (Math.PI / 180);
        let cx = CorX + 0.5 * CorW;   // x of shape center
        let cy = CorY + 0.5 * CorH;
        RotateRec(ctx, CorX, CorY, CorW, CorH, De, cx, cy);
        RotateRec(ctx1, CorX, CorY, CorW, CorH, De, cx, cy);
        NewTextBox(CorX, CorY, CorW, CorH, $(".attDe", b).val() - 90);

    });

}
function SaveCor() {
    let model = new Array();
    $("#tblEntAttributes tbody tr").each(function () {

        let row = $(this);
        let TextBox = {};
        TextBox.Coordinate = row.find("td").eq(0).attr("data-attX") + "," + row.find("td").eq(0).attr("data-attY");
        TextBox.PageId = $("#PageId").val();
        TextBox.Witdh = +row.find("td").eq(0).attr("data-attW");
        TextBox.Height = +row.find("td").eq(0).attr("data-attH");
        TextBox.Degrees = row.find("td").eq(1).find("input").eq(0).val() - 90;
        TextBox.TextBoxId = row.find("td").eq(3).html();
        model.push(TextBox);

    });

    table.each(function () {
        let row = $(this);
        let TextBox = {};
        TextBox.Coordinate = row.find("td").eq(0).attr("data-attX") + "," + row.find("td").eq(0).attr("data-attY");
        TextBox.PageId = $("#PageId").val();
        TextBox.Witdh = +row.find("td").eq(0).attr("data-attW");
        TextBox.Height = +row.find("td").eq(0).attr("data-attH");
        TextBox.Degrees = row.find("td").eq(1).find("input").eq(0).val() - 90;
        TextBox.TextBoxId = row.find("td").eq(3).html();
        TextBox.StatusActive = 1;
        let index = model.indexOf(model.find(function (element) {
            return element.TextBoxId == TextBox.TextBoxId;
        }));
        if (index == -1) {
            model.push(TextBox);
        }

    });

    $.ajax({
        type: "POST",
        url: "/Page/AddNewTextBoxes",
        data: JSON.stringify(model),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result == true) {
                table = $("#tblEntAttributes tbody tr").clone();
                alert("Lưu Thành Công");
            }
        }
    });

}
function Remove(e) {

    let number = $(e).parents('tr').find("td").eq("0").text();
    $(e).parents('tr').next().find("td").eq("0").find("span").text(number);
    $(e).parents('tr').remove();
    listRect.pop(number - 1);
    LoadTable();
}
var table = $("#tblEntAttributes tbody tr").clone();
function Reload() {
    console.log(table);
    count = 0;
    $("#tblEntAttributes tbody tr").each(function () {
        this.remove();
    });
    table.appendTo($("#tblEntAttributes"));
    table = $("#tblEntAttributes tbody tr").clone();
    LoadTable();
}
function NewTextBox(CorX, CorY, CorW, CorH, De) {
    let textbox = {};
    textbox.CorX = CorX;
    textbox.CorY = CorY;
    textbox.CorW = CorW;
    textbox.CorH = CorH;
    textbox.De = De;
    listRect.push(textbox);
}
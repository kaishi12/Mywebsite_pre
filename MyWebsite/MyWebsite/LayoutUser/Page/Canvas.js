    var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d'),
    rect = {},
    drag = false;

var img = new Image();
var ctx1,scale,canvas1;
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
    drag = true;
}

function mouseUp(e) {
    drag = false;

    SetRectangle();
    ctx.drawImage(canvas1, 0, 0);
    //ctx.clearRect(0, 0, canvas.width, canvas.height);

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
    ctx1.fillText("#" + count, rect.startX, rect.startY);
    let newRowContent = '<tr><td>' + count + ' </td> <td  hidden class = "attX"> ' + rect.startX * scale + '</td><td hidden class = "attY"> ' + rect.startY * scale + '</td><td hidden  class = "attW">' + rect.w * scale + '</td><td hidden class = "attH">' + rect.h * scale + '</td>' + '<td><input  style="width:40px" value=90 class = "attDe" type=number id=' + count + ' /> <td><button class="btn btn-fw danger" onclick="Remove(this)">Xóa</button> </td> </tr>';
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
    cete.fillText("#"+count, X, Y); 
    //paint_centered_wrap(cete, X, Y, W, H, "ABC", 20, 13);
    cete.restore();
}
paint_centered_wrap = function (ctx, x, y, w, h, text, fh, spl) {
    // The painting properties 
    // Normally I would write this as an input parameter
    var Paint = {

        VALUE_FONT: '30px lokicola',
        VALUE_FILL_STYLE: 'red'
    }
    /*
     * @param ctx   : The 2d context 
     * @param mw    : The max width of the text accepted
     * @param font  : The font used to draw the text
     * @param text  : The text to be splitted   into 
     */
    var split_lines = function (ctx, mw, font, text) {
        // We give a little "padding"
        // This should probably be an input param
        // but for the sake of simplicity we will keep it
        // this way
        mw = mw - 10;
        // We setup the text font to the context (if not already)
        ctx.font = font;
        // We split the text by words 
        var words = text.split(' ');
        var new_line = words[0];
        var lines = [];
        for (var i = 1; i < words.length; ++i) {
            if (ctx.measureText(new_line + " " + words[i]).width < mw) {
                new_line += " " + words[i];
            } else {
                lines.push(new_line);
                new_line = words[i];
            }
        }
        lines.push(new_line);
        // DEBUG 
        // for(var j = 0; j < lines.length; ++j) {
        //    console.log("line[" + j + "]=" + lines[j]);
        // }
        return lines;
    }
    // Obtains the context 2d of the canvas 
    // It may return null


    if (ctx) {
        // draw rectangular

        // Paint text
        var lines = split_lines(ctx, w, Paint.VALUE_FONT, text);
        // Block of text height
        var both = lines.length * (fh + spl);
        if (both >= h) {
            // We won't be able to wrap the text inside the area
            // the area is too small. We should inform the user 
            // about this in a meaningful way
        } else {
            // We determine the y of the first line
            var ly = (h - both) / 2 + y + spl * lines.length;
            var lx = 0;
            for (var j = 0, ly; j < lines.length; ++j, ly += fh + spl) {
                // We continue to centralize the lines
                lx = x + w / 2 - ctx.measureText(lines[j]).width / 2;
                // DEBUG 
                console.log("ctx2d.fillText('" + lines[j] + "', " + lx + ", " + ly + ")");
                ctx.fillText(lines[j], lx, ly);
            }
        }
    } else {
        // Do something meaningful
    }
}
function LoadTable() {
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    $("#tblEntAttributes tbody tr").each(function (a, b) {
        count++;
        let CorX = parseInt($(".attX", b).text())/scale;
        console.log(CorX);
        let CorY = parseInt($(".attY", b).text()) / scale;
        let CorW = parseInt($(".attW", b).text()) / scale;
        let CorH = parseInt($(".attH", b).text()) / scale;
        let De = parseInt($(".attDe", b).val() - 90) * (Math.PI / 180);
        let cx = CorX + 0.5 * CorW;   // x of shape center
        let cy = CorY + 0.5 * CorH;
        RotateRec(ctx, CorX, CorY, CorW, CorH, De, cx, cy);
        RotateRec(ctx1, CorX, CorY, CorW, CorH, De, cx, cy);
    });
}
function SaveCor() {
    let model = new Array();
    $("#tblEntAttributes tbody tr").each(function () {
        
        let row = $(this);
        let TextBox = {};
        TextBox.Coordinate = row.find("td").eq(1).html().trim() + "," + row.find("td").eq(2).html().trim();
        TextBox.PageId = $("#PageId").val();
        TextBox.Witdh = +row.find("td").eq(3).html();
        TextBox.Height = +row.find("td").eq(4).html();
        TextBox.Degrees = row.find("td").eq(5).find("input").eq(0).val() - 90;
        TextBox.TextBoxId = row.find("td").eq(7).html();
        model.push(TextBox);
        
    });
   
    table.each(function () {
        let row = $(this);
        let TextBox = {};
        TextBox.Coordinate = row.find("td").eq(1).html().trim() + "," + row.find("td").eq(2).html().trim();
        TextBox.PageId = $("#PageId").val();
        TextBox.Witdh = +row.find("td").eq(3).html();
        TextBox.StatusActive = 1;
        TextBox.Height = +row.find("td").eq(4).html();
        TextBox.Degrees = row.find("td").eq(5).find("input").eq(0).val() - 90 ;
        TextBox.TextBoxId = row.find("td").eq(7).html();
        let index = model.indexOf(model.find(function (element) {
            return element.TextBoxId == TextBox.TextBoxId;
        }));
        if (index == -1) {
            model.push(TextBox);
        }
       
    });
    console.log(model);
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
    $(e).parents('tr').remove();
}
var table = $("#tblEntAttributes tbody tr").clone();
function Reload() {
    count = 0;
    $("#tblEntAttributes tbody tr").each(function () {
        this.remove();
    });
    table.appendTo($("#tblEntAttributes"));
    LoadTable();
}
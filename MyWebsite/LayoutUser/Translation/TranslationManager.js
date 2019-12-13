var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d'),
    rect = {},
    drag = false;

var img = new Image();
var ctx1, scale, canvas1;
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
    var count = 0;
    ctx.strokeStyle = "#FF0000";
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    if ($("#tblEntAttributes tbody tr").length != 0) {

        LoadTable();
    }
    //LoadTable();
}
function DrawImg() {
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    $('#tblEntAttributes').find('tbody').detach();
    $('#tblEntAttributes').append($('<tbody>'));
}

function RotateRec(cete, X, Y, W, H, degrees, cx, cy, text, font, outline, color, italic, bold, size, color) {
   

    let fontTextBox = "";
    if (italic == 1) {
        fontTextBox += "Italic ";
    }
    let size1 = 24 / scale;
    fontTextBox += bold + " " + size / scale + "px " + font;

    cete.save();
    cete.translate(cx, cy);              //translate to center of shape
    cete.rotate(degrees);  //rotate 25 degrees.
    cete.translate(-cx, -cy);
    //translate center back to 0,0
    cete.setLineDash([3]);
    cete.strokeRect(X, Y, W, H);
    cete.font = size1 + "px PlayfairDisplay";
    ctx.fillStyle = "red";
    cete.fillText("#" + count, X, Y);
  
        paint_centered_wrap(cete, X, Y, W, H, text, fontTextBox, 12, 2, color);
    
    cete.restore();
}
paint_centered_wrap = function (ctx, x, y, w, h, text, fontTextBox, fh, spl, color) {

    // The painting properties 
    // Normally I would write this as an input parameter
    var Paint = {

        VALUE_FONT: fontTextBox,
        VALUE_FILL_STYLE: color
    }
    /*
     * @param ctx   : The 2d context 
     * @param mw    : The max width of the text accepted
     * @param font  : The font used to draw the text
     * @param text  : The text to be splitted   into 
     */
    var split_lines = function (ctx, mw, Pain, text) {
        // We give a little "padding"
        // This should probably be an input param
        // but for the sake of simplicity we will keep it
        // this way
        mw = mw - 10;
        // We setup the text font to the context (if not already)
        ctx.font = Pain.VALUE_FONT;
        if (Pain.VALUE_FILL_STYLE == 0) {
            ctx.fillStyle = "black";
        }
        else {
            ctx.fillStyle = Pain.VALUE_FILL_STYLE;
        }

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
        var lines = split_lines(ctx, w, Paint, text);
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
    let text, size, font, outline, italic, bold;
    let color = 0;
    $("#tblEntAttributes tbody tr").each(function (a, b) {
        count++;
        let CorX = parseInt($(".Att", b).attr("data-attX")) / scale;
        let CorY = parseInt($(".Att", b).attr("data-attY")) / scale;
        let CorW = parseInt($(".Att", b).attr("data-attW")) / scale;
        let CorH = parseInt($(".Att", b).attr("data-attH")) / scale;
        let De = parseInt($(".Att", b).attr("data-attDe")) * (Math.PI / 180);
        bold = parseInt($(".AttText", b).find(':selected').data("bold"));
        size = parseInt($(".AttText", b).find(':selected').data("size"));
        font = $(".AttText", b).find(':selected').data("font");
        color = $(".AttText", b).find(':selected').data("color");
        alert($(".AttBtn", b).attr("data-xzs"));
        $(".AttBtn", b).attr("data-id", $(".AttText", b).find(":selected").val());
        italic = parseInt($(".AttText", b).find(':selected').data("italic"));
        let cx = CorX + 0.5 * CorW;   // x of shape center
        let cy = CorY + 0.5 * CorH;
        text = $(".AttText", b).find(':selected').text();
        console.log(bold,size,font,color,text);
  RotateRec(ctx, CorX, CorY, CorW, CorH, De, cx, cy, text, font, outline, color, italic, bold, size, color);
    });
}
$("#SelectPage").on("change", function () {
    window.location.href = "/TranslationManager/" + $("#Translation").val() +"/"+ $("#SelectChapter").val() + "/" + $(this).val();
})
$("#SelectChapter").on("change", function () {
    window.location.href = "/TranslationManager/" + $("#Translation").val()+"/"+ $(this).val();
})
$('.AttText').on("change",function () {
   
    $(this).parent().next().find("button").eq(0).attr("data-id", $(this).find(":selected").val());
    LoadTable();
})
function loadjscssfile(filename, filetype) {
    if (filetype == "js") { //if filename is a external JavaScript file
        var fileref = document.createElement('script')
        fileref.setAttribute("type", "text/javascript")
        fileref.setAttribute("src", filename)
    }
    else if (filetype == "css") { //if filename is an external CSS file
        var fileref = document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
    if (typeof fileref != "undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref)
}

function Save() {
    let model = new Array();
    $("#tblEntAttributes tbody tr.New").each(function () {
        let row = $(this);

        let Text = {};
        Text.TextContent = row.find("td").eq(1).find("input").eq(0).val();
        if (Text.TextContent != "") {
            $(this).removeClass("New");
            $(this).addClass("Default");
            Text.ColorText = row.find("td").eq(2).find("button").eq(0).data("color");
            Text.Bold = +row.find("td").eq(2).find("button").eq(0).data("bold");
            Text.TranslationId = $("#SelectLanguage").val();
            Text.TextBoxId = row.find("td").eq(2).find("button").eq(0).val();
            Text.FontId = row.find("td").eq(2).find("button").eq(0).data("fontid");
            Text.FontSize = row.find("td").eq(2).find("button").eq(0).data("size");
            Text.Italic = row.find("td").eq(2).find("button").eq(0).data("italic");
            if (Text.FontId == undefined) {
                Text.StatusActive = 1;
            }
            else {
                Text.StatusActive = 0;
            }
            Text.StatusAllow = 1;
            Text.TextId = row.find("td").eq(0).attr("data-TextId");
            if (Text.TextId == undefined) {
                row.find("td").eq(3).html = "Chưa được chọn";
            }
            model.push(Text);
        }
    });
    console.log(model);
    $.ajax({
        type: "POST",
        url: "/Contribute/AddNewTexts",
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
$(".AttBtn").on("click", function () {
    Text = {};
    Text.Id = +$(this).attr("data-id");
    Text.TextBoxId = +$(this).attr("data-textboxid");
    $.ajax({
        type: "POST",
        url: "/Translation/AllowText",
        data: JSON.stringify(Text),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result == true) {
                alert("Lưu Thành Công");
            }
        }
    });
})





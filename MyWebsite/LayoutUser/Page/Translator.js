var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d'),
    rect = {},
    drag = false;

var img = new Image();
var ctx1, scale, canvas1;
const prepareFontLoad = (fontList) => Promise.all(fontList.map(font => document.fonts.load(font)))
$("#buttonRaw").on("click", function () {
    
    $("#PageRaw").attr("hidden", false);
    $("#canvas").attr("hidden", true);
    $("#bybtnLanguage").fadeOut();
})
$("#buttonClearText").on("click", function () {

    $("#PageRaw").attr("hidden", true);
    $("#canvas").attr("hidden", false);
    $("#bybtnLanguage").fadeOut();
})
$("#buttonLanguage").on("click", function () {

    $("#PageRaw").attr("hidden", true);
    $("#canvas").attr("hidden", true);
    $("#bybtnLanguage").fadeIn();
})
$(".labellanguage").on("click", function () {
    let content = $(this).html();
    $("#buttonLanguage").html(content);
    $(".labellanguage.primary").removeClass("primary");
    $(".labellanguage.danger").removeClass("danger");
    let thislabel = $(this); 
    let spin = '<i class="fas fa-cog fa-spin"></i>';
    $.ajax({
        type: "POST",
        url: "/Contribute/GetTextByTrans",
        data: {
            TranslationId: thislabel.attr("data-translationid"),
            PageId: $("#PageId").val()
        },
        beforeSend: function () {
            thislabel.append('<i class="fas fa-cog fa-spin"></i>');
        },
        complete: function () {
            thislabel.html(content);
            thislabel.parent().hide("slow");
        },
        dataType: "json",
        success: function (result) {
        
            LoadText(result);
            $("#DivCanvas").append(canvas1);
           
        }
    });
    $(this).addClass("danger");
    $(this).addClass("disabled");
    $(this).attr("disabled", true);
})
function LoadText(result) {

    count = 0;
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    for (let i = 0; i < result.length ; i++)
    {
      console.log("loadtext");
        count++;
        let CorX = result[i].CorX / scale;
        let CorY = result[i].CorY / scale;
        let CorW = result[i].Witdh / scale;
        let CorH = result[i].Height / scale;
        let De = parseInt(result[i].Degrees) * (Math.PI / 180);
        bold = parseInt(result[i].Bold);
        size = parseInt(result[i].Size);
        font = result[i].Font;
        color = result[i].color;
        italic = parseInt(result[i].Italic);
        let cx = CorX + 0.5 * CorW;   
        let cy = CorY + 0.5 * CorH;
        text = result[i].text;
        RotateRec(1, ctx1, CorX, CorY, CorW, CorH, De, cx, cy, text, font, color, italic, bold, size, color);
    }

}
$(document).ready(function ()  {

    img = document.getElementById("girl");
    var complete = img.complete;
    img1 = document.getElementById("PageRaw");
    if ($("#DivCanvas").width() > img.width) {
        scale = 1;
    }
    else {
        scale = img.width / $("#DivCanvas").width();
    }
    img.onload = function () {
        Load();
    }
    if (complete) {
        Load();
    }
    //LoadTable();
})
function DrawImg() {
    count = 0;
    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    $('#tblEntAttributes').find('tbody').detach();
    $('#tblEntAttributes').append($('<tbody>'));
}

async function RotateRec(status, cete, X, Y, W, H, degrees, cx, cy, text, font, outline, color, italic, bold, size, color) {

    let fontTextBox = "";
    if (italic == 1) {
        fontTextBox += "Italic ";
    }
  if (bold == 1) {
    fontTextBox += "bold ";
  }
    let size1 = 24 / scale;
    fontTextBox +=  size / scale + "px " + font;
    cete.save();
    cete.translate(cx, cy);              //translate to center of shape
    cete.rotate(degrees);  //rotate 25 degrees.
    cete.translate(-cx, -cy);
    //translate center back to 0,0
    cete.setLineDash([3]);
    cete.strokeRect(X, Y, W, H);
    cete.font =  "20px MTO Astro City";
    cete.fillStyle = "black";
    cete.fillText("#" + count, X, Y);
    const fontList = [];
    fontList.push(fontTextBox);
    if (fontList.count > 0)
    await prepareFontLoad(fontList);
    if (status == 1) {
        paint_centered_wrap(cete, X, Y, W, H, text, fontTextBox, 12, 2, color);
    }
    cete.restore();
}
paint_centered_wrap = function (cete, x, y, w, h, text, fontTextBox, fh, spl, color) {

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
        cete.font = Pain.VALUE_FONT;
        if (Pain.VALUE_FILL_STYLE == 0) {
            cete.fillStyle = "black";
        }
        else {
            cete.fillStyle = Pain.VALUE_FILL_STYLE;
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


    if (cete) {
        // draw rectangular

        // Paint text
        var lines = split_lines(cete, w, Paint, text);
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
                lx = x + w / 2 - cete.measureText(lines[j]).width / 2;
                // DEBUG 
                console.log(lx, ly);
                cete.fillText(lines[j], lx, ly);
            }
        }
    } else {
        // Do something meaningful
    }
}
function LoadTable(status) {
    if (status == 0) {
        flagChange = false;
        CheckChange();
    }
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
       size = parseInt($(".clickbutton", b).data("size"));
      
        font = $(".clickbutton", b).data("font");
        color = $(".clickbutton", b).data("color");
     
      italic = $(".clickbutton", b).data("italic") == "True" ? 1 : 0;
      bold = $(".clickbutton", b).data("bold") == "True" ? 1 : 0;
        let cx = CorX + 0.5 * CorW;   // x of shape center
        let cy = CorY + 0.5 * CorH;


        if (status == 1) {
          
            text = $(".attText", b).val();

        }
        else {
            $(".attText.New", b).val(null);
        }
        RotateRec(status, ctx, CorX, CorY, CorW, CorH, De, cx, cy, text, font, outline, color, italic, bold, size, color);
    });
}
var flagChange = false;
function CheckChange() {
    if (flagChange) {

        $("#AddText").show();

    }
    else {
        $("#AddText").hide();
    }
}
$(".attText").on("input", function () {
    if ($(this).hasClass("Default")) {
        $(this).removeClass("Default");
        $(this).addClass("New");
    }
    if ($(this).parent().parent().hasClass("Default")) {
        $(this).parent().parent().removeClass("Default");
        $(this).parent().parent().addClass("New");
    }
    LoadTable(1);
    flagChange = false;
    $(".attText").each(function () {
        if ($(this).val().length != 0) {

            flagChange = true;
            CheckChange();
        }
    });
    CheckChange();
})
$("#SelectPage").on("change", function () {
    window.location.href = "/Contribute/Translator?ChapterId=" + $("#SelectChapter").val() + "&PageId=" + $(this).val() + "&TranslationId=" + $("#SelectLanguage").val();
})
$("#SelectChapter").on("change", function () {
    window.location.href = "/Contribute/Translator?ChapterId=" + $(this).val();
})
$("#SelectLanguage").on("change", function () {
    alert(1);
    window.location.href = "/Contribute/Translator?ChapterId=" + $("#SelectChapter").val() + "&PageId=" + $("#SelectPage").val() + "&TranslationId="+ $(this).val();
})

$(".clickbutton").on("click", function () {
  $("#Size").val($(this).data("size"));
  $("#Font").val($(this).data("fontid")).change();
  $('#Join').attr("data-Id", $(this).attr("id"));
  $(this).data("italic") == "True" ? document.getElementById("SelectItalic").checked = true : document.getElementById("SelectItalic").checked = false;
  $(this).data("bold") == "True" ? document.getElementById("SelectBold").checked = true : document.getElementById("SelectBold").checked = false;
  $("#SelectColor").next().css("background-color", $(this).data("color").trim());
})
$("#Join").on("click", function () {
  
  console.log(document.getElementById("SelectColor").value);
    flagChange = true;
    CheckChange();
    let text = $("#Font").val().trim();

    let id = "#" + $(this).attr("data-id");
    if ($(id).hasClass("Default")) {
        $(id).removeClass("Default");
        $(id).addClass("New");
       
    }
    if ($(id).parent().parent().hasClass("Default")) {
        $(id).parent().parent().removeClass("Default");
        $(id).parent().parent().addClass("New");
    }
    $(id).data("fontid", text);
    $(id).data("font", $("#Font :selected").text());
    
    $(id).data("size", $("#Size").val());
    $(id).data("color", $("#SelectColor").val());
    if ($("#SelectItalic").is(":checked") == true) {
        $(id).data("italic", "True");
    }
    else {
        $(id).data("italic", "False");
    }
  if ($("#SelectBold").is(":checked") == true) {
    $(id).data("bold", "True");
  }
  else {
    $(id).data("bold", "False");
  }
    if ($("#SelectOutLine").attr("checked") == true) {
        $(id).data("outline", "True");
    }
    else {
        $(id).data("outline", "False");
    }


    LoadTable(1);
})
$("#SelectColor").on("change", function () {
    $(this).next().css("border", "2px solid #1bdbf8")
        .css("background-color", $(this).val())
        .css("transition", "all .2s");

})
function Save() {
  alert(1);
    let model = new Array();
    $("#tblEntAttributes tbody tr.New").each(function () {
        let row = $(this);
        
        let Text = {};
        Text.TextContent = row.find("td").eq(1).find("input").eq(0).val();
        if (Text.TextContent != "") {
            $(this).removeClass("New");
            $(this).addClass("Default");
        Text.ColorText = row.find("td").eq(2).find("button").eq(0).data("color");
        Text.Bold = row.find("td").eq(2).find("button").eq(0).data("bold") == "True";
        Text.TranslationId = $("#SelectLanguage").val();
        Text.TextBoxId = row.find("td").eq(2).find("button").eq(0).val();
        Text.FontId = row.find("td").eq(2).find("button").eq(0).data("fontid");
        Text.FontSize = row.find("td").eq(2).find("button").eq(0).data("size");
        Text.Italic =  row.find("td").eq(2).find("button").eq(0).data("italic") == "True";
           
              Text.Active = true;
          console.log(Text.Italic);
          Text.Allow = false;
            Text.TextId = row.find("td").eq(0).attr("data-TextId");
            if (Text.TextId == undefined) {
                row.find("td").eq(3).html = "Chưa được chọn";
            }
        model.push(Text);
        }
    });
  
  $.ajax({
    type: "POST",
    url: "/Contribute/AddNewTexts",
    data: {
      model: model
    },
            
            success: function (result) {
                if (result == true) {
                    table = $("#tblEntAttributes tbody tr").clone();
                    alert("Lưu Thành Công");
                }
            }
        });

}
function Load() {
    ctx.canvas.height = img.height / scale;
    ctx.canvas.width = img.width / scale;
    canvas1 = document.createElement('canvas');
    canvas1.height = canvas.height;
    canvas1.width = canvas.width;
    img1.height = canvas1.height;
    img1.width = canvas.width;
    ctx1 = canvas1.getContext('2d');
    var count = 0;
    ctx.strokeStyle = "#FF0000";
    ctx1.strokeStyle = "#FF0000";

    ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
    ctx1.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);

    if ($("#tblEntAttributes tbody tr").length != 0) {

        LoadTable(1);
    }
}





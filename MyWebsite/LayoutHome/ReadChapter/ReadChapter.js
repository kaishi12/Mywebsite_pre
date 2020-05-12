var listcanvas = [];
function LoadImg() {

    $('.lazy').lazy({
        placeholder: "/RootPicture/tenor.gif",
        // called before an elements gets handled
        beforeLoad: function (element) {
            var imageSrc = element.data('src');
            console.log('image "' + imageSrc + '" is about to be loaded');
        },

        // called after an element was successfully handled
        afterLoad: function (element) {
            var imageSrc = element.data('src');
            console.log('image "' + imageSrc + '" was loaded successfully');
            $(element).parent().hide();
            let canvas1 = document.createElement('canvas');
            canvas1.id = "canvas" + element.data('id');
            let img = document.getElementById(element.data('id'));
            canvas1.height = img.height;
            canvas1.width = img.width;
            canvas1.style.display = "block";
            canvas1.style.marginLeft = "auto";
            canvas1.style.marginRight = "auto";
            let ctx = canvas1.getContext("2d");
            ctx.drawImage(img, 0, 0);
            $(element).parent().parent().append(canvas1);
        },

        // called whenever an element could not be handled
        onError: function (element) {
            var imageSrc = element.data('src');
            console.log('image "' + imageSrc + '" could not be loaded');
        },

        // called once all elements was handled
        onFinishedAll: function () {
            console.log('finished loading all images');
            LoadCom(obj);
        }
    });
};

function LoadText(cete, result) {

    let text, size, font, italic, bold;
    for (let i = 0; i < result.length; i++) {
        let CorX = +result[i].Cor.split(",")[0];
        let CorY = +result[i].Cor.split(",")[1];
        let CorW = result[i].witdh;
        let CorH = result[i].height;
        let De = parseInt(result[i].degree) * (Math.PI / 180);
        bold = result[i].texts.bold == true ? "Bold" : "";
        size = result[i].texts.size;
        font = result[i].texts.font;
        color = result[i].texts.color.trim();
        italic = result[i].texts.italic == true ? "Italic " : "";
        let cx = CorX + 0.5 * CorW;   // x of shape center
        let cy = CorY + 0.5 * CorH;
        text = result[i].texts.content;
        let fontTextBox = "";
        if (italic == 1) {
            fontTextBox += "Italic ";
        }
        fontTextBox += italic + bold + " " + size + "px " + font;

        cete.save();
        cete.translate(cx, cy);            
        cete.rotate(De);  
        cete.translate(-cx, -cy);
        paint_centered_wrap(cete, CorX, CorY, CorW, CorH, text, fontTextBox, 12, 2, color);
        cete.restore();
    }

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
                cete.fillText(lines[j], lx, ly);
            }
        }
    } else {
        // Do something meaningful
    }
}
function LoadCom(obj) {
    $.each(obj, function (arrayID, element) {

        let namecanvas = "canvas" + element[0].Id;
        let canvas = document.getElementById(namecanvas);
        let ctx = canvas.getContext("2d");
        LoadText(ctx, element[0].textboxes);
    });
}
var obj = [];
function LoadAllText() {
    $.ajax({
        type: "POST",
        url: "/Home/GetTexts",
        data: {
            chapterid: $("#ChapterId").val(),
            language: 1
        },
        success: function (result) {
            obj = result;

        }
    });
}

$(document).ready(function () {
    document.fonts.ready.then(function () {
        alert('All fonts in use by visible text have loaded.');
        alert('Roboto loaded? ' + document.fonts.check('1em Roboto'));  // true
    });
    LoadAllText();
    LoadImg();
});






    var x1 = 0;
                    function myFunction() {

                        var x = document.getElementById("sotrang").value;
                        if (Number(x) < 0) {
        alert("Hello! I am an alert box!!");
    }
    else
                            if (x1 > 0) {
                                for (var i = 0; i < Number(x1); i++) {
        document.getElementById("myTable").deleteRow(1);
    }
    x1 = 0;
}
var fullname = document.getElementById("PageFullName");
var ordernumber = document.getElementById("PageOrderNumber");
var stringfullname = "";
var stringorder = "";
                        for (var i = 0; i < Number(x); i++) {
                            var x2 = x1 + 1;
    var tr, td, tbody;
    var table = document.getElementById("myTable");
    var inputfile = document.createElement("input");
    inputfile.type = "file";
    inputfile.id = "AnhTrang";
    inputfile.name = "AnhTrang";
    table.appendChild(tbody = document.createElement("tbody"));
    tbody.appendChild(tr = document.createElement("tr"));
    tr.appendChild(td = document.createElement("td"));
    td.textContent = x2;
    stringorder += ";" + td.textContent;
    td.id = "pageModels.OrderNumber";
    td.name = "pageModels.OrderNumber";
    tr.appendChild(td = document.createElement("td"));
    td.appendChild(inputfile);
    tr.appendChild(td = document.createElement("td"));

    td.textContent = "trang " + x2 + "-" + document.getElementById("FullName").value  ;
    stringfullname += ";" + td.textContent;
    td.id = "pageModels.FullName";
    td.name = "pageModels.FullName";
    x1++;
}
fullname.value = stringfullname;
ordernumber.value = stringorder;

}
               
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function refreshData(path)
{
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            var statistics = xmlhttp.responseText;
            if(statistics == 'undefined' || statistics == '' || statistics == 'null' || statistics == '"not validate"') {
                return ;
            }else if(statistics.length > 0){

                displayResults(statistics);

            }else{
                return ;
            }
        }
    }
    xmlhttp.open("GET",path ,true);
    xmlhttp.send();

}

function displayResults(newData)
{
    rows = JSON.parse(newData)

    body = document.getElementById("data")
    body.innerHTML = ""

    district = Object.keys(rows)

    for (i=0; i < district.length; i++)
    {
        row = document.createElement("tr")
        body.appendChild(row)

        cell1 = document.createElement("td")
        cell1.innerHTML = district[i]
        cell1.style.textAlign = "left"
        cell1.style.paddingLeft= "5px"
        cell1.style.width = (document.getElementById("district_head").offsetWidth -2 ) +"px"
        row.appendChild(cell1)

        cell2 = document.createElement("td")
        cell2.innerHTML = (rows[district[i]]["FACILITY OPEN"] == null ? 0 : rows[district[i]]["FACILITY OPEN"])
        cell2.style.width = (document.getElementById("facilityOpen").offsetWidth -2 ) +"px"
        row.appendChild(cell2)

        cell3 = document.createElement("td")
        cell3.innerHTML = (rows[district[i]]["DC OPEN"] == null ? 0 : rows[district[i]]["DC OPEN"])
        cell3.style.width = (document.getElementById("dcOpen").offsetWidth -2 ) +"px"
        row.appendChild(cell3)

        cell4 = document.createElement("td")
        cell4.innerHTML = rows[district[i]]["DC_ASK"] == null ? 0 : rows[district[i]]["DC_ASK"]
        cell4.style.width = (document.getElementById("dcAsk").offsetWidth -2 ) +"px"
        row.appendChild(cell4)

        cell5 = document.createElement("td")
        cell5.innerHTML = rows[district[i]]["GRANTED"] == null ? 0 : rows[district[i]]["GRANTED"]
        cell5.style.width = (document.getElementById("dcGranted").offsetWidth -2 ) +"px"
        row.appendChild(cell5)


        cell6 = document.createElement("td")
        cell6.innerHTML = rows[district[i]]["HQ OPEN"] == null ? 0 : rows[district[i]]["HQ OPEN"]
        cell6.style.width = (document.getElementById("hqOpen").offsetWidth -2 ) +"px"
        row.appendChild(cell6)

        cell7 = document.createElement("td")
        cell7.innerHTML = rows[district[i]]["PRINTED"] == null ? 0 : rows[district[i]]["PRINTED"]
        cell7.style.width = (document.getElementById("hqPrinted").offsetWidth -2 ) +"px"
        row.appendChild(cell7)

    }
}
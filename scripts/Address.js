$(document).ready(function () {
    GetRegion(function (e) {
        $("#txtRegion").html("");
        $('<option/>', {
            value: 'none',
            text: 'Please select'
        }).appendTo($("#txtRegion"));
        for (var i in e) {
            $('<option/>', {
                value: e[i]['REGION_DESCRIPTION'],
                text: e[i]['REGION_DESCRIPTION'],
                'data-REGION_CODE': e[i]['REGION_CODE']
            }).appendTo($("#txtRegion"));
        }

        $("#txtRegion").change(function () {
            var REGION_CODE = $("#txtRegion").find(':selected').attr('data-REGION_CODE');
            GetProvince(REGION_CODE, function (e) {
                $("#txtProvince").html("");
                $('<option/>', {
                    value: 'none',
                    text: 'Please select'
                }).appendTo($("#txtProvince"));
                for (var i in e) {
                    $('<option/>', {
                        value: e[i]['PROVINCE_DESCRIPTION'],
                        text: e[i]['PROVINCE_DESCRIPTION'],
                        'data-PROVINCE_CODE': e[i]['PROVINCE_CODE']
                    }).appendTo($("#txtProvince"));
                }
            });

            $("#txtProvince").change(function () {
                var PROVINCE_CODE = $("#txtProvince").find(':selected').attr('data-PROVINCE_CODE');
                GetCity(PROVINCE_CODE, function (e) {
                    $("#txtCity").html("");
                    $('<option/>', {
                        value: 'none',
                        text: 'Please select'
                    }).appendTo($("#txtCity"));
                    for (var i in e) {
                        $('<option/>', {
                            value: e[i]['CITY_CODE'],
                            text: e[i]['CITY_DESCRIPTION'],
                            'data-zipcode': e[i]['ZIPCODE'],
                            'data-CITY_CODE': e[i]['CITY_CODE']
                        }).appendTo($("#txtCity"));
                    }
                });

                $("#txtCity").change(function () {
                    $("#txtZipCode").val($("#txtCity").find(':selected').attr('data-zipcode'));
                    var CITY_CODE = $("#txtCity").find(':selected').attr('data-CITY_CODE');
                    GetBarangay(CITY_CODE, function (e) {
                        $("#txtBarangay").html("");
                        $('<option/>', {
                            value: 'none',
                            text: 'Please select'
                        }).appendTo($("#txtBarangay"));
                        for (var i in e) {
                            $('<option/>', {
                                value: e[i]['BRGY_DESC'],
                                text: e[i]['BRGY_DESC'],
                                'style':  "text-transform: uppercase" 
                            }).appendTo($("#txtBarangay"));
                        }
                    });
                    //$('#txtBarangay option').each(function () {
                    //    $(this).text($(this).text().toUpperCase());
                    //});
                });
            });
        });
    });
});

function GetRegion(callback) {
    $.ajax({
        url: "SharedService.asmx/GetRegion",
        type: "POST",
        data: "{}",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetProvince(REGION_CODE, callback) {
    $.ajax({
        url: "SharedService.asmx/GetProvince",
        type: "POST",
        data: JSON.stringify({ REGION_CODE: REGION_CODE}),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetCity(PROVINCE_CODE, callback) {
    $.ajax({
        url: "SharedService.asmx/GetCity",
        type: "POST",
        data: JSON.stringify({ PROVINCE_CODE: PROVINCE_CODE }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetBarangay(CITY_CODE, callback) {
    $.ajax({
        url: "SharedService.asmx/GetBarangay",
        type: "POST",
        data: JSON.stringify({ CITY_CODE: CITY_CODE }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (e) {
            var d = JSON.parse(e.d)
            console.log(d);
            if (callback !== undefined) {
                callback(d);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
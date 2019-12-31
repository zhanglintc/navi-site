// functions for index.tpl

function Copyright() {
    copyright.innerHTML =  "&copy 2018-" + (new Date()).getFullYear() + " by <a style='color: inherit;' target='_blank' href='http://github.com/zhanglintc/navi-site'>zhanglintc</a>";
}

function update_site_dict(cell, name, site) {
    params = {
        sn: cell,
        name: name,
        site: site
    };

    $.ajax({
        url: "/update_site_dict",
        type: "post",
        data: params,
        async: true,
        success: function(rec) {
            console.log("update_site_dict() done")
        }
    });
}

function make_new_layer() {
    layer.open({
        id: "iframe_edit",
        type: 2,
        title: ["Edit", 'font-size: 14px;'],
        closeBtn: 1,
        shadeClose: false,
        resize: false,
        area: ['400px', '220px'],
        content: './layer_edit.php',
    });
}

function toggle_editable() {
    window.editable = !window.editable;
    console.log("editable: " + window.editable);

    if (window.editable) {
        $(".cells").css("color", "red");
    }
    else {
        $(".cells").css("color", "black");
    }
}

function cell_click(sn) {
    name = $("#" + sn).text();
    site = $("#" + sn).attr('url');

    if (window.editable) {
        window.selected_cell = sn;
        make_new_layer();
    }
    else {
        if (name == '--') {
            return;
        }
        window.open(site);
    }
}

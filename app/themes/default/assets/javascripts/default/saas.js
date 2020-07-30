//= require jquery/external/sizzle/dist/sizzle
//= require bootstrap/dist/js/bootstrap
//= require metismenu/dist/metisMenu
//= require jquery-mousewheel/jquery.mousewheel
//= require malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar
//= require node-waves/dist/waves.min
//= require toastr/build/toastr.min
//= require html5shiv/dist/html5shiv.min
//= require underscore/underscore-min
//= require bootstrap-select/dist/js/bootstrap-select
//= require moment/min/moment.min
//= require saas/common.js
//= require saas/demo-switch

var sortableBlock, set_positions;

set_positions = function () {
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panel.panel-default').each(function (i) {
        $(this).attr("data-pos", i + 1);
    });
}


sortableBlock = function () {
    $(".sortable-block").nestedSortable({
        disableNestingClass: 'no-nest',
        listType: 'ul',
        opacity: 0.6,
        handle: '.handle',
        items: "li:not(.dontsortme)",
        toleranceElement: '> div',
        connectWith: '.sortable-block',
        update: function (event, ui) {
            var finalstring = '';
            $('.no-nest').each(function (i) {
                if ($(this).data("id")) {
                    var id = $(this).data("id");
                    var region = $(this).parent().data('id');
                    console.log($(this).parent().data('id'));
                    finalstring = finalstring + 'blocks' + '[' + i + ']' + '[id]=' + id + '&' + 'blocks' + '[' + i + '][region]=' + region + '&' + 'blocks' + '[' + i + '][position]=' + i + '&';
                }
            });
            $.post("/admin/blocks/sort", finalstring);
        }
    });
}

$(document).ready(sortableBlock);

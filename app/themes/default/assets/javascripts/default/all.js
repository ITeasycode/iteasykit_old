// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery/dist/jquery
//= require jquery2
//= require jquery-ui
//= require jquery-ui/widgets/sortable
//=require jquery.mjs.nestedSortable.js

//= require rails-ujs
//= require activestorage
//= require underscore/underscore
//= require rails_sortable
//= require ckeditor/init



$(function() {
    $('.sortable').railsSortable();
});
$(document).ready(function(){

    $('.sortable_tree').each(function() {
        $(this).nestedSortable({
            forceHelperSizeType: true,
            errorClass: 'cantdoit',
            disableNesting: 'cantdoit',
            handle: '> .item',
            helper:	'clone',
            listType: 'ol',
            items: 'li',
            opacity: 0.6,
            placeholder: 'placeholder',
            revert: 250,
            maxLevels: $(this).data('max-levels'),
            //maxLevels: #{options[:max_levels] || 5},
            //tabSize: 20,
            // protectRoot: $(this).data('protect-root'),

            // prevent drag flickers
            tolerance: 'pointer',
            toleranceElement: '> div',
            isTree: true,
            startCollapsed: false,
            //startCollapsed: $(this).data("start-collapsed"),

            relocate: function(){
                //$(this).nestedSortable("disable");
                var data = $(this).nestedSortable("serialize");
                var url = "/admin/menu_items/sort";

                // update on server
                $.ajax({
                    url: url,
                    type: "post",
                    data: data
                }).always(function(){
                    //$(this).nestedSortable("enable");

                    $(this).find('.item').each(function(index){
                        if (index % 2){
                            $(this).removeClass('odd').addClass('even');
                        }else{
                            $(this).removeClass('even').addClass('odd');
                        }
                    });

                }).done(function(data){

                }).fail(function(jqXHR, textStatus){

                });


                //$(this).nestedSortable("enable");
            }
        }); // nested tree
    });


}); // document.ready
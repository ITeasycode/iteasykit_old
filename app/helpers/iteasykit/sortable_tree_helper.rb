module Iteasykit::SortableTreeHelper

  def sortable_tree_render_nested_groups_custom(groups, opts={})
    content_tag(:ol) do
      groups.map do |item, sub_groups|
        content_tag(:li, {id: "cat_#{item.id}"} ) do
          #(item.title +  sortable_tree_render_nested_groups(sub_groups, opts)).html_safe

          title = item.send(opts[:name_method] || :name) || ''

          s = content_tag(:div, {class: 'item'}) do
            (
                '<div class="cell left"> <i class="zmdi zmdi-arrows zmdi-hc-fw"></i>'\
            '<a href="'+menu_item_url(item)+'">'+title+'</a>'\
              ''+sortable_tree_build_actions(item, opts)+' </div>'
            ).html_safe
          end
          (s + sortable_tree_render_nested_groups(sub_groups, opts)).html_safe
        end

      end.join.html_safe
    end
  end


end
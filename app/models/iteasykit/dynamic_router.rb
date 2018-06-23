class Iteasykit::DynamicRouter
  def self.load
    if ActiveRecord::Base.connection.table_exists? 'iteasykit_entity_types'
      Rails.application.routes.draw do
        Iteasykit::EntityType.all.each do |rt|
          if ActiveRecord::Base.connection.column_exists?(:iteasykit_entity_types, :path_root_url)
            if rt.path_root_url
              if rt.model == 'Iteasykit::Taxonomy'
                 get '/*id', :to => "#{rt.rel_model.downcase.tableize}#show", :constraints => lambda { |r| Iteasykit::Taxonomy.friendly.find_by(iteasykit_entity_id: rt.id, url: r.params[:id]).present? }
              else
                get '/:id', :to => "#{rt.rel_model.downcase.tableize}#show", :constraints => lambda { |r| rt.rel_model.constantize.friendly.find_by(iteasykit_entity_id: rt.id, url: r.params[:id]).present? }
              end
            else
              get "/#{rt.machine_name}/:id", :to => "#{rt.rel_model.downcase.tableize}#show"
            end
          end
        end
      end
    end
  end

  def self.reload
    Rails.application.routes_reloader.reload!
  end
end

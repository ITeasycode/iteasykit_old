module Iteasykit
  class Form < ApplicationRecord
    translates :slug
    extend FriendlyId
    friendly_id :slug, :use => [:slugged, :finders, :globalize, :history]
    belongs_to :iteasykit_entity_type, class_name: "Iteasykit::EntityType"
    belongs_to :iteasykit_seomore, optional: true
    has_many :fcis, as: :fciable
<<<<<<< HEAD
    after_create :send_email_admin
    include Humanizer
    require_human_on :create
=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23


    def field(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      if fci
        m = ('Iteasykit::Fci'+fci.type_fci.camelize).constantize
        mf = m.find_by(iteasykit_fci_id: fci.id, fieldable_type: 'Iteasykit::Form', fieldable_id: id)
        if mf
          if mf.value.class == String
            mfv = mf.value.html_safe
          else
            mfv = mf.value
          end
        end
      end
    end


    def field_name(name)
      fci = Iteasykit::Fci.find_by_machine_name(name)
      fci.name if fci
    end

<<<<<<< HEAD
    def send_email_admin
      thr = Thread.new {
        sleep 10
        subject = iteasykit_entity_type.name
        @entity = self
        ApplicationMailer.test_welcome_email("info.ua@profine-group.com", subject, @entity).deliver
        ApplicationMailer.test_welcome_email('franckire62@gmail.com', subject, @entity).deliver
      }

    end
=======
>>>>>>> da5d6b72830a0014e83c8edcc709afe275c69b23


  end
end

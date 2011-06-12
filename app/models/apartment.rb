class Apartment < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos

  # apartment.send I18.locale.to_s + '_address'
  # модель apartment-объеет, a en_address- название столбца в таблице
  # to_s - преобразовать в строку для последующей конкатенации
  # EE -- {{lang}_apartments}

  %w(address description).each do |method|
    class_eval %{
      def #{method}
        send I18n.locale.to_s + '_#{method}'
      end
    }
  end

  %w(ru_address 
     ro_address 
     en_address 
     ru_description 
     ro_description 
     en_description).each do |method|
    class_eval %{
      def #{method}
        super.force_encoding 'UTF-8' if super
      end
    }
  end

end

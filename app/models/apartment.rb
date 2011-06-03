class Apartment < ActiveRecord::Base
  has_many :photos

  # apartment.send I18.locale.to_s + '_address'
  # модель apartment-объеет, a en_address- название столбца в таблице
  # to_s - преобразовать в строку для последующей конкатенации
  # EE -- {{lang}_apartments}
  def address
    send I18n.locale.to_s + '_address'
  end
  def description
    send I18n.locale.to_s + '_description'
  end

  def ru_address
    super.force_encoding 'UTF-8' if super
  end

  def ro_address
    super.force_encoding 'UTF-8' if super
  end

  def ru_description
    super.force_encoding 'UTF-8' if super
  end

  def ro_description
    super.force_encoding 'UTF-8' if super
  end
end

# 5.abs
# a = Apartment.create ...
# a.address
class Apartment < ActiveRecord::Base

  # apartment.send I18.locale.to_s + '_address'
  # модель apartment-объеет, a en_address- название столбца в таблице
  # to_s - преобразовать в строку для последующей конкатенации
  # EE -- {{lang}_apartments}
  def address
    self.send I18n.locale.to_s + '_address'
  end

end

# 5.abs
# a = Apartment.create ...
# a.address
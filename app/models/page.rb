class Page < ActiveRecord::Base
  before_save :create_url_title
  def create_url_title
    self.url = en_title.downcase.split.join('_')
  end

  
  def body
    self.send "#{I18n.locale.to_s}_body"
  end
end

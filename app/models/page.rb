class Page < ActiveRecord::Base
  before_save :create_url_title
  def create_url_title
    self.url = en_title.downcase.split.join('_')
  end

  
  def body
    send "#{I18n.locale.to_s}_body"
  end


  def ro_title
    super.force_encoding 'UTF-8'
  end

  def ru_title
    super.force_encoding 'UTF-8'
  end

  def ro_body
    super.force_encoding 'UTF-8'
  end

  def ru_body
    super.force_encoding 'UTF-8'
  end

  def title
    send "#{I18n.locale.to_s}_title"
  end
end

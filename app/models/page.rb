class Page < ActiveRecord::Base
  before_save :create_url_title
  def create_url_title
    self.url = en_title.downcase.split.join('_')
  end

  %w(title body).each do |method|
    class_eval %{
      def #{method}
        send I18n.locale.to_s + '_#{method}'
      end
    }
  end

  %w(ro_body
     ru_body 
     en_body).each do |method|
    class_eval %{
      def #{method}
        RedCloth.new(super.force_encoding 'UTF-8').to_html.html_safe if super
      end
    }
  end

  %w(ro_title
     ru_title
     en_title).each do |method|
    class_eval %{
      def #{method}
        super.force_encoding 'UTF-8'
      end
    }
  end
end

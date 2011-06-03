module ApplicationHelper


  def red_h2 str
    "<h2>#{first_red_letter str}</h2>".html_safe
  end

  def first_red_letter str
    "<span>#{str[0].capitalize}</span>#{str[1..-1].gsub("_", " ")}".html_safe
  end

  def i18n_link_to link_word, href
    link_to link_word, href + "?language=#{I18n.locale}"
  end
end


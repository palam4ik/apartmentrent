class ApplicationController < ActionController::Base
  protect_from_forgery

  # /apartments/:id?language=ru
  # /apartments?language=ru
  # /apartments
  # $_GET $_POST
  # params[:language]
  before_filter :set_language
  def set_language
    # Если params[:locale] равно nil, то будет использовано I18n.default_locale
    I18n.locale = params[:language] || cookies[:language] || :en
    #если метод должен вернуть либо true либо  faulse, то после него ставится ? например include?
    
    redirect_to root_url unless %w(ru ro en).include? I18n.locale.to_s
  end

  def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
end

end


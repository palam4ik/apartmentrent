class ApplicationController < ActionController::Base
  
  # перенаправляем в админку как пользователь авторизировался
  def after_sign_out_path_for resource_or_scope
    admin_root_path
  end

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
#
#  def default_url_options(options={})
#    { :language => I18n.locale } # if I18n.locale != :en
#  end

end


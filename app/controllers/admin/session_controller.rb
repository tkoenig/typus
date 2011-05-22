class Admin::SessionController < Admin::BaseController

  skip_before_filter :reload_config_and_roles
  skip_before_filter :authenticate

  before_filter :create_an_account?, :only => [:new, :create]

  def new
  end

  def create
    user = user_scope.authenticate(params[:typus_user][:email], params[:typus_user][:password])

    path = if user
             session[:typus_user_id] = user.id
             params[:back_to] || root_path
           else
             new_session_path(:back_to => params[:back_to])
           end

    redirect_to path
  end

  def destroy
    deauthenticate
  end

  private

  def create_an_account?
    redirect_to new_account_path if zero_users
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end

  def user_scope
    if Typus.user_class.respond_to?(:in_domain)
      Typus.user_class.in_domain(request.host)
    else
      Typus.user_class
    end
  end

end

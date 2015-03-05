class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
before_action :authenticate_user!  

before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
           #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
        end




  helper_method :find_album
  def find_album(id)
    Album.find(:first, :conditions => [ "id = ?", id ])
  end

  helper_method :current_album
  def current_album
    @current_album ||= (session[:album_id] ? find_album(session[:album_id]) : nil)
  end

  helper_method :current_album=
  def current_album=(id)
    if current_user
      session[:album_id] = id
    else
      session[:album_id] = nil
    end
  end

  helper_method :all_albums
  def all_albums
    if current_user
      return current_user.albums
    else
      return Album.find(:all, :order => "id DESC", :limit => 20 )
    end
  end

  helper_method :all_pictures
  def all_pictures
    if current_user
      return current_user.pictures
    else
      return Picture.find(:all, :order => "id DESC", :limit => 20 )
    end
  end

  helper_method :user_albums
  def user_albums
    if current_user
      return current_user.albums
    else
      return []
    end
  end

  helper_method :current_user_owns?
  def current_user_owns?(item)
    logged_user = current_user
    return true if logged_user && logged_user.id == item.user_id
    false
  end
end

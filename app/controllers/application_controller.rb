# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"      # use app/views/layouts/devise.html.erb
    else
      "application" # default layout with header/footer
    end
  end
end

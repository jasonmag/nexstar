module Admin
  class ProfilesController < BaseController
    before_action :set_profile

    def show
    end

    def edit
    end

    def update
      if @profile.update(profile_params)
        redirect_to edit_admin_profile_path, notice: "Profile updated successfully."
      else
        flash.now[:alert] = "There was a problem updating the profile."
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_profile
      @profile = Profile.first_or_create!
    end

    def profile_params
      params.require(:profile).permit(
        :name,
        :role,
        :hero_title,
        :hero_subtitle,
        :intro,
        :who_i_am,
        :what_i_do,
        :highlights,
        :toolbox,
        :availability_message,
        :email,
        :github_url,
        :linkedin_url
      )
    end
  end
end

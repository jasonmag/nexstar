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
      profile = params.require(:profile)

      {
        name:                 profile[:name],
        role:                 profile[:role],
        hero_title:           profile[:hero_title],
        hero_subtitle:        profile[:hero_subtitle],
        intro:                profile[:intro],
        who_i_am:             profile[:who_i_am],
        what_i_do:            profile[:what_i_do],
        highlights:           profile[:highlights],
        toolbox:              profile[:toolbox],
        availability_message: profile[:availability_message],
        email:                profile[:email],
        github_url:           profile[:github_url],
        linkedin_url:         profile[:linkedin_url]
      }
    end
  end
end

class ProfilesController < ApplicationController
    def update
        if current_user.update(user_params)
            UpdateUserJob.perform_later(current_user.id)
            flash[:notice] = 'Your profile has been updated'
            rewdirect_to root_path
        else
            flash[:notice] = 'There was an error'
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email)
    end
end

class LocationController < ApplicationController
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to root_path, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      if params[:id] == nil
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

    def user_params
      accessible = [ :longitude, :latitude ] # extend with your own params
      params.require(:user).permit(accessible)
    end
end

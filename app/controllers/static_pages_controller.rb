class StaticPagesController < ApplicationController

  def setup_user
  end

  def home
    @user = current_user
  end

  def about
  end

  def contact
  end

end

class StaticPagesController < ApplicationController

  def home
    @facebook_status = 'unconnected'
    @twitter_status = 'unconnected'
    @linkedin_status = 'unconnected'
  end

  def about
  end

  def contact
  end

end

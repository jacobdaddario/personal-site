class StaticPagesController < ApplicationController
  def home
    @user = User.find_by(email: "jake.daddario@gmail.com")
  end

  def contact
  end
end

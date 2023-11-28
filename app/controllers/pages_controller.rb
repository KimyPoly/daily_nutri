class PagesController < ApplicationController
  def home
  end

  def programs_dashboard
    @user = current_user
    @programs = Program.all
    @program = Program.new
  end
end

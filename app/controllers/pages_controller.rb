class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:programs_dashboard]
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def programs_dashboard
    @user = current_user
    @programs = Program.all
    @program = Program.new
  end
end

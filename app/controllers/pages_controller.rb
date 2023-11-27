class PagesController < ApplicationController
  def home
  end

  def programs_dashboard
    @programs = Program.all
  end
end

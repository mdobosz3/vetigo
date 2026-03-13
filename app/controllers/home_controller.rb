class HomeController < ApplicationController
  def index
    @clinics = Clinic.all
  end
end

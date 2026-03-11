class HomeController < ApplicationController
  def index
    @clinics = Clinic.all # Pobierz wszystko na próbę, żeby wykluczyć błędy filtrowania
    puts "DEBUG: Liczba klinik w bazie: #{@clinics.count}" # To zobaczysz w terminalu bin/dev
  end
end

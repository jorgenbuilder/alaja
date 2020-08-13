class PagesController < ApplicationController
    def home
        @band_name = BandName.last
        logger.debug "Someone named the band #{@band_name.name} on #{@band_name.date}"
        @sessions = Session.all.order(date: :desc)
    end
end
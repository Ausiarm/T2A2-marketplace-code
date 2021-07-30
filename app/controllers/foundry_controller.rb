class FoundryController < ApplicationController
  def page
    @listings = Listing.all
  end
end

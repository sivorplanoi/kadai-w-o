class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to listspage_url
    end
  end
end

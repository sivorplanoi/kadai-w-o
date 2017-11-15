class InitialdisplaysController < ApplicationController
  before_action :sign_in_required


  def create

    @initialdisplay = Initialdisplay.find_or_create_by(username: current_user.id)
    @initialdisplay.initialdisplay_key = params[:initialdisplay_key]
    
    if @initialdisplay.save
    else
    end

   
  end

  def update
  end

  def destroy
  end
  
  
  private

  def initialdisplay_params
    params.require(:initialdisplay).permit(:initialdisplay_key,:username)
  end
  
end

class GroupsController < ApplicationController
  before_action :sign_in_required

  def create
    
    @group = current_user.groups.build(group_params)

    if @group.save
      flash[:success] = 'グループ「' + @group.name + '」を作成しました'
      
      initialdisplay = Initialdisplay.find_or_create_by(username: current_user.id)
      initialdisplay.initialdisplay_key = (params[:belonging_groups_counts].to_i + 1).to_s
      initialdisplay.save
      
      @relationship = @group.relationships.create(user_id: current_user.id)
      @relationship.save
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'グループの作成に失敗しました'
      redirect_back(fallback_location: root_path)
    end
    
  end

  def destroy
    
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name)
  end
  
end

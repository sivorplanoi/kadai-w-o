class RelationshipsController < GroupsController
  before_action :sign_in_required


  def create
    user = User.find_by(setting_id: relationship_params[:add_member_id])
    unless (user == nil)
      unless (Group.find_by(id: params[:current_group]).already_this_group?(user))
        Group.find_by(id: params[:current_group]).join_this_group(user)
        flash[:success] = user.setting_name + 'さんがグループ「' + Group.find_by(id: params[:current_group]).name + '」に加入しました'
      else
        flash[:danger] = user.setting_name + 'さんはグループ「' + Group.find_by(id: params[:current_group]).name + '」に加入済みです'
      end
    else
      flash[:danger] = 'ID:' + relationship_params[:add_member_id] + 'は存在しません'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end
  
  private

  def relationship_params
    params.permit(:add_member_id)
  end
  
  
end

class GrouplistsController < ApplicationController
  before_action :sign_in_required

  def create
    @grouptabs = Group.find_by(id: params[:current_group]).grouptabs.order('created_at DESC')
    @active_grouptab = @grouptabs.find_by(active: 'active')
    @grouplist = @active_grouptab.grouplists.build(grouplist_params)
    
    if params[:classificationEach]
      @grouplist.classification = params[:classificationEach]
    end
    
    if @grouplist.save
      flash[:success] = '項目「' + @grouplist.content + '」を追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '項目の追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    grouplist = Grouplist.find_by(id: params[:id])

    flash[:success] = '項目「' + grouplist.content + '」を削除しました'
    grouplist.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def grouplist_params
    params.require(:grouplist).permit(:content, :limit, :classification)
  end

end

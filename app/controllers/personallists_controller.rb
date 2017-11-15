class PersonallistsController < ApplicationController
  before_action :sign_in_required
  
  def create
    @personaltabs = current_user.personaltabs.order('created_at DESC')
    @active_personaltab = @personaltabs.find_by(active: 'active')
    @personallist = @active_personaltab.personallists.build(personallist_params)
    
    if params[:classificationEach]
      @personallist.classification = params[:classificationEach]
    end
    
    if @personallist.save
      flash[:success] = '項目「' + @personallist.content + '」を追加しました'
      redirect_to listspage_url(selected_class: params[:classification])
    else
      flash[:danger] = '項目の追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    personallist = Personallist.find_by(id: params[:id])

    flash[:success] = '項目「' + personallist.content + '」を削除しました'
    personallist.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def personallist_params
    params.require(:personallist).permit(:content, :limit, :classification)
  end
  
end

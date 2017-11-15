class PersonaltabsController < ApplicationController
  before_action :sign_in_required
  before_action :correct_user, only: [:destroy]

  def create
    @personaltab = current_user.personaltabs.build(personaltab_params)
    if @personaltab.save
      flash[:success] = 'リスト「' + @personaltab.name + '」を作成しました'
      redirect_to listspage_url(active_personaltab_id: @personaltab.id)
    else
      flash[:danger] = 'リストの作成に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    relation_persolallists = @personaltab.personallists
    if relation_persolallists
      relation_persolallists.each do |d|
        d.destroy
      end
    end
    
    relation_persolalclassification = @personaltab.personalclassifications
    if relation_persolalclassification
      relation_persolalclassification.each do |d|
        d.destroy
      end
    end
    

    flash[:success] = 'リスト「' + @personaltab.name + '」を削除しました'
    @personaltab.destroy
    redirect_to listspage_url
  end

  private

  def personaltab_params
    params.require(:personaltab).permit(:name)
  end
  
  def correct_user
    @personaltab = current_user.personaltabs.find_by(id: params[:id])
    unless @personaltab
      redirect_to root_url
    end
  end
  
end

class PersonalclassificationsController < ApplicationController
  before_action :sign_in_required

  def create
    @personaltabs = current_user.personaltabs.order('created_at DESC')
    @active_personaltab = @personaltabs.find_by(active: 'active')
    @personalclassification = @active_personaltab.personalclassifications.build(personalclassification_params)
    
    if @active_personaltab.personalclassifications.find_by(classification: @personalclassification.classification)
      flash[:danger] = 'ラベル「' + @personalclassification.classification + '」はすでに存在します'
      redirect_back(fallback_location: root_path)
    else
      if @personalclassification.save
        flash[:success] = 'ラベル「' + @personalclassification.classification + '」を追加しました'
        redirect_to listspage_url(active_personaltab_id: @personalclassification.personaltab_id)
      else
        flash[:danger] = 'ラベルの追加に失敗しました'
        redirect_back(fallback_location: root_path)
      end
    end

  end

  def destroy
    personalclassification = Personalclassification.find_by(id: params[:id])

    if ((personalclassification.personaltab.personalclassifications.count > 1))
      flash[:success] = 'ラベル「' + personalclassification.classification + '」を削除しました'
    elsif personalclassification.classification != '標準'
        flash[:success] = 'ラベル「' + personalclassification.classification + '」を削除しました'
        flash[:danger] = 'ラベルが全て無くなると「標準」が自動的に追加されて表示されます'
    else
      flash[:danger] = 'ラベルが全て無くなると「標準」ラベルが自動的に追加されて表示されます'
    end
      
    personalclassification.personaltab.personallists.each do |pl|
      if pl.classification == personalclassification.classification
        pl.destroy
      end
    end
    
    
    personalclassification.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def personalclassification_params
    params.require(:personalclassification).permit(:classification)
  end
  
end

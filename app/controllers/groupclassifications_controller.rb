class GroupclassificationsController < ApplicationController
  before_action :sign_in_required

  def create
    @grouptabs = Group.find_by(id: params[:current_group]).grouptabs.order('created_at DESC')
    @active_grouptab = @grouptabs.find_by(active: 'active')
    @groupclassification = @active_grouptab.groupclassifications.build(groupclassification_params)
    
    if @active_grouptab.groupclassifications.find_by(classification: @groupclassification.classification)
      flash[:danger] = 'ラベル「' + @groupclassification.classification + '」はすでに存在します'
      redirect_back(fallback_location: root_path)
    else
      if @groupclassification.save
        flash[:success] = 'ラベル「' + @groupclassification.classification + '」を追加しました'
        redirect_to listspage_url(active_grouptab_id: @groupclassification.grouptab_id)
      else
        flash[:danger] = 'ラベルの追加に失敗しました'
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    
    groupclassification = Groupclassification.find_by(id: params[:id])

    if ((groupclassification.grouptab.groupclassifications.count > 1))
      flash[:success] = 'ラベル「' + groupclassification.classification + '」を削除しました'
    elsif groupclassification.classification != '標準'
        flash[:success] = 'ラベル「' + groupclassification.classification + '」を削除しました'
        flash[:danger] = 'ラベルが全て無くなると「標準」が自動的に追加されて表示されます'
    else
      flash[:danger] = 'ラベルが全て無くなると「標準」ラベルが自動的に追加されて表示されます'
    end

    groupclassification.grouptab.grouplists.each do |gl|
      if gl.classification == groupclassification.classification
        gl.destroy
      end
    end
    
   
    groupclassification.destroy
    redirect_back(fallback_location: root_path)
    
  end

  private

  def groupclassification_params
    params.require(:groupclassification).permit(:classification)
  end

 
end

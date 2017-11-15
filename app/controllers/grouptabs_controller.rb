class GrouptabsController < ApplicationController
  before_action :sign_in_required

  def create
    @grouptab = Group.find_by(id: params[:current_group]).grouptabs.build(grouptab_params)
    
    temp = ('active_grouptab_id_' + params[:createtab_groupindex].to_s).to_sym
    if @grouptab.save
      flash[:success] = 'リスト「' + @grouptab.name + '」を作成しました'
      redirect_to listspage_url(temp => @grouptab.id)
    else
      flash[:danger] = 'リストの作成に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    
    @grouptab = Grouptab.find_by(id: params[:id])
    
    relation_grouplists = @grouptab.grouplists
    if relation_grouplists
      relation_grouplists.each do |d|
        d.destroy
      end
    end
    
    relation_groupclassification = @grouptab.groupclassifications
    if relation_groupclassification
      relation_groupclassification.each do |d|
        d.destroy
      end
    end
    
    flash[:success] = 'リスト「' + @grouptab.name + '」を削除しました'
    @grouptab.destroy
    redirect_to listspage_url
  end

  private

  def grouptab_params
    params.require(:grouptab).permit(:name)
  end
  
    

end

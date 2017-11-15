class ListsController < ApplicationController
  before_action :sign_in_required
  
  def index
    @personaltab = current_user.personaltabs.build
    @personaltabs = current_user.personaltabs.order('created_at DESC')
    if @personaltabs.empty?
      @default_personaltab = current_user.personaltabs.build
      @default_personaltab.name = '初期リスト'
      @default_personaltab.save
    end

    active_personaltab_select 

    @personalclassification = @active_personaltab.personalclassifications.build
    @personalclassifications = @active_personaltab.personalclassifications.order('created_at ASC')
    if  @personalclassifications.empty?
      @default_personalclassification = @active_personaltab.personalclassifications.build
      @default_personalclassification.classification = '標準'
      @default_personalclassification.save
    end
    
    #@selected_class = @personalclassifications.find_by(classification: params[:selected_class])
    #unless @selected_class
    #  @selected_class = @personalclassifications.first
    #end
    
    @personallist = @active_personaltab.personallists.build
    @personallists = @active_personaltab.personallists.order('created_at ASC')    
    
    @group = current_user.groups.build
    
    @belonging_groups_counts = current_user.belonging_groups.count
    
    @relationship = current_user.relationships.build    
    
    counts(current_user)
    
    
    #------------------------------------------ここまでpersonal用
    
    #------------------------------------------ここからgroup用
    @active_grouptab = []
    @grouptab = []
    @grouptabs = []
    @grouplist = []
    @groupclassifications = []
    @selected_class_group = []
    @groupclassification = []
    @grouplists = []
    @groupmembers = []
    
    group_i = 0
    current_user.belonging_groups.each do |g|
      @groupmembers[group_i] = g.members.order('created_at DESC')
      @grouptab[group_i] = g.grouptabs.build
      @grouptabs[group_i] = g.grouptabs.order('created_at DESC')
      if @grouptabs[group_i].empty?
        @default_grouptab = g.grouptabs.build
        @default_grouptab.name = '初期リスト'
        @default_grouptab.save
        
      end





      temp = ('active_grouptab_id_' + group_i.to_s).to_sym 

      if (params[temp] && @grouptabs[group_i].find_by(id: params[temp]))
        @active_grouptab[group_i] = @grouptabs[group_i].find_by(id: params[temp])
      elsif @grouptabs[group_i].find_by(active: 'active')
        @active_grouptab[group_i] = @grouptabs[group_i].find_by(active: 'active')
      else
        @active_grouptab[group_i] = @grouptabs[group_i].first
      end
      if @grouptabs[group_i].find_by(active: 'active')
        @grouptabs[group_i].find_by(active: 'active').update(active: '')
      end
      @grouptabs[group_i].find_by(id: @active_grouptab[group_i].id).update(active: 'active')

      @groupclassification[group_i] = @active_grouptab[group_i].groupclassifications.build
      @groupclassifications[group_i] = @active_grouptab[group_i].groupclassifications.order('created_at ASC')
      if  @groupclassifications[group_i].empty?
        @default_groupclassification = @active_grouptab[group_i].groupclassifications.build
        @default_groupclassification.classification = '標準'
        @default_groupclassification.save
      end
      
      
      
      
      #@selected_class_group[group_i] = @groupclassifications[group_i].find_by(classification: params[:selected_class])
      #unless @selected_class_group[group_i]
      #  @selected_class_group[group_i] = @groupclassifications[group_i].first
      #end
      
      @grouplist[group_i] = @active_grouptab[group_i].grouplists.build
      @grouplists[group_i] = @active_grouptab[group_i].grouplists.order('created_at ASC')    
      
      # @group = current_user.groups.build
      # @relationship = current_user.relationships.build    
      # counts(current_user) 
      
      group_i = group_i + 1
      
    end
    
    unless (Initialdisplay.find_by(username: current_user.id) == nil)
      @initialdisplay_hidden_tag = Initialdisplay.find_by(username: current_user.id).initialdisplay_key
    else
      @initialdisplay_hidden_tag = 0
    end
    
  end

  def show
  end

  private

  def active_personaltab_select 
    if (params[:active_personaltab_id] && @personaltabs.find_by(id: params[:active_personaltab_id]))
      @active_personaltab = @personaltabs.find_by(id: params[:active_personaltab_id])
    elsif @personaltabs.find_by(active: 'active')
      @active_personaltab = @personaltabs.find_by(active: 'active')
    else
      @active_personaltab = @personaltabs.first
    end
    if @personaltabs.find_by(active: 'active')
      @personaltabs.find_by(active: 'active').update(active: '')
    end
    @personaltabs.find_by(id: @active_personaltab.id).update(active: 'active')
  end
   
end

class ItemsController < ApplicationController
    before_action :authenticate_user!
    
    def toggle
        @user = User.find(params[:user_id])
        @item = @user.items.find(params[:item_id])
        
        @item.update_attribute(:completed, !@item.completed)
        
        redirect_to current_user
    end
    
    
    def create
        @user = User.find(params[:user_id])
        @item = @user.items.new(todo_params)
        @item.expires_at = Time.now + 7.days
        if @item.save
            flash[:notice] = "Item was save successfully."
        else
            flash[:alert] = "Item did not save. Please try again."
 
        end
        redirect_to current_user
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @item = @user.items.find(params[:id])
        
        if @item.destroy
            flash[:notice] = "Item was deleted."
            redirect_to current_user
        else
            flash[:alert] = "Item was not deleted."
            redirect_to current_user
        end
    end
    
    private
    
    def todo_params
        params.require(:item).permit(:description)
    end
end

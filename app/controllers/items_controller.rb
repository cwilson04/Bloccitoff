class ItemsController < ApplicationController
    before_action :authenticate_user!
    
    
    def create
        @user = User.find(params[:user_id])
        @item = @user.items.new(todo_params)
        @item.user = current_user
        
        if @item.save
            flash[:notice] = "Item was save successfully."
            redirect_to current_user
        else
            flash[:alert] = "Item did not save. Please try again."
            redirect_to current_user
        end
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

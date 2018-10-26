# class FriendsController < ApplicationController
#
#   before_action :set_user
#
#   def friend_button_clicked
#     Friend.create(user_id: User.find(session[:user_id]), friend_id: @user.id)
#     redirect_to user_path(@user)
#   end
#
#
#   private
#
#   def set_user
#     @user = User.find(params[:id])
#   end
#
# end

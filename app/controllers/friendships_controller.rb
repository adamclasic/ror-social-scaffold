class FriendshipsController < ApplicationController
  def send_request
    if current_user.send_request(params[:user_id])
      redirect_to users_path, notice: 'Friend request sent'
    else
      flash.now[:notice] = 'something went wrong'
    end
  end

  def confirm_request
    if current_user.confirm_friend(params[:user_id])
      redirect_to users_path, notice: 'Friend request accepted'
    else
      flash.now[:notice] = 'something went wrong'
    end
  end

  def reject_request
    if current_user.reject_friend(params[:user_id])
      redirect_to users_path, notice: 'Friend request denied'
    else
      flash[:notice] = 'something went wrong'
    end
  end

  def pending_requests
    @pending_requests = current_user.pending_friends
  end

  def all_friends
    @all_friends = current_user.friends
  end

  def unfriend
    friend = Friendship.find_by(user_id: params[:user_id], friend_id: current_user.id)
    inverse_friend = Friendship.find_by(user_id: current_user.id, friend_id: params[:user_id])
    friend&.delete
    inverse_friend&.delete
    redirect_to users_path 
end

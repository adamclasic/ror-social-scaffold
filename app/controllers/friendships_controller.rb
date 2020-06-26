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
    user = User.find(params[:user_id])
    remove_friend = current_user.friendships.find_by_friend_id(user)
    if remove_friend
      remove_friend.delete
      redirect_to users_path, notice: 'Friend removed'
    else
      flash.now[:notice] = 'something went wrong'
    end
  end
end

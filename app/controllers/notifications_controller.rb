class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_notifications, if: :signed_in?

  def index
    @notifications = Notification.where(user_id: current_user.id).order(created_at: :desc)
  end

  def current_notifications
    @notifications = Notification.where(user_id: current_user.id).where(read: false).order(created_at: :desc)
  end
end

class NotificationsController < ApplicationController

  def index
    @genres = Genre.all
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
    notification.update_attributes(checked: true)
    end
  end
  

end

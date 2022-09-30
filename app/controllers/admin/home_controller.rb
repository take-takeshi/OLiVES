class Admin::HomeController < Admin::ApplicationController
  def index
    @conferences = Conference.all.order('start_date desc')
  end
end

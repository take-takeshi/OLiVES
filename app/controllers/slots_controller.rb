class SlotsController < ApplicationController
  def show
    @slot = Slot.find(params[:id])
    @user = current_user
    @participation = Participation.find_by(user: @user, slot: @slot)

  #@seealsoを計算
  conf = @slot.track.day.conference
  @slots = Slot.joins(:participations).where(participations: { conference: conf }) - [ @slot ]
  su = {}
  @slots&.each{|s|
    l = (s.users & @slot.users).length
    su[s] = l if l >= 3
  }
  @seealso = su.sort_by{|k,v| v}.reverse.first(3).map{|k,v| k} if su.length > 0
  end

end

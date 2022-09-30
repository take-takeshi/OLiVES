class Slot < ApplicationRecord
  belongs_to :track
  has_many :presentations, dependent: :destroy
  has_many :participations
  has_many :users, through: :participations
  
  def pdatetime
    start_time.strftime("%Y年%m月%d日") + " " + 
      start_time.strftime("%H:%M") + " - " + 
      end_time.strftime("%H:%M")
  end

  def ptime
    start_time.strftime("%H:%M") + " - " + end_time.strftime("%H:%M")
  end

end

class Day < ApplicationRecord
  has_many :tracks, dependent: :destroy
  #外部キーのnilを許可する(optional: true)
  belongs_to :conference, optional: true
  
  def pdate
    (conference.start_date+seq_no).strftime("%Y年%m月%d日")
  end
end

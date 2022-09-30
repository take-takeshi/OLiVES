class Admin::DaysController < Admin::ApplicationController
  def edit
    @day = Day.find(params[:id])
  end

  def update
    d = Day.find(params[:id])
    p = day_params
    title = p[:title]
    desc = p[:description]
    num_track = p[:num_track]

    if title == ''
      flash[:alert] = 'タイトルは必須です。'
      redirect_to edit_admin_day_path(d)
    else
      d.title = title
      d.description = desc
      d.save

      if num_track != nil
        num_track.to_i.times{|i|
          d.tracks <<
          Track.create(title: 'The track ' + (i+1).to_s, seq_no: i, day_id: d.id)
        }
        flash[:notice] = 'トラックを追加しました。'
        redirect_to edit_admin_day_path(d)
        return
      end
      flash[:notice] = 'デイを更新しました。'
      redirect_to edit_admin_conference_path(d.conference)
    end
  end

  private
  def day_params
    params.require(:day).permit(:title, :description, :num_track)
  end
end

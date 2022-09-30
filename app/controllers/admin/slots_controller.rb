class Admin::SlotsController < Admin::ApplicationController
  def create
    p = slot_params
    title = p[:title]
    t = Track.find(params[:track_id])
    d = t.day

    date = (d.conference.start_date + d.seq_no).strftime("%Y-%m-%d ")
    stime = date + sprintf("%02d:%02d:00",
                           p['start_time(4i)'].to_i, p['start_time(5i)'].to_i)
    etime = date + sprintf("%02d:%02d:00",
                           p['end_time(4i)'].to_i, p['end_time(5i)'].to_i)
    if title == ''
      flash[:alert] = 'タイトルは必須です。'
    elsif etime < stime
      flash[:alert] = '時刻を正しく入れてください。'
    else
      s = Slot.create(title: title, start_time: stime, end_time: etime, track_id: t.id)
      t.slots << s
      flash[:notice] = 'セッションを追加しました。'
    end
    redirect_to edit_admin_track_path(t)
  end

  def destroy
    s = Slot.find(params[:id])
    t = s.track
    s.destroy
    flash[:notice] = 'セッションを削除しました。'
    redirect_to edit_admin_track_path(t)
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    p = slot_params
    title = p[:title]
    s = Slot.find(params[:id])
    t = s.track
    d = t.day
    
    date = (d.conference.start_date + d.seq_no).strftime("%Y-%m-%d ")
    stime = date + sprintf("%02d:%02d:00",
                           p['start_time(4i)'].to_i, p['start_time(5i)'].to_i)
    etime = date + sprintf("%02d:%02d:00",
                           p['end_time(4i)'].to_i, p['end_time(5i)'].to_i)

    if title == ''
      flash[:alert] = 'タイトルは必須です。'
    elsif etime < stime
      flash[:alert] = '時刻を正しく入れてください。'
    else
      s.update(p)
      flash[:notice] = 'セッションを更新しました。'
    end
    redirect_to edit_admin_track_path(t)

  end
  
  private
  def slot_params
    params[:slot].each{|k,v| params[:slot][k] = nil if v == ""}
    params.require(:slot).permit(:title, :description, :organizer, :chair, :lecturer, :room,
                                 :url, :audience, :level, :background, :category, :material, :mlinkurl, :start_time, :end_time, :track_id)
  end
 
end

class Admin::ConferencesController < Admin::ApplicationController
  def create
    p = conference_params
    name = p[:name]
    desc = p[:description]
    sdat = sprintf "%4d-%02d-%02d", p['start_date(1i)'].to_i, p['start_date(2i)'].to_i, p['start_date(3i)'].to_i
    dura = p[:duration]

    if name == ''
      flash[:alert] = 'イベント名は必須です。'
    else
      c = Conference.create(name: name, description: desc, start_date: sdat, duration: dura)
      
      logger.debug('「conferenceのIDは' + (c.id).to_s + '」')

      dura.to_i.times{|i|
        d = Day.create(title: 'The day ' + (i+1).to_s, seq_no: i, conference_id: c.id)
        logger.debug(d.inspect)
        c.days << d

      }

     flash[:notice] = '新規イベントを追加しました。'
    end
    redirect_to admin_root_path
  end

  def destroy
    conference = Conference.find(params[:id])
    conference.destroy
    flash[:notice] = 'イベントを削除しました。'
    redirect_to admin_root_path
  end

  def edit
    @conference = Conference.find(params[:id])
  end

  def update
    c = Conference.find(params[:id])
    p = conference_params
    name = p[:name]
    desc = p[:description]
    sdat = sprintf "%4d-%02d-%02d", p['start_date(1i)'].to_i, p['start_date(2i)'].to_i, p['start_date(3i)'].to_i
    dura = p[:duration]

    if name == ''
      flash[:alert] = 'イベント名は必須です。'
      redirect_to edit_admin_conference_path(c)
    
    elsif sdat != c.start_date.to_s or dura.to_i != c.duration
      flash[:alert] = '開催日もしくは日数は変更できません。'
      redirect_to edit_admin_conference_path(c)

    else
      c.update(p)
      flash[:notice] = 'イベントを更新しました。'
      redirect_to admin_root_path
    end
    
  end

  private
  def conference_params
    params.require(:conference).permit(:name, :description, :start_date, :duration)
  end

end

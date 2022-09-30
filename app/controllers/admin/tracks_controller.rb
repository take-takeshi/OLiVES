class Admin::TracksController < Admin::ApplicationController
  def edit
    @track = Track.find(params[:id])
  end

  def update
    t = Track.find(params[:id])
    p = track_params
    title = p[:title]
    desc = p[:description]
    
    if title == ''
      flash[:alert] = 'タイトルは必須です。'
      redirect_to edit_admin_path(t)
    else
      t.title = title
      t.description = desc
      t.save
      flash[:notice] = 'トラックを更新しました。'
      redirect_to edit_admin_day_path(t.day)
    end  
  end

  private
  def track_params
    params.require(:track).permit(:title, :description)
  end
end

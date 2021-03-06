class FilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    asset = Asset.find(params[:id])
    if current_user.admin? || can?(:view, asset.ticket.project)
      send_file asset.asset.path, filename: asset.asset_file_name,
                content_type: asset.asset.content_type
    else
      redirect_to root_path, alert: "The asset you were looking for could not be found."
    end
  end

  def new
    @ticket = Ticket.new
    asset = @ticket.assets.build
    render :partial => "files/form",
           :locals => { :number => params[:number].to_i,
                        :asset => asset }
  end

end

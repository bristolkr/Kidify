class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_, only: [:show]

  def show
    @attachment = @group.attachments.find(params[:id])
  end

  def new
    @attachment = current_user.attachments.new
  end

  def create
    @attachment = @group.attachments.new(attachment_params)
     if @attachment.save
       redirect_to group_attachments_path, notice: 'File was successfully uploaded.'
     else
       render :new
     end
  end

  private

  def set_attachment
    @attachment = @group.attachments.find(params[:id])
  end

  def set_group
    @group = current_user.membered_groups.find(params[:group_id])
  end

  def attachment_params
    params.require(:attachment).permit(:caption, :image, :document)
  end
end

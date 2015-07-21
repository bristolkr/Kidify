class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  # def show
  #   @attachments = @attachments.all
  # end

  def new
    @attachment = current_user.attachments.new
  end

  def create
    @attachment = current_user.attachments.new(attachment_params)

    respond_to do |format|
     if @attachment.save
       format.html { redirect_to users_path(current_user), notice: 'File was successfully uploaded.' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:caption, :image, :document, :user_id)
  end
end

class MessagesController < ApplicationController
  before_action :set_room
  def index
    @messages=@room.messages.all.paginate(:page=> params[:page], :per_page => 5 ).order('created_at DESC')

    respond_to do |format|
      format.html { render :index, layout: !request.xhr? }
      format.json { render :index }
    end
  end

  def create

    @message = current_user.messages.create(message_params.merge(room_id: @room.id))
    @messages=@room.messages.all.paginate(:page=> params[:page], :per_page => 5 ).order('created_at DESC')
    render partial: 'messages/messages'
  end

  def destroy
  end

  private

  def set_room
  @room=Room.find(params[:room_id])
  end

   def message_params
    params.require(:message).permit(:text)
  end

end

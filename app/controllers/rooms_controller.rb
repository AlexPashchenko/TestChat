class RoomsController < ApplicationController

  load_and_authorize_resource

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = @rooms.paginate(:page=> params[:page], :per_page => 6 ).order('created_at DESC')
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  @messages= @room.messages.paginate(:page=> params[:page], :per_page => 5 ).order('created_at DESC')

  render :show
  end

  # GET /rooms/new
  def new
  end

  # GET /rooms/1/edit
  def edit
     end


  # POST /rooms
  # POST /rooms.json
  def create

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update

    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title)
    end
end

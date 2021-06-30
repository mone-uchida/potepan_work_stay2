class RoomsController < ApplicationController
  
  def index
   @rooms = Room.all
  end

  def search
    @rooms = Room.where(['name LIKE(?) OR introduction LIKE(?) OR address LIKE(?)', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
    render "rooms/index"
  end

  def address
    @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    render "rooms/index"
  end

 def new
  @room = Room.new
  end

  def create
    @room = Room.new(
      name: params[:name],
      introduction: params[:introduction],
      price: params[:price],
      address: params[:address],
      user_id: @current_user.id,
      image_name: "default_room.jpg"
    )
      if @room.save
          image = params[:image]
          @room.image_name = "#{@room.id}.jpg"
          File.binwrite("public/room_images/#{@room.image_name}", image.read)
          @room.save
          flash[:notice]="ルームを登録しました"
          redirect_to("/")
      else
        flash[:notice]="入力内容にエラーがあります"
        render ("rooms/new")
      end
  end

  def record
    @rooms = Room.where(user_id: @current_user.id) 
   end

   def show
    @room = Room.find_by(id: params[:id])
    @reservation = Reservation.new
   end

   def reserve
    @room = Room.find_by(id: params[:id])
    people = params[:people]
    count_people = people.to_i
    @reservation = Reservation.new(
      user_id: @current_user.id,
      room_id: @room.id,
      start_at: params[:start_at],
      finish_at: params[:finish_at]
    )
  
    date1 = params[:start_at]
    date2 = params[:finish_at]

    days = date2.to_date - date1.to_date

    @reservation.total_price = @room.price * count_people * days.to_i
    
     if @reservation.save
        flash[:notice]="ルームを予約しました"
        redirect_to("/")
      else
        flash[:notice]="入力内容にエラーがあります"
        render ("rooms/show")
      end
    
   end

end

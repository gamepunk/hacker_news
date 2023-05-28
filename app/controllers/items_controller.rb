class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create update destroy ]
  load_and_authorize_resource

  layout "short", only: %i[ new ]

  # GET /items or /items.json
  def index
    @items = Item.page(params[:page])
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, layout: "short", status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    if current_user.role == "publisher"
      @item.destroy

      respond_to do |format|
        format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def vote
    @item.score += 1
  end

  def newest
    @items = Item.order("id desc").page(params[:page])
    render "items/index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :url, :text, :score, :user_id)
    end
end

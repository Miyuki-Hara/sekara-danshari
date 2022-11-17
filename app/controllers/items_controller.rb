class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  before_action :search_category_item, only: [:index, :category, :hashtag, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def category
    @item = @q.result
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :let_go_way_id, :let_go_reason_id, :result_id,
                                 :comment).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_category_item
    @q = item.ransack(params[:q])
  end
end

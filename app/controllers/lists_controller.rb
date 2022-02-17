class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  # '/lists/new'
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # '/lists'
  def index
    @lists = List.all
  end

  # '/lists/:id'
  def show
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end

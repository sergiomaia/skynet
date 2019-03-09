class GadgetsController < ApplicationController
  before_action :set_gadget, only: [:show, :edit, :update, :destroy]

  def index
    @gadgets = Gadget.all
  end

  def show;end

  def new
    @gadget = Gadget.new
  end

  def edit;end

  def create
    @gadget = Gadget.new(gadget_params)

    if @gadget.save
      redirect_to @gadget, notice: 'Gadget was successfully created.'
    else
      render :new
    end
  end

  def update
    if @gadget.update(gadget_params)
      redirect_to @gadget, notice: 'Gadget was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @gadget.destroy
    redirect_to gadgets_url, notice: 'Gadget was successfully destroyed.'
  end

  private
  def set_gadget
    @gadget = Gadget.find(params[:id])
  end

  def gadget_params
    params.require(:gadget).permit(:card, :nds, :model, :status)
  end
end

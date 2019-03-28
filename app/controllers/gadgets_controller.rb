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
      redirect_to @gadget, notice: 'Equipamento foi criado com sucesso.'
    else
      redirect_back(fallback_location: root_path, notice: @gadget.errors.full_messages.join(', '))
    end
  end

  def dealloc
    @gadget = Gadget.find(params[:gadget_id])
    @gadget.update(customer_id: nil)
    redirect_back(fallback_location: root_path, notice: "Equipamento desassociado com sucesso.")
  end

  def update
    if @gadget.update(gadget_params)
      redirect_to @gadget, notice: 'Equipamento foi atualizado com sucesso.'
    else
      redirect_back(fallback_location: root_path, notice: @gadget.errors.full_messages.join(', '))
    end
  end

  def destroy
    @gadget.destroy
    redirect_to gadgets_url, notice: 'Equipamento foi removido com sucesso.'
  end

  private

  def set_gadget
    @gadget = Gadget.find(params[:id])
  end

  def gadget_params
    permited_params = params.require(:gadget).permit(:card, :nds, :model)
    permited_params[:status] = params[:gadget][:status].to_i
    permited_params
  end
end

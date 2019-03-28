class GadgetAllocationsController < ApplicationController

  def create
    @gadget_allocation = GadgetAllocation.new(gadget_allocation_params)
    @gadget_allocation.register
    if @gadget_allocation.valid?
      flash[:notice] = "Equipamento associado com sucesso."
    else
      flash[:notice] = @gadget_allocation.errors.full_messages.join(', ')
    end
    redirect_back(fallback_location: root_path)
  end

  def gadget_allocation_params
    permited_params = params.require(:gadget_allocation).permit(
    :customer_id,
    :gadget_id)
  end
end

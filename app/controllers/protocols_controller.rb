class ProtocolsController < ApplicationController
  before_action :set_protocol, only: [:show, :edit, :update, :destroy]

  def create
    @protocol = Protocol.new(protocol_params.merge(user: current_user))
    if @protocol.save
      redirect_back(fallback_location: root_path, notice: 'Protocolo criado com sucesso.')
    else
      redirect_back(fallback_location: root_path, notice: @protocol.errors.full_messages.join(', '))
    end
  end

  def destroy
    @customer = @protocol.customer
    @protocol.destroy
    redirect_to @customer, notice: 'O comentário foi removido.'
  end

  private

  def set_protocol
    @protocol = current_user.protocols.find(params[:id])
  end

  def protocol_params
    permited_params = params.require(:protocol).permit(:number, :customer_id)
  end
end

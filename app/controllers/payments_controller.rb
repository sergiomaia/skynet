class PaymentsController < ApplicationController
  before_action :set_payment, only: [:create, :destroy]

  def create
    @payment = Payment.new(payment_params.merge(user: current_user))
    if @payment.save
      redirect_back(fallback_location: root_path, notice: 'O Pagamento foi atualizado com sucesso.')
    else
      redirect_back(fallback_location: root_path, notice: @payment.errors.full_messages.join(', '))
    end
  end

  def destroy
    @customer = @payment.customer
    @payment.destroy
    redirect_to @payment, notice: 'O comentário foi removido.'
  end

  private

  def set_payment
    @payment = current_user.payments.find(params[:id])
  end

  def payments_params
    params.require(:payment).permit(:paid, :paid_value, :paid_at, :customer_id, :package_id)
  end
end

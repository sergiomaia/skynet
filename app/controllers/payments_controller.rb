class PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update, :destroy]
  before_action :set_package, only: [:update]

  def edit
    @customer.payments.build
  end

  def create_monthly_payments
    service = Payments::ExtractCustomersFromUserService.new(current_user).extract
    if service
      redirect_to @customer, notice: 'Os pagamentos foram gerados com sucesso!'
    else
      redirect_to @customer, notice: 'Deu merda!'
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Pagamento foi atualizado com sucesso.') }
      else
        format.html { redirect_back(fallback_location: root_path, notice: @payment.errors.full_messages.join(', ')) }
      end
    end
  end

  def destroy
    @customer = @payment.customer
    @payment.destroy
    redirect_to @customer, notice: 'O comentário foi removido.'
  end

  private

  def set_payment
    @payment = current_user.payment.last.find(params[:id])
  end

  def payments_params
    params.require(:payment).permit(:paid, :expires_at_day, :value, :paid_at, :package_id, :user_id, :payment_month)
  end
end

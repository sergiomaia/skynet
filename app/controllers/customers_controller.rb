class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_user.customers.all
  end

  def show;end

  def new
    @customer = current_user.customers.new
  end

  def edit;end

  def create
    @customer = current_user.customers.build(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Cliente cadastrado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Os dados cliente foi editado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'O cliente foi deletado.'
  end

  private

  def set_customer
    @customer = current_user.customers.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :cpf, :birthdate, :phone, :cellphone)
  end
end

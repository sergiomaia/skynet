class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_user.customers.all
    @customer = current_user.customers.new
    @customer.packages.build
  end

  def show
    @gadget_allocation = GadgetAllocation.new(customer_id: @customer.id)
  end

  def new
    @customer = current_user.customers.new
    @customer.packages.build
  end

  def edit
    @customer.packages.build
  end

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
    permited_params = params.require(:customer).permit(
    :name,
    :email,
    :cpf,
    :address,
    :birthdate,
    :phone,
    :cellphone,
    { packages_attributes: Package.attribute_names.map(&:to_sym).push(:_destroy) })
    permited_params[:packages_attributes]["0"][:plan] = permited_params[:packages_attributes]["0"][:plan].to_i
    permited_params[:packages_attributes]["0"][:status] = permited_params[:packages_attributes]["0"][:status].to_i
    permited_params
  end
end

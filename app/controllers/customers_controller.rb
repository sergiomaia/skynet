class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_user.customers.all
    @customer = current_user.customers.new
    @customer.packages.build
    @gadget_allocation = GadgetAllocation.new
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
    package = @customer.packages.last
    if @customer.save
      CreatePaymentService.create_payment(package, current_user)
      redirect_to @customer, notice: 'Cliente cadastrado com sucesso.'
    else
      redirect_back(fallback_location: root_path, notice: @customer.errors.full_messages.join(', '))
    end
  end

  def custom_table
    if params[:type].include?('late_customers')
      @custom_table = current_user.customers.includes(:packages).where('packages.expires_at < ?', Date.current).references(:packages)
      @title = 'Clientes atrasados'
    elsif params[:type].include?('late_today_customers')
      @custom_table = current_user.customers.includes(:packages).where('packages.expires_at = ?', Date.current).references(:packages)
      @title = 'Clientes - Vencem hoje'
    else
      redirect_back(fallback_location: root_path, notice: 'Algum erro aconteceu.')
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Os dados cliente foi alterado com sucesso.' }
        format.json { respond_with_bip(@customer) }
      else
        format.html { redirect_back(fallback_location: root_path, notice: @customer.errors.full_messages.join(', ')) }
        format.json { respond_with_bip(@customer) }
      end
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'O cliente foi removido.'
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
    if permited_params[:packages_attributes]
      permited_params[:packages_attributes]["0"][:value] = permited_params[:packages_attributes]["0"][:value].gsub(/[^\d.]/, '').to_f
      permited_params[:packages_attributes]["0"][:plan] = permited_params[:packages_attributes]["0"][:plan].to_i
      permited_params[:packages_attributes]["0"][:status] = permited_params[:packages_attributes]["0"][:status].to_i
    end
    permited_params
  end
end

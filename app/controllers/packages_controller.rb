class PackagesController < ApplicationController
  before_action :set_package, only: [:update]

  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_back(fallback_location: root_path, notice: 'Plano foi atualizado com sucesso.') }
        format.json { respond_with_bip(@package) }
      else
        format.html { redirect_back(fallback_location: root_path, notice: @package.errors.full_messages.join(', ')) }
        format.json { respond_with_bip(@package) }
      end
    end
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def package_params
    permited_params = params.require(:package).permit(:plan, :value, :status, :expires_at)
    permited_params[:value] = permited_params[:value].gsub(/[^\d.]/, '').to_f if permited_params[:value]
    permited_params
  end
end

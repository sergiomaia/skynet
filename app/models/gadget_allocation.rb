class GadgetAllocation
  include ActiveModel::Model

  attr_accessor(
    :customer_id,
    :gadget_id
  )

  validates :customer_id, :gadget_id, presence: true

  def register
    if valid?
      Gadget.find(gadget_id).update(customer_id: customer_id, status: :active)
    end
  end
end

class Tqrdc::ScoresController < ApplicationController

  def supplier_entry
    @order = Tqrdc::Order
      .where(:supplier_id => current_user.supplier_id)
      .where(:status => 'CREATE')
      .last
  end

  def supplier_enquiry
    @orders = Tqrdc::Order.where(:supplier_id => current_user.supplier_id)

  end

  def update_scores

  end
end

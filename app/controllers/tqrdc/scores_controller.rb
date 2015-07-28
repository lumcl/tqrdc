class Tqrdc::ScoresController < ApplicationController

  def supplier_entry
    @order = Tqrdc::Order.includes(:order_groups, :order_lines)
                 .where(:supplier_id => current_user.supplier_id)
                 .where(:status => 'CREATE')
                 .last

    @order_groups = @order.order_groups
    @order_lines = @order.order_lines

    @qheads = Hash.new
    Tqrdc::Qhead.all.each do |qhead|
      @qheads[qhead.id] = qhead
    end

    @groups = Hash.new
    Tqrdc::Group.all.each do |group|
      @groups[group.id] = group
    end

  end

  def supplier_enquiry
    @orders = Tqrdc::Order.where(:supplier_id => current_user.supplier_id)

  end

  def update_scores

  end
end

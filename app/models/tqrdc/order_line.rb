class Tqrdc::OrderLine < ActiveRecord::Base
  belongs_to :order_group, :class_name => 'Tqrdc::OrderGroup'
  belongs_to :qhead, :class_name => 'Tqrdc::Qhead'
  belongs_to :order, :class_name => 'Tqrdc::Order'

  def check_editable(user_id, position)
    puts "#{user_id},#{position},#{u1_user_id},#{u2_user_id},#{u3_user_id},#{u4_user_id}"
    if ((position == 1 and user_id == u1_user_id) or
        (position == 2 and user_id == u2_user_id) or
        (position == 3 and user_id == u3_user_id) or
        (position == 4 and user_id == u4_user_id) )
        'false'
    else
      'disabled'
    end
  end

end

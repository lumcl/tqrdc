class Tqrdc::ReportsController < ApplicationController

  def order_summary
    @orders, @groups = Tqrdc::Report.order_summary(params)
  end

end

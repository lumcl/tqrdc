class Tqrdc::Supplier < ActiveRecord::Base
  validates_presence_of :vname
  validates_presence_of :supplier
  validates_presence_of :email
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i , :message => "郵箱格式不正確"
  validates_presence_of :start_period
  validates_presence_of :end_period
  validates_presence_of :mtype
  #validates_inclusion_of :mtype, :in => ["M", "E"] , :message => "只能選擇輸入E(電子)或 M(機構)"
  validates_presence_of :commodity_mgr_id
  has_many :orders , :class_name => 'Tqrdc::Order'

  def to_s
    vname
  end

  def name
    vname
  end

end

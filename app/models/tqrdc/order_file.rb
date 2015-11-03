class Tqrdc::OrderFile < ActiveRecord::Base
  belongs_to :order, :class_name => 'Tqrdc::Order'
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'

  has_attached_file :tqrdc,
                    path: ':rails_root/public/tqrdc_file/:basename.:extension',
                    url: '/tqrdc_file/:basename.:extension'

  do_not_validate_attachment_file_type :tqrdc
  validates :tqrdc, attachment_presence: true

  # validates_attachment :tqrdc,
  #                      content_type: {
  #                          content_type: [
  #                          'application/pdf',
  #                          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  #                          'application/vnd.ms-excel',
  #                          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  #                          'application/msword',
  #                          'application/vnd.openxmlformats-officedocument.presentationml.presentation',
  #                          'application/vnd.ms-powerpoint',
  #                          'application/zip','application/octet-stream']}

  before_save :randomize_file_name, if: :tqrdc_file_name_changed?

  private

  def randomize_file_name
    self.filename = tqrdc_file_name
    extension = File.extname(tqrdc_file_name).downcase
    self.tqrdc.instance_write(:file_name, "#{SecureRandom.uuid}#{extension}")
  end

end

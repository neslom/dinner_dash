class Order < ActiveRecord::Base
  belongs_to :user
  enum status: %w(ordered paid completed cancelled)
  before_create :format_time

  def format_time
    updated_at.to_formatted_s(:long)
  end
end

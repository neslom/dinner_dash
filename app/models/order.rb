class Order < ActiveRecord::Base
  belongs_to :user
  enum status: %w(ordered paid completed cancelled)
end

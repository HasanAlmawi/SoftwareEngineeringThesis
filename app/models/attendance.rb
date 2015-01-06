class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :user_id
  attr_accessor :email, :code
  belongs_to :user
  validates_presence_of :user
end

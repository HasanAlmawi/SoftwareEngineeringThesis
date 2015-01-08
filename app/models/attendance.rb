class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :code
  attr_accessor :email
  belongs_to :user
  validates_presence_of :user
end

class Event < ActiveRecord::Base
  attr_accessible :code, :lecturer, :title, :description, :start_time, :end_time
  has_many :attendances
  accepts_nested_attributes_for :attendances
end

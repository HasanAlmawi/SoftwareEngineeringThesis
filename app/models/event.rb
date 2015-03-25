class Event < ActiveRecord::Base
  attr_accessible :code, :lecturer, :faculty, :title, :description, :start_time, :end_time
  has_many :attendances
  accepts_nested_attributes_for :attendances
end

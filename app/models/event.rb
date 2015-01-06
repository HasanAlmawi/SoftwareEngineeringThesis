class Event < ActiveRecord::Base
  attr_accessible :code, :lecturer, :title
  has_many :attendances
  accepts_nested_attributes_for :attendances
end

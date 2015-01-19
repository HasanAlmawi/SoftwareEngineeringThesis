class Attendance < ActiveRecord::Base
  attr_accessible :user_id, :code
  attr_accessor :email
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :user_id, scope: :code, :message => "already registered for given event."

  def self.to_csv (options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |attendance|
  			csv << attendance.attributes.values_at(*column_names)
  		end
  	end
  end
end

class Attendance < ActiveRecord::Base
  attr_accessible :user_id, :code
  attr_accessor :email
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :user_id, scope: :code, :message => "already registered for given event."

  def self.to_csv (options = {})
  	CSV.generate(options) do |csv|
  		csv << ["Email", "Event Title", "Description", "Lecturer", "Department", "Date", "Hours"]
  		all.each do |attendance|
        csv << [User.find(attendance.user_id).email, Event.find_by_code(attendance.code).title, Event.find_by_code(attendance.code).description, 
          Event.find_by_code(attendance.code).lecturer, Event.find_by_code(attendance.code).faculty, Event.find_by_code(attendance.code).start_time.to_date,
           (Event.find_by_code(attendance.code).end_time - Event.find_by_code(attendance.code).start_time)/3600]
  		end
  	end
  end
end
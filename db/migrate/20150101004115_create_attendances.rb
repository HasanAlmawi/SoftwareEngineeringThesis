class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user
      t.string :code

      t.timestamps
    end
  end
end
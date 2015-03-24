class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :lecturer
      t.string :faculty
      t.string :code

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :lecturer
      t.string :code

      t.timestamps
    end
  end
end

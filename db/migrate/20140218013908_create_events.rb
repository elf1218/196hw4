class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.string :desc
      t.belongs_to :user, index: true
      t.belongs_to :calendar, index: true

      t.timestamps
    end
  end
end

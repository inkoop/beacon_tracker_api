class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

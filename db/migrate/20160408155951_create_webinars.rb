class CreateWebinars < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.datetime :live_date, null: false
      t.string :title, null: false
      t.string :description
      t.references :presenter, index: true, foreign_key: true
      t.string :webinar_url
      t.boolean :active

      t.timestamps null: false
    end
  end
end

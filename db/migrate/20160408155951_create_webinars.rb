class CreateWebinars < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.datetime :live_date
      t.string :title
      t.string :description
      t.integer :presenter_id
      t.string :webinar_url
      t.boolean :active

      t.timestamps null: false
    end
  end
end

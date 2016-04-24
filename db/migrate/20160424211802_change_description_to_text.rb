class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :webinars, :description, :text, null: false
    change_column :webinars, :active, :boolean, default: false
  end
end

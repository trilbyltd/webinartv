class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.string :name
      t.string :email
      t.string :bio

      t.timestamps null: false
    end
  end
end

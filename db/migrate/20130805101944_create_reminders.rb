class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.date :due_date
      t.integer :status
      t.references :user

      t.timestamps
    end
    add_index :reminders, :user_id
  end
end

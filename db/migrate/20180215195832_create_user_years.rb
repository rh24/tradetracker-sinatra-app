class CreateUserYears < ActiveRecord::Migration[5.1]
  def change
    create_table :user_years do |t|
      t.integer :user_id
      t.integer :year_id
    end
  end
end

class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.integer :weight
      t.integer :subject_id

      t.timestamps
    end
  end
end

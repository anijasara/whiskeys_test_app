class CreateWhiskeys < ActiveRecord::Migration[5.2]
  def change
    create_table :whiskeys do |t|
      t.string :title
      t.text :description
      t.string :taste
      t.string :color
      t.string :smokiness

      t.timestamps
    end
  end
end

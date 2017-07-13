class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|
      t.string :label
      t.string :model
      t.integer :capacity
      t.references :virtual_machine, foreign_key: true

      t.timestamps
    end
  end
end

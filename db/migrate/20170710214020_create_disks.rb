class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|
      t.string :label
      t.string :capacity
      t.string :model
      t.references :virtual_machine, foreign_key: true

      t.timestamps
    end
  end
end

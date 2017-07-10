class CreateVirtualMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :virtual_machines do |t|
      t.string :name
      t.string :state, default: "shut down"
      t.string :os
      t.integer :memory
      t.integer :cores
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

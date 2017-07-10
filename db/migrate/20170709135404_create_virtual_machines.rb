class CreateVirtualMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :virtual_machines do |t|
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

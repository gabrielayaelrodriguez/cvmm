class CreateGlobalResources < ActiveRecord::Migration[5.1]
  def change
    create_table :global_resources do |t|
      t.integer :totalRAM, default: 0
      t.integer :totalDiskSpace, default: 0
      t.integer :totalCPUCores, default: 0

      t.timestamps
    end
  end
end

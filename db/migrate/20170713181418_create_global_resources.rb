class CreateGlobalResources < ActiveRecord::Migration[5.1]
  def change
    create_table :global_resources do |t|
      t.integer :totalRAM
      t.integer :totalUsableRAM
      t.integer :totalDiskSpace
      t.integer :totalUsableDiskSpace
      t.integer :totalCPUCores
      t.integer :totalUsableCPUCores

      t.timestamps
    end
  end
end

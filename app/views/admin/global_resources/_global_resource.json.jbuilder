json.extract! global_resource, :id, :totalRAM, :totalUsableRAM, :totalDiskSpace, :totalUsableDiskSpace, :totalCPUCores, :totalUsableCPUCores, :created_at, :updated_at
json.url global_resource_url(global_resource, format: :json)

cluster_name = "pld"
project      = "trim-modem-277014"
zone         = "us-central1-a"

# network_name            = "<existing network name>"
# subnetwork_name         = "<existing subnetwork name>"
# shared_vpc_host_project = "<vpc host project>"

disable_controller_public_ips = false
disable_login_public_ips      = false
disable_compute_public_ips    = false

# suspend_time  = 300

controller_machine_type = "n1-standard-2"
controller_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
controller_disk_type    = "pd-ssd"
controller_disk_size_gb = 1000
# controller_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# controller_service_account = "default"
# controller_scopes          = ["https://www.googleapis.com/auth/cloud-platform"]
# cloudsql = {
#   server_ip = "<cloudsql ip>"
#   user      = "slurm"
#   password  = "verysecure"
#   db_name   = "slurm_accounting"
# }
# controller_secondary_disk      = false
# controller_secondary_disk_size = 100
# controller_secondary_disk_type = "pd-ssd"
#
# When specifying an instance template, specified controller fields will
# override the template properites.
# controller_instance_template = null

login_machine_type = "n1-standard-2"
login_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
login_disk_type    = "pd-standard"
login_disk_size_gb = 20
# login_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# login_node_count = 1
# login_node_service_account = "default"
# login_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]
#
# When specifying an instance template, specified login fields will
# override the template properites.
# login_instance_template = null

# Optional network storage fields
# network_storage is mounted on all instances
# login_network_storage is mounted on controller and login instances
# network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/home"
#   local_mount   = "/home"
#   fs_type       = "nfs"
#   mount_options = null
# }]
#
# login_network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/net_storage"
#   local_mount   = "/shared"
#   fs_type       = "nfs"
#   mount_options = null
# }]

# compute_node_service_account = "default"
# compute_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]

partitions = [
  { name                 = "debug"
    machine_type         = "n2-highmem-8"
    static_node_count    = 0
    max_node_count       = 100
    zone                 = "us-central1-a"
    image                = "prflow-compute-0-image-2021-03-16-00-00-13"
    image_hyperthreads   = false
    compute_disk_type    = "pd-ssd"
    compute_disk_size_gb = 256
    compute_labels       = {}
    cpu_platform         = "Intel Cascade Lake"
    gpu_count            = 0
    gpu_type             = null
    network_storage      = []
    preemptible_bursting = false
    vpc_subnet           = null
    exclusive            = false
    enable_placement     = false
    regional_capacity    = false
    regional_policy      = {}
    instance_template    = null
  },
  #  { name                 = "debug"
  #    machine_type         = "n1-standard-16"
  #    static_node_count    = 0
  #    max_node_count       = 20
  #    zone                 = "us-west1-b"
  #    image                = "projects/slurm-184304/global/images/family/schedmd-slurm-20-11-3-hpc-centos-7"
  #    image_hyperthreads   = false
  #
  #    compute_disk_type    = "pd-ssd"
  #    compute_disk_size_gb = 20
  #    compute_labels       = {
  #      key1 = "val1"
  #      key2 = "val2"
  #    }
  #    cpu_platform         = "Intel Cascade Lake"
  #    preemptible_bursting = true
  #    vpc_subnet           = null
  #    exclusive            = false
  #    enable_placement     = false
  #
  #    ### NOTE ####
  #    # regional_capacity is under development. You may see slowness in
  #    # deleting lots of instances.
  #    #
  #    # With regional_capacity : True, the region can be specified in the zone.
  #    # Otherwise the region will be inferred from the zone.
  #    zone = "us-west1"
  #    regional_capacity    = True
  #    # Optional
  #    regional_policy      = {
  #        locations = {
  #            "zones/us-west1-a" = {
  #                preference = "DENY"
  #            }
  #        }
  #    }
  #
  #    When specifying an instance template, specified compute fields will
  #    override the template properites.
  #    instance_template = "my-template"
]


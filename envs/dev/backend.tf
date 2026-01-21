# Remote backend placeholder (disabled by default).
#
# Dev/local workflows should default to local state:
#   terraform init -backend=false
#
# If/when a remote backend is introduced, explicitly enable it with:
#   TF_ENABLE_REMOTE_STATE=1 terraform init
#
# NOTE: Terraform does not support conditional backend blocks. This file exists purely
# as documentation scaffolding. The Makefile defaults to -backend=false to ensure
# local state is used in Phase 2.

terraform {
  backend "s3" {
    # bucket         = "REPLACE_ME"
    # key            = "connected-car/dev/terraform.tfstate"
    # region         = "REPLACE_ME"
    # dynamodb_table = "REPLACE_ME" # optional state locking table
    # encrypt        = true
  }
}


require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride

  run ApplicationController
  use ArticlesController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end


#can only run one controller (run ApplicationController) and can use other controllers ( use ArticlesController)

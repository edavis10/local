namespace :local do
  namespace :test do
    desc "Update the development and test databases"
    task :setup => ['db:migrate', 'db:migrate_plugins', 'db:schema:dump', 'db:test:load', 'parallel:prepare']
  end
end

# require the hydra codebase
require 'hydra'
# require the hydra rake task helpers
require 'hydra/tasks'

Hydra::TestTask.new('local:hydra:units') do |t|
  t.add_files 'test/unit/**/*_test.rb'
end
Hydra::TestTask.new('local:hydra:functionals') do |t|
  t.add_files 'test/functional/**/*_test.rb'
end
Hydra::TestTask.new('local:hydra:integrations') do |t|
  t.add_files 'test/integraton/**/*_test.rb'
end
Hydra::TestTask.new('local:hydra:all') do |t|
  t.add_files 'test/unit/**/*_test.rb'
  t.add_files 'test/functional/**/*_test.rb'
  t.add_files 'test/integraton/**/*_test.rb'
end

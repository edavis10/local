namespace :local do
  namespace :test do
    desc "Update the development and test databases"
    task :setup => ['db:migrate', 'db:migrate_plugins', 'db:schema:dump', 'db:test:load', 'parallel:prepare']
  end
end

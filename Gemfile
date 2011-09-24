gem 'awesome_print'
gem 'thin'
gem 'yard'

group :development do
  gem 'inaction_mailer', :require => 'inaction_mailer/force_load'
end

group :test do
  gem 'memory_test_fix', '0.1.3'
  gem 'redgreen', :platforms => :mri_18
  # Pulls in linecache19 which is 1.9 compatable
  gem 'ruby-debug19', :require => 'ruby-debug', :platforms => :mri_19
  # Pulls in linecache which is 1.8 only
  gem 'ruby-debug', :platforms => :mri_18
  gem 'launchy'
end

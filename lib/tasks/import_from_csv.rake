require 'csv'
# example:
# rake redmine:import_from_csv FILENAME=test/fixtures/files/rubyrogue.csv PROJECT=rubyrogue RAILS_ENV=production
namespace :redmine do
  desc 'Imports issues previously exported as CSV'
  task :import_from_csv => :environment do
    filename = ENV['FILENAME'] || raise('FILENAME is missing')
    project = ENV['PROJECT'] || raise('PROJECT is missing')
    Issue.import_from_csv(filename, :project => project)
  end
end

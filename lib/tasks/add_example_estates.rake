require 'csv'
require 'active_record'


def import_example_data  
  e = Estate.new(:estate_code => '0066S', :service_charge_period => 'Quarterly', :due_dates => '1st Feb,  3rd May,  1st Aug,  5th Nov')
  e.save
  e = Estate.new(:estate_code => '0123S', :service_charge_period => 'Quarterly', :due_dates => '28th Feb, 31st May, 31st Aug, 30th Nov')
  e.save
  e = Estate.new(:estate_code => '0250S', :service_charge_period => 'Twice a year', :due_dates => '23rd Jan, 22nd Jun')
  e.save
end

namespace :example_data do
  desc 'Import example data'
  task :import => :environment do
    import_example_data
  end
end

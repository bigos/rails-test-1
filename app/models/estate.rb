class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  validates_uniqueness_of :estate_code

  def due_dates_list
      self.due_dates.split( ',').collect do |d| d.strip end
  end
  


end

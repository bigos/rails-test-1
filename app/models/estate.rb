class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  validates_uniqueness_of :estate_code

  def due_dates_list
      self.due_dates.split( ',').collect do |d| d.strip end
  end
  
  def remind(date,estates)
    date = Date.parse date
    results = []
    estates.each do |e|
      e.due_dates_list.each do |db_due_date|
        due_date = Date.parse "#{db_due_date} #{date.year}"
        due_date = due_date + 1.year if due_date < date #due dates must be in future
        if e.service_charge_period == "Quarterly"          
          reminder_date = due_date - 1.month
        elsif e.service_charge_period == "Twice a year"
          reminder_date = due_date - 2.months
        else
          raise "wrong service charge period in the database"
        end
        if date.between? reminder_date, due_date
          results << "#{e.estate_code} due date #{db_due_date} #{due_date.year}"
        end
      end
    end
    results
  end

end

class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  def due_dates_list
      self.due_dates.split( ',').collect do |d| d.strip end
  end
  
  def remind(date)
    date = Date.parse date
    results = []
    Estate.all.each do |e|
      e.due_dates_list.each do |due_date|
        d = Date.parse "#{due_date} #{date.year}"
        d = d + 1.year if d < date #due dates must be in future
        if e.service_charge_period == "Quarterly"          
          rd = d - 1.month
        elsif e.service_charge_period == "Twice a year"
          rd = d - 2.months
        else
          raise "wrong service charge period in the database"
        end
        if date.between? rd, d
          results << "#{e.estate_code} due date #{due_date} #{d.year}"
        end
      end
    end
    results
  end

end

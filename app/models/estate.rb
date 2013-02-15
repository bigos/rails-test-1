class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  def due_dates_list
      self.due_dates.split( ',').collect do |d| d.strip end
  end
  
  def remind(date)
    date = Time.parse date
    year = date.year
    Estate.all.each do |e|
      e.due_dates_list.each do |due_date|
        d = Time.parse "#{due_date} #{year}"
        d = d + 1.year if d < date #due dates must be in future
        if e.service_charge_period == "Quarterly"          
          rd = d - 1.month
        elsif e.service_charge_period == "Twice a year"
          rd = d - 2.months
        else
          raise "wrong service charge period in the database"
        end
        if rd <= date and date <= d
          puts "#{e.estate_code} due date #{due_date} #{d.year}"
        end
      end
    end
    ''
  end

end

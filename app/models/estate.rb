class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  def due_dates_list
      self.due_dates.split( ',').collect do |d| d.strip end
  end

  
  def remind(date)
    date = Time.parse date
    year = date.year
    ee = Estate.all
    ee.each do |e|
      puts '-----------'
      dd = e.due_dates_list
      dd.each do |dm|
        d = Time.parse "#{dm} #{year}"
        if e.service_charge_period == "Quarterly"          
          rd = d - 1.month
        elsif e.service_charge_period == "Twice a year"
          rd = d - 2.months
        else
          raise "wrong service charge period in the database"
        end
        if rd <= date and date <= d
          puts "#{e.estate_code} due date #{dm} #{year}"
        end
      end
    end
    ''
  end

end

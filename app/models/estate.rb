class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  def due_dates_for_year(year)
    self.due_dates.split(',').collect do |d| 
      Time.parse "#{d.strip} #{year}"
    end 
  end

  
  def remind(date)
    date = Time.parse date
    year = date.year
    ee = Estate.all
    ee.each do |e|
      puts '-----------'
      #p e
      dd = e.due_dates_for_year year
      dd.each do |d|
        if e.service_charge_period == "Quarterly"          
          rd = d - 1.month
        elsif e.service_charge_period == "Twice a year"
          rd = d - 2.months
        else
          raise "wrong service charge period in the database"
        end
        if date >= rd and date <= d
          p e
        end
      end
    end
    ''
  end

end

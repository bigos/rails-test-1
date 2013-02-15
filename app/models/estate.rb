class Estate < ActiveRecord::Base
  attr_accessible :due_dates, :estate_code, :service_charge_period

  def due_dates_for_year(year)
    self.due_dates.split(',').collect do |d| 
      Time.parse "#{d.strip} #{year}"
    end 
  end

  def remind(date)
    rd=Time.parse date
    year = rd.year
    ee = Estate.all
    ee.each do |e|
      p e
      dd = e.due_dates_for_year year
      dd.each do |d|
        p d
        if e.service_charge_period == "Quarterly"
          
        elsif e.service_charge_period == "Twice a year"
        else
          raise "wrong service charge period in the database"
        end
      end
    end
  end

end

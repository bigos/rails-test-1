class ReminderController < ApplicationController
  def date
    dates = ['1st Jan 2009', '1st Feb 2009', '2nd Feb 1979', '15th Mar 1999', '21st Apr 2013', 
             '22nd Apr 2017', '29th Apr 2000', '30th Apr 2002', '29th Oct 2011', '30th Oct 2011', '24th Dec 2006']
    @estates = Estate.all
    @results = []
    dates.each do |date|
      res = remind date, @estates
      res.each do |rem|
        @results << [date, rem]
      end
    end
        
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

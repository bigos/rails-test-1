Feature: Reminder Feature
In order to ensure reminding works
As a developer
I want to test reminder dates

Scenario: Reminder Scenario
  Given example data
  When the date is <test_date>
  Then found reminders should include <result>
  And found reminders count should be <c>
| test_date     | result                       | c|
| 1st Jan 2009  | 0066S due date  1st Feb 2009 | 2|   
| 1st Jan 2009  | 0250S due date 23rd Jan 2009 | 2|
| 1st Feb 2009  | 0066S due date  1st Feb 2009 | 2|
| 1st Feb 2009  | 0123S due date 28th Feb 2009 | 2|
| 2nd Feb 1979  | 0123S due date 28th Feb 1979 | 1|
| 15th Mar 1999 | (no reminders)               | 0|
| 21st Apr 2013 | 0066S due date  3rd May 2013 | 1|
| 22nd Apr 2017 | 0066S due date  3rd May 2017 | 2|
| 22nd Apr 2017 | 0250S due date 22nd Jun 2017 | 2|
| 29th Apr 2000 | 0066S due date  3rd May 2000 | 2|
| 29th Apr 2000 | 0250S due date 22nd Jun 2000 | 2|
| 30th Apr 2002 | 0066S due date  3rd May 2002 | 3|
| 30th Apr 2002 | 0123S due date 31st May 2002 | 3|
| 30th Apr 2002 | 0250S due date 22nd Jun 2002 | 3|
| 29th Oct 2011 | 0066S due date  5th Nov 2011 | 1|
| 30th Oct 2011 | 0066S due date  5th Nov 2011 | 2|
| 30th Oct 2011 | 0123S due date 30th Nov 2011 | 2|
| 24th Dec 2006 | 0250S due date 23rd Jan 2007 | 1|

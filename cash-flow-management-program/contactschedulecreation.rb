#this is used simply to record contracts into the
#transactions CSV
require 'csv'


class ContactScheduleCreation

  def initialize(schedule)
    @contract_id = schedule['contract_id']
    @payor_company = schedule['payor_company']
    @payor_mobile = schedule['payor_mobile']
    @first_contact_date = schedule['first_contact_date']
    @second_contact_date = schedule['second_contact_date']
    @third_contact_date = schedule['third_contact_date']
    @amount_due = schedule['amount_due']
  end

  def save
    new_contact_schedule = [@contract_id, @payor_company, @payor_mobile, @first_contact_date, @second_contact_date, @third_contact_date, @amount_due]
    CSV.open("contactschedule.csv", "a+") do |csv|
      csv << new_contact_schedule
    end
  end

  def contactDateSetup



end


    # USING customer_id AND payor_id HERE AS I THINK WE WILL
    # NEED TO CALL IN THESE PARAMETERS FROM DIFFERENT SOURCES
    # IN ORDER TO CREATE A NEW CONTRACT OBJECT TO BE
    # MANUIPULATED
    #
    # NEW FILEUPLOAD INSTANCE WILL LIKELY REQUIRE 3 TYPES OF
    # ID, ONE ID OF CUSTOMER TO BE PAID, ONE ID OF PAYOR TO PAY,
    # AND ONE ID FOR THE CONTRACT IN QUESTION, THIS ALLOWS US
    # TO BE ABLE TO CREATE AND ALSO DELETE INCORRECT CONTRACTS
    # WITHOUT AWKWARD FUCKING AROUND, AND I THINK IT ENABLES US
    # TO MINIMISE THE AMOUNT OF METHODS WE CREATE, AS CUSTOMERS
    # CAN BE TURNED INTO PAYORS AT THE SAME TIME, TO BE CALLED
    # ON WHENEVER

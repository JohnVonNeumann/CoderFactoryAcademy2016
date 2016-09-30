require 'csv'
require 'contracts'

class Customer
  attr_accessor :company, :id_cust, :email

  def initialize(customer)
    @id_cust = customer['id_cust']
    @first_name = customer['first_name']
    @last_name = customer['last_name']
    @company = customer['company']
    @email = customer['email']
    @mobile = customer['mobile']
  end

  def save
    customer = [@id_cust, @first_name, @last_name, @company, @email, @mobile]
    CSV.open("customers.csv", "a+") do |csv|
      csv << customer
    end
  end

end


class Payor

  def initialize(payor)
  #inits like our customer init just above
  @id_payor = payor['id_payor']
  @company_payor = payor['company_payor']
  @email_payor = payor['email_payor']
  @contact_name_payor = payor['contact_name_payor']
  @mobile_payor = payor['mobile_payor']
  end

  def save
  #saves the payor in a payor csv
    payor = [@id_payor, @company_payor, @email_payor, @contact_name_payor, @mobile_payor]
    CSV.open("payors.csv", "a+") do |csv|
      csv << payor
    end
  end
end

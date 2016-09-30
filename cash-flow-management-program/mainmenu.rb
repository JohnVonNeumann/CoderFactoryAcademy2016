require 'csv'
require 'securerandom'
require_relative 'interactablentities'
require_relative 'fileupload'

def accountVerify(customer_email)
  CSV.foreach('customers.csv', headers: true) do |row|
    if row["email"] == customer_email then
      return true
    end
  end

  return false
end

def getCustomer(customer_email)
  CSV.foreach('customers.csv', headers: true) do |row|
    if row["email"] == customer_email then
      @customer = Customer.new(row.to_hash)
      break
    end
  end
end



def newCustomer(customer_email)
  puts "Create new account for #{customer_email}?"
  puts "Yes / No"
  case gets.chomp.strip.downcase
  when "yes", "y", "ok", "true", "ye", "yea"
    newAccountMenu(customer_email)
  else
    puts "Returning you to the main menu."
  end
end

def newCustAccountMenu(customer_email)
  puts "Please enter your first name:"
  first_name = gets.chomp.strip.downcase
  puts "Please enter your last name:"
  last_name = gets.chomp.strip.downcase
  puts "Please enter your company name:"
  company = gets.chomp.strip.downcase
  puts "Please enter your email:"
  email = gets.chomp.strip.downcase
  puts "Please enter your mobile number:"
  mobile = gets.chomp.strip.downcase
  puts "Please enter your address:"
  address = gets.chomp.strip.downcase
  email = customer_email

  new_account_cust = {
    'id' => SecureRandom.uuid,
    'first_name' => first_name,
    'last_name' => last_name,
    'company' => company,
    'email' => email,
    'mobile' => mobile,
    'address' => address
  }

  @customer = Customer.new(new_account_cust)
  @customer.save
  #customer_menu
  # NOT YET, THIS IS WHERE WE BRANCH FROM THE COPIED
  # FILES THAT REUGEN UPLOADED
  dataInputMenuGateway
end

def newPayorAccountMenu(payor_email)
  puts "Please enter payor company name:"
  company_payor = gets.chomp.strip.downcase
  puts "Please enter payor email:"
  email_payor = gets.chomp.strip.downcase
  puts "Please enter payor company contact:"
  contact_name_payor = gets.chomp.strip.downcase
  puts "Please enter payor mobile number:"
  mobile_payor = gets.chomp.strip.downcase
  email_payor = email_payor

  new_account_payor = {
    'id_payor' => SecureRandom.uuid,
    'company_payor' => company_payor,
    'email_payor' => email_payor,
    'contact_name_payor' => contact_name_payor,
    'mobile_payor' => mobile_payor,
  }

  @payor = Payor.new(new_account_payor)
  @payor.save

end

def initialLogin
  puts "Please enter your email to login:"
  customer_email = $stdin.gets.chomp

  account = accountVerify(customer_email)

  if account
    puts "Logged in."
    getCustomer(customer_email)
  else
    puts "Account not found."
    newCustomer(customer_email)
  end
end

def dataInputMenuGateway
  puts "Do you have any new data for your cashflow database?"
  puts "Yes / No"
  case gets.chomp.strip.downcase
  when "yes", "y", "ok", "true", "ye", "yea"
    dataInput
  else
    puts "Sending you to the main menu."
    customerMenuInterface
  end
end

def dataInput
  # THIS METHOD CAN BE CREATED IN A SOMEWHAT SIMILAR FASHION
  # TO THAT OF newAccountMenu HOWEVER IT WILL REQUIRE SOME
  # UNIQUE FUNCTIONALITY, IN PARTICULAR BUSINESSES THAT USERS
  # ENGAGE WITH (THEIR PAYORS) WILL BE REQUIRED TO BE ISSUED
  # WITH A UNIQUE ID AS WELL, THIS CAN THEN BE USED OVER AND OVER
  # TO TRACK PAYMENT DATA ACROSS ALL OCCURANCES, THIS FEATURE
  # COULD POTENTIALLY BE AVOIDED IN THIS BUILD AS IT COULD BE
  # SAID THAT THE UNIQUE PAYOR ID'S CAN REALLY ONLY BE USED
  # EN MASSE FOR LARGE SCALE DATA UNDERSTANDING
  #
  # BASICALLY, THE FLOW OF THIS METHOD IS AS FOLLOWS:
  # 1. IT WILL LIKELY REQUIRE IT'S OWN CLASS AS DATA INPUTS
  # WILL NEED TO BE BUILT INTO THEIR OWN OBJECTS AS THEY CAN
  # THEN BE MANIPULATED FOR OUR USES. SOMETHING SIMILAR TO THAT
  # OF CUSTOMERS.RB AND THE @customer inst.var. WE USED TO CREATE
  # OUR CSV FILES WITH. THIS CAN ACTUALLY ALL BE MODELLED
  # DIRECTLY OFF CUSTOMER.
  #
  # 2.
end

def customerMenuInterface
  puts "-" * 20
  # puts this is where you will input and place your quick
  # puts view module, leave this area blank
  # puts
  puts "1. Database."
  puts "2. Setup New Schedule."
  puts "3. View Payment Progress."
  puts "4. Upload data."
  puts "5. Exit."
  customerMenuSelectionInput
end

def customerMenuSelectionInput
  case gets.chomp.strip.downcase
    when "1", "database", "db", "one", "1.", "one."
      #DATABASE CALL METHOD/CLASS
    when "2", "setup new schedule", "setup","two", "2.", "two."
      #SETUP NEW SCHEDULE METHOD/CLASS
    when "3", "view payment progress", "view", "vpp", "three", "3.", "three."
      #VIEW PAYMENT PROGRESS METHOD/CLASS
    when "4", "upload data", "upload", "data", "ud", "four", "4.", "four."
      dataInputMenuGateway
    when "5", "exit", "five", "5.", "five.", "end", "finish"
      puts "Thank you for using UrVoice!"
      puts "If you ever have any concerns, queries or "
      puts "suggestions, feel free to drop us a line at:"
      puts "support@urvoice.com.au"

      abort
  end

  customerMenuInterface

end


exit = false
until exit do
  initialLogin
end

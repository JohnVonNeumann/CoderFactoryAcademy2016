require 'date'
require_relative 'contactschedulecreation'

  class ContractCreation

    attr_accessor :id_contract, :id_cust, :id_payor, #unfinished

    def initialize(contract)
      @id_contract = contract['id_contract']
      @id_cust = contract['id_cust']
      @id_payor = contract['id_payor']
      @created_at = contract['created_at']
      @due_date = contract['due_date']
      @payment_term = contract['payment_term']
      @balance_due = contract['balance_due']
    end

    def save
      new_contract = [@id_contract, @id_cust, @id_payor, @created_at, @due_date, @payment_term, @balance_due]
      CSV.open("contracts.csv", "a+") do |csv|
        csv << new_contract
      end
    end

    def createContactSchedule

      @contactschedulecreation = ContactScheduleCreation.new(
      {
        'contract_id' => @contract_id,
        'payor_company' => @payor_company,
        'payor_mobile' => @payor_mobile,
        'first_contact_date' => #wat,
        'second_contact_date' => #wat,
        'third_contact_date' => #wat,
        'amount_due' => #wat,
      }
      )
      @contactschedulecreation.save
    end

  end

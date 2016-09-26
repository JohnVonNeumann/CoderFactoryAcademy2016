class CashFlowManagementSystem
  def enter()
    puts "This scene is not yet configured."
    exit(1)
  end
end

#BACKEND IS WHERE OUR SUBSYSTEM TO SUBSYSTEM SWITCHING
#COMES FROM, IT IS EFFECTIVELY HOW WE MOVE AROUND THE
#SYSTEM. IT HAS BEEN MODELLED OFF EX43.RB, AS SUCH IT
#MAY NOT BE ENTIRELY FUNCTIONING, IF UNSURE OF HOW IT
#OPERATES, CONSULT EX43.RB.
class BackEnd
  #INITS AND REQ'S A PARAM, DEFINING AN INST VAR:subsystem_map
  def initialize(subsystem_map)
    @subsystem_map = subsystem_map
  end

  def run
    #DEFS 2 LOCAL VARS:current_subsystem+last_subsystem
    #THEN APPLIES THE VAL OF INST VAR:subsystem_map.
    #THIS BLOCK IS USED TO DEFINE VARS FOR THE UPCOMING
    #WHILE LOOP
    current_subsystem = @subsystem_map.bootSubsystem
    last_subsystem = @subsystem_map.nextSubsystem('exit_system')

    #USING VALS DEFINED ON LINE 23+24, WE NOW KICK OFF
    #A LOOP WHICH STATES THAT WHEN YOUR CURRENT LOC IS NOT
    #YOUR PREV LOC, THE VAR:next_subsystem_name IS SET TO
    #current_subsystem WITH THE enter METHOD CALLED ON IT.
    #THEN current_subsystem VAR IS SET TO INST VAR
    #subsystem_map WITH THE nextSubsystem METHOD, ALONG WITH
    #A PARAM
    while current_subsystem != last_subsystem
      next_subsystem_name = current_subsystem.enter
      current_subsystem = @subsystem_map.nextSubsystem(next_subsystem_name)
    end

    current_subsystem.enter
  end
end

class MainMenu < CashFlowManagementSystem
  def enter
    puts "--" * 26
    puts "Welcome to the UrVoice Cash Flow Management System!"
    puts "--" * 26
    puts "We hope you enjoy your user experience, if you"
    puts "encounter any issues, please email us at:"
    puts "support@urvoice.com.au"
    puts "--" * 17
    puts "Where would you like to go today?"
    puts "1. Customers."
    puts "2. Payors."
    puts "3. User Interface."
    puts "4. File Upload"
    puts "5. Exit program."
    puts "--" * 17
    print "> "

    main_menu_directory_select = $stdin.gets.chomp.to_i
      if main_menu_directory_select == 1
      return 'customers'
    elsif main_menu_directory_select == 2
      return 'payors'
    elsif main_menu_directory_select == 3
      return 'user_interface'
    elsif main_menu_directory_select == 4
      return 'file_upload'
    elsif main_menu_directory_select == 5
      return 'exit_system'
    end
  end
end

class Customers < CashFlowManagementSystem
  def enter
    puts "--" * 15
    puts "Customers"
    puts "--" * 15
    puts "Would you like to return to the main menu?"
    puts "--" * 15
    print "> "
    main_menu_return_choice = $stdin.gets.chomp
    if main_menu_return_choice == "yes"
      return 'main_menu'
    else
      return 'customers'
    end
  end
end

class Payors <CashFlowManagementSystem
  def enter
    puts "--" * 15
    puts "Payors"
    puts "--" * 15
    puts "Would you like to return to the main menu?"
    puts "--" * 15
    print "> "
    main_menu_return_choice = $stdin.gets.chomp
    if main_menu_return_choice == "yes"
      return 'main_menu'
    else
      return 'payors'
    end
  end
end

class UserInterface < CashFlowManagementSystem
  def enter
    puts "--" * 15
    puts "User Interface"
    puts "--" * 15
    puts "--" * 15
    puts "Would you like to return to the main menu?"
    puts "--" * 15
    print "> "
    main_menu_return_choice = $stdin.gets.chomp
    if main_menu_return_choice == "yes"
      return 'main_menu'
    else
      return 'user_interface'
    end
  end
end

class FileUpload < CashFlowManagementSystem
  def enter
    puts "--" * 15
    puts "File Upload"
    puts "--" * 15
    puts "--" * 15
    puts "Would you like to return to the main menu?"
    puts "--" * 15
    print "> "
    main_menu_return_choice = $stdin.gets.chomp
    if main_menu_return_choice == "yes"
      return 'main_menu'
    else
      return 'file_upload'
    end
  end
end

class ExitSystem < CashFlowManagementSystem
  def enter
    puts "Thank you for using UrVoice!"
    exit(1)
  end
end

class SystemMap
  @@subsystems = {
    'main_menu' => MainMenu.new(),
    'customers' => Customers.new(),
    'payors' => Payors.new(),
    'user_interface' => UserInterface.new(),
    'file_upload' => FileUpload.new(),
    'exit_system' => ExitSystem.new(),
  }

  def initialize(start_subsystem)
    @start_subsystem = start_subsystem
  end

  def nextSubsystem(subsystem_name)
    val = @@subsystems[subsystem_name]
    return val
  end

  def bootSubsystem()
    return nextSubsystem(@start_subsystem)
  end
end

a_systemmap = SystemMap.new('main_menu')
a_system_session = BackEnd.new(a_systemmap)
a_system_session.run()

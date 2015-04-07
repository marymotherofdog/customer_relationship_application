#load 'contact.rb'
#require './contact'
require_relative 'contact'
require_relative 'rolodex'

class CRM

    def self.run
      my_crm = CRM.new # can also just call new
      my_crm.main_menu
    end

    def initialize
      @rolodex = Rolodex.new
    end

    def print_main_menu
      puts "[1] Add new contact"
      puts "[2] Modify existing contact"
      puts "[3] Delete a contact"
      puts "[4] Display all the contacts"
      puts "[5] Display an attribute"
      puts "[6] Display contact"
      puts "[7] Exit"
      puts "Enter a selection"
    end


    def call_selection(selection)
      add_new_contact if selection == 1
      modify_contact if selection == 2
      delete_contact if selection == 3
      display_all if selection == 4
      display_by_attribute if selection == 5
      display_contact if selection == 6
      exit if selection == 7
    end

    def main_menu
      while true
        print_main_menu
        selection = gets.chomp.to_i
        call_selection(selection)
      end
    end

    def add_new_contact
      print "First Name: "
      first_name = gets.chomp
      print "Last Name: "
      last_name = gets.chomp
      print "Email: "
      email = gets.chomp
      print "Note: "
      note = gets.chomp
      contact = Contact.new(first_name, last_name, email, note)
      @rolodex.add_contact(contact)
    end

    def find_contact
      print "Enter user id:"
      contact_id = gets.chomp.to_i
      @rolodex.find(contact_id)
    end



  def modify_contact
    contact = find_contact
        print "Modify #{contact.first_name}? (Y or N)"
        y_or_n = gets.chomp.capitalize
        if y_or_n == "Y"
          puts "Enter number to select attribute to modify: "
          puts "[1] First Name "
          puts "[2] Last Name "
          puts "[3] Email "
          puts "[4] Note "
          selection = gets.chomp.to_i
           case selection
             when 1
                puts "Enter new first name: "
                contact.first_name = gets.chomp.capitalize
              when 2
                puts "Enter new last name: "
                contact.last_name = gets.chomp.capitalize
              when 3
                puts "Enter new email: "
                contact.email = gets.chomp.capitalize
              when 4
                puts "Enter new note: "
                contact.note = gets.chomp.capitalize
            end
          else return
          end
      end

  def delete_contact
    print "Enter id of contact to delete: "
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts contact.to_s
    @rolodex.delete(contact)
    puts "Contact has been deleted. "
  end

  def display_all
    @rolodex.display_each
  end

  def display_contact
    puts "Enter contact to display: "
    contact_id = gets.chomp.to_i
    @rolodex.display_specific_contact(contact_id)
  end
end



CRM.run
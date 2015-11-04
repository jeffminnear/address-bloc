require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View entry number 'n'"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      if @address_book.entries.size > 0
        view_entry_by_number
      else
        puts "There are no entries to view"
        main_menu
      end
    when 6
      puts "Good-bye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp.downcase
    case selection
    when "n"
      # no need to do anything
    when "d"
      # will delete the entry
    when "e"
      # will allow user to edit the entry
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def entry_short_menu(entry)
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp.downcase
    case selection
    when "d"
      # will delete the entry
    when "e"
      # will allow user to edit the entry
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_short_menu(entry)
    end
  end

  def view_entry_by_number
    print "What is the number of the entry you want to view? "
    entry_number = gets.chomp.to_i
    entry = @address_book.entries[entry_number - 1]
    if ! entry
      puts "That is not a valid entry number"
      view_entry_by_number
    end

    puts entry.to_s
    entry_short_menu(entry)
  end
end

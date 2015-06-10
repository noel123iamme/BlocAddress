RSpec.describe AddressBook do 
  
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  context "attributes" do 
    it "should respond to entries" do 
      expect(book).to respond_to(:entries)
    end
    it "should initialize entries as an array" do 
      expect(book.entries).to be_a(Array)
    end
    it "should initialize as empty" do 
      expect(book.entries.size).eql? 0
    end
  end
  
  context ".add_entry" do 
    before do 
      book.add_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
    end
    it "adds only one entry to the address book" do 
      expect(book.entries.size).eql? 1
    end
    it "adds the correct information to entries" do 
      new_entry = book.entries[0]
      expect(new_entry.name).eql? 'Ada Lovelace'
      expect(new_entry.phone_number).eql? '010.012.1815'
      expect(new_entry.email).eql? 'augusta.king@Lovelace.com'
    end
  end
  
  context ".remove_entry" do 
    before do 
      book.add_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
      book.add_entry('Joe Blow','210.212.2815','joe.blow@whodat.com')
    end
    it "adds only one entry to the address book" do 
      expect(book.entries.size).eql? 2
    end
    it "adds the correct information to entries" do 
      book.remove_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
      expect(book.entries.size).eql? 1
    end
  end

  context ".import_from_csvv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eql 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "Bill", "555-555-5555", "bill@blocmail.com")
    end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5555", "bob@blocmail.com")
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-5555", "joe@blocmail.com")
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-5555", "sally@blocmail.com")
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-5555", "sussie@blocmail.com")
     end
  end

  context ".import_from_csv_2" do
    before do
      book.import_from_csv("entries_2.csv")
      @book_size = book.entries.size
    end

    it "imports from a second csv file" do
      expect(@book_size).to eql 3
    end


    it "imports the 1st entry" do
      entry_one = book.entries[1]

      check_entry(entry_one, "Noel", "555-555-5555", "noel@blocmail.com")
    end

     it "imports the 2nd entry" do
       # Check the second entry
       entry_two = book.entries[0]
      check_entry(entry_two, "London", "555-555-5555", "london@blocmail.com")
     end
 
     it "imports the 3rd entry" do
       # Check the third entry
       entry_three = book.entries[2]
      check_entry(entry_three, "Raven", "555-555-5555", "raven@blocmail.com")
     end
  end

   # Test the binary_search method
   context ".binary_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Dan")
       expect(entry).to be_nil
     end 

     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
     end

     it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bob")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
     end 
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Joe")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
     end 
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sally")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
     end 
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sussie")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
     end

     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Billy")
       expect(entry).to be_nil
     end

   end

   # Test the iterative_search method
   context ".iterative_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Dan")
       expect(entry).to be_nil
     end 

     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bill")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
     end

     it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bob")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
     end 
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Joe")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
     end 
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sally")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
     end 
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sussie")
       expect entry.instance_of?(Entry)
       check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
     end

     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Billy")
       expect(entry).to be_nil
     end

   end

end
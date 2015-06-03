RSpec.describe AddressBook do 
  before do 
    @book = AddressBook.new
  end
  context "attributes" do 
    it "should respond to entries" do 
      expect(@book).to respond_to(:entries)
    end
    it "should initialize entries as an array" do 
      expect(@book.entries).to be_a(Array)
    end
    it "should initialize as empty" do 
      expect(@book.entries.size).eql? 0
    end
  end
  context ".add_entry" do 
    before do 
      @book.add_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
    end
    it "adds only one entry to the address book" do 
      expect(@book.entries.size).eql? 1
    end
    it "adds the correct information to entries" do 
      new_entry = @book.entries[0]
      expect(new_entry.name).eql? 'Ada Lovelace'
      expect(new_entry.phone_number).eql? '010.012.1815'
      expect(new_entry.email).eql? 'augusta.king@Lovelace.com'
    end
  end
  context ".remove_entry" do 
    before do 
      @book.add_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
      @book.add_entry('Joe Blow','210.212.2815','joe.blow@whodat.com')
    end
    it "adds only one entry to the address book" do 
      expect(@book.entries.size).eql? 2
    end
    it "adds the correct information to entries" do 
      @book.remove_entry('Ada Lovelace','010.012.1815','augusta.king@Lovelace.com')
      expect(@book.entries.size).eql? 1
    end
  end
end
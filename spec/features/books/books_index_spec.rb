require 'rails_helper'

describe "Book Index Page", type: :feature do
    before :each do
      @author_1 = Author.create(name: "J.K. Rowling")
      @book_1 = Book.create(title: "Harry Potter",
                      number_of_pages: 400,
                      publication_year: 2010)
      @book_1.authors << @author_1
      @author_2 = Author.create!(name: "Ellyn Green")
      @author_3 = Author.create!(name: "Harrison Levin")
      @book_2 = Book.create(title: "Harrison's Potter",
                      number_of_pages: 300,
                      publication_year: 2012)
      @book_2.authors << [@author_2, @author_3]
    end

    it "index page shows the list of books and details" do

      visit "/books"
      within "#book-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.number_of_pages)
        expect(page).to have_content(@book_1.publication_year)
        expect(page).to have_content("J.K. Rowling")
      end

      within "#book-#{@book_2.id}" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.number_of_pages)
        expect(page).to have_content(@book_2.publication_year)
        expect(page).to have_content("Harrison Levin")
        expect(page).to have_content("Ellyn Green")
      end
    end

end

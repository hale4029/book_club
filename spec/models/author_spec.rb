require 'rails_helper'

describe Author, type: :model do

  describe 'validation of Author table' do
    it { should validate_presence_of :name }
  end

  describe 'relationships with Book' do
    it { should have_many :author_books }
    it { should have_many(:books).through(:author_books) }
  end

  describe "test model methods" do
    it "average number of pages" do
      author_1 = Author.create(name: "J.K. Rowling")
      book_1 = Book.create(title: "Harry Potter",
                      number_of_pages: 400,
                      publication_year: 2010)
      book_1.authors << author_1
      author_2 = Author.create!(name: "Harrison Levin")
      book_2 = Book.create(title: "Harrison's Potter",
                      number_of_pages: 300,
                      publication_year: 2012)
      book_2.authors << [author_2, author_1]

      expect(author_1.average_page_count).to eq(350)
    end
  end
end

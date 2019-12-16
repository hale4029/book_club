require 'rails_helper'

describe "Auhtor Show Page", type: :feature do
  it "links from book index page take you to author's show page and show author details" do
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

    visit "/books"
    within "#book-#{book_1.id}" do
      click_link "J.K. Rowling"
    end

    expect(current_path).to eq("/authors/#{author_1.id}")
    expect(page).to have_content("J.K. Rowling")
    expect(page).to_not have_content("Harrison Levin")
    expect(page).to have_content("Average Number of Pages: 350")
    expect(page).to have_content("Harrison's Potter")
    expect(page).to have_content("Harry Potter")

    visit "/books"
    click_link "Harrison Levin"
    expect(current_path).to eq("/authors/#{author_2.id}")
    expect(page).to have_content("Harrison Levin")
    expect(page).to_not have_content("J.K. Rowling")
    expect(page).to have_content("Average Number of Pages: 300")
    expect(page).to have_content("Harrison's Potter")
    expect(page).to_not have_content("Harry Potter")
  end
end

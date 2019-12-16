# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AuthorBook.destroy_all
Author.destroy_all
Book.destroy_all

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

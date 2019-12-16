class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates_presence_of :name

  def average_page_count
    averages = Author.joins(:books).where("authors.id = #{self.id}").average(:number_of_pages)
  end

end

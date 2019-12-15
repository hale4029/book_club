FactoryBot.define do
  factory :book do
    title { "Harry Potter" }
    number_of_pages { 400 }
    publication_year { 2000 }
    author
  end



end

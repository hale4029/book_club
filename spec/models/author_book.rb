require 'rails_helper'

describe AuthorBook, type: :model do

  describe 'validations of AuthorBooks table' do
    it { should validate_presence_of :author_id }
    it { should validate_presence_of :book_id }
  end
end

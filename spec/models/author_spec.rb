require 'rails_helper'

describe Author, type: :model do

  describe 'validation of Author table' do
    it { should validate_presence_of :name }
  end

  describe 'relationships with Author' do
    it { should have_many :author_books }
    it { should have_many(:books).through(:author_books) }
  end
end

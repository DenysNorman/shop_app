require 'rails_helper'

RSpec.describe Category, type: :model do
  context'#validations' do

    it 'title can*t be blank' do
      category =  Category.create(title: '')
      expect(category).to_not be_valid
    end

    it 'title too long' do
      category =  Category.create(title: 'c'*100)
      expect(category).to_not be_valid
    end

    it 'title should be uniqueness' do
      Category.create(title: 'category')
      category =  Category.create(title: 'category')
      expect(category).to_not be_valid
    end
  end
  context '#relations' do
    it 'should have many products' do
      t = Category.reflect_on_association(:products)
      t.macro.should == :has_many
    end

  end
end
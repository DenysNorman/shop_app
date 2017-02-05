require 'rails_helper'

RSpec.describe Feature, type: :model do

  context'#validations' do
    it 'title can*t be blank' do
      feature =  Feature.create(title: '')
      expect(feature).to_not be_valid
    end

    it 'title too long' do
      feature =  Feature.create(title: 'c'*100)
      expect(feature).to_not be_valid
    end

    it 'title should be uniqueness' do
      Feature.create(title: 'category')
      feature =  Feature.create(title: 'category')
      expect(feature).to_not be_valid
    end
  end
  context '#relations' do

    it 'should have many products' do
      t = Feature.reflect_on_association(:products)
      t.macro.should == :has_many
    end
    it 'should have many feature_values' do
      t = Feature.reflect_on_association(:feature_values)
      t.macro.should == :has_many
    end
  end
end
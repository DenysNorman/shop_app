require 'rails_helper'

RSpec.describe FeatureValue, type: :model do
  context'#validations' do

    it 'title can*t be blank' do
      feature_value =  FeatureValue.create(title: '')
      expect(feature_value).to_not be_valid
    end

    it 'title too long' do
      feature_value =  FeatureValue.create(title: 'c'*100)
      expect(feature_value).to_not be_valid
    end
    it 'product_id can*t be blank' do
      feature_value =  FeatureValue.create(product_id: '')
      expect(feature_value).to_not be_valid
    end
    it 'feature_id can*t be blank' do
      feature_value =  FeatureValue.create(feature_id: '')
      expect(feature_value).to_not be_valid
    end
  end
  context '#relations' do
    it 'should belong_t0 products' do
      t = FeatureValue.reflect_on_association(:product)
      t.macro.should == :belongs_to
    end
    it 'should belong_t0 products' do
      t = FeatureValue.reflect_on_association(:feature)
      t.macro.should == :belongs_to
    end
  end
end
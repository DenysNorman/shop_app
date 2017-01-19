require 'rails_helper'

RSpec.describe Order, type: :model do
  context'#validations' do

    it 'does not allow incorrect format of email'do
      order =  Order.create(email: 'user.example com')
      expect(order).to_not be_valid
    end

    it 'email cant be blank'do
      order =  Order.create(email: '')
      expect(order).to_not be_valid
    end

    it 'name cant be blank' do
      order =  Order.create(name: '')
      expect(order).to_not be_valid
    end

    it 'phone cant be blank' do
      order =  Order.create(name: '')
      expect(order).to_not be_valid
    end

    it 'name cant be to long' do
      order =  Order.create(name: 'a'*100)
      expect(order).to_not be_valid
    end

    it 'phone cant be to long' do
      order =  Order.create(name: 99999999999999999999999999)
      expect(order).to_not be_valid
    end
  end

  context '#total_price' do
    it 'sum total prices of all products' do
      price = rand(100)
      rand_times = rand(50)
      order =  FactoryGirl.create(:order)
      rand_times.times { FactoryGirl.create(:order_product, actual_price: price, order: order) }
      expect(order.total_price(order)).to eq(rand_times * price)
    end
  end


end
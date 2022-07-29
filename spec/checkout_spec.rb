# encoding: utf-8

require_relative '../app/item'
require_relative '../app/bulk_pricing_rule'
require_relative '../app/checkout'

describe Checkout do
  describe '#total' do

    it "calculates correct prices for A,B and C" do
      items = Array.new
      1.times do
        items << Item.new( "A", 50 )
      end
      1.times do
        items << Item.new( "B", 30 )
      end
      1.times do
        items << Item.new( "C", 20 )
      end
      checkout = Checkout.new
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to be(100.0)
    end


    it "calculates correct price for 5 items A, 5 items B and 1 ieam C with special offers" do
      items = Array.new
      5.times do
        items << Item.new( "A", 50 )
      end
      5.times do
        items << Item.new( "B", 30 )
      end
      1.times do
        items << Item.new( "C", 20 )
      end
      offers = Array.new
      offers << BulkPricingRule.new("A", 50, 3, 130)
      offers << BulkPricingRule.new("B", 30, 2, 45)
      checkout = Checkout.new( offers )
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to eq(370.0)
    end

    it "calculates correct price for 3 items A, 5 items B, 1 ieam C and 1 ieam D with special offers" do
      items = Array.new
      item_c = items.select { |comment_array| comment_array.name == "D"}
      item_d = items.select { |comment_array| comment_array.name == "C"}
      3.times do
        items << Item.new( "A", 50 )
      end
      5.times do
        items << Item.new( "B", 30 )
      end
      unless item_c.nil? && item_d.nil?
        1.times do
          items << Item.new( "C + D", 35 )
        end
      else
        1.times do
          items << Item.new( "C", 20 )
        end
        1.times do
          items << Item.new( "D", 15 )
        end
      end
      offers = Array.new
      offers << BulkPricingRule.new("A", 50, 3, 130)
      offers << BulkPricingRule.new("B", 30, 2, 45)
      item_c = items.select { |comment_array| comment_array.name == "D"}
      item_d = items.select { |comment_array| comment_array.name == "C"}
      unless item_c.nil? && item_d.nil?
       offers << BulkPricingRule.new("C + D",30, 1, 30)
      else
      offers << BulkPricingRule.new("c", 20, 1, 20)
      offers << BulkPricingRule.new("D", 15, 1, 15)
      end
      checkout = Checkout.new( offers )
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to eq(280.0)
    end
  end
end

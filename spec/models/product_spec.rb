require 'rails_helper'

describe Product do
  before do
    @user = create(:user)
  end
  describe '#create' do
    it "is valid with a product_name, images, product_explanation, product_status_id, shipping_method_id, shipping_charge_id, prefecture_id, days_until_shipping_id, price, status, user_id" do
      product = build(:product, user: @user)
      expect(product).to be_valid
    end

    it "is invalid without a product_name" do
      product = build(:product, product_name: nil)
      product.valid?
      expect(product.errors[:product_name]).to include("can't be blank")
    end

    it "is invalid without a product_explanation" do
      product = build(:product, product_explanation: nil)
      product.valid?
      expect(product.errors[:product_explanation]).to include("can't be blank")
    end

    it "is invalid without a product_status_id" do
      product = build(:product, product_status_id: nil)
      product.valid?
      expect(product.errors[:product_status_id]).to include("can't be blank")
    end
    it "is invalid without a shipping_method_id" do
      product = build(:product, shipping_method_id: nil)
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("can't be blank")
    end
    it "is invalid without a shipping_charge_id" do
      product = build(:product, shipping_charge_id: nil)
      product.valid?
      expect(product.errors[:shipping_charge_id]).to include("can't be blank")
    end
    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end
    it "is invalid without a days_until_shipping_id" do
      product = build(:product, days_until_shipping_id: nil)
      product.valid?
      expect(product.errors[:days_until_shipping_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "is invalid excepting a number" do
      product = build(:product, price: "a")
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end
    it "is valid that price is number" do
      product = build(:product, price: 1, user: @user)
      expect(product).to be_valid
    end

    it "is invalid without a status" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
  end
  describe '#update' do
    it "is valid with a product_name, images, product_explanation, product_status_id, shipping_method_id, shipping_charge_id, prefecture_id, days_until_shipping_id, price, status, user_id" do
      product = build(:product, user: @user)
      expect(product).to be_valid
    end

    it "is invalid without a product_name" do
      product = build(:product, product_name: nil)
      product.valid?
      expect(product.errors[:product_name]).to include("can't be blank")
    end

    it "is invalid without a product_explanation" do
      product = build(:product, product_explanation: nil)
      product.valid?
      expect(product.errors[:product_explanation]).to include("can't be blank")
    end

    it "is invalid without a product_status_id" do
      product = build(:product, product_status_id: nil)
      product.valid?
      expect(product.errors[:product_status_id]).to include("can't be blank")
    end
    it "is invalid without a shipping_method_id" do
      product = build(:product, shipping_method_id: nil)
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("can't be blank")
    end
    it "is invalid without a shipping_charge_id" do
      product = build(:product, shipping_charge_id: nil)
      product.valid?
      expect(product.errors[:shipping_charge_id]).to include("can't be blank")
    end
    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end
    it "is invalid without a days_until_shipping_id" do
      product = build(:product, days_until_shipping_id: nil)
      product.valid?
      expect(product.errors[:days_until_shipping_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    it "is invalid excepting a number" do
      product = build(:product, price: "a")
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end
    it "is valid that price is number" do
      product = build(:product, price: 1, user: @user)
      expect(product).to be_valid
    end

    it "is invalid without a status" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
  end

  describe '#search' do
    it "return products that match the search term" do
      product1 = create(:product, user: @user)
      product2 = create(:product, user: @user)
      expect(Product.search("商品")).to include(product1, product2)
      expect(Product.search("24")).to include(product2)
    end

    it "returns an empty collection when no results are found" do
      product = build(:product, user: @user)
      expect(Product.search("aaa")).to be_empty
    end
  end
end

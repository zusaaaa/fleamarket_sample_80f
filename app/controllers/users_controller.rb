class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @product = Product.where("user_id = ? and status = ?", current_user.id, "出品中")
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      case @card_brand
      when "Visa"
        @card_src = "icon-visa.png"
      when "American Express"
        @card_src = "icon-american-express.png"
      end
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2, 3)
    end
  end
end

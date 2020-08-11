class CardController < ApplicationController


  def index
  end


## 支払いに必要なトークン作成
  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: 3500, ## 決算する金額
      card: params["payjp-token"],
      currency: "jpy"
    )
  end

  ## 支払い処理
  def charge
    Payjp.api_key = ENV["`PAYJP_PRIVATE_KEY"]
    Payjp::Customer.create(
      
  end



## 元々の記述

  # def index
  # end

  # def new
  # end

  # def create
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   if params['payjp-token'].blank?
  #     render :new
  #   else
  #     customer = Payjp::Customer.create( ## 引数にemail,トークンIDを指定 metadataは現在ログイン中のユーザーかどうか識別
  #       email: current_user.email,
  #       card: params['payjp-token'],
  #       metadata: {user_id: current_user.id}
  #     )
  #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: default_card)
  #     if @card.save
  #       redirect_to action: "show"
  #     else
  #       render :new
  #     end
  #   end
  # end

  # def delete
  #   card = current_user.credit_cards.first
  #   if card.present?
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "confirmation", id: current_user.id
  # end

  # def show
  #   card = current.user.credit_cards.first
  #   if card.present?
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   else
  #     redirect_to action: "confirmation"
  #   end
  # end

  # def confirmation
  #   card = current_user.credit_cards
  #   redirect_toaction "show" if card.exists?
  # end

  # def pay
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   Payjp::Charge.create(
  #     amount: params[:amount], ## 決済金額
  #     card: params['payjp-token'],
  #     currency: 'jpy'
  #   )
  # end

end
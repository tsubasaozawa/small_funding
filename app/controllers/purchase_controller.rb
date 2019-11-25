class PurchaseController < ApplicationController
  before_action :set_project
  before_action :investment_params
  require 'payjp'

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => params[:investment_amount],
    :customer => card.customer_id,
    :currency => 'jpy',
    )
    investment_amount = Investment.create(investment_amount: params[:investment_amount], project_id: params[:id], user_id: current_user.id)
    if investment_amount.save
      redirect_to action: 'done'
    else
      render action: :show
    end
  end

  def done
    @investment = Investment.where(project_id: params[:id]).where(user_id: current_user.id).last
    @total_investment = Investment.where(project_id: params[:id]).where(user_id: current_user.id).sum(:investment_amount)
  end

  private

  def investment_params
    params.permit(:investment_amount, :id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end

class AccountsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @scooters = current_user.scooters
  end

  def edit
    @account = current_user
  end

  def update
    @account.update(account_params)
    if @account.save
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:user).permit(:first_name, :last_name, :address, :email)
  end

  def set_user
    @account = current_user
  end
end




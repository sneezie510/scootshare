class AccountsController < ApplicationController

  def show
    @account = current_user
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
    params.require(:account).permit(:first_name, :last_name, :address, :email)
  end

end




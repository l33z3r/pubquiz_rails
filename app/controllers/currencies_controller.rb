class CurrenciesController < ApplicationController

  before_action :logged_in_required
  before_action :admin_required
  before_action :get_variables

  def index
    @currencies = Currency.paginate(page: params[:page], per_page: 100).all
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      flash[:success] = 'Currency was successfully created.'
      redirect_to currencies_url
    else
      render action: 'new'
    end
  end

  def update
    if @currency.update(currency_params)
      flash[:success] = 'Currency was successfully updated.'
      redirect_to currencies_url
    else
      render action: 'edit'
    end
  end

  def destroy
    if @currency.destroy
      flash[:success] = 'Currency was successfully deleted'
    else
      flash[:error] = 'Currency was not deleted'
    end
    redirect_to currencies_url
  end

  private
  def get_variables
    if params[:id]
      @currency = Currency.find(params[:id])
    end
  end

  def currency_params
    params.require(:currency).permit(:name, :iso_code, :leading_symbol, :trailing_symbol,
                                     :thousands_separator, :decimal_separator, :active, :sorting_order)
  end

end

class PortfoliosController < ApplicationController
  
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def update
    @portfolio = Portfolio.find_by(id: params[:id])
    if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      redirect_to portfolios_path, notice: "Record updated successfully"
    else
      render :edit
    end
  end

  def show
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def destroy
    @portfolio = Portfolio.find_by(id: params[:id])
    @portfolio.destroy
    redirect_to portfolios_path, notice: 'Portfolio was successfully deleted.'
  end

end

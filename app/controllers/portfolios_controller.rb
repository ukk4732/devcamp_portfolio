class PortfoliosController < ApplicationController
  access all: [:show, :index, :angular], user: {except: [:destroy, :edit, :update, :new, :create, :destroy]}, site_admin: :all
  layout "portfolio"  
  
  def index
    @portfolio_items = Portfolio.all.order("created_at DESC")
  end

  def angular
    @angular_portfolio = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
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
    3.times { @portfolio.technologies.build } unless @portfolio.technologies.present?
  end

  def update
    @portfolio = Portfolio.find_by(id: params[:id])
    if @portfolio.update(portfolio_params)
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

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:id, :name])  
  end

end

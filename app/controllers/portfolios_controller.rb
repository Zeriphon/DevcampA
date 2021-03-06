class PortfoliosController < ApplicationController
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

    def index
        @portfolio_items = Portfolio.order("position ASC")
    end
    
    def sort
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
      end
      
      render nothing: true
    end
    
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    
    def create
      @portfolio_item = Portfolio.new(portfolio_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
    
    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end
    
    def update
        @portfolio_item = Portfolio.find(params[:id])
        respond_to do |format|
          if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def show
      @portfolio_item = Portfolio.find(params[:id])
    end
    
    def destroy
      @portfolio_item = Portfolio.find(params[:id])
      
      @portfolio_item.destroy
      respond_to do |format|
        format.html {redirect_to portfolios_url, notice: 'Portfolio was deleted'}
    end
  
    end
  
  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
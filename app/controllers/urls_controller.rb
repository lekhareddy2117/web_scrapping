require 'httparty'
require 'nokogiri'
require 'json'

class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]


  def scrape
    @links=Array.new
    @alphabets=Array.new
    @alphabets.push('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    @alphabets.each do |alphabet|
    url = 'https://www.moneycontrol.com/india/stockpricequote/'+alphabet+''
    page = scrape_page(url)
    @links.push(page.css('a.bl_12'))
    end
    return @links
 end

  def save_data
    scrape()
    @links.each do |link|
      link.each do |company_link|
        if !(company_link.children.presence==nil)
          if !(company_link.children[0].text.presence==nil)
            code= company_link.attributes['href'].value.split('/').last
            company_name= company_link.children[0].text
            Url.create(:company_code=>code,:company_name=>company_name)
          end
        end
      end
    end
    
  end

  def chart
    scrape()
   @links.each do |link|
    link.each do |company_link|
      if !(company_link.children.presence==nil)
        if !(company_link.children[0].text.presence==nil)
          code= company_link.attributes['href'].value.split('/').last
          charturl='https://www.moneycontrol.com/mc/widget/basicchart/get_chart_value?classic=true&sc_did='+code+'&dur=2yr'
          page = scrape_page(charturl)
          page=JSON.parse(page)["g1"]
        
          if page==nil
            stocks_chart=StocksChart.new
            stocks_chart.c_code=code
            stocks_chart.save 
          else
            page.each do |chart|
              stocks_chart=StocksChart.new
              stocks_chart.c_code=code
              stocks_chart.date=chart["date"]
              stocks_chart.open=chart["open"]
              stocks_chart.high=chart["high"]
              stocks_chart.low=chart["low"]
              stocks_chart.close=chart["close"]
              stocks_chart.volume=chart["volume"]
              stocks_chart.value=chart["value"]
              stocks_chart.save 
           end 
          end
        end
       end#if
      end
    end#link
  end


  def scrape_page(url)
    scrape = Nokogiri::HTML(HTTParty.get(url))
  end


  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end



  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:url, :company_name)
    end
end

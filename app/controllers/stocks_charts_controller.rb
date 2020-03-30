class StocksChartsController < ApplicationController
  before_action :set_stocks_chart, only: [:show, :edit, :update, :destroy]

  # GET /stocks_charts
  # GET /stocks_charts.json
  def index
    @stocks_charts = StocksChart.all
  end

  # GET /stocks_charts/1
  # GET /stocks_charts/1.json
  def show
  end

  # GET /stocks_charts/new
  def new
    @stocks_chart = StocksChart.new
  end

  # GET /stocks_charts/1/edit
  def edit
  end

  # POST /stocks_charts
  # POST /stocks_charts.json
  def create
    @stocks_chart = StocksChart.new(stocks_chart_params)

    respond_to do |format|
      if @stocks_chart.save
        format.html { redirect_to @stocks_chart, notice: 'Stocks chart was successfully created.' }
        format.json { render :show, status: :created, location: @stocks_chart }
      else
        format.html { render :new }
        format.json { render json: @stocks_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks_charts/1
  # PATCH/PUT /stocks_charts/1.json
  def update
    respond_to do |format|
      if @stocks_chart.update(stocks_chart_params)
        format.html { redirect_to @stocks_chart, notice: 'Stocks chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @stocks_chart }
      else
        format.html { render :edit }
        format.json { render json: @stocks_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks_charts/1
  # DELETE /stocks_charts/1.json
  def destroy
    @stocks_chart.destroy
    respond_to do |format|
      format.html { redirect_to stocks_charts_url, notice: 'Stocks chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stocks_chart
      @stocks_chart = StocksChart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stocks_chart_params
      params.require(:stocks_chart).permit(:date, :open, :high, :low, :close, :volume, :value)
    end
end

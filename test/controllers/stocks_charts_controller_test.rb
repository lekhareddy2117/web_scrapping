require 'test_helper'

class StocksChartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stocks_chart = stocks_charts(:one)
  end

  test "should get index" do
    get stocks_charts_url
    assert_response :success
  end

  test "should get new" do
    get new_stocks_chart_url
    assert_response :success
  end

  test "should create stocks_chart" do
    assert_difference('StocksChart.count') do
      post stocks_charts_url, params: { stocks_chart: { close: @stocks_chart.close, date: @stocks_chart.date, high: @stocks_chart.high, low: @stocks_chart.low, open: @stocks_chart.open, value: @stocks_chart.value, volume: @stocks_chart.volume } }
    end

    assert_redirected_to stocks_chart_url(StocksChart.last)
  end

  test "should show stocks_chart" do
    get stocks_chart_url(@stocks_chart)
    assert_response :success
  end

  test "should get edit" do
    get edit_stocks_chart_url(@stocks_chart)
    assert_response :success
  end

  test "should update stocks_chart" do
    patch stocks_chart_url(@stocks_chart), params: { stocks_chart: { close: @stocks_chart.close, date: @stocks_chart.date, high: @stocks_chart.high, low: @stocks_chart.low, open: @stocks_chart.open, value: @stocks_chart.value, volume: @stocks_chart.volume } }
    assert_redirected_to stocks_chart_url(@stocks_chart)
  end

  test "should destroy stocks_chart" do
    assert_difference('StocksChart.count', -1) do
      delete stocks_chart_url(@stocks_chart)
    end

    assert_redirected_to stocks_charts_url
  end
end

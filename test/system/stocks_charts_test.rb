require "application_system_test_case"

class StocksChartsTest < ApplicationSystemTestCase
  setup do
    @stocks_chart = stocks_charts(:one)
  end

  test "visiting the index" do
    visit stocks_charts_url
    assert_selector "h1", text: "Stocks Charts"
  end

  test "creating a Stocks chart" do
    visit stocks_charts_url
    click_on "New Stocks Chart"

    fill_in "Close", with: @stocks_chart.close
    fill_in "Date", with: @stocks_chart.date
    fill_in "High", with: @stocks_chart.high
    fill_in "Low", with: @stocks_chart.low
    fill_in "Open", with: @stocks_chart.open
    fill_in "Value", with: @stocks_chart.value
    fill_in "Volume", with: @stocks_chart.volume
    click_on "Create Stocks chart"

    assert_text "Stocks chart was successfully created"
    click_on "Back"
  end

  test "updating a Stocks chart" do
    visit stocks_charts_url
    click_on "Edit", match: :first

    fill_in "Close", with: @stocks_chart.close
    fill_in "Date", with: @stocks_chart.date
    fill_in "High", with: @stocks_chart.high
    fill_in "Low", with: @stocks_chart.low
    fill_in "Open", with: @stocks_chart.open
    fill_in "Value", with: @stocks_chart.value
    fill_in "Volume", with: @stocks_chart.volume
    click_on "Update Stocks chart"

    assert_text "Stocks chart was successfully updated"
    click_on "Back"
  end

  test "destroying a Stocks chart" do
    visit stocks_charts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stocks chart was successfully destroyed"
  end
end

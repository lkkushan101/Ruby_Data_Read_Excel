require 'test/unit'
require 'selenium-webdriver'
require 'roo'

class MyTest < Test::Unit::TestCase

  def setup
    xlsx = Roo::Spreadsheet.open("C:/data.xlsx")
    @driver=Selenium::WebDriver.for :chrome

    @driver.manage.window.maximize

    @driver.navigate.to xlsx.sheet('Sheet1').cell(2,1)
  end

  def test_search


    xlsx = Roo::Spreadsheet.open("C:/data.xlsx")
    #Typing the Selenium in Google search
    @driver.find_element(:name, "q").send_keys xlsx.sheet('Sheet1').cell(2,2)

    #Clicking the search button
    @driver.find_element(:name, "q").send_key :return


    #Clicking the search button
    @driver.find_element(:xpath, "//*[@id='rso']/div[3]/div/div[1]/div/div/div[1]/a/h3").click


    #Asserting whether the registration success message is diaplyed
    puts @driver.title


  end

  def teardown
    @driver.quit
  end



end
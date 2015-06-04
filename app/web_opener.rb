# coding: utf-8
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'dotenv'

require __dir__ + '/incrementer.rb'

Dotenv.load

Capybara.current_driver    = :selenium
Capybara.app_host          = ENV['TOP_URL']
Capybara.default_wait_time = 20

module PrivateCrawler
  class TsukubaCommunity
    include  Capybara::DSL

    def login
      visit('/')
      click_link "公共施設予約システム(一般用)"

      new_window=page.driver.browser.window_handles.last
      page.within_window new_window do
        sleep 2

        #空き状況検索
        within_frame(0) {
          click_link 9
          sleep 2
        }

        #目的から探す
        within_frame(1) {
          click_link 1
          sleep 2
        }

        #テニスコート
        within_frame(1) {
          click_link 33
          sleep 2
        }

        within_frame(1) {
          #東光台運動公園
          click_link 21
          sleep 2
          inc = PrivateCrawler::Incrementer.new
          for num in 2..8 do
            click_link_css('#'+num.to_s)
            sleep 2
            save_page __dir__ + '/../html_01/' + inc.getCount.to_s + '.html'
            click_link 0
            sleep 2
          end
          click_link 0
          sleep 2
        }

        within_frame(1) {
          #さくら運動公園
          click_link 33
          sleep 2
          inc = PrivateCrawler::Incrementer.new
          for num in 2..8 do
            click_link_css('#'+num.to_s)
            sleep 2
            save_page __dir__ + '/../html_02/' + inc.getCount.to_s + '.html'
            click_link 0
            sleep 2
          end
          click_link 0
          sleep 2
        }

        within_frame(1) {
          #筑波北部公園
          click_link 13
          sleep 2
          inc = PrivateCrawler::Incrementer.new
          for num in 2..8 do
            click_link_css('#'+num.to_s)
            sleep 2
            save_page __dir__ + '/../html_03/' + inc.getCount.to_s + '.html'
            click_link 0
            sleep 2
          end
          click_link 0
          sleep 2
        }

      end
    end

    #css-selectorを指定しての、click_linkができるメソッド
    def click_link_css(css_selector)
      base_xpath = Nokogiri::CSS.xpath_for(css_selector)[0]
      xpath = "#{base_xpath}[../a][@href]"
      find(:xpath, xpath).click
    end
  end
end

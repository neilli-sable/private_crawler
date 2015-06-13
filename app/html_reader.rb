# coding: utf-8
require 'nokogiri'
require __dir__ + '/reservation_status.rb'

module PrivateCrawler
  class HtmlReader

    # analysisDirectoryについて
    #   placeNum 01:東光台運動公園, 02: さくら運動公園, 03:筑波北部公園
    #   courtNum 東光台運動公園:2〜3, さくら運動公園:2〜6, 筑波北部公園:2〜13
    #   timeNum 1:9〜11, 2:11〜13, 3:13〜15, 4:15〜17, 5:17〜19, 6:19〜21
    def analysisDirectory(placeNum:, courtNum:, timeNum:)

      dir = __dir__ + '/../html_' + placeNum + '/'

      aDayArray = []

      for num in 0..6 do
        x = nil
        html = File.open(dir + num.to_s + '.html')

        nokogiri = Nokogiri::HTML(html.read)
        reserve = nokogiri.xpath('/html/body/form/table[5]/tbody/tr[' +
        courtNum +
        ']/td[' +
        timeNum +
        '][@class="time-non"]')

        day = nokogiri.xpath(
          '/html/body/form/table[4]/tbody/tr/th[@class="dchg-selct"]'
          ).text

        html.close

        if reserve.empty? then
          isReserved = false
        else
          isReserved = true
        end

        aDay = PrivateCrawler::ADay.new(day, isReserved)
        aDayArray.push(aDay)
      end

      aDayArray
    end

  end
end

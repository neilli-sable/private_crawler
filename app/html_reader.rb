# coding: utf-8
require 'nokogiri'

module PrivateCrawler
  class HtmlReader

    def initialize()
      File.open __dir__ + '/../tennis.html', 'w' do |f|
        f.write ''
      end
    end

    def readFile(path)
      File.open(path)
    end

    def addReport(row)
      File.open __dir__ + '/../tennis.html', 'a' do |f|
        f.write row
      end
    end

    # analysisDirectoryについて
    #   placeNum 01:東光台運動公園, 02: さくら運動公園, 03:筑波北部公園
    #   courtNum 東光台運動公園:2〜3, さくら運動公園:2〜6, 筑波北部公園:2〜13
    #   timeNum 1:9〜11, 2:11〜13, 3:13〜15, 4:15〜17, 5:17〜19, 6:19〜21
    def analysisDirectory(placeNum:, courtNum:, timeNum:)
      dir = __dir__ + '/../html_' + placeNum + '/'

      for num in 0..6 do
        x = nil
        html = self.readFile(dir + num.to_s + '.html')

        nokogiri = Nokogiri::HTML(html.read)
        x = nokogiri.xpath('/html/body/form/table[5]/tbody/tr[' +
        courtNum +
        ']/td[' +
        timeNum +
        '][@class="time-non"]')

        if ! x.empty? then
          self.addReport '<li>' + nokogiri.xpath('/html/body/form/table[4]/tbody/tr/th[@class="dchg-selct"]').text + '</li>'
        end

      end
    end

  end
end

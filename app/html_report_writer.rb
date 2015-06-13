# coding: utf-8
require 'nokogiri'
require __dir__ + '/html_reader.rb'

module PrivateCrawler
  class HtmlReportWriter

    # レポートファイルの初期化
    def initialize()
      File.open __dir__ + '/../tennis.html', 'w' do |f|
        f.write ''
      end
      File.open __dir__ + '/../tennisByDay.html', 'w' do |f|
        f.write ''
      end
    end

    def createReport(reservationStatus)
      html = <<"EOS"
      <!DOCTYPE html>
      <html lang="ja">
      <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" href="tennis.css">
      <title>Do you play tennis?</title>
      </head>
      <body>
      <h1>Do you play tennis?</h1>
      <p class="description">ナイターが空いている日付を表示しています。</p>
EOS

      #情報取得時点の日時を取得
      day = Time.now
      dayFormat = sprintf("%d月%d日 %02d:%02d に更新されました。", day.month.to_s, day.day.to_s, day.hour.to_s, day.min.to_s)

      html += '<div class="refresh"><p>' + dayFormat + '</p></div>'

      currentGround = "" # ループ中で参照しているグラウンド名
      reservationStatus.each do |rs|
        if (rs.groundName != currentGround)
          html += '<h2>' + rs.groundName + '</h2>'
          currentGround = rs.groundName
        end
        html += '<h3>' + rs.courtName + '</h3><ul class="clearfix">'

        rs.aDayArray.each do |aDay|
          if aDay.isReserved
            html += '<li>' + aDay.day + '</li>'
          end
        end

        html += '</ul>'
      end

      html += <<"EOS"
      </body>
      </html>
EOS

      write(html)

    end

    private
    def write(html)
      File.open __dir__ + '/../tennis.html', 'a' do |f|
        f.write html
      end
    end

  end
end

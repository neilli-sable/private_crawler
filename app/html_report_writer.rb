# coding: utf-8
require 'nokogiri'
require __dir__ + '/html_reader.rb'

module PrivateCrawler
  class HtmlReportWriter

    HEADER = <<"EOS"
    <!DOCTYPE html>
    <html lang="ja">
    <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="tennis.css">
    <title>Do you play tennis?</title>
    </head>
    <body>
    <h1>Do you play tennis?</h1>
    <p class="description">ナイターが空いているコートを表示しています。</p>
EOS

  FOOTER = <<"EOS"
  <footer>
    <p><a href="https://twitter.com/neilling">This page create by @neilling</a></p>
  </footer>
  </body>
  </html>
EOS

    # レポートファイルの初期化
    def initialize()
      File.open __dir__ + '/../tennis.html', 'w' do |f|
        f.write ''
      end
      File.open __dir__ + '/../tennisPerCourt.html', 'w' do |f|
        f.write ''
      end
    end

    def createReportPerDay(dailyStatus)
      html = HEADER

      # 情報取得時点の日時を挿入
      html += timeCaption

      dailyStatus.each do |ds|
        currentGround = "" # ループ中で参照しているグラウンド名
        html += '<h2>' + ds.day + '</h2>'

        if ds.isReserved
            html += '<div class="courtInfo"><ul class="clearfix">空きはありません</li></ul></div>'
            next
        end

        ds.courtArray.each do |dCourt|
          if (dCourt.groundName != currentGround)
            isFirstCourt = true
          end
          if !dCourt.isReserved
            if isFirstCourt
              html += currentGround == "" ? '' : '</ul></div>'
              html += '<div class="courtInfo">'
              html += '<h3>' + dCourt.groundName + '</h3><ul class="clearfix">'
              currentGround = dCourt.groundName
            end
            html += '<li>' + dCourt.courtName + '</li>'
          end
        end
        html += '</ul></div>'
      end

      html += FOOTER

      write(html)

    end

    def createReportPerCourt(reservationStatus)

      html = HEADER

      #情報取得時点の日時を挿入
      html += timeCaption

      currentGround = "" # ループ中で参照しているグラウンド名
      reservationStatus.each do |rs|
        if (rs.groundName != currentGround)
          html += '<h2>' + rs.groundName + '</h2>'
          currentGround = rs.groundName
        end
        html += '<div class="courtInfo">'
        html += '<h3>' + rs.courtName + '</h3><ul class="clearfix">'

        rs.aDayArray.each do |aDay|
          if !aDay.isReserved
            html += '<li>' + aDay.day + '</li>'
          end
        end

        html += '</ul></div>'
      end

      html += FOOTER

      writePerCourt(html)

    end

    private
    def timeCaption
      day = Time.now
      info = sprintf("%d月%d日 %02d:%02d に更新されました。",
        day.month.to_s, day.day.to_s, day.hour.to_s, day.min.to_s)

      '<div class="refresh"><p>' + info + '</p></div>'
    end

    def write(html)
      File.open __dir__ + '/../tennis.html', 'a' do |f|
        f.write html
      end
    end

    def writePerCourt(html)
      File.open __dir__ + '/../tennisPerCourt.html', 'a' do |f|
        f.write html
      end
    end

  end
end

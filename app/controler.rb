# coding: utf-8
require __dir__ + '/web_opener.rb'
require __dir__ + '/html_reader.rb'
require __dir__ + '/send_reporter.rb'

#htmlを取得
tc = PrivateCrawler::TsukubaCommunity.new
tc.login

#htmlを解析/レポート出力
reader = PrivateCrawler::HtmlReader.new

header = <<"EOS"
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="tennis.css">
<title>Do you play tennis?</title>
</head>
<body>
<h1>Do you play tennis?</h1>
<p class="description">それぞれのコートについて、ナイターが空いている日付を表示しています。</p>
<div class="refreshButton">
<p></p>
<button disable="true">更新</button>
</div>
EOS

footer = <<"EOS"
</body>
</html>
EOS

reader.addReport header
reader.addReport "<h2>東光台運動公園</h2>"
reader.addReport "<h3>全天候コート（A）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"01", courtNum:"2", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（B）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"01", courtNum:"3", timeNum:"6")

reader.addReport "</ul><h2>さくら運動公園</h2>"
reader.addReport "<h3>全天候コート（D）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"02", courtNum:"5", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（E）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"02", courtNum:"6", timeNum:"6")

reader.addReport "</ul><h2>筑波北部公園</h2>"
reader.addReport "<h3>全天候コート（A-1）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"2", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（A-2）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"3", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（A-3）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"4", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（A-4）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"5", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（B-1）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"6", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（B-2）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"7", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（B-3）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"8", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（B-4）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"9", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（C-1）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"10", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（C-2）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"11", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（C-3）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"12", timeNum:"6")
reader.addReport "</ul><h3>全天候コート（C-4）</h3><ul class=\"clearfix\">"
reader.analysisDirectory(placeNum:"03", courtNum:"13", timeNum:"6")
reader.addReport '</ul>' + footer

#sender = PrivateCrawler::SendReporter.new
#sender.sendMail

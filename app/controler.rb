# coding: utf-8
require __dir__ + '/web_opener.rb'
require __dir__ + '/html_reader.rb'
require __dir__ + '/html_report_writer.rb'
require __dir__ + '/daily_status.rb'
require __dir__ + '/send_reporter.rb'

#htmlを取得
tc = PrivateCrawler::TsukubaCommunity.new
tc.login

#htmlを解析/レポート出力
reader = PrivateCrawler::HtmlReader.new
reservationStatusArray = []

reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '東光台運動公園', '全天候コート（A）',
  reader.analysisDirectory(placeNum:"01", courtNum:"2", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '東光台運動公園', '全天候コート（B）',
  reader.analysisDirectory(placeNum:"01", courtNum:"3", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  'さくら運動公園', '全天候コート（D）',
  reader.analysisDirectory(placeNum:"02", courtNum:"5", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  'さくら運動公園', '全天候コート（E）',
  reader.analysisDirectory(placeNum:"02", courtNum:"6", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（A-1）',
  reader.analysisDirectory(placeNum:"03", courtNum:"2", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（A-2）',
  reader.analysisDirectory(placeNum:"03", courtNum:"3", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（A-3）',
  reader.analysisDirectory(placeNum:"03", courtNum:"4", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（A-4）',
  reader.analysisDirectory(placeNum:"03", courtNum:"5", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（B-1）',
  reader.analysisDirectory(placeNum:"03", courtNum:"6", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（B-2）',
  reader.analysisDirectory(placeNum:"03", courtNum:"7", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（B-3）',
  reader.analysisDirectory(placeNum:"03", courtNum:"8", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（B-4）',
  reader.analysisDirectory(placeNum:"03", courtNum:"9", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（C-1）',
  reader.analysisDirectory(placeNum:"03", courtNum:"10", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（C-2）',
  reader.analysisDirectory(placeNum:"03", courtNum:"11", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（C-3）',
  reader.analysisDirectory(placeNum:"03", courtNum:"12", timeNum:"6")
))
reservationStatusArray.push(PrivateCrawler::ReservationStatus.new(
  '筑波北部公園', '全天候コート（C-4）',
  reader.analysisDirectory(placeNum:"03", courtNum:"13", timeNum:"6")
))

writer = PrivateCrawler::HtmlReportWriter.new
writer.createReportPerCourt(reservationStatusArray)

dsFactory = PrivateCrawler::DailyStatusFactory.new
dailyStatusArray = dsFactory.createDailyStatus(reservationStatusArray)
writer.createReportPerDay(dailyStatusArray)

# coding: utf-8

module PrivateCrawler

  class DailyStatusFactory

    def createDailyStatus(reservationStatus)
      # 日付ごとのループをさせるため、適当なデータから日付情報を取得
      daysList = []
      reservationStatus[0].aDayArray.each do |aDay|
        daysList.push(aDay.day)
      end

      dailyStatusArray = []  # dailyStatusの集合

      daysList.each do |day|
        dailyStatus = PrivateCrawler::DailyStatus.new
        dailyStatus.day = day
        dailyStatus.courtArray = []
        dailyStatusArray.push(dailyStatus)
      end

      dailyStatusArray.each do |ds|
        reservationStatus.each do |rs|
          rs.aDayArray.each do |aDay|
            if(ds.day == aDay.day)
              court = PrivateCrawler::Court.new
              court.groundName = rs.groundName
              court.courtName = rs.courtName
              court.isReserved = aDay.isReserved

              ds.courtArray.push(court)
            end
          end
        end
      end
      dailyStatusArray

    end

  end

  class DailyStatus
    attr_accessor :day, :courtArray
  end

  class Court
    attr_accessor :groundName, :courtName, :isReserved
  end

end

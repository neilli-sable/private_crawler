# coding: utf-8

module PrivateCrawler

  class ReservationStatus
    attr_accessor :groundName, :courtName, :aDayArray

    def initialize(groundName, courtName, aDayArray)
      @groundName = groundName
      @courtName  = courtName
      @aDayArray  = aDayArray
    end
  end

  class ADay
    attr_accessor :day, :isReserved

    def initialize(day, isReserved)
      @day = day
      @isReserved = isReserved
    end

  end

end

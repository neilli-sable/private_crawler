# coding: utf-8
module PrivateCrawler
  class Incrementer

    def initialize()
      @count = 0
    end

    def getCount
      ret = @count
      @count += 1
      ret
    end

  end
end

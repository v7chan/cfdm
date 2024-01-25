require 'nokogiri'
require 'open-uri'

# hello world
class WodListController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("http://www.crossfitdelmar.com/"))
    
    @todays_date = doc.xpath('//div[3]/div[2]/div/div[2]/h3//text()')
    @tomorrows_date = doc.xpath('//div[3]/a//text()')
    
    todays_list = doc.xpath('//div[2]/table//text()')
    tomorrows_list = doc.xpath('//div[@id="tomorrowwod"]/table//text()')
    
    if @todays_date.empty?
      @todays_date = 'No WOD Today :('
    end
    
    @todays_strength_skill = todays_list[1]
    @todays_wod = todays_list[3..(todays_list.length - 1)]
    
    if (@tomorrows_date.empty? && tomorrows_list.any?)
      @tomorrows_date = doc.xpath('//div[2]/a[@class="alt"]//text()')
    end
    
    @tomorrows_strength_skill = tomorrows_list[1]
    @tomorrows_wod = tomorrows_list[3..(tomorrows_list.length - 1)]
    
    @debug = todays_list
  end
end

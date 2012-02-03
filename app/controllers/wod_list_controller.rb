require 'nokogiri'
require 'open-uri'

class WodListController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("http://www.crossfitdelmar.com/"))
    
    @todays_date = doc.xpath('//h3//text()')
   
    todays_list = doc.xpath('//div[2]/table//text()')
    @todays_strength_skill = todays_list[1]
    @todays_wod = todays_list[3..(todays_list.length - 1)]
    
    @tomorrows_date = doc.xpath('//div[3]/a//text()')
    
    tomorrows_list = doc.xpath('//div[4]/table//text()')
    @tomorrows_strength_skill = tomorrows_list[1]
    @tomorrows_wod = todays_list[3..(tomorrows_list.length - 1)]
    
  end
end

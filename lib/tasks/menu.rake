namespace :scrape_foodpanda_menu do
  # this is a description of your task
  
  desc "Scrape the list of"
  task :scrape_menus => :environment do
    # do something

      require 'open-uri'
      require 'nokogiri'

      url = "https://www.foodpanda.hk/restaurants?lat=22.2799907&lng=114.1587983&district=Central"
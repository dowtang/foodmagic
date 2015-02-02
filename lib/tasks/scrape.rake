namespace :scrape_foodpanda do
  # this is a description of your task
  
  desc "Scrape the list of"
  task :scrape_restaurants => :environment do
    # do something

      require 'open-uri'
      require 'nokogiri'

      url = "https://www.foodpanda.hk/restaurants?lat=22.2799907&lng=114.1587983&district=Central"

      document = open(url).read

      html_doc = Nokogiri::HTML(document)


      data_format_name = "article > div > div > h2 > a"
      data_format_cuisine_type = "div.details > div.description > ul.cuisines > li:nth-child(1) > a:nth-child(1)"
      data_format_location = "section > article > div > div > address"
      data_format_logo_url = "section > article > div > div > img"
      data_format_review_count = "article.vendor.js-vendors-list-vendor-panel > div.header > div.extra > div.rating > .review"
      data_format_vendor_info = "dl.vendor-quick-info:nth-of-type(1)"
      data_format_menu_url = "section.vendor-list > section.vendors.js-infscroll-container > article.vendor.js-vendors-list-vendor-panel > div.details > a:nth-child(3).btn.btn-primary.btn-lg.btn-arrow.js-vendors-list-vendor-panel-link"

      names = html_doc.css(data_format_name)
      cuisinetypes = html_doc.css(data_format_cuisine_type)
      locations = html_doc.css(data_format_location)
      logourls = html_doc.css(data_format_logo_url)
      reviewcounts = html_doc.css(data_format_review_count)
      vendorinfos = html_doc.css(data_format_vendor_info)
      menuurls = html_doc.css(data_format_menu_url)
      
      names.each_with_index do |name, index|

        puts "-------------------"
        puts index
        puts "NAME>> #{name.text}"
        # puts "CUISINE>> #{cuisinetypes[index].text}"
        # puts "LOCATION>> #{locations[index].text}"
        # puts "LOGO URL>> #{logourls[index]}"
        puts "LOGO URL>> http:#{logourls[index].attr("data-src")}"
        puts "MENU URL>> http:/#{menuurls[index].attr("href")}"
        # puts "NUMBER OF REVIEWS>> #{reviewcounts[index].text.squish}"
        # puts "VENDOR INFO>> #{vendorinfos[index].css('.vendor-delivery-time')}"
        # puts "VENDOR INFO>> #{vendorinfos[index]}"
        # puts "vendor info >>> #{vendorinfos[index]}"


        delivery_time_format = ".vendor-delivery-time + dd"
        delivery_time = vendorinfos[index].css(delivery_time_format).text.squish
        # puts "delivery_time >>> #{delivery_time}"


        delivery_fee_format = ".vendor-delivery-fee + dd"
        delivery_fee = vendorinfos[index].css(delivery_fee_format).text.squish

        if delivery_fee == ''
          # puts "Free delivery"
          delivery_fee = "Free delivery"
        end
        # puts "delivery_fee >>> #{delivery_fee}"

        delivery_minimum_format = ".vendor-delivery-minimum + dd"
        delivery_minimum = vendorinfos[index].css(delivery_minimum_format).text.squish
        # puts "delivery_minimum >>> #{delivery_minimum}"

        delivery_payment_type_format = ".vendor-online_payment + dd"
        delivery_payment_type = vendorinfos[index].css(delivery_payment_type_format).text.squish
        # puts "delivery_payment_type >>> #{delivery_payment_type}"

        # puts "DELIVERY TIME>> #{deliverytimes[index].text.squish}"
        # puts "DELIVERY COST>> #{deliverycosts[index].text}"
        # puts "MIN ORDER>> #{minimumorders[index].text.squish}"
        # puts "PAYMENT TYPES>> #{paymenttypes[index].text}"
        
        Restaurant.create(
          :name => name.text, 
          :cuisinetype => cuisinetypes[index].text, 
          :location => locations[index].text, 
          :logourl => "http:#{logourls[index].attr("data-src")}",
          :menuurl => "https://www.foodpanda.hk#{menuurls[index].attr("href")}",
          :deliverytime => delivery_time, 
          :deliverycost => delivery_fee, 
          :minimumorder => delivery_minimum, 
          :paymenttype => delivery_payment_type,
          :reviewcount => reviewcounts[index].text.squish
          )

        puts "#{name.text} is done!"
        
      end

      puts "everyting is done"
      # puts "names >>> #{names.count}"
      # puts "vendor info >>> #{vendorinfos.count}"
      
  end

end
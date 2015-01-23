namespace :scrape do
  # this is a description of your task
  
  desc "Scrape the list of"
  task :scrape => :environment do
    # do something

      require 'open-uri'
      require 'nokogiri'

      url = [
        "https://www.foodpanda.hk/restaurants?lat=22.2799907&lng=114.1587983&district=Central",
        
        "https://www.foodpanda.hk/restaurants?lat=22.2988123&lng=114.1721746&district=Tsim+Sha+Tsui",
        
        "https://www.foodpanda.hk/restaurants?lat=22.2859787&lng=114.1914919&district=Causeway+Bay"]


      document = open(url).read

      html_doc = Nokogiri::HTML(document)

      data_format_name = "article > div > div > h2 > a"
      data_format_cuisine_type = "div.details > div.description > ul.cuisines > li:nth-child(1) > a:nth-child(1)"
      data_format_location = "section > article > div > div > address"
      data_format_logo_url = "section > article > div > div > img"
      data_format_review_count = "article.vendor.js-vendors-list-vendor-panel > div.header > div.extra > div.rating > .review"
      data_format_vendor_info = "article.vendor.js-vendors-list-vendor-panel > div.details > div.description > dl.vendor-quick-info"

      # data_format_delivery_time = "article.vendor.js-vendors-list-vendor-panel > div.details > div.description > dl:nth-child(2).vendor-quick-info > dd:nth-child(2)"

      # data_format_delivery_cost = "article > div > div > dl > dt.vendor-delivery-fee"

      # data_format_payment_type = "div.description > dl.vendor-quick-info > dt:nth-child(6).vendor-online-payment > ul:nth-child(1).csv-list > li:nth-child(1)"
      

      names = html_doc.css(data_format_name)
      cuisinetypes = html_doc.css(data_format_cuisine_type)
      locations = html_doc.css(data_format_location)
      logourls = html_doc.css(data_format_logo_url)
      # deliverytimes = html_doc.css(data_format_delivery_time)
      # deliverycosts = html_doc.css(data_format_delivery_cost)
      # minimumorders = html_doc.css(data_format_minimum_order)
      # paymenttypes = html_doc.css(data_format_payment_type)
      reviewcounts = html_doc.css(data_format_review_count)
      vendorinfos = html_doc.css(data_format_vendor_info)

      names.each_with_index do |name, index|
        Restaurant.create(
          :name => name.text, 
          :cuisinetype => cuisinetypes[index].text, 
          :location => locations[index].text, 
          :logourl => logourls[index].attr("src"), 
          # :deliverytime => deliverytimes[index].text, 
          # :deliverycost => deliverycosts[index].text, 
          # :minimumorder => minimumorders[index].text, 
          # :paymenttype => paymenttypes[index].text, 
          :reviewcount => reviewcounts[index].text.squish)


        puts "---------------------------------------"
        puts index
        # puts name.text
        puts "#{name.text} is done!"
        # puts "CUISINE>> #{cuisinetypes[index].text}"
        # puts "LOCATION>> #{locations[index].text}"
        # puts "LOGO URL>> #{logourls[index].attr("src")}"
        # puts "NUMBER OF REVIEWS>> #{reviewcounts[index].text.squish}"
        # puts "VENDOR INFO>> #{vendorinfos[index]}"

        # puts "DELIVERY TIME>> #{deliverytimes[index].text.squish}"
        # puts "DELIVERY COST>> #{deliverycosts[index].text}"
        # puts "MIN ORDER>> #{minimumorders[index].text.squish}"
        # puts "PAYMENT TYPES>> #{paymenttypes[index].text}"
   

      end
      puts "everyting is done"

  end




end
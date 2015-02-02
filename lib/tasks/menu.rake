namespace :scrape_foodpanda_menu do
#   # this is a description of your task
  
#   desc "Scrape the list of"
  task :scrape_menus => :environment do
#     # do something

      require 'open-uri'
      require 'nokogiri'


      url = "https://www.foodpanda.hk/restaurants?lat=22.2799907&lng=114.1587983&district=Central"

      # WE WANT TO RUN THE SCRAPING FOR ALL THE RESTAURANTS IN OUR DATABASE, LET'S LOOP THROUGH ALL OF THEM
      Restaurant.all.each do |restaurant|
        # WHAT FOLLOWS APPLIES FOR EACH RESTAURANT

        url = restaurant.menuurl
        puts "NOW SCRAPPING #{restaurant.name}, FROM URL: #{url}"
        document = open(url).read

        html_doc = Nokogiri::HTML(document)

        # data_format_food_heading = "div > div > section > div > div"

        # THIS IS MY CSS FORMAT FOR EACH MENU ITEM
        # data_format_menu_item = ".menu-list"
        data_format_menu_item = ".menu-item-container"

        # HERE I'M GRABING ALL THE SINGLE MENU ITEMS AND STORE THEM INTO AN ARRAY menu_items
        menu_items = html_doc.css(data_format_menu_item)

        menu_items.each_with_index do | menu_item, index |
          

        # IF THE PAGE HAS THE LAYOUT A
        # PUTS "LETS SCRAPE THIS RESTAURANT NAME WITH METHOD A"


        # ELSE IF THE PAGE HAS THE LAYOUT B
        # PUTS "LETS SCRAPE THIS RESTAURANT NAME WITH METHOD B"


          if index < 15
          puts index

          # category_title_format = ".category-title"
          dish_title_format = ".title"
          dish_size_format = "article.variation > div.title"
          dish_price_format = "article.variation > div.price"
          

          dish_title = menu_item.css(dish_title_format).text
          dish_title = menu_item.css(dish_title_format).text
          dish_size = menu_item.css(dish_size_format).text
          dish_price = menu_item.css(dish_price_format).text
          
          # dish_title.each_with_index do | menu_item, index |

          # puts "Category Title: #{category_title}"
          puts "Dish Title: #{dish_title}"
          puts "Dish Size: #{dish_size}"
          puts "Dish Price: #{dish_price}"

          # puts menu_item
          end
        
        end

        # puts "Foodheading>> #{foodheadings.text}"
        # puts "Foodheading>> #{menu_items}"

        puts "I'm done with #{restaurant.name}"
        puts "---------------------------------------"
        # END OF THE LOOP, THEN IT GOES TO THE NEXT RESTAURANT AND DOES THE SAME ALL OVER AGAIN
      end

      puts "Now all the restaurants are done!"







      # foodheadings = html_doc.css(data_format_food_heading)
      # foodheadingchilds = html_doc.css(data_format_menu_item)
      # foodheadingchildsizes = html_doc.css(data_format_menu_item_size)
      # foodprices = html_doc.css(data_format_food_price)

      # puts "-------------------"
      #   puts index
      #   puts "Foodheading>> #{foodheadings.text}"
      


        # puts "CUISINE>> #{cuisinetypes[index].text}"
        # puts "LOCATION>> #{locations[index].text}"
        # puts "LOGO URL>> #{logourls[index]}"
        # puts "LOGO URL>> http:#{logourls[index].attr("data-src")}
      # Dish.create(
      #   :restaurant_id => 
      #   :dish_category => foodheadings 
      #   :dish_name => foodheadingchilds 
      #   :dish_size => foodheadingchildsizes
      #   :dish_price => foodprices 
      #   )
  end
end


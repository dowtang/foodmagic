namespace :harry_scrape_foodpanda_menu do
  desc "Scrape the list of"
  task :scrape_menus => :environment do
    require 'open-uri'
    require 'nokogiri'

    Restaurant.all.each do |restaurant|
      url = restaurant.menuurl
      puts "NOW SCRAPPING #{restaurant.name}, FROM URL: #{url}"
      document = open(url).read
      html_doc = Nokogiri::HTML(document)

      data_format_menu_item = ".menu-item-container"
      menu_items = html_doc.css(data_format_menu_item)

      menu_items.each_with_index do |menu_item, index|

        if index < 15
          puts index

          dish_title_format = ".title"
          dish_title = menu_item.css(dish_title_format).text
          puts "Dish Title: #{dish_title}"

          dish = restaurant.dishes.create(:name => dish_title)

          dish_variation_format = "article.variation"
          dish_variations = menu_item.css(dish_variation_format)

          if dish_variations.length == 1
            puts "no variation"
            dish_price_format = ".price"
            dish_price = dish_variations[0].css(dish_price_format).text.squish
            puts "Dish Price: #{dish_price}"

            dish.variations.create(
              :size => dish_title,
              :price => dish_price
            )

          else
            puts "yes variation"
                        
            dish_variations.each do |x|
            
              y = ".title"
              dish_title = x.css(dish_title_format).text.squish
              puts "Dish Title: #{dish_title}"

              y = ".price"
              dish_price = x.css(y).text.squish
              puts "Dish Price: #{dish_price}"

              dish.variations.create(
                :size => dish_title,
                :price => dish_price
              )
            end
          end
        end
      end

      puts "I'm done with #{restaurant.name}"
      puts "---------------------------------------"
    end

    puts "Now all the restaurants are done!"
  end
end
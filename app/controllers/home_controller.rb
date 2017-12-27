require "rubygems"
require "net/https"
require "uri"
require "json"

class HomeController < ApplicationController
  def index
    if params[:search]
      @todos_produtos = Produto.where("productName like ?", "%#{params[:search]}%")
    else
      @todos_produtos = Produto.all
    end
  end

  def importar_produtos
    
    count_json_url = 0
    total_produtos = 0

    until count_json_url >= 100
        index = count_json_url
        next_index = index + 1

        uri = URI.parse('https://www.fossil.com.br/api/catalog_system/pub/products/search/?_from=' + index.to_s + '&_to=' + next_index.to_s)
        #uri = URI.parse('http://www.timex.com.br/api/catalog_system/pub/products/search/?_from=' + index.to_s + '&_to=' + next_index.to_s)
        #uri = URI.parse('https://www.schumann.com.br/api/catalog_system/pub/products/search/?_from=' + index.to_s + '&_to=' + next_index.to_s)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)
        user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0'
        request.initialize_http_header({"User-Agent" => user_agent})

        res = http.request(request)
        
          response = JSON.parse(res.body)

          response.each do |child|
              impProd = Produto.new
              impProd.productId =  child['productId']
              impProd.productName = child['productName']

              child['items'].each do |item|
                  item['images'].each do |image|
                     impProd.image = image['imageUrl']
                     break
                  end

                  item['sellers'].each do |sellers|
                     impProd.price =  sellers['commertialOffer']['Price']
                  end
              end

              impProd.plots = 10
              impProd.link =  child['link']
              impProd.save

              puts "productId saved: " + impProd.productId.to_s

              total_produtos = total_produtos + 1
           end

           if total_produtos == 100
        #       count_json_url = total_produtos
           end

           count_json_url = count_json_url + 1
        end

        redirect_to root_path
     end
  end

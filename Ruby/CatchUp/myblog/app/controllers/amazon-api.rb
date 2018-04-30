#! /usr/bin/ruby
# coding: UTF-8

require 'rubygems'
require 'amazon/ecs'

Amazon::Ecs.debug = true

Amazon::Ecs.options = {
  :associate_tag => "takanori501-22",
    :AWS_access_key_id => "AKIAJ2OXHHYRXAMNURHA",
    :AWS_secret_key => "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"
    :asin => "B07CGZ3YNP"
}

res = Amazon::Ecs.item_search('ruby', {:search_index => 'Books', :response_group => 'Medium,ItemAttributes,Images', :country => 'jp'})
res.items.each do |item|

  puts item.get_element('ItemAttributes')

  #階層が下のものも取得できる
  puts "Title:#{item.get('ItemAttributes/Title')}"
  puts "Author:#{item.get('ItemAttributes/Author')}"

  # 画像のurlとサイズをhashで取得
  puts item.get_hash('SmallImage')
end
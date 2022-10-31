def shopping(store, *products)
  products.each do |product|
    puts "#{store}で買った#{product}おいしい"
  end
end

shopping("カフェ", "milk", "apple", "banana")
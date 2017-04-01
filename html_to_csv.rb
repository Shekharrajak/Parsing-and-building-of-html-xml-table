# run using ```rvm jruby-1.6.7 do  jruby "-J-Xmx2000m" "--1.9" tej.rb```

require 'rubygems'
require 'nokogiri'
require 'csv'

f = File.open("preview_table.html")
puts f
puts
doc = Nokogiri::HTML(f)
puts doc
csv = CSV.open("output.csv", 'w',{:col_sep => ",", :quote_char => '\'', :force_quotes => true})
puts
puts csv
#doc.xpath('//table/tbody/tr').take(10).each do |row|
doc.xpath('//table/tbody/tr').each do |row|
  tarray = []
  row.xpath('td').each do |cell|
    tarray << cell.text
  end
  csv << tarray
end

csv.close
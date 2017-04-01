require 'nokogiri'

html = File.open('table.html', 'r').read
doc = Nokogiri::HTML(html)

# get table headers
headers = []
doc.xpath('//*/table/thead/tr/th').each do |th|
  headers << th.text
end

puts headers
# Foo
# Bar
# get table rows
rows = []
doc.xpath('//*/table/tbody/tr').each_with_index do |row, i|
  rows[i] = {}
  row.xpath('td').each_with_index do |td, j|
    rows[i][headers[j]] = td.text
  end
end

p rows
# [{"Foo"=>"foofoo", "Bar"=>"barbar"}, {"Foo"=>"foobar", "Bar"=>"barfoo"}]
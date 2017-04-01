require 'nokogiri'
require 'csv'

html = File.open('table.html', 'r').read
document = Nokogiri::HTML(html)

document.at('table').search('tr').each do |row|
  cells = row.search('th, td').map { |cell| cell.text.strip }

  puts CSV.generate_line(cells)
end

# outout : 

# Foo,Bar
# foofoo,barbar
# foobar,barfoo

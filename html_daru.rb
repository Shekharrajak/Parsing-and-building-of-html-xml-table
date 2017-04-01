require 'rubygems'
require 'builder'

data = [{"col1"=>"v1", "col2"=>"v2"}, {"col1"=>"v3", "col2"=>"v4"}]
xm = Builder::XmlMarkup.new(:indent => 2)
xm.table {
  xm.tr { data[0].keys.each { |key| xm.th(key)}}
  data.each { |row| xm.tr { row.values.each { |value| xm.td(value)}}}
}
puts "#{xm}"

# output :

# <table>
#   <tr>
#     <th>col1</th>
#     <th>col2</th>
#   </tr>
#   <tr>
#     <td>v1</td>
#     <td>v2</td>
#   </tr>
#   <tr>
#     <td>v3</td>
#     <td>v4</td>
#   </tr>
# </table>
require_relative 'heap'

h = Heap.new
data = [3, 5, 66, 34, 20, 12, 10]
h.load_data(data)

puts h.heap
h.remove
puts
puts h.heap
h.load_data([100])
puts
puts h.heap

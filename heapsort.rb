require_relative 'heap'

def heapsort(array)
	h = Heap.new
	h.load_data(array)

	sorted = []

	until h.empty?
		sorted.insert(0, h.heap.first)
		h.remove
	end
	sorted
end

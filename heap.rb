class Heap
	attr_accessor :heap

	def initialize
		@heap = []
	end

	def load_data(data)
		data.each do |point|
			@heap.push(point)
			up_heap(@heap.length - 1)
		end
	end

	def remove
		@heap.delete_at(0)

		unless @heap.empty?
			last = @heap.pop
			@heap.insert(0, last)
			down_heap
		end
	end

	def empty?
		@heap.length == 0
	end

	private

	def up_heap(index)
		if index != 0
			parent_index = (index - 1) / 2

			if @heap[parent_index] < @heap[index]
				swap(index, parent_index)
				up_heap(parent_index)
			end
		end
	end

	def down_heap(index = 0)
		if incorrect?(index) && has_children?(index)
			big_child_index = index_of_greatest_child(index)
			swap(index, big_child_index)
			down_heap(big_child_index)
		end
	end

	def incorrect?(parent_index)
		children = get_children(parent_index)
		children.any? { |index, child| child > @heap[parent_index] }
	end

	def get_children(index)
		children = Hash.new
		children[((index + 1) * 2) - 1] = @heap[((index + 1) * 2) - 1] unless @heap[((index + 1) * 2) - 1].nil?
		children[((index + 1) * 2)] = @heap[((index + 1) * 2)] unless @heap[((index + 1) * 2)].nil?
		children
	end

	def has_children?(index)
		children = get_children(index)
		!children.empty?
	end

	def index_of_greatest_child(index)
		children = get_children(index)
		children.sort_by {|index, child| child }.reverse.first.first
	end

	def swap(first_index, second_index)
		@heap[first_index], @heap[second_index] = @heap[second_index], @heap[first_index]
	end
end

def quicksort(array, left_index = 0, right_index = array.length - 1)
	return array if array.length <= 1

	if left_index < right_index
		partition = partition(array, left_index, right_index)
		quicksort(array, left_index, partition - 1)
		quicksort(array, partition + 1, right_index)
	end
	array
end

def partition(array, left_index, right_index)
	pivot = array[right_index]
	i = left_index - 1
	left_index.upto(right_index - 1) do |j|
		if array[j] <= pivot
			i += 1
			array[i], array[j] = array[j], array[i]
		end
	end
	array[i+1], array[right_index] = array[right_index], array[i+1]
	return i + 1
end

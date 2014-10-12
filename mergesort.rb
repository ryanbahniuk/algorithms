def mergesort(array)
	return array if array.length <= 1
	second_array = array.slice!((array.length / 2.0).round..array.length)

	sorted_array = mergesort(array)
	second_sorted_array = mergesort(second_array)

	return merge(sorted_array, second_sorted_array)
end

def merge(first_array, second_array)
	return first_array if second_array.empty?
	return second_array if first_array.empty?

	if first_array.first <= second_array.first
		element = first_array.shift
	else
		element = second_array.shift
	end

	# recursive call to construct the merged array
	return [element] + merge(first_array, second_array)
end

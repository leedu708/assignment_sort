def insert(array, right_index, value)
    # value is the value of array[right_index + 1]
    # right_index is the furthest right sorted element

    # Step through sorted elements right to left.
    # As long as your value is less than the element
    # at array[i] and you still have elements
    i = right_index
    while(i >= 0 && array[i] > value)
        # copy the element
        array[i+1] = array[i]
        i -= 1
    end

    # insert the actual element
    array[i+1] = value;
end

def insertion_sort(array)

    sorted = [] << array[0]

    array[1..-1].each_with_index do |item, index|
        insert(sorted, index, item)
    end

    sorted

end

def bubble_sort(array)

    sorted = false
    until sorted
        sorted = true
        array[0..-2].each_with_index do |item, index|
            if array[index] > array[index + 1]
                array[index], array[index + 1] = array[index + 1], array[index]
                sorted = false
            end
        end
    end

    array

end

print insertion_sort( [1,3,7,2,5] ).to_s + "\n"
print bubble_sort( [1,3,7,2,5] ).to_s + "\n"

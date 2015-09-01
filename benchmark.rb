def merge_sort(array)

  # return array if it is only one element long
  return array if array.length == 1

  left_half = array[0..((array.length / 2) - 1)]
  right_half = array[(array.length / 2)..-1]

  # merge_sort() the left half
  leftArr = merge_sort(left_half)

  # merge_sort() the right half
  rightArr = merge_sort(right_half)

  # merge() the two halves
  return merge(leftArr, rightArr)

end

def merge(leftArr, rightArr)

  newArr = []

  until leftArr.empty? && rightArr.empty?

    if leftArr.empty? && !rightArr.empty?
      newArr << rightArr.shift
    elsif rightArr.empty? && !leftArr.empty?
      newArr << leftArr.shift
    elsif leftArr[0] > rightArr[0]
      newArr << rightArr.shift
    else
      newArr << leftArr.shift
    end

  end

  newArr

end

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

def benchmark(array = [1,3,7,2,5], run = 100)

  start = Time.now

  run.times do
    insertion_sort(array)
  end

  end_time = Time.now
  puts (end_time - start).to_s

  start = Time.now

  run.times do
    bubble_sort(array)
  end

  end_time = Time.now
  puts (end_time - start).to_s

  start = Time.now

  run.times do
    merge_sort(array)
  end

  end_time = Time.now
  puts (end_time - start).to_s

end

input_array = []
15000.times do
  input_array << rand(1..99)
end

benchmark(input_array, 1)
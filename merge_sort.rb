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

print merge([5,7], [6,8]).to_s + "\n"
print merge_sort( [1,3,7,2,5] ).to_s + "\n"
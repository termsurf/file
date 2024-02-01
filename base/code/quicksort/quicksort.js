function quicksort(array, left, right) {
  var index, pivot, l, r, temp

  if (array.length > 1) {
    left = typeof left === 'undefined' ? 0 : left
    right = typeof right === 'undefined' ? array.length - 1 : right

    // partition(array, left, right)
    pivot = array[Math.floor((right + left) / 2)]
    l = left
    r = right

    while (l <= r) {
      while (array[l] < pivot) {
        l++
      }

      while (array[r] > pivot) {
        r--
      }

      if (l <= r) {
        // swap(array, l, r) {
        temp = array[l]
        array[l] = array[r]
        array[r] = temp
        // end swap

        l++
        r--
      }
    }

    index = l
    // end partition

    if (left < index - 1) {
      quicksort(array, left, index - 1)
    }

    if (index < right) {
      quicksort(array, index, right)
    }
  }

  return array
}

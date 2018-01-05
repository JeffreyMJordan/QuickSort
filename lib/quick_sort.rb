class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)

  end

  # In-place.


  def self.sort2!(array, start = 0, length = array.length, &prc)

  end

  #Have barrier which starts at first element
  #When you find an element less than the pivot, 
  #swap it with the first element to the right of the barrier, 
  #then iterate barrier by 1
  #After completing this, swap the pivot with the last element left of the barrie
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|x,y| x<=>y}
    pivot_el = array[start]
    barr = start 
    idx = start 
    while idx<length+start
      el = array[idx]
      if prc.call(pivot_el, el) == 1 
        array[barr+1], array[idx] = array[idx], array[barr+1]
        barr += 1 
      end
      idx += 1  
    end
    array[start], array[barr] = array[barr], array[start]
    barr
  end
end

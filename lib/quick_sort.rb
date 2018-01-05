require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)

  end

  # In-place.


  def self.sort2!(array, start = 0, length = array.length, &prc)
    # subarr = array[start...length]
    if length<=1 
      return
    end 
    prc ||= Proc.new{|x,y| x<=>y}
    pivot_idx = partition(array, start, length, &prc)
    
    sort2!(array, start, array[start...pivot_idx].length, &prc)
    sort2!(array, pivot_idx+1, array[pivot_idx+1..-1].length, &prc)
    array
  end

  #Have barrier which starts at first element
  #When you find an element less than the pivot, 
  #swap it with the first element to the right of the barrier, 
  #then iterate barrier by 1
  #After completing this, swap the pivot with the last element left of the barrier
  def self.partition(array, start, length, &prc)
    subarr = array[start...start+length]
    prc ||= Proc.new{|x,y| x<=>y}
    pivot_el = array[start]
    barr = start 
    idx = start+1
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

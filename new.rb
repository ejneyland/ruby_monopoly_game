# a = [27, 11, 14, 3, 7, 40, 1, 12]
# b = [4, 7, 20, 21, 22, 11, 1]
# Write a function that will find all elements which are present in both arrays: 
# commonElements(a,b) == [11, 7, 1] 
# (The order of the output array is not important.)

# c = a & b
# puts c

# sort through index a one element at a time
# each element from 'a' will be compared with each 
# element in array b
# once sort has found a match it will return the element
# if not, the array will complete and return nothing
# next element of array a, will now run through the same process
# once evert element in array a has been compared with array b
# all elements that exist in both arrays will be returned in a new array

a = [27, 11, 14, 3, 7, 40, 1, 12]
b = [4, 7, 20, 21, 22, 11, 1]

a = Array.new(a.sort!)
# a = [1, 3, 7, 11, 12, 14, 27, 40]
# a.length = 8

def commonElements(a, b)
  commons = []
  i = 0
  while i < a.length
    element = a[i]
    # puts element
    if b.include?(element) == true
      # puts "yas queen"
      commons.push(element)
    end
    # puts "--"
    i += 1
  end
  puts commons
end

commonElements(a, b)
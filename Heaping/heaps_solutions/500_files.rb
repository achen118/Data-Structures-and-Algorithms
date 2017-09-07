## 500 files

# You are given 500 files, each containing the stock trading data for a
# company. Within each file all the trades have timestamps.
# The timestamps appear in ascending order. Your job is to create one
# file of all data in ascending time order. Achieve the best Time and
# Space complexity that you can, and don't modify the inputs.

so flatten array of files into an array of data objects


require_relative "heap"

def five_hundred_files(arr_of_files)

  arr_of_trades = arr_of_files.flatten
  heap = BinaryMinHeap.new

  

end

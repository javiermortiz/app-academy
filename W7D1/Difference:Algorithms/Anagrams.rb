def first_anagram?(str1, str2)
    anagram = str1.chars.permutation.to_a
    anagram.any? { |ana| ana.join('') == str2}
end 


# O(n * n!)

def second_anagram?(str1, str2)
    str2_arr = str2.chars
    str1.each_char do |char|
        matched_char = str2_arr.find_index(char)
        str2_arr.delete_at(matched_char) unless matched_char.nil?
    end 
    str2_arr.empty?
end 

#O(n^2)
# start_2 = Time.now
# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")
# # p second_anagram?("asdfghjkl", "qwertyu")
# finish_2 = Time.now
# p "second_anagram"
# p diff_2 = finish_2 - start_2


# start_1 = Time.now
# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")
# # p first_anagram?("asdfgfdsfdsfdsfhjkl", "qwasfdsfdsfdsfertyu")
# # O(n^2)
# finish_1 = Time.now
# p "first anagram"
# p diff_1 = finish_1 - start_1

def third_anagram?(str1, str2)
  alpha = ("a".."z").to_a
  str1_indices = str1.chars.map { |char| alpha.index(char) }
  str2_indices = str2.chars.map { |char| alpha.index(char) }
  str1_indices.sort == str2_indices.sort
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

# O(n log n)

def fourth_anagram?(str1, str2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    str1.each_char { |char| hash_1[char] += 1}
    str2.each_char { |char| hash_2[char] += 1}
    hash_1 == hash_2
end 

# O(n)

def b_fourth_anagram?(str1, str2)
    hash_1 = Hash.new(0)
    str1.each_char { |char| hash_1[char] += 1}
    str2.each_char { |char| hash_1[char] -= 1}
    hash_1.all? { |k,v| v == 0 }
end 

start_1 = Time.now.to_f
third_anagram?("dkfmdsfodsngoisnfgosidfndsoifnds", "dkfmdsfodsngoisnfgosidfndsoifnds")
finish_1 = Time.now.to_f

start_2 = Time.now.to_f

fourth_anagram?("dkfmdsfodsngoisnfgosidfndsoifnds", "dkfmdsfodsngoisnfgosidfndsoifnds")
finish_2 = Time.now.to_f

start_3 = Time.now.to_f

b_fourth_anagram?("dkfmdsfodsngoisnfgosidfndsoifnds", "dkfmdsfodsngoisnfgosidfndsoifnds")
finish_3 = Time.now.to_f

p "third anagram"
diff_1 = finish_1 - start_1
p diff_1 * 1000000.0
p "fourth"
diff_2 = finish_2 - start_2
p diff_2 * 1000000.0
p "fourth B"
diff_3 = finish_3 - start_3
p diff_3 * 1000000.0

# finish_1 = Time.now
# p "first anagram"
# p diff_1 = finish_1 - start_1
# O(n)
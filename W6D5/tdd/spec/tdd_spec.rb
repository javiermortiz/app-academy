require "tdd"

describe "remove_dups" do
    let(:array) { [1, 1, 2, 2, 3, 3] }
    let(:my_uniq) { remove_dups(array) }

    it "removes dups" do 
        array.each do |el|
            expect(my_uniq.count(el)).to eq(1)
        end 
    end 
end 

describe "two_sum" do 
    let(:array) { [-1, 0, 2, -2, 1] }
    let(:two_sum_result) { array.two_sum }

    it "finds all pairs of positions where the elements at thos positions sum to zero" do
        expect(two_sum_result).to eq([[0, 4], [2, 3]])
    end
end 
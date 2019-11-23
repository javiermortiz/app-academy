require "card"
require "deck"
require "hand"

describe Card do 
    subject(:card) { Card.new(:K, :Spades) }

    it "#initializes card" do 
        expect(card).to be_a(Card)
    end 

    it "has a valid rank" do 
        valid_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
        expect(card.rank).to eq(:K)
        expect(valid_ranks).to include(card.rank)
    end 

    it "has a valid suit" do 
        valid_suits = [:Spades, :Hearts, :Diamonds, :Clubs]
        expect(card.suit).to eq(:Spades)
        expect(valid_suits).to include(card.suit)
    end 
end 

describe Deck do 
    subject(:deck) { Deck.new }
    # let(:card) { double("Card") }

    it "initializes deck" do 
        expect(deck).to be_a(Deck)
    end 

    it "sets @cards instance variable to an Array" do
        expect(deck.cards).to be_a(Array)
    end 

    describe "#sort_deck" do 
        it "pushes 52 elements into cards" do 
            deck.sort_deck 
            expect(deck.cards.length).to eq(52)
        end 

        it "contains instances of Card" do
            deck.sort_deck
            deck.cards.each do |card_ins|
                expect(card_ins).to be_a(Card)
            end 
        end 

        it "shuffles the cards" do 
            expect(deck.cards).to receive(:shuffle!)
            deck.sort_deck
        end 
    end 
end 

describe Hand do 
    let(:card_1) { double("Card_1") }
    let(:card_2) { double("Card_2") }
    let(:card_3) { double("Card_3") }
    let(:card_4) { double("Card_4") }
    let(:card_5) { double("Card_5") }
    subject(:hand) { Hand.new(card_1, card_2, card_3, card_4, card_5) }
    subject(:pair) { Hand.new(card_1, card_1, card_2, card_3, card_4) }

    it "initializes hand" do
        expect(hand).to be_a(Hand)
    end

    it "allows the user to look at the hand" do
        expect(hand.my_hand).to eq([card_1, card_2, card_3, card_4, card_5])
    end

    describe "#[]" do 
        it "accesses a card inside hand" do
            pos = 0
            expect(hand.[](pos)).to eq(card_1)
        end
    end 

    describe "#[]=" do 
        it "updates a card inside hand" do 
            other_card = :card_2
            hand.[]=(0, :card_2)
            expect(hand.[](0)).to eq(:card_2)
        end 
    end 

    describe "#get_rankings" do


        it "gets the ranking for the hand" do 
            allow(card_1).to receive(:rank).and_return(2)
            allow(card_2).to receive(:rank).and_return(3)
            allow(card_3).to receive(:rank).and_return(4)
            allow(card_4).to receive(:rank).and_return(5)
            expect(pair.get_rankings).to eq(["Pair", card_1.rank ])
        end 
    end
end 
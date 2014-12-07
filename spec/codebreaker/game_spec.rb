require 'spec_helper'

module Codebreaker
  describe Game do
   let(:player) {Player.new("test")}
   let(:game) { Game.new(player) }
    context "#generate secret" do

      it "saves secret code" do
        expect(game.secret).not_to be_empty
      end


      it "saves 4 numbers secret code" do
        expect(game.secret.size).to eq(4)
      end

      it "saves secret code with numbers from 1 to 6" do
        expect(game.secret).to match(/[1-6]+/)
      end
    end

    context "codebreaker secret to guess number" do
      before(:each) do

        game.instance_variable_set(:@secret, "1234")
      end

      it "should return right string for guesses" do

        suspect = Guess.new "1256"

        expect(game.guess(suspect)).to eq"++XX"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "1356"

        expect(game.guess(suspect)).to eq"+-XX"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "5555"

        expect(game.guess(suspect)).to eq"XXXX"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "1234"

        expect(game.guess(suspect)).to eq"++++"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "1111"

        expect(game.guess(suspect)).to eq"+---"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "4321"

        expect(game.guess(suspect)).to eq"----"
      end
      it "should return right string for guesses" do

        suspect = Guess.new "6543"

        expect(game.guess(suspect)).to eq"XX--"
      end

      it "should return right string for guesses" do

        suspect = Guess.new "1243"

        expect(game.guess(suspect)).to eq"++--"
      end

    end
   end
  end
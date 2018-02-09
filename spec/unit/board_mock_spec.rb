require_relative "spec_helper"

describe BoardMock do
  context "one column" do
    let :subject {
      BoardMock.new
        .list("One")
    }

    it "has one column" do
      expect(subject.columns.count).to eq(1)
    end

    it "has no cards" do
      expect(subject.cards.count).to eq(0)
    end
  end

  context "two columns" do
    let :subject {
      board = BoardMock.new
      board.list("One")
      board.list("Two")
      board
    }

    it "has two columns" do
      expect(subject.columns.count).to eq(2)
    end

    it "has no cards" do
      expect(subject.cards.count).to eq(0)
    end
  end

  context "one column and two cards" do
    let :subject {
      board = BoardMock.new
      list = board.list("One")
      list.card("Red")
      list.card("Green")
      board
    }

    it "has one column" do
      expect(subject.columns.count).to eq(1)
    end

    it "has two cards" do
      expect(subject.cards.count).to eq(2)
    end
  end    

  context "two columns and two cards each" do
    let :subject {
      BoardMock.new
        .list("One")
          .card("Red")
          .card("Green")
        .list("Two")
          .card("Blue")
          .card("Yellow")
    }

    it "has two columns" do
      expect(subject.columns.count).to eq(2)
    end

    it "has four cards" do
      expect(subject.cards.count).to eq(4)
    end

    it "has two cards in each list" do
      subject.columns.each do |column|
        expect(column.cards.count).to eq(2)
      end
    end
  end
  
  context "one card with one label" do
    let :subject {
      BoardMock.new
        .list("One")
          .card("Red")
            .label("Cold")
    }

    it "has one card" do
      expect(subject.cards.count).to eq(1)
    end

    it "card has one label" do
      expect(subject.cards.first.has_label?("Cold"))
    end
  end
end

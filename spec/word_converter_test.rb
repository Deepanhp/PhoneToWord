
require 'WordConverter'

describe "Convert number to word: 6686787825" do
  it "Should give all matching words" do
    expect(WordConverter.new.convert("6686787825"))
                        .to eq([["noun", "struck"],["onto", "struck"],["motor", "truck"], ["motor", "usual"],["nouns", "truck"], ["nouns", "usual"],"motortruck"])
  end
end

describe "Convert number to word: 2282668687" do
  it "Should give all matching words" do
    expect(WordConverter.new.convert("2282668687"))
                        .to eq([["act", "amounts"],["act", "contour"],["bat", "amounts"],["bat", "contour"],["cat", "amounts"],["cat", "contour"],["acta", "mounts"], "catamounts"])
  end
end

describe "Convert number to word: 45" do
  it "Should show error as digits count is less than two" do
    expect { WordConverter.new.convert("45") }.to raise_error("Invalid Number")
  end
end

describe "Convert number to word: 3045891895" do
  it "Should throw error as digits contain 0 and 1 digits" do
    expect { WordConverter.new.convert("7463981023") }.to raise_error("Invalid Number")
  end
end

describe "Convert number to word: basdaqw3e" do
  it "Should show error as digits include alphabet" do
    expect { WordConverter.new.convert("abasdaqw3e") }.to raise_error("Invalid Number")
  end
end

describe "Convert number to word: 34567898%$" do
  it "Should show error as digits include special characters" do
    expect { WordConverter.new.convert("34567898%$") }.to raise_error("Invalid Number")
  end
end

describe "Convert number to word: 923 4 4 56" do
  it "Should show error as digits has spaces" do
    expect { WordConverter.new.convert("123 4 4 56") }.to raise_error("Invalid Number")
  end
end

describe "Convert number to word: 98765432345" do
  it "Should show error as digits has more than ten characters" do
    expect { WordConverter.new.convert("98765432345") }.to raise_error("Invalid Number")
  end
end



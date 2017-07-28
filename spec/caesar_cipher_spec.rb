describe "Caesar Cipher" do
  describe "encrypt" do
    it "encrypts message" do
      expect(encrypt("This is a test.", 3)).to eq("Wklv lv d whvw.")
    end
  end
end

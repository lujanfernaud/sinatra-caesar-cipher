describe CaesarCipher do
  describe ".encrypt" do
    it "encrypts message" do
      expect(described_class.encrypt("This is a test.", 3))
        .to eq("Wklv lv d whvw.")
    end
  end

  describe ".decrypt" do
    it "decrypts message" do
      expect(described_class.decrypt("Wklv lv d whvw.", 3))
        .to eq("This is a test.")
    end
  end
end

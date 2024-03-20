require './lib/caesar-cipher.rb'

describe 'Cipher' do
    describe "encrypt" do
      it "returns the encryption of one word" do
        result = encrypt "abc", 1
        expect(result).to eql('bcd')
      end
      it "returns the encryption of multiple words" do
        result = encrypt "i am fast", 2
        expect(result).to eql('k co hcuv')
      end
      it "returns the same input" do
        result = encrypt "a", 0
        expect(result).to eql('a')
      end
      it "returns encryption with special characters" do
        result = encrypt "are you ok?", 1
        expect(result).to eql('bsf apv pl?')
      end
      it "returns encryption of text with uppercases" do
        result = encrypt "Pass", 1
        expect(result).to eql('Qbtt')
      end
      it "returns correct encryption when using a number higher than the amount of abecedary letters as the second param" do
        result = encrypt "abc", 27
        expect(result).to eql('cde')
      end
    end
end

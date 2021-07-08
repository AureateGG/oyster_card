require "station"

describe Station do
    subject {described_class.new(name = "Picadilly", zone = 1)}
    describe "#initialize" do
        it "station knows its name" do
            expect(subject.name).to eq("Picadilly")  
        end
        it "station knows its zone" do 
            expect(subject.zone).to eq(1)  
        end
    end

end

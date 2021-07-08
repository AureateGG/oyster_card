require "journey"

describe Journey do 
    describe "#initialize" do
        it "default entry_station is nil" do
        expect(subject.entry_station).to eq(nil)
        end

        it "default entry_station is nil" do
            expect(subject.exit_station).to eq(nil)
        end
    end
end
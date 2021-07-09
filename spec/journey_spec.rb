require "journey"

describe Journey do
    describe "#initialize" do
        it "default entry_station is nil" do
        expect(subject.entry_station).to eq(nil)
        end

        it "default entry_station is nil" do
            expect(subject.exit_station).to eq(nil)
        end

        it "creates an empty hash with entry_station & exit_station set to nil" do
            expect(subject.current).to eq ({ entry_station: nil, exit_station: nil })
        end
    end

    describe "#start_journey" do
        let(:entry_station) { double :entry_station }
        
        it "sets entry_station of journey to tap_in-station" do
        subject.start_journey(entry_station)
        expect(subject.entry_station).to eq entry_station
        end

        it "remembers the entry_station in current" do
        subject.start_journey(entry_station)
        expect(subject.current).to eq ({ entry_station: entry_station, exit_station: nil })  
        end
    end

    describe "#end_journey" do
        let(:entry_station) { double :entry_station }
        let(:exit_station) { double :exit_station }
        
        it "sets exit_station of journey to tap_out-station" do
        subject.start_journey(entry_station)
        subject.end_journey(exit_station)
        expect(subject.exit_station).to eq exit_station
        end

        it "remembers the exit_station in current" do
        subject.start_journey(entry_station)
        subject.end_journey(exit_station)
        expect(subject.current).to eq ({ entry_station: entry_station, exit_station: exit_station })  
        end
    end

    describe "#is_complete?" do
        let(:entry_station) { double :entry_station }
        let(:exit_station) { double :exit_station }
        
        it "returns a valid journey as true " do
            subject.start_journey(entry_station)
            subject.end_journey(exit_station)
            expect(subject.is_complete?).to be true    
        end

        it "returns an invalid journey with missing exit_station as false " do
            subject.start_journey(entry_station)
            expect(subject.is_complete?).to be false    
        end

        it "returns an invalid journey with missing entry_station as false " do
            subject.end_journey(entry_station)
            expect(subject.is_complete?).to be false    
        end
    end

    describe "#fare" do
        let(:entry_station) { double :entry_station }
        let(:exit_station) { double :exit_station }

        it "calculates fare for valid journey" do
            subject.start_journey(entry_station)
            subject.end_journey(exit_station)
            expect(subject.fare).to eq (Oystercard::PRICE)
        end

        it "calculates penalty for invalid journey no exit" do
            subject.start_journey(entry_station)
            expect(subject.fare).to eq (Oystercard::PENALTY)
        end

        it "calculates penalty for invalid journey no entry" do
            subject.end_journey(exit_station)
            expect(subject.fare).to eq (Oystercard::PENALTY)
        end
    end
end
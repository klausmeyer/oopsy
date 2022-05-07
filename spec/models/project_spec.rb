require "rails_helper"

RSpec.describe Project do
  describe ".by_name" do
    it "returns the records sorted by their name" do
      p1 = FactoryBot.create :project, name: "Project C"
      p2 = FactoryBot.create :project, name: "Project A"
      p3 = FactoryBot.create :project, name: "Project B"

      expect(described_class.by_name).to eq [p2, p3, p1]
    end
  end
end

require "rails_helper"

module Errors
  RSpec.describe GroupJob do
    let(:instance) { described_class.new }

    let(:project1) { FactoryBot.create :project }
    let(:project2) { FactoryBot.create :project }

    let(:error_type) { "ErrorOne" }

    describe "#perform" do
      it "creates new groups when no matching ones found" do
        FactoryBot.create :error, project: project1, error_type: error_type

        expect { instance.perform }.to change(project1.error_groups, :count).by(1)
      end

      it "assigns errors to existing groups" do
        error = FactoryBot.create :error, project: project1, error_type: error_type
        group = FactoryBot.create :error_group, project: project1, name: error_type

        expect { instance.perform }.to change(project1.error_groups, :count).by(0)

        expect(error.reload.error_group).to eq group
      end

      it "does not mix groups of projects" do
        group = FactoryBot.create :error_group, project: project1, name: error_type
        error = FactoryBot.create :error, project: project2, error_type: error_type

        expect { instance.perform }.to change(project2.error_groups, :count).by(1)

        expect(error.reload.error_group).not_to eq group
      end
    end
  end
end

require "rails_helper"

module Errors
  RSpec.describe CollectErrorUnitiesJob do
    let(:instance) { described_class.new }

    let(:project1) { FactoryBot.create :project }
    let(:project2) { FactoryBot.create :project }

    let(:error_type)    { "ErrorOne" }
    let(:error_message) { "Error One" }

    describe "#perform" do
      it "creates new unities when no matching ones found" do
        FactoryBot.create :error_occurrence, project: project1, error_type: error_type, error_message: error_message

        expect { instance.perform }.to change(project1.error_unities, :count).by(1)
      end

      it "assigns occurences to existing unities" do
        eo = FactoryBot.create :error_occurrence, project: project1, error_type: error_type, error_message: error_message
        eu = FactoryBot.create :error_unity, project: project1, error_type: error_type, error_message: error_message

        expect { instance.perform }.to change(project1.error_unities, :count).by(0)

        expect(eo.reload.error_unity).to eq eu
      end

      it "does not mix unities of projects" do
        eu = FactoryBot.create :error_unity, project: project1, error_type: error_type, error_message: error_message
        eo = FactoryBot.create :error_occurrence, project: project2, error_type: error_type, error_message: error_message

        expect { instance.perform }.to change(project2.error_unities, :count).by(1)

        expect(eo.reload.error_unity).not_to eq eu
      end
    end
  end
end

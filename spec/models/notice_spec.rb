require "rails_helper"

RSpec.describe Notice do
  subject(:instance) { FactoryBot.create :notice, context: context }

  shared_examples_for "an context accessor" do |method|
    subject { instance.public_send(method) }

    context "with context being nil" do
      let(:context) { nil }

      it { is_expected.to be_nil }
    end

    context "with context being a hash" do
      let(:context) { { method.to_s => "value" } }

      it { is_expected.to eq "value" }
    end
  end

  describe "#action" do
    it_should_behave_like "an context accessor", :action
  end

  describe "#component" do
    it_should_behave_like "an context accessor", :component
  end

  describe "#hostname" do
    it_should_behave_like "an context accessor", :hostname
  end
end

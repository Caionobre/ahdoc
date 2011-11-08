# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe BasicFlow do
  context "association" do
    it {should belong_to :document}
  end
  context "validations" do
    it {should validate_presence_of :flow}    
    it {should ensure_length_of(:flow).is_at_most(255)}
    it {should validate_presence_of :order}
    it {should validate_numericality_of :order}
    
    context "Document should be unique" do
      before(:each){ BasicFlow.make!}
      it {should validate_uniqueness_of(:flow).scoped_to(:document_id)}
      it {should validate_uniqueness_of(:order).scoped_to(:document_id)}
    end
  end

  it "to_s should return flow to_s" do
    subject.flow = "Register of contract"
    subject.to_s.should == "Register of contract"
  end
end

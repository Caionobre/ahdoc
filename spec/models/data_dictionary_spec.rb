# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe DataDictionary do
  context "association" do
    it {should belong_to :document}
  end
  context "validations" do
    it {should validate_presence_of :description}
    it {should ensure_length_of(:description).is_at_most(255)}

    it {should validate_presence_of :link}
    it {should ensure_length_of(:link).is_at_most(255)}
    
    context "Document should be unique" do
      before(:each){ DataDictionary.make!}
      it {should validate_uniqueness_of(:description).scoped_to(:document_id)}
    end
  end

  it "to_s should return description to_s" do
    subject.description = "Register of contract"
    subject.to_s.should == "Register of contract"
  end
end
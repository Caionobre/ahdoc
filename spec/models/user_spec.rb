# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe User do
  context "validations" do
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}
    
    context "should be unique" do
      before(:each){ User.make!}
      it {should validate_uniqueness_of(:name)}
    end
  end

  it "to_s should return name to_s" do
    subject.name = "Jhon Doe"
    subject.to_s.should == "Jhon Doe"
  end
end
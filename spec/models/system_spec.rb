# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe System do
    
  context "validations" do
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}
    it {should ensure_length_of(:version).is_at_most(25)}

    context "should be unique" do
      before(:each){ System.make!}
      it {should validate_uniqueness_of(:name)}
    end
  end

  it "to_s should return name to_s" do
    subject.name = "ahdoc"
    subject.to_s.should == "ahdoc"
  end
end
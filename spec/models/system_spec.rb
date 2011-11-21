# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe System do
  context "associations" do
    it {should have_many :databases}
    it {should have_many :groups}
  end

  context "validations" do
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}
    it {should ensure_length_of(:version).is_at_most(25)}

    context "should be unique" do
      before(:each){System.make!}
      it {should validate_uniqueness_of(:name)}
    end

    it "can be deleted when there aren't groups" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are databases" do
      subject = stub_model System, :databases => [stub_model(Database)]

      subject.destroy
      subject.destroyed?.should be_false
    end

    it "can't be deleted when there are groups" do
      subject = stub_model System, :groups => [stub_model(Group)]

      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  it "to_s should return name to_s" do
    subject.name = "ahdoc"
    subject.to_s.should == "ahdoc"
  end
end
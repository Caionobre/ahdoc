# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe AlternativeFlow do
  context "associate" do
    it {should belong_to :document}
    it {should have_many :items}
  end
    
  context "validations" do
    it {should validate_presence_of :title}
    it {should ensure_length_of(:title).is_at_most(255)}

    it {should validate_presence_of :order}
    it {should validate_numericality_of :order}
    
    context "title's altenative flow should be unique for document" do
      before(:each){ AlternativeFlow.make!}
      it {should validate_uniqueness_of(:title).scoped_to(:document_id)}
      it {should validate_uniqueness_of(:order).scoped_to(:document_id)}
    end

    it "can be deleted when there aren't items" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are items" do
      subject = stub_model AlternativeFlow, :items => [stub_model(Item)]

      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  it "to_s should return title to_s" do
    subject.title = "Register of contract"
    subject.to_s.should == "Register of contract"
  end
end

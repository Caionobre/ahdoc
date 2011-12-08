# encoding: utf-8
require 'spec_helper'

describe Actor do
  context "association" do
    it {should belong_to :group}
    it {should have_many :documents}
  end
    
  context "validations" do
    it {should validate_presence_of :group}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(50)}

    context "actor's name should be unique for group" do
      before(:each){ Actor.make! }
      it {should validate_uniqueness_of(:name).scoped_to(:group_id)}
    end

    it "can be deleted when there aren't actors and documents" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are documents" do
      subject = stub_model Actor, :documents => [stub_model(Document)]

      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  it 'to_s should return name to_s' do
    subject.name = "Contract manager"
    subject.to_s.should == "Contract manager"
  end
end
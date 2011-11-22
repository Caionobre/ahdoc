# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Database do
  context "association" do
    it {should belong_to :system}
    it {should have_many :tables}
  end
  
  context "validations" do
    it {should validate_presence_of :system}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}

    context "should be unique" do
      before(:each){ Database.make! }
      it {should validate_uniqueness_of(:name).scoped_to(:system_id) }
    end

    it "can be deleted when there aren't tables" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are tables" do
      subject = stub_model Database, :tables => [stub_model(Table)]

      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  it 'to_s should return name to_s' do
    subject.name = "ahdoc_test"
    subject.to_s.should == "ahdoc_test"
  end
end
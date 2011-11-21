# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Group do
  context "association" do
    it {should belong_to :system}
    it {should have_many :actors}
    it {should have_many :documents}
  end
  
  context "validations" do
    it {should validate_presence_of :system}
    it {should validate_presence_of :title}
    it {should ensure_length_of(:title).is_at_most(200)}

    context "should be unique" do
      before(:each){ Group.make! }
      it {should validate_uniqueness_of(:title).scoped_to(:system_id) }
    end

    it "can be deleted when there aren't actors and documents" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are actors" do
      subject = stub_model Group, :actors => [stub_model(Actor)]

      subject.destroy
      subject.destroyed?.should be_false
    end

    it "can't be deleted when there are documents" do
      subject = stub_model Group, :documents => [stub_model(Document)]
      
      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  it 'to_s should return title to_s' do
    subject.title = "user"
    subject.to_s.should == "user"
  end
end
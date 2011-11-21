# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Database do
  context "association" do
    it {should belong_to :system}
  end
  
  context "validations" do
    it {should validate_presence_of :system}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}

    context "should be unique" do
      before(:each){ Database.make! }
      it {should validate_uniqueness_of(:name).scoped_to(:system_id) }
    end
  end

  it 'to_s should return name to_s' do
    subject.name = "ahdoc_test"
    subject.to_s.should == "ahdoc_test"
  end
end
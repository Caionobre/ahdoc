# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Table do
  context "association" do
    it {should belong_to :database}
  end
  
  context "validations" do
    it {should validate_presence_of :database}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}

    context "should be unique" do
      before(:each){ Table.make! }
      it {should validate_uniqueness_of(:name).scoped_to(:database_id) }
    end
  end

  it 'to_s should return name to_s' do
    subject.name = "users"
    subject.to_s.should == "users"
  end
end
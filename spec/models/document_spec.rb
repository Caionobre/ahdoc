# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Document do
  context "association" do
    it {should belong_to :actor}
    it {should belong_to :group}
    it {should have_and_belong_to_many :tables}

    Document::DEPENDENCIES.each do |dependency|
      it {should have_many dependency}
    end
  end

  context "validations" do
    it {should validate_presence_of :actor}
    it {should validate_presence_of :group}
    it {should validate_presence_of :title}

    context "document's title should be unique for group" do
      before(:each){ Document.make! }
      it {should validate_uniqueness_of(:title).scoped_to(:group_id)}
    end

    it "can be deleted when there aren't documents" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    Document::DEPENDENCIES.each do |dependency|
      it "can't be deleted when there are #{dependency}" do
        subject = stub_model Document, dependency => [stub_model(dependency.to_s.singularize.camelize.constantize)]

        subject.destroy
        subject.destroyed?.should be_false
      end
    end
  end
  context "callbacks" do
    pending "test delete all tables before exclude document" do
      it "deleted tables when there was" do
        subject = stub_model Document, :table_ids => [stub_model(Table).id]

        subject.destroy
        subject.table_ids.should have(:no).items
      end
    end
  end

  it 'to_s should return title to_s' do
    subject.title = "Register of contract"
    subject.to_s.should == "Register of contract"
  end
end

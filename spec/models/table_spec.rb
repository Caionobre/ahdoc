# encoding: utf-8
require File.expand_path("spec/spec_helper")

describe Table do
  context "association" do
    it {should belong_to :database}
    it {should have_many :fields}
    it {should have_and_belong_to_many :documents}
  end
  
  context "validations" do
    it {should validate_presence_of :database}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}

    context "should be unique" do
      before(:each){ Table.make! }
      it {should validate_uniqueness_of(:name).scoped_to(:database_id) }
    end

    it "can be deleted when there aren't fields" do
      subject.destroy
      subject.destroyed?.should be_true
    end

    it "can't be deleted when there are fields" do
      subject = stub_model Table, :fields => [stub_model(Field)]

      subject.destroy
      subject.destroyed?.should be_false
    end
  end

  context "callbacks" do
    pending "test delete all documents before exclude table" do
      it "deleted fields when there was" do
        subject = stub_model Table, :document_ids => [stub_model(Document).id]

        subject.destroy
        subject.document_ids.should have(:no).items
      end
    end
  end

  it 'to_s should return name to_s' do
    subject.name = "users"
    subject.to_s.should == "users"
  end
end
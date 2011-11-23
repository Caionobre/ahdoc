require 'spec_helper'

describe Field do
  context "asociations" do
    it {should belong_to :table}
  end

  context "validations" do
    it {should validate_presence_of :table}
    it {should validate_presence_of :name}
    it {should ensure_length_of(:name).is_at_most(255)}
    it {should validate_presence_of :storage_type}
    context "should be unique" do
      before(:each) {Field.make!}
      it {should validate_uniqueness_of(:name).scoped_to(:table_id)}
    end
  end
end

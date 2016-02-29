require 'rails_helper'
require 'net/http'
RSpec.describe Snapshot, type: :model do
  let(:uri){uri = "http://www.google.com"}
  subject(:snap) {snap = Snapshot.create(:url => uri)}
  
  it "should have a valid url address" do
  	expect(snap.is_valid_uri?).to be_truthy
  end

  it "should generate a pdf file from the url" do
  	snap.generate_pdf
  	File.exist?(snap.snapshot_link).should be_truthy
  end
end

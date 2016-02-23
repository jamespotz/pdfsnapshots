require 'rails_helper'

RSpec.describe "snapshots/show", type: :view do
  before(:each) do
    @snapshot = assign(:snapshot, Snapshot.create!(
      :url => "Url",
      :snapshot_link => "Snapshot Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Snapshot Link/)
  end
end

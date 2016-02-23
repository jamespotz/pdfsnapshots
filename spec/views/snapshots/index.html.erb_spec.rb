require 'rails_helper'

RSpec.describe "snapshots/index", type: :view do
  before(:each) do
    assign(:snapshots, [
      Snapshot.create!(
        :url => "Url",
        :snapshot_link => "Snapshot Link"
      ),
      Snapshot.create!(
        :url => "Url",
        :snapshot_link => "Snapshot Link"
      )
    ])
  end

  it "renders a list of snapshots" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Snapshot Link".to_s, :count => 2
  end
end

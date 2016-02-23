require 'rails_helper'

RSpec.describe "snapshots/new", type: :view do
  before(:each) do
    assign(:snapshot, Snapshot.new(
      :url => "MyString",
      :snapshot_link => "MyString"
    ))
  end

  it "renders new snapshot form" do
    render

    assert_select "form[action=?][method=?]", snapshots_path, "post" do

      assert_select "input#snapshot_url[name=?]", "snapshot[url]"

      assert_select "input#snapshot_snapshot_link[name=?]", "snapshot[snapshot_link]"
    end
  end
end

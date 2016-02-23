require 'rails_helper'

RSpec.describe "snapshots/edit", type: :view do
  before(:each) do
    @snapshot = assign(:snapshot, Snapshot.create!(
      :url => "MyString",
      :snapshot_link => "MyString"
    ))
  end

  it "renders the edit snapshot form" do
    render

    assert_select "form[action=?][method=?]", snapshot_path(@snapshot), "post" do

      assert_select "input#snapshot_url[name=?]", "snapshot[url]"

      assert_select "input#snapshot_snapshot_link[name=?]", "snapshot[snapshot_link]"
    end
  end
end

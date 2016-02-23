json.array!(@snapshots) do |snapshot|
  json.extract! snapshot, :id, :url, :snapshot_link
  json.url snapshot_url(snapshot, format: :json)
end

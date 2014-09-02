json.array!(@iterations) do |iteration|
  json.extract! iteration, :id, :title
  json.url iteration_url(iteration, format: :json)
end

class SerializableAnswer < JSONAPI::Serializable::Resource
  type 'answers'
  attribute :content
  attribute :is_chosen_as_best_answer
end

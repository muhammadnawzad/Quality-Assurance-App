class SerializableAnswer < JSONAPI::Serializable::Resource
  type 'answers'
  attribute :content
  attribute :is_chosen_as_best_answer

  has_one :user, serializer: SerializableUser
  has_one :question, serializer: SerializableQuestion
end

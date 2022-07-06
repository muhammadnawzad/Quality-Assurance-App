class SerializableAnswer < JSONAPI::Serializable::Resource
  type 'answers'
  attribute :content
  attribute :is_chosen_as_best_answer

  belongs_to :user, serializer: SerializableUser
  belongs_to :question, serializer: SerializableQuestion
end

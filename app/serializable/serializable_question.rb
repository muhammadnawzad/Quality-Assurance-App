class SerializableQuestion < JSONAPI::Serializable::Resource
  type 'questions'
  attribute :title
  attribute :content
  attribute :created_at

  has_many :answers, serializer: SerializableAnswer
end

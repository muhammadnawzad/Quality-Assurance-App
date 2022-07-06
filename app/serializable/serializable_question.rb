class SerializableQuestion < JSONAPI::Serializable::Resource
  type 'questions'
  attribute :title
  attribute :content
  attribute :created_at

  belongs_to :user, serializer: SerializableUser
  has_many :answers, serializer: SerializableAnswer
end

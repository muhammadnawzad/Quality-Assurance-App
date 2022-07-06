class SerializableQuestion < JSONAPI::Serializable::Resource
  type 'questions'
  attributes :title, :content, :created_at

  has_one :user, serializer: SerializableUser
  has_many :answers, serializer: SerializableAnswer
end

class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attribute :email

  has_many :questions, serializer: SerializableQuestion
  has_many :answers, through: :questions, source: :answers, serializer: SerializableAnswer
  has_many :roles, serializer: SerializableRole
end

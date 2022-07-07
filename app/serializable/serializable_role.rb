class SerializableRole < JSONAPI::Serializable::Resource
  type 'roles'
  attribute :name

  has_many :users, serializer: SerializableUser
end

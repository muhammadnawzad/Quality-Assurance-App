class SerializableRole < JSONAPI::Serializable::Resource
  type 'roles'
  attribute :name

  has_one :user, serializer: SerializableUser
end

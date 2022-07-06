class SerializableRole < JSONAPI::Serializable::Resource
  type 'roles'
  attribute :name

  belongs_to :user, serializer: SerializableUser
end

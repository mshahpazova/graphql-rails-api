# defines a new GraphQL type
Types::UserType = GraphQL::ObjectType.define do
  # this type is named `User`
  name 'User'

  # it has the following fields
  field :id, !types.ID
  field :posts, Types::PostType
end

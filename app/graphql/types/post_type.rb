# defines a new GraphQL type
Types::PostType = GraphQL::ObjectType.define do
  # this type is named `Post`
  name 'Post'

  # it has the following fields
  field :id, !types.ID
  field :text, types.String
end

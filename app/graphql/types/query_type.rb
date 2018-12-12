Types::QueryType = GraphQL::ObjectType.define do
  # queries are just represented as fields
  name 'User'
  field :users, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end
end


# type_hash =


#
# module Types
#   class QueryType < Types::BaseObject
#     # Add root-level fields here.
#     # They will be entry points for queries on your schema.
#
#     # TODO: remove me
#     field :test_field, String, null: false,
#       description: "An example field added by the generator"
#     def test_field
#       "Hello World!"
#     end
#   end
# end





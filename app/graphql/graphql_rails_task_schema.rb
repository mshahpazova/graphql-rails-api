# frozen_string_literal: true

# graphqlschema = Rails.root.join('app/graphql/schema.graphql')

module ExecuteGraphQLByConvention
  module_function

  # Find a Ruby module corresponding to `type`,
  # then call its method corresponding to `field`.
  def call(type, field, obj, args, ctx)
    # use GraphQL::Batch
    type_module = Object.const_get(type.name)
    type_module.public_send(field.name, obj, args, ctx)
  end
end

type_hash = {
  'Query' => {
    'users' => ->(_ob, _args, _ctx) { User.all }
  },
  'Post' => {
    'title' => ->(obj, _args, _ctx) { obj.title },
    'body' => ->(obj, _args, _ctx) { obj.body }
  },

  'User' => {
    'posts' => ->(obj, _args, _ctx) { obj.posts }
  }
}

GraphqlRailsTaskSchema = GraphQL::Schema.from_definition(
  'schema {
  query: Query
}
type Query {
  users: [User!]!
}

type User {
  id: Int!
  posts: [Post!]
}

type Post {
  id: Int!
  text: String!
}', default_resolve: type_hash)

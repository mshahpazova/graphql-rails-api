# frozen_string_literal: true
  include GraphQL::Preload::SchemaMethods
  require Rails.root.join('app/graphql/field_resolvers')
  graphql_path = Rails.root.join('app/graphql/schema.graphql')
  graphql_schema = File.read(graphql_path)
  hash = FieldResolvers.instance
  GraphqlRailsTaskSchema = GraphQL::Schema.from_definition(graphql_schema, default_resolve: hash)

  GraphqlRailsTaskSchema.redefine do
    enable_preloading
    use GraphQL::Batch
  end

  GraphqlRailsTaskSchema.types['User'].redefine do
    preload :posts
  end

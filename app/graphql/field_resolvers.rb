# frozen_string_literal: true

class FieldResolvers
  def self.instance
    {
      'Query' => {
        'users' => ->(_ob, _args, _ctx) { User.includes(:posts) }
      },
      'Post' => {
        'title' => ->(obj, _args, _ctx) { obj.title },
        'body' => ->(obj, _args, _ctx) { obj.body }
      },

      'User' => {
        'posts' => ->(obj, _args, _ctx) { obj.posts }
      }
    }
  end
end

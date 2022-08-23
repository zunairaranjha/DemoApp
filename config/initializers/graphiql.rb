if Rails.env.development?
  
    GraphiQL::Rails.config.headers['Authorization'] = -> (_ctx) {
      "Token #{ENV['JWT_TOKEN']}"
      # GraphiQL::Rails.config.header_editor_enabled = true
    # GraphiQL::Rails.config.headers['Authorization'] = true
     }
   end
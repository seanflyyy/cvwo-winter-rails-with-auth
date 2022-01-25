Rails.application.config.middleware.insert_before 0, Rack::Cors do 
    allow do 
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end 
    allow do 
        origins "https://61efd3b6d5a539e551b747ff--trusting-hawking-bdc7d2.netlify.app/"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end 
end


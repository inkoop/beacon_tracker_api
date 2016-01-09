User.create(name: "Vivek", api_key: SecureRandom.hex(10)) if User.count.zero?

Category.find_or_create_by(name: "Office")
Category.find_or_create_by(name: "Sleep")

class Drink

  attr_accessor :id, :title, :description

  # Open the connection to the DB
  def self.open_connection
    conn = PG.connect( dbname: 'yumtree' )
  end

  # Method to get all instances from our DB
  def self.all
    # calling the open_connection method
    conn = self.open_connection

    # Creating a SQL string
    sql = "SELECT * FROM drinks ORDER BY id"

    # Execute the connection with our SQL string, storing it in a variable
    # 'Dirty array'
    results = conn.exec(sql)

    # 'Cleaned array'
    drinks = results.map do |tuple|
      self.hydrate tuple
    end
  end

  # Find one using the ID that'll give it when we call it
  def self.find id
    # Open connection
    conn = self.open_connection

    # SQL to find using the ID
    sql = "SELECT * FROM drinks WHERE id=#{ id } LIMIT 1"

    # Get the raw results
    drinks = conn.exec(sql)

    # Result comes back as array so need to run hydrate on first instance
    drink = self.hydrate drinks[0]

    # Return the cleaned drink
    drink
  end

  def save
    conn = Drink.open_connection

    # If the object that the save method is run on does NOT have an existing ID, create a new instance
    if (!self.id)
      sql = "INSERT INTO drinks (title, description) VALUES ('#{ self.title }','#{ self.description }')"
    else
      sql = "UPDATE drinks SET title='#{self.title}', description='#{self.description}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)
  end

  # DESTROY method
  def self.destroy id
    conn = self.open_connection

    sql = "DELETE FROM drinks WHERE id=#{id}"

    conn.exec(sql)
  end

  # The data we get back from the DB isn't particularly clean, so we need to create a method to clean it up before we send it to the Controller
  def self.hydrate drink_data
    # Create a new instance of Drink
    drink = Drink.new

    # Assign the id, title and description properties to those that come back from the DB
    drink.id = drink_data['id']
    drink.title = drink_data['title']
    drink.description = drink_data['description']

    # Return the drink
    drink
  end
end

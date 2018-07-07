require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :db, :hp


  @@all = []
  def initialize(id: , name: , type: , db:, hp: )

    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self

  end

    def self.all
      @@all
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    #binding.pry
    end

    def self.find(id, db)
      pokemon_info = db.execute("SELECT * FROM pokemon  WHERE id = ?", id).flatten

      Pokemon.new(id: 1, name: 'Pikachu', type: 'electric', db: db)

    end

    def self.alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
    end

end

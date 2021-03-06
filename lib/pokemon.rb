require 'pry'
class Pokemon
  attr_accessor :name, :type, :hp, :db
  attr_reader :id

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten.flatten
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    id = self.id
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end

end

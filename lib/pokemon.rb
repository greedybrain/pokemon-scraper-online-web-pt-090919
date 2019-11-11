require 'pry'
class Pokemon
  
  attr_accessor :name, :type, :id, :db
  
  def initialize(id=nil)
    @id = id
    @name = name 
    @type = type
    @db = db
    binding.pry
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    db.execute(sql, id)[0]
  end
  
end

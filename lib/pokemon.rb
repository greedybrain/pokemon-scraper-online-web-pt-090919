require 'pry'
class Pokemon
  
  attr_accessor :name, :type, :id, :db
  
  def initialize(id=nil)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    # binding.pry 
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
end

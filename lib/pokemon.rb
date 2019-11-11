require 'pry'
class Pokemon
  
   attr_accessor :name, :type, :id, :db
  
  def initialize(id=nil)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def self.save(name, type)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
    # binding.pry 
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
end

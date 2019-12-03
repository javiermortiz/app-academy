require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true 
    end 


end 

class Model 
        def self.find_by_id(id)
            id = id.to_i

            data = QuestionsDatabase.instance.execute(<<-SQL, id)
                SELECT * FROM users WHERE id = ? 
            
            SQL

        end 
end
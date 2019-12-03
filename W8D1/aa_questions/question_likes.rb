require_relative 'QuestionsDatabase.rb'
class QuestionLikes
    attr_accessor :id, :user_id, :question_id
    def self.find_by_id(id)
        id = id.to_i
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM question_likes WHERE id = ?  
        SQL
        data.map { |datum| QuestionLikes.new(datum) }
    end

    def initialize(options={})
        @id = options["id"]
        @user_id= options["user_id"]
        @question_id = options["question_id"]
    end


end


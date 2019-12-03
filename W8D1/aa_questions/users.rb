require_relative 'QuestionsDatabase.rb'
require_relative 'questions.rb'
require_relative 'replies.rb'
require_relative 'question_follows.rb'
class Users
    attr_accessor :id, :fname, :lname
    def self.find_by_id(id)
        id = id.to_i
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM users WHERE id = ?  
        SQL
        data.map { |datum| Users.new(datum) }
    end

    def initialize(options={})
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end

    def self.find_by_name(fname,lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT 
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL

        users.map{|user| Users.new(user)}

    end


    def authored_questions
        Questions.find_by_author_id(id)
    end

    def authored_replies
        Replies.find_by_user_id(id)
    end

    def followed_questions
        QuestionFollows.followed_questions_for_user_id(id)
    end

    def followers
        my_questions = self.authored_questions
        my_questions.map do |question|
            QuestionFollows.followers_for_question_id(question.id)
        end
    end


end
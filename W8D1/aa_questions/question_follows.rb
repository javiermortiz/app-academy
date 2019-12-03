require_relative 'QuestionsDatabase.rb'
require_relative 'users.rb'
class QuestionFollows

    attr_accessor :id, :question_id, :user_id 
    def self.find_by_id(id)
        id = id.to_i
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM question_follows WHERE id = ?  
        SQL

        data.map { |datum| QuestionFollows.new(datum) }
    end

    def initialize(options={})
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.followers_for_question_id(target_question_id)
        followers = QuestionsDatabase.instance.execute(<<-SQL, target_question_id)
        SELECT 
            *
        FROM
            users
        JOIN
            question_follows
        ON    
            question_follows.user_id = users.id
        WHERE
            question_id = ?
        SQL
        followers.map { |follower| Users.new(follower)}
    end

    #what question is a user following?
    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            questions
        JOIN
            question_follows
        ON
            question_follows.question_id = questions.id
        WHERE
            user_id = ?
        SQL
        questions.map { |question| Questions.new(question) }
    end 

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT DISTINCT
            *
        FROM
            questions
        JOIN
            question_follows
        ON 
            question_follows.question_id = questions.id 
        GROUP BY
            question_id
        ORDER BY 
            COUNT(*) DESC
        LIMIT 
            ?
        SQL
        questions.map{|question| Questions.new(question)}[n-1...n]

    end

end 


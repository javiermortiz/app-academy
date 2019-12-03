require_relative 'QuestionsDatabase.rb'
require_relative 'question_follows.rb'
class Questions 

    attr_accessor :id, :title, :body, :author_id 
    def self.find_by_id(id)
        # id = id.to_i
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM questions WHERE id = ?  
        SQL

        data.map { |datum| Questions.new(datum) }
    end

    def initialize(options={})
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT 
                *
            FROM 
                questions
            WHERE
                author_id = ?
        SQL

        questions.map { |question| Questions.new(question) }
    end 

    def author
        authors = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                fname,lname
            FROM
                users
            JOIN
                questions
            ON 
                questions.author_id = users.id
            WHERE
                author_id = ?
        SQL
        authors.map { |author| Users.new(author) }
    end 

    def replies
        Reply.find_by_question_id(id)
    end 

    def self.most_followed(n)
        QuestionFollows.most_followed_questions(n)
    end
end 

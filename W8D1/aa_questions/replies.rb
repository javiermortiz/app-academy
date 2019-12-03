require_relative 'QuestionsDatabase.rb'
class Replies 
    attr_accessor :id, :question_id, :parent_reply, :user_id, :body
    def self.find_by_id(id)
        id = id.to_i
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM replies WHERE id = ?  
        SQL
        data.map { |datum| Replies.new(datum) }
    end

    def initialize(options={})
        @id = options["id"]
        @question_id = options["question_id"]
        @parent_reply = options["parent_reply"]
        @user_id = options["user_id"]
        @body = options["body"]
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT 
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL

        replies.map { |reply| Replies.new(reply) }
    end 

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT 
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL

        replies.map { |reply| Replies.new(reply) }
    end 

    def author
        authors = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                fname,lname
            FROM
                users
            JOIN
                replies
            ON 
                replies.user_id = users.id
            WHERE
                user_id = ?
        SQL
        authors.map { |author| Users.new(author) }
    end 

    def child_replies
        child_replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM
            replies
        WHERE 
            parent_reply = ?
        SQL
        child_replies.map { |child_reply| Replies.new(child_reply)}
    end
end



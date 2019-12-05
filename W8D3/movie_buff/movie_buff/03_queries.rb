def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  # Movie
  #   .select(:title, :id)
  #   .joins(:actors)
  #   .where(actors: { name: those_actors })

  #  first_actor_movies = Movie
  #   .joins(:actors)
  #   .where('actors.name = ?', those_actors[0])

  #   first_actor_movies
  #   .select(:title, :id)
  #   .joins(:actors)
  #   .where('actors.name = ?', those_actors[1])
  
  Movie
    .select(:title, :id)
    .joins(:actors)
    .where(actors: { name: those_actors })
    .group(:id)
    .having('COUNT(*) = ?', those_actors.length)
end

#

def golden_age
  # Find the decade with the highest average movie score.

  # result_of_query => instance of ActiveRecord
  # i = 0
  # while i < result_of_query.length
  # result_of_query.each |movie|
  #   # che
  # decade_sum = 0
  # while yr % 10 != 0
  # <<-SQL
  #   SELECT 
  #     yr/10*10 AS decade, AVG(score) AS avg_score
  #   FROM 
  #     movies
  #   GROUP BY 
  #     yr/10*10
  #   ORDER BY 
  #    AVG(score) DESC LIMIT 1
  # SQL

  Movie
    .group('yr/10*10')
    .order('AVG(score) DESC')
    .limit(1)
    .pluck('yr/10*10')[0]

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
# <<-SQL
# SELECT
#       a1.name
#     FROM (  
#         -- all movies that art garfunkel was in
#         SELECT
#           movies.*
#         FROM
#           movies
#         JOIN
#           castings ON castings.movie_id = movies.id
#         JOIN
#           actors ON actors.id = castings.actor_id
#         WHERE
#           actors.name = 'Art Garfunkel'
#       ) AS m1
#     JOIN (
#         SELECT
#           actors.*,
#           castings.movie_id
#         FROM
#           actors
#         JOIN
#           castings ON castings.actor_id = actors.id
#         WHERE
#           actors.name != 'Art Garfunkel'
#       ) AS a1 ON m1.id = a1.movie_id;
# SQL
end 

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end

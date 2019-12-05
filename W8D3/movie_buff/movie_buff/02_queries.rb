def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie 
    .select(:id, :title, :yr, :score)
    .where(score: 3..5)
    .where(yr: 1980..1989)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  <<-SQL
    SELECT
      yr
    FROM
      movies
    GROUP BY
      yr
    HAVING 
      MAX(score < 8)
  SQL

  # good_years = Movie
  #   .where('score > 8')
  #   .pluck(:yr)

  # Movie
  #   .where.not(yr: good_years)
  #   .distinct
  #   .pluck(:yr)

  # Movie
  #   .where('yr NOT IN (SELECT 
  #         yr
  #       FROM
  #         movies
  #       WHERE
  #         score > 8)')
  #   .distinct
  #   .pluck(:yr)

  Movie 
    .group(:yr)
    .having('MAX(score) < 8')
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  # <<-SQL(title)
  #   SELECT
  #     id, name
  #   FROM
  #     actors
  #   JOIN
  #     castings ON casting.actor_id = actors.id
  #   JOIN
  #     movies ON movies.id = castings.movie_id
  #   WHERE
  #     movie.title = ?
  #   ORDER BY
  #     castings.ord
  # SQL

  Actor
    .select(:id, :name)
    .joins(:movies)
    .where(movies: { title: title })
    .order('castings.ord')

end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie 
    .joins(:actors)
    .select('movies.id, movies.title, actors.name')
    .where('director_id = actors.id')
    .where('castings.ord = 1')
    
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select('actors.id, actors.name, COUNT(castings.*) AS roles')
    .joins(:castings)
    .where.not(castings: { ord: 1 })
    .group(:id)
    .order('COUNT(castings.*) DESC') 
    .limit(2)
end

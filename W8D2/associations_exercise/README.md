**Associations!**

Welcome to the associations exercise.

Check out the [`db/schema.rb`][schema] to see what your database will look like.

Check out [`db/seeds.rb`][seedfile] to see what test data your database contains.

The database has already been created and is standing by for your usage.

[schema]: ./db/schema.rb
[seedfile]: ./db/seeds.rb


<!-- enroll BELONG to course
            AND     to user
 -->

<!-- enrollments
    - belongs to 
         course
            through - table
            source - method
         user
 -->

 <!-- users
    has_many -> enrollments / courses
  -->

  <!-- course
    -add association for prereq
        return a course prereq IF they have one

    -add instructors association to course
        point to a User object
            -course is RELATED to instructor and enrolled students

    
   -->
phase 1
users
-create user table and model
    -email associated
    -supplies an email -> not null
    -unique email
    -optional: true <--- look into
    -validate email
    -use snake_case ex: SnakeCase should be snake_case
    -Users and user.rb
    -timestamps
    -index for email col
    -should not persist if duplicate email

Phase 2 - ShortenedURL
    -shortened_urls table
        -long col
        -short col
        -user_id col <-- foreign key - belongs_to
    -ShortenedURL model
        -uniqueness validation
        -prescence validation
validates :email prescence 

create new migration for checking uniqueness
migration - unique (last line of def)
model - uniquness (mimic db validation)
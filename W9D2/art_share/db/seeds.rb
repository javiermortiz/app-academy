# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Artwork.destroy_all 
ArtworkShare.destroy_all 
Comment.destroy_all

user1 = User.create!(username: 'name1')
user2 = User.create!(username: 'name2')

artwork1 = Artwork.create!(title: 'title1', image_url: 'google.com', artist: user1, favorite: true)
artwork2 = Artwork.create!(title: 'title2', image_url: 'google1.com', artist: user2, favorite: false )

artwork_share1 = ArtworkShare.create!(artwork: artwork1, viewer: user1)
artwork_share2 = ArtworkShare.create!(artwork: artwork2, viewer: user2)

comment1 = Comment.create!(body: 'this is a comment1', author: user1, artwork: artwork1)
comment2 = Comment.create!(body: 'this is a comment2', author: user2, artwork: artwork2)


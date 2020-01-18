json.partial! "/api/guests/guests", guest: @guest
json.gifts @guest.gifts do |gift|
json.extract! gift, :title, :description
end 
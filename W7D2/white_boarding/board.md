A class is a packet of code, that defines an object with specific attributes and
functionality. You can create many instances out of that blueprint.


Self is a reference to the class object that has access to the methods in the class
definition.

super() is used to call the parents class method with the same name as the method in the
subclass. We can pass arguments to it.

class Jukebox
    attr_accessor :user
    attr_reader :current_track

    def initialize(player, user)
        @player = player
        @user = user
        @current_track = nil
    end
end

class Player
    attr_accessor :album, :playlist
    def initialize(album, playlist)
        @album = album
        @playlist = playlist
    end

    def play_track(track)
        play(track)
    end 
end 

class Playlist
    
    def initialize
        @queue = []
    end

    def add_track(track)
        @queue << track
    end 

    def shift
        @queue.shift
    end 
end

class Album
    #info the album
end 

class Track
    #info about the track
end

class User
    #info about the user
end 

bfs
class Node

    def bfs(&prc) 
        raise "No proc!" if prc.nil? 
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if prc.call(el)
            el.children.each do |child|
                queue << child
            end 
        end
        nil
    end 
end 
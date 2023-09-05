class GetStreams < ApplicationService 
  def self.call 
    HTTParty.get('https://api.twitch.tv/helix/streams', headers: { 'Authorization' => 'Bearer ', 'Client-Id' => ''})
  end
end

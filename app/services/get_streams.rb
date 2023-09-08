class GetStreams < ApplicationService 
  attr_accessor :params

  def initialize(params)
    @params = { 
      category: params.fetch(:category),
      language: params.fetch(:language)    
    }
  end

  def call 
    url = "https://api.twitch.tv/helix/streams?#{url_parameter}"
    Rails.logger.info "url_parameter = #{url}"
    HTTParty.get(url, headers: { 'Authorization' => 'Bearer ', 'Client-Id' => ''})
  end

  private 

  def url_parameter
    params.reduce("") do |memo, param| 
      key, value = param
      if key == :category
        memo += "game_id=#{game_id_for(value)}"
      else 
        memo += "&language=#{language_for(value)}"
      end
      memo
    end
  end

  def game_id_for(value)
    case value 
    in 'Art'
    '509660'
    in 'Beauty & Body Art'
    '509669'
    in 'Food & Drink'
    '509667'
    in 'Just Chatting'
    '509658'
    in 'Makers & Crafting'
    '509673'
    in 'Music'
    '26936'
    in 'Retro'
    '27284'
    in 'Software and Game Development'
    '1469308723'
    end
  end

  def language_for(value)
    case value 
    in 'English'
    'en'
    in 'German'
    'de'
    in 'Italian'
    'it'
    in 'Japanese'
    'ja'
    in 'Korean'
    'ko'
    in 'Russian'
    'ru'
    in 'Spanish'
    'es'
    end
  end
end

module StreamsHelper
  def get_language(value)
    case value 
    in 'en'
    'English'
    in 'de'
    'German'
    in 'it'
    'Italian'
    in 'ja'
    'Japanese'
    in 'ko'
    'Korean'
    in 'ru'
    'Russian'
    in 'es'
    'Spanish'
    end
  end

  def get_time(time)
    diff = Time.diff(time.to_datetime, Time.now)
    return "#{diff[:minute]} minutes" unless diff[:hour] > 1 
    hour_string = diff[:hour] == 1 ? "hour" : "hours"
    "#{diff[:hour]} #{hour_string} and #{diff[:minute]} minutes"
  end
end

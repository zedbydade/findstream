class StreamsController < ApplicationController
  def index
    @streams = GetStreams.call(params)
    return @streams = @streams["data"].select {|stream|
      String::Similarity.cosine(params[:search_string], stream["title"]) > 0.5
    } unless params[:search_string].blank?
    @streams = @streams["data"] 
  end

  def home; end
end

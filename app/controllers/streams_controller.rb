class StreamsController < ApplicationController
  def index
    @streams = GetStreams.call(params)
    @streams = @streams["data"].select {|stream|
      String::Similarity.cosine(params[:search_string], stream["title"]) > 0.3
    } unless params[:search_string].blank?
    
  end

  def home; end
end

class StreamsController < ApplicationController
  def index
    @streams = GetStreams.call(params)
  end

  def home; end
end

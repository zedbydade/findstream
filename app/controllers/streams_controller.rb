class StreamsController < ApplicationController
  def index
    @streams = GetStreams.call
  end

  def home; end
end

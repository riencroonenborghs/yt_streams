require 'httparty'
require 'cgi'

module YtStreams
  def self.info(url)
    video_info = ::YtStreams::VideoInfo.new(url)
    video_info.fetch
    video_info
  end
end

require_relative 'yt_streams/url_parser'
require_relative 'yt_streams/video_info'
require_relative 'yt_streams/itag'
require_relative 'yt_streams/stream'
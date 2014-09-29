require 'httparty'
require 'cgi'

module YtStreams
  def self.info(url)
    video_info = ::YtStreams::VideoInfo.new(url)
    video_info.fetch
    video_info
  end
end

require 'yt_streams/url_parser'
require 'yt_streams/video_info'
require 'yt_streams/itag'
require 'yt_streams/stream'
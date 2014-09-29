module YtStreams
  class VideoInfo
    include ::HTTParty

    attr_accessor :title, :streams

    def initialize(url)
      @url = url
    end

    def fetch
      get_streams
    end

  private

    def video_info      
      path = YOUTUBE_VIDEO_INFO_URL + ::YtStreams::UrlParser.new(@url).video_id
      ::HTTParty.get(path)
    end

    def get_streams
      parsed_video_info = CGI::parse(video_info)
      @title  = parsed_video_info['title'][0]
      @streams ||= []
      parsed_video_info['url_encoded_fmt_stream_map'].each do |stream|  
        streams = parsed_stream(stream)
        streams.keys.each do |key|
          url = streams[key]
          @streams << Stream.new(key.merge(url: url))
        end
      end
    end

    def parsed_stream(stream)
      data    = {}
      hash    = CGI::parse(stream)
      
      codecs  = hash['type']
      is3d    = hash.keys.include?('stereo3d')
      itags   = hash['itag']

      hash['url'].each_with_index do |url, index|
        itag = ::YtStreams::Itag.translate(itags[index])
        data[itag] = url
      end

      data
    end    

    YOUTUBE_VIDEO_INFO_URL = "http://www.youtube.com/get_video_info?video_id="

  end
end
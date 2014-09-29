module YtStreams
  class Stream
    attr_accessor :url
    attr_accessor :codec, :width, :height, :is3d
    attr_accessor :video_only, :audio_only, :bitrate

    def initialize(args = {})
      args.keys.each do |key|
        send("#{key}=", args[key]) if respond_to?(key)
      end
    end
  end
end
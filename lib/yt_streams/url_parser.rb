module YtStreams
  class UrlParser

    def initialize(url)
      @url = url
    end

    def video_id
      @url.match(VIDEO_REG_EXP)[1]
    end

  private

    VIDEO_REG_EXP = /.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/

  end
end
module YtStreams
  class Itag

    ITAGS = {
      5 =>  {codec: 'FLV', width: 320, height: 240},
      17 => {codec: '3GP', width: 176, height: 144},
      18 => {codec: 'MP4', width: 480, height: 360},
      22 => {codec: 'MP4', width: 1280, height: 720},
      34 => {codec: 'FLV', width: 480, height: 360},
      35 => {codec: 'FLV', width: 640, height: 480},
      36 => {codec: '3GP', width: 320, height: 240},
      37 => {codec: 'MP4', width: 1920, height: 1080},
      38 => {codec: 'MP4', width: 2048, height: 1080},
      43 => {codec: 'WEB', width: 480, height: 360},
      44 => {codec: 'WEB', width: 640, height: 480},
      45 => {codec: 'WEB', width: 1280, height: 720},
      46 => {codec: 'WEB', width: 1920, height: 1080},
      82 => {codec: 'MP4', width: 480, height: 360, is3d: true},
      83 => {codec: 'MP4', width: 640, height: 480, is3d: true},
      84 => {codec: 'MP4', width: 1280, height: 720, is3d: true},
      85 => {codec: 'MP4', width: 1920, height: 1080, is3d: true},
      100 => {codec: 'WEB', width: 480, height: 360, is3d: true},
      101 => {codec: 'WEB', width: 640, height: 480, is3d: true},
      102 => {codec: 'WEB', width: 1280, height: 720, is3d: true},
      133 => {codec: 'MP4', width: 320, height: 240, video_only: true},
      134 => {codec: 'MP4', width: 480, height: 360, video_only: true},
      135 => {codec: 'MP4', width: 640, height: 480, video_only: true},
      136 => {codec: 'MP4', width: 1280, height: 720, video_only: true},
      137 => {codec: 'MP4', width: 1920, height: 1080, video_only: true},
      139 => {codec: 'MP4', bitrate: 'Low bitrate', audio_only: true},
      140 => {codec: 'MP4', bitrate: 'Med bitrate', audio_only: true},
      141 => {codec: 'MP4', bitrate: 'Hi bitrate', audio_only: true},
      160 => {codec: 'MP4', width: 256, height: 144, video_only: true}
    }

    def self.translate(itag)
      ITAGS[itag.to_i]
    end
  end
end

# https://github.com/rg3/youtube-dl/issues/1687
require 'spec_helper'

describe YtStreams::VideoInfo do

  let(:url) { 'https://www.youtube.com/watch?v=uDF3Z_giJiY' }
  let(:invalid_url) { 'https://www.youtube.com/watch?v=' }
  let(:fetcher) { YtStreams::VideoInfo.new(url) }
  let(:response) { File.read(File.join('spec', 'support', 'youtube_response')) }
  let(:stream) { File.read(File.join('spec', 'support', 'youtube_response_stream')) }
  let(:codec) { 'video/webm; codecs="vp8.0, vorbis",quality=medium' }

  context '#new' do
    it "should initialize" do
      expect { YtStreams::VideoInfo.new(url) }.to_not raise_error
    end

    it "should raise error" do
      expect{ YtStreams::VideoInfo.new }.to raise_error(ArgumentError)
    end
  end

  context '#video_info' do
    it "should return" do
      expect(fetcher.send(:video_info)).to_not eq nil
    end

    it "should return HTTParty::Response" do
      expect(fetcher.send(:video_info).class).to eq HTTParty::Response
    end
  end

  context '#parsed_stream' do
    it "should return" do
      expect(fetcher.send(:parsed_stream, stream)).to_not eq nil
    end

    it "should return hash" do
      expect(fetcher.send(:parsed_stream, stream).class).to eq Hash
    end

    it "should return width" do
      expect(fetcher.send(:parsed_stream, stream).keys.map{|x| x[:width]}).to eq [1280, 480, 480, 320, 320, 176]
    end

    it "should return height" do
      expect(fetcher.send(:parsed_stream, stream).keys.map{|x| x[:height]}).to eq [720, 360, 360, 240, 240, 144]
    end

    it "should return codecs" do
      expect(fetcher.send(:parsed_stream, stream).keys.map{|x| x[:codec]}).to eq ["MP4", "WEB", "MP4", "FLV", "3GP", "3GP"]
    end
  end

  context '#get_streams' do
    before(:each) do
      allow_any_instance_of(YtStreams::VideoInfo).to receive(:video_info).and_return(response)
    end

    it "should return" do
      expect(fetcher.send(:get_streams)).to_not eq nil
    end

    it "should set title attribute" do
      expect(fetcher.title).to eq nil
      fetcher.send(:get_streams)
      expect(fetcher.title).to_not eq nil
      expect(fetcher.title.class).to eq String
      expect(fetcher.title).to eq "History Of The World In Two Hours ( History Channel TV )"
    end

    it "should set streams attribute" do
      expect(fetcher.streams).to eq nil
      fetcher.send(:get_streams)
      expect(fetcher.streams).to_not eq nil
      expect(fetcher.streams.class).to eq Array
      expect(fetcher.streams.size).to eq 6
      expect(fetcher.streams.first.class).to eq ::YtStreams::Stream
    end
  end

  context '#fetch' do
    before(:each) do
      allow_any_instance_of(YtStreams::VideoInfo).to receive(:video_info).and_return(response)
    end

    it "should return" do
      expect(fetcher.fetch).to_not eq nil
    end
  end

end
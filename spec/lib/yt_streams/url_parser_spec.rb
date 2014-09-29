require 'spec_helper'

describe YtStreams::UrlParser do

  let(:url) { 'https://www.youtube.com/watch?v=uDF3Z_giJiY' }
  let(:invalid_url) { 'https://www.youtube.com/watch?v=' }
  let(:video_id) { 'uDF3Z_giJiY' }

  context '#new' do
    it "should initialize" do
      expect { YtStreams::UrlParser.new(url) }.to_not raise_error
    end

    it "should raise error" do
      expect{ YtStreams::UrlParser.new }.to raise_error(ArgumentError)
    end
  end

  context '#video_id' do
    let(:url_parser) { YtStreams::UrlParser.new(url) }

    it "should return" do
      expect(url_parser.video_id).to_not eq nil
    end

    it "should return nil" do
      url_parser = YtStreams::UrlParser.new(invalid_url)
      expect(url_parser.video_id).to_not eq nil
    end

    it "should return id" do
      expect(url_parser.video_id).to eq video_id
    end
  end

end
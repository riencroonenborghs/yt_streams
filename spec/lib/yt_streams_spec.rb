require 'spec_helper'

describe YtStreams do

  let(:url) { 'https://www.youtube.com/watch?v=uDF3Z_giJiY' }
  let(:response) { File.read(File.join('spec', 'support', 'youtube_response')) }
  
  context 'self#info' do
    before(:each) do
      allow_any_instance_of(YtStreams::VideoInfo).to receive(:video_info).and_return(response)
    end

    it "should return" do
      expect(YtStreams.info(url)).to_not eq nil
    end

    it "should return ::YtStreams::VideoInfo" do
      expect(YtStreams.info(url).class).to eq ::YtStreams::VideoInfo
    end
  end

end
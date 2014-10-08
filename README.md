# Yt Streams

A little library to fetch video stream info from a YouTube video.

**YouTube is very fickle with its responses and results may vary.**

## Install
### Rails example

Add this line to your Gemfile:

```
gem 'yt_streams', github: 'riencroonenborghs/yt_streams'
```

and run:

```
bundle install
```

That's it really. Now you can add a controller and some views that will lookup a URL and return the streams.

See [Yt](https://github.com/riencroonenborghs/yt) as an example.

### Ruby example

In the project folder run `irb`

```
> require './lib/yt_streams'
 => true

> require 'pp'
 => true

> PP.pp YtStreams.info('https://www.youtube.com/watch?v=VIDEOID')
#<YtStreams::VideoInfo:0x007f98135d33d0
 @streams=
  [#<YtStreams::Stream:0x007f98136c8d30
    @codec="MP4",
    @height=360,
    @url=
     "http://youtube.direct.url",
    @width=480>],
 @title="video title",
 @url="https://www.youtube.com/watch?v=VIDEOID">
 => #<IO:<STDOUT>> 
```

## Usage

```
YtStreams.info(<YOUTUBE_URL>)
```

If everything goes well, you will get a YtStreams::VideoInfo object back.

This will contain the title and all associated video streams for the YouTube video.

Typically a YtStreams::Stream will have stream related information like the codec used. Most likely you'd be more interested in **url**.

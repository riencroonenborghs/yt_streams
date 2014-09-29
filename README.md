# Yt Streams

A little library to fetch video stream info from a YouTube video.

**YouTube is very fickle with its responses and results may vary.**

## Install

Add to your Gemfile:

```
gem 'yt_streams', github: 'riencroonenborghs/yt_streams'
```

and run:

```
bundle install
```


## Usage

```
YtStreams.info(<YOUTUBE_URL>)
```

If everything goes well, you will get a YtStreams::VideoInfo object back.

This will contain the title and all associated video streams for the YouTube video.

Typically a YtStreams::Stream will have stream related information like the codec used. Most likely you'd be more interested in **url**.


## Example
```
> YtStreams.info('https://www.youtube.com/watch?v=SOMEID')
> #<YtStreams::VideoInfo:0x007fb442e394c0
 @streams=
  [#<YtStreams::Stream:0x007fb442c30070
    @codec="MP4", @height=720, @url="http://...", @width=1280>,
   #<YtStreams::Stream:0x007fb442c37a28
    @codec="WEB", @height=360, @url="http://...", @width=480>,
   #<YtStreams::Stream:0x007fb442c377f8
    @codec="MP4", @height=360, @url="http://...", @width=480>,
   #<YtStreams::Stream:0x007fb442c375f0
    @codec="FLV", @height=240, @url="http://...", @width=320>,
   #<YtStreams::Stream:0x007fb442c373c0
    @codec="3GP", @height=240, @url="http://...", @width=320>,
   #<YtStreams::Stream:0x007fb442c37028
    @codec="3GP", @height=144, @url="http://...", @width=176>],
 @title="Awesome video in HD",
 @url="https://www.youtube.com/watch?v=SOMEID">
```
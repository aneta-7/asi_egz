class HashtagsController < ApplicationController

  def index
    @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| x.name <=> y.name }
    #@hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| SimpleHashtag::Hashtag.find_by_name(y.name).hashtaggables.count <=> SimpleHashtag::Hashtag.find_by_name(x.name).hashtaggables.count }
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end

end

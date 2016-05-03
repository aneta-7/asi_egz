class HashtagsController < ApplicationController

  def index
    if params[:sortName]
      if params[:sortName] == "asc"
        @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| x.name <=> y.name }
        @sn = true;
      else
        @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| y.name <=> x.name }
        @sn = false;
      end
    elsif params[:sortScore]
      if params[:sortScore] == "desc"
        @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| SimpleHashtag::Hashtag.find_by_name(y.name).hashtaggables.count <=> SimpleHashtag::Hashtag.find_by_name(x.name).hashtaggables.count }
        @ss = true;
      else
        @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| SimpleHashtag::Hashtag.find_by_name(x.name).hashtaggables.count <=> SimpleHashtag::Hashtag.find_by_name(y.name).hashtaggables.count }
        @ss = false;
      end
    else 
      @sn = true
      @hashtags = SimpleHashtag::Hashtag.all.sort { |x,y| x.name <=> y.name }
    end
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end

end

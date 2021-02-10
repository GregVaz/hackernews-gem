require 'rest-client'
require 'json'

class HackerNew
  URL = 'https://hacker-news.firebaseio.com/v0/'.freeze
  JSON_FORMAT = '/.json?print=pretty'.freeze

  def initialize
    @stories = []
  end

  def new_stories(num = 20)
    new_stories_ids = request_bunch('newstories', num)
    # while story_id = new_stories_ids.shift
    #   @stories << request('item', story_id)
    # end
    @stories << request_item('item', new_stories_ids[0])
    # @stories
  end

  def top_stories(num = 20)

  end

  def user_stories(user, num = 10)

  end

  def story_comments(story)

  end

  def top_job_stories(num = 20)

  end

  private
  def request(url)
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def request_item(type, id)
    url = URL + type + '/' + id.to_s + JSON_FORMAT
    request(url)
  end

  def request_bunch(type, num)
    url = URL + type + JSON_FORMAT
    response = request(url)
    response.first(num)
  end
end
=begin
  - item, user, maxitem
  - topstories, newstories, beststories
  - askstories, showstories, jobstories
=end

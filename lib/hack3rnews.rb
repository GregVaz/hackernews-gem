require 'rest-client'
require 'json'

class HackerNew
  URL = 'https://hacker-news.firebaseio.com/v0/'.freeze
  JSON_FORMAT = '/.json?print=pretty'.freeze

  class << self
    def new_stories(num = 3)
      stories = []
      new_story_ids = request_bunch('newstories', num)
      while story_id = new_story_ids.shift
        stories << request_item('item', story_id)
      end
      stories
    end

    def top_stories(num = 3)
      stories = []
      top_story_ids = request_bunch('topstories', num)
      while story_id = top_story_ids.shift
        stories << request_item('item', story_id)
      end
      stories
    end

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

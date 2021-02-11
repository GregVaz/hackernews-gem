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

    def user_stories(user, num = 3)
      stories = []
      user_data = request_item('user', user)
      user_story_ids = user_data["submitted"].first(num) || [nil]
      while story_id = user_story_ids.shift
        stories << request_item('item', story_id)
      end
      stories
    end

    def story_comments(story)
      story_data = request_item('item', story)
      comment_ids = story_data["kids"] || [nil]
      comments = []
      while comment_id = comment_ids.shift
        comments << request_item('item', comment_id)
      end
      comments
    end

    def top_job_stories(num = 2)
      job_scores = []
      top_jobs = []
      request_bunch('jobstories').each do |job_id|
        job_scores << request_item('item', job_id)["score"]
      end
      job_scores.sort.last(num).reverse.each do |job_id|
        top_jobs << request_item('item', job_id)
      end
      top_jobs
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

    def request_bunch(type, num = nil)
      url = URL + type + JSON_FORMAT
      response = request(url)
      num ? response.first(num) : response
    end
  end
end

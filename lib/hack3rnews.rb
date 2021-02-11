require 'rest-client'
require 'json'

class HackerNew
  URL = 'https://hacker-news.firebaseio.com/v0/'.freeze
  JSON_FORMAT = '/.json?print=pretty'.freeze

  class << self
    def new_stories(num = 3)
      capture_stories('newstories', num)
    end

    def top_stories(num = 3)
      capture_stories('topstories', num)
    end

    def user_stories(user, num = 3)
      capture_item_kids('user', num: num, item_id: user, kind: 'submitted')
    end

    def story_comments(story)
      capture_item_kids('item', item_id: story, kind: 'kids')
    end

    def top_job_stories(num = 20)
      job_scores = []
      request_bunch('jobstories').each do |job_id|
        job_scores << request_item('item', job_id)
      end
      job_scores.sort_by! { |hsh| hsh["score"] }
      job_scores.last(num).reverse
    end

  private
    def capture_item_kids(type, opt = {})
      kids = []
      item = request_item(type, opt[:item_id])
      kid_ids = capture_ids(item, opt)
      while kid_id = kid_ids.shift
        kids << request_item('item', kid_id)
      end
      kids
    end

    def capture_ids(item, opt)
      num = opt[:num]
      return (item[opt[:kind]].first(num) || [nil]) if num
      item[opt[:kind]] || [nil]
    end

    def capture_stories(type, num)
      stories = []
      storie_ids = request_bunch(type, num)
      while story_id = storie_ids.shift
        stories << request_item('item', story_id)
      end
      stories
    end

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

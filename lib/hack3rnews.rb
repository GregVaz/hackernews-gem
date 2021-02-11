require 'rest-client'
require 'json'

class HackerNew
  URL = 'https://hacker-news.firebaseio.com/v0/'.freeze
  JSON_FORMAT = '/.json?print=pretty'.freeze

  class << self
    def new_stories(num = 5)
      capture_stories('newstories', num)
    end

    def top_stories(num = 5)
      capture_stories('topstories', num)
    end

    def user_stories(user, num = 5)
      capture_item_kids('user', num: num, item_id: user, kind: 'submitted')
    end

    def story_comments(story)
      capture_item_kids('item', item_id: story, kind: 'kids')
    end

    def top_job_stories(num = 5)
      job_scores = []
      request_bunch('jobstories').each do |job_id|
        job_scores << request_item('item', job_id)
      end
      job_scores.sort_by! { |hsh| hsh["score"] }
      job_scores.last(num).reverse
    end

  private
    def capture_item_kids(type, opt = {})
      item = request_item(type, opt[:item_id])
      kid_ids = capture_ids(item, opt)
      capture_items(kid_ids)
    end

    def capture_ids(item, opt)
      num = opt[:num]
      return (item[opt[:kind]].first(num) || [nil]) if num
      item[opt[:kind]] || [nil]
    end

    def capture_stories(type, num)
      story_ids = request_bunch(type, num)
      capture_items(story_ids)
    end

    def capture_items(item_ids)
      items = []
      while item_id = item_ids.shift
        items << request_item('item', item_id)
      end
      items
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

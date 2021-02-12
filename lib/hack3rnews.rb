require_relative 'hack3rnews/request'

class HackerNew
  URL = 'https://hacker-news.firebaseio.com/v0/'.freeze
  JSON_FORMAT = '/.json?print=pretty'.freeze

  class << self
    def new_stories(num = 5)
      stories('newstories', num)
    end

    def top_stories(num = 5)
      stories('topstories', num)
    end

    def user_stories(user_id, num = 5)
      user = item('user', user_id)
      items(user['submitted'].first(num) || [])
    end

    def story_comments(story_id)
      story = item('item', story_id)
      items(story['kids'] || [])
    end

    def top_job_stories(num = 5)
      top_items(stories('jobstories'), 'score').last(num)
    end

  private
    def stories(type, num = nil)
      story_ids = request.item(url(type))
      story_ids = story_ids.first(num) if num
      items(story_ids)
    end

    def top_items(items, field)
      items.sort_by! { |hsh| hsh[field] }.reverse
    end

    def items(item_ids)
      item_ids.map {|item_id| item('item', item_id)}
    end

    def item(type, item_id)
      request.item(url(type, item_id))
    end

    def url(type, id = nil)
      return URL + type + '/' + id.to_s + JSON_FORMAT if id
      URL + type + JSON_FORMAT
    end

    def request
      Request.new
    end
  end
end

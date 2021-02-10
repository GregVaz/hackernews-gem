require 'rest-client'

class HackerNews
  URL = 'https://hacker-news.firebaseio.com/v0'.freeze

  def initialize
    @stories = []
  end

  def new_stories(num = 20)

  end

  def top_stories(num = 20)

  end

  def user_stories(user, num = 10)

  end

  def story_comments(story)

  end

  def top_job_stories(num = 20)

  end
end

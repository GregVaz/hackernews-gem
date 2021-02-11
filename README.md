# Hackernews-gem
Ruby gem for consume Hackernews API

Information for the API: [HackerNewsAPI](https://github.com/HackerNews/API)

## Requirements:
* Get the last 20 new stories with all the information
* Get the last 20 top stories with all the information
* Get the last 10 stories for a specific user (you will need to know his/her username)
* Get all the comments of a specific story
* Get the last 20 hihghest-rated score job stories

## How to use

### Installation
First be sure to install the gem: `gem install hack3rnews`

Once installed you have to require the gem in order to use it.
At the top of your ruby file where you need to use the gem write: `require 'hack3rnews'`

### Avalilable methods

- Newest stories:
  - Returns the newest stories, the last 5 by default. This method accepts an argument to specify as many as you need (based on availavility):
  - example: `newest_stories = HackerNew.new_stories(40)`
- Top stories:
  - Returns the highest rated stories, the last 5 by default. It also accepts an argument to specify how many stories you need.
  - example: `top_stories = HackerNew.top_stories(25)`
- User stories:
  - Returns the stories written by an specified user, the last 5 by default. It also accepts an argument to specify the amount that you need.
  - example: `user_stories = HackerNew.top_stories(17)`
- Story comments:
  - Returns all the comments of a specified story. 
  - example: `story_comments = HackerNew.story_comments(story_id)`
- Top job stories:
  - Returns the highest rated job stories, the last 5 by default. The method also accepts an argument to ask for certain amount of stories.
  - example: `top_job_stories = HackerNew.top_job_stories(33)`



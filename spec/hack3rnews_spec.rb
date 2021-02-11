require_relative '../lib/hack3rnews'

RSpec.describe HackerNew do
  describe '.new_stories' do
    it 'returns the 5 newest sotries by default' do
      expect(HackerNew.new_stories.count).to eq(5)
    end

    it 'returns just the 2 newest stories' do
      expect(HackerNew.new_stories(2).count).to eq(2)
    end
  end

  describe '.top_stories' do
    it 'returns the top 5 stories of the moment' do
      expect(HackerNew.top_stories.count).to eq(5)
    end

    it 'returns the top 3 stories of the moment' do
      expect(HackerNew.top_stories(3).count).to eq(3)
    end
  end

  describe '.user_stories' do
    user = 'stanislavb'
    it 'returns the last 5 stories of a user' do
      expect(HackerNew.user_stories(user).count).to eq(5)
    end

    it 'returns the last 3 stories of a user' do
      expect(HackerNew.user_stories(user, 3).count).to eq(3)
    end
  end

  describe '.story_comments' do
    it 'returns all the comments of a given story' do
      story = 26096340

      expect(HackerNew.story_comments(story).count).to be > 10
    end
  end

  describe '.top_job_stories' do
    it 'returns the 5 most ranked job stories' do
      expect(HackerNew.top_job_stories.count).to eq(5)
    end

    it 'returns the 4 most ranked job stories' do
      expect(HackerNew.top_job_stories(4).count).to eq(4)
    end
  end
end

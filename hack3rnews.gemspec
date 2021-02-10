Gem::Specification.new do |s|
  s.name           = "hack3rnews"
  s.version        = "0.0.0"
  s.authors        = ["Alvaro Padilla"]
  s.date           = %q{2021-02-10}
  s.summary        = 'Consume hackernews content (stories, comments, etc)'
  s.description    = "Consume heckernews content through the use of their API"
  s.email          = 'varoboss.ap@gmail.com'
  s.files          = ['README', 'lib/hack3rnews.rb', 'spec/hack3rnews_spec.rb']
  s.homepage       = 'https://github.com/ese-varo'
  s.licens         = 'MIT'
  s.add_dependency = 'rest-client'
  s.add_dependency = 'json'
end

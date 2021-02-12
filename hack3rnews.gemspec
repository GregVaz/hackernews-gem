Gem::Specification.new do |s|
  s.name           = "hack3rnews"
  s.version        = "0.0.2"
  s.authors        = ["Alvaro Padilla"]
  s.date           = %q{2021-02-10}
  s.summary        = 'Consume hackernews content (stories, comments, etc)'
  s.description    = "Consume heckernews content through the use of their API"
  s.email          = 'varoboss.ap@gmail.com'
  s.files          = ['README.md', 'lib/hack3rnews.rb', 'lib/hack3rnews/request.rb', 'spec/hack3rnews_spec.rb']
  s.homepage       = 'https://github.com/GregVaz/hackernews-gem'
  s.license        = 'MIT'
  s.add_dependency('rest-client', '>= 2.1')
  s.add_development_dependency('rspec', '~> 3.0')
end

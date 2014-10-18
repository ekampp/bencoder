Gem::Specification.new do |s|
  s.name        = 'bencoder'
  s.version     = '0.0.3'
  s.date        = '2014-10-18'
  s.summary     = 'Bittorrent encoding'
  s.description = 'Minimalistic BEncoding gem'
  s.authors     = ['Kasper Holbek Jensen']
  s.email       = 'kholbekj@gmail.com'
  s.files       =  Dir['Rakefile', '{lib,test}/**/*', 'README*']
  s.homepage    = 'https://github.com/kholbekj/bencoder'
  s.license     = 'MIT'
  s.add_development_dependency 'Minitest', '~> 5.4', '>= 5.4.0'
end 

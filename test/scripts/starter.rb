# encoding: utf-8


puts "[debug] self.class.name #{self.class.name}"

name = "check setting local variable name"
puts "[debug] #{name}"

puts "pp self:"
pp self


###############################################
# Mr. Hyde's Quick Start Static Site Script

say "Welcome, before setting up your site Mr. Hyde will ask you some questions."

title = ask "What's your site's title", "Your Site Title"

name  = ask "What's your name", "Henry Jekyll"

say "Thanks! Ready-to-go. Stand back."

install_theme "Starter"

config do |c|
  c.title        = title
  c.author.name  = name

  c.mrhyde.last_updated = Time.now
  c.mrhyde.title        = title
  c.mrhyde.name         = name
end

say "Done."


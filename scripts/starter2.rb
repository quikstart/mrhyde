# encoding: utf-8

###############################################
# Mr. Hyde's Quick Start Static Site Script

say "Welcome, before setting up your site Mr. Hyde will ask you some questions."

title = ask "What's your site's title", "Your Site Title"

url   = ask "What's your site's address (url)", "http://yoursite.com"

name  = ask "What's your name", "Henry Jekyll"

theme = select "Select your theme", ["Starter", "Bootstrap", "Minimal"]

say "Thanks! Ready-to-go. Stand back."

install_theme theme

config do |c|
  c.title        = title
  c.url          = url
  c.author.name  = name

  c.mrhyde.last_updated = Time.now
  c.mrhyde.title        = title
  c.mrhyde.name         = name
  c.mrhyde.theme        = theme
  c.mrhyde.url          = url
end

say "Done."

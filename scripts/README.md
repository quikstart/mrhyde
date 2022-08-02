# Mr. Hyde's Scripts - Add Your Script!


## Usage

Type in your shell:

```
$ mrhyde new starter
```

Resulting in:

```
Welcome, before setting up your site Mr. Hyde will ask you some questions.

Q: What's your site's title? [Your Site Title]:  Another Beautiful Static Site
Q: What's your name? [Henry Jekyll]: Edward Hyde
Q: Select your theme:
    1 - Starter
    2 - Bootstrap
    3 - Minimal
   Your choice (1-3)? [1]: 2 

Thanks! Ready-to-go. Stand back.

  Downloading Henry's Bootstrap Theme...
  Setting up Henry's Bootstrap Theme..
  ...
  Updating settings in _config.yml...
    title: "Another Beautiful Static Site"
    author.name: "Edward Hyde"
  ...
Done.
```

That's it. Now use:

```
$ cd starter
$ jekyll serve
```

And open up your new static site in your browser.



## Write Your Own Mr Hyde Script


Example - `starter.rb`:

```ruby
###############################################
# Mr. Hyde's Quick Start Static Site Script

say "Welcome, before setting up your site Mr. Hyde will ask you some questions."

title = ask "What's your site's title", "Your Site Title"

name  = ask "What's your name", "Henry Jekyll"

theme = select "Select your theme", ["Starter", "Bootstrap", "Minimal"]

say "Thanks! Ready-to-go. Stand back."

install_theme theme

config do |c|
  c.title        = title
  c.author.name  = name
  
  c.mrhyde.last_updated = Time.now
  c.mrhyde.title        = title
  c.mrhyde.name         = name
  c.mrhyde.theme        = theme
end

say "Done."
```


### Mini Language Reference


#### say( text )

```ruby
say( "Welcome" )
```

#### ask(question, [default])

```ruby
title = ask( "What do you want to call your site" )
```

#### yes?(question, [default]) or no?(question, [default])

```ruby
puts "yes, sir"   if yes?( "Add analytics" )
```

#### select( title, choices, [default] )

```ruby
theme = select( "Select your theme", ["Starter", "Bootstrap", "Minimal"] )
```

#### install_theme( key | title )

download and setup (unzip/unpack) theme

```ruby
install_theme( 'starter' )
```


#### config block

update _config.yml settings

```ruby
config do |c|
  c.title        = "Your Site Title"
  c.author.name  = "Your Name"
  c.author.email = "henry@example.com"
      
  c.mrhyde.title        = title
  c.mrhyde.last_updated = Time.now
end
```



## Meta


**Questions? Comments?**

Post them to the [wwwmake forum](http://groups.google.com/group/wwwmake). Thanks!


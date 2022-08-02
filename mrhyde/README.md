# mrh/mrhyde - static site quick starter script wizard

jekyll command line tool

* home  :: [github.com/mrhydescripts/mrhyde](https://github.com/mrhydescripts/mrhyde)
* bugs  :: [github.com/mrhydescripts/mrhyde/issues](https://github.com/mrhydescripts/mrhyde/issues)
* gem   :: [rubygems.org/gems/mrhyde-tools](https://rubygems.org/gems/mrhyde-tools)
* rdoc  :: [rubydoc.info/gems/mrhyde-tools](http://rubydoc.info/gems/mrhyde-tools)
* forum :: [wwwmake](http://groups.google.com/group/wwwmake)


## Usage

The mrhyde-tools gem includes a command line tool that lets you
run static site quick starter scripts. Try:

```
$ mrhyde --help      # or
$ mrh -h
```

Resulting in:

```
NAME
    mrh/mrhyde - jekyll command line tool .:. the static site quick starter script wizard

SYNOPSIS
    mrhyde [global options] command [command options] [arguments...]

VERSION
    0.1.0

GLOBAL OPTIONS
    --help            - Show this message
    --test, --dry_run - (Debug) Dry run; run script in simulation for testing
    --verbose         - (Debug) Show debug messages
    --version         - Display the program version

COMMANDS
    new, n - Run static site quick starter script

    help   - Shows a list of commands or help for one command
    test   - (Debug) Test command suite
```


### Commands

[New Wizard](#new-wizard-command---new-n)

#### New Wizard Command - `new`, `n`

To run a static site quick starter wizard script
to download and install (unzip/unpack) a theme archive and configure
a static site ready-to-use. Try:


```
$ mrhyde new starter    # or
$ mrhyde n starter      # or
$ mrh n starter
```

This will download the `starter.rb` wizard script
from the [Mr. Hyde's Scripts](https://github.com/mrhydescripts/scripts) repo
and run through all steps e.g.:

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



**More Quick Starter Wizard Scripts**

See the [Mr. Hyde's Scripts](https://github.com/mrhydescripts/scripts) library.


**More Themes**

See the [Dr. Jekyll's Themes](https://drjekyllthemes.github.io) directory.



## Install

Just install the gem:

    $ gem install mrhyde-tools


## License

The `mrhyde` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the [wwwmake forum](http://groups.google.com/group/wwwmake).
Thanks!


# Alfred Freshbooks

An experimental [Alfred][] Workflow for quickly visiting [Freshbooks][].

# Ruby Version

This workflow expects there to be bash script in your home directory that will
do whatever form of ruby version management you are partial to. This can be
rvm, rbenv, chruby, direct $PATH manipulation, or other. In my case, I use
rbenv, so I have added the rbenv init code to the file:

``` bash
# ~/.ruby-version-shim
eval "$(rbenv init - --no-rehash)"
```

Create this file and alter this as needed to make use of your preferred Ruby version system.

# Gemfile

The repo contains a gemfile with the dependencies. Run `bundle install` to
install the needed gems. Make sure to do this with the default ruby specified
by the `~/.ruby-version-shim` file.

# Credentials

Alfred Freshbooks expects credentials be exposed in a `~/.env` file. The file
should have the following structure / keys:

``` env
FRESHBOOKS_URL=whatever.freshbooks.com
FRESHBOOKS_TOKEN=YOURTOKEN
```

# Usage

This workflow provides two pieces:

- A caching script `cache-freshbooks`
- A script filter to prompt / open clients

The clients must be cached before the filter / opening can happen.

[Alfred]: http://www.alfredapp.com/
[Freshbooks]: http://www.freshbooks.com/

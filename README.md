# Capistrano::Bedrock

## THIS PROJECT IS NOT MAINTAINED ANYMORE, see [valentinocossar/trellis-database-and-uploads-migration](https://github.com/valentinocossar/trellis-database-and-uploads-migration)

**This project is based on [bedrock-capistrano](https://github.com/roots/bedrock-capistrano) and works only with Trellis and Bedrock.**

These are the Capistrano configs for deploying uploads and database with [Bedrock](https://github.com/roots/bedrock) using [capistrano-trellis-bedrock-wpcli](https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli).

## Requirements

* Ruby >= 2.0

Required Gems:

* `capistrano` (~> 3.6.0)
* `capistrano-trellis-bedrock-wpcli` (~> 1.0.0)

These can be installed manually with `gem install <gem name>` but it's highly suggested you use [Bundler](http://bundler.io/) to manage them. Bundler is basically the Ruby equivalent to PHP's Composer. Just as Composer manages your PHP packages/dependencies, Bundler manages your Ruby gems/dependencies. Bundler itself is a Gem and can be installed via `gem install bundler` (sudo may be required).

The `Gemfile` in the root of this repo specifies the required Gems (just like `composer.json`). Once you have Bundler installed, run `bundle install` to install the Gems in the `Gemfile`. When using Bundler, you'll need to prefix the `cap` command with `bundle exec` as seen below (this ensures you're not using system Gems which can cause conflicts).

## Installation

1. Download the latest release of [capistrano-bedrock](https://github.com/itsensoul/capistrano-bedrock/releases/latest).
2. Copy the following `capistrano-bedrock` files into the root of your Bedrock project:
  * `Capfile`
  * `Gemfile`
  * `Gemfile.lock`
  * `database.sh`
  * `uploads.sh`
  * `VERSION.md` (to know which version of `capistrano-bedrock` are you using)
3. Copy the content of `capistrano-bedrock .gitignore` file into the `.gitignore` file of your Bedrock project.
4. Copy the following `capistrano-bedrock` files/folders into your `config` directory:
  * `config/deploy/*`
  * `config/deploy.rb`
5. Run `gem install bundler -v "~>1.12.0" && bundle` into the root of your Bedrock project.
6. Edit your `config/deploy.rb` [configs](https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli#configurationanchor) to set the roles/servers and connection options.
7. Edit your `config/deploy/*` stage/environment [configs](https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli#configurationanchor) to set the specific roles/servers and connection options.
8. Enjoy `capistrano-trellis-bedrock-wpcli` [Tasks](#tasksanchor).

## Usage

<a name="tasksanchor"></a>
### Tasks

#### 1. Manage database

* `./database.sh staging/production push` or `bundle exec cap staging/production wpcli:db:push` - Pushes the local WordPress database to the remote server and replaces the urls (Optionally backs up the remote database before pushing, only if `wpcli_backup_db` is set to true, see [Configuration](https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli#configurationanchor))

* `./database.sh staging/production pull` or `bundle exec cap staging/production wpcli:db:pull` - Pulls the remote server WordPress database to local and replaces the urls (Optionally backs up the local database before pulling, only if `wpcli_backup_db` is set to true, see [Configuration](https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli#configurationanchor))

* `./database.sh staging/production backup` or `bundle exec cap staging/production wpcli:db:backup:remote` - Backs up remote staging/production database (uses `wpcli_local_db_backup_dir` to define the location of the export)

* `./database.sh development backup` or `bundle exec cap development wpcli:db:backup:local` - Backs up local vagrant database (uses `wpcli_local_db_backup_dir` to define the location of the export)

#### 2. Manage updates

* `./uploads.sh staging/production push` or `bundle exec cap staging/production wpcli:uploads:rsync:push` - Pushes the local uploads delta to remote machine using rsync.

* `./uploads.sh staging/production pull` or `bundle exec cap staging/production wpcli:uploads:rsync:pull` - Pulls the remote uploads delta to local machine using rsync.

## Contributing

1. Fork it (https://github.com/itsensoul/capistrano-bedrock/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

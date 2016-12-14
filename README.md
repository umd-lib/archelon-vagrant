# fcrepo-search-vagrant

Vagrant box for running fcrepo-search rails app.

## Prerequisites
### fcrepo-vagrant 
The fcrepo-search app depends on a solr service for functioning. Use the 
[fcrepo-vagrant][1] to bring up a solr instance.

The [fcrepo-search.env](files/fcrepo-search.env) is already configured to
point to the IP address of the solr vm included in the fcrepo-vagrant. The
SOLR_URL property in this file can be changed to point to a different solr
server if necessary.

**Warning:** Without a working solr url, the fcrepo-search will not function.

### fcrepo-search 
The [fcrepo-search][2] repo will be automatically checked out onto the host machine, if the 
vagrant finds that the `/apps/git/fcrepo-search` directory does not exist when you 
run `vagrant up` 

## Usage

```
> git clone git@github.com:umd-lib/fcrepo-search-vagrant
> cd fcrepo-search-vagrant
> vagrant up
```

You should be able to access the fcrepo-search app at <http://192.168.44.14>.

## Details

Base box: [peichman-umd/ruby (1.0.0)][4] with:

* CentOS 7.0 64-bit
* RVM 1.26.11
* Ruby 2.2.4
* Rails 4.2.6

Installs the most recent version of [Phusion Passenger][5] (5.0.26 as of March
29, 2016). Configures Apache with mod_passenger to serve the Rails app found in
`/apps/services/fcrepo-search` on port 80.

Also [installs NodeJS and NPM][6], for compiling Javascript resources in Rails'
asset pipeline. This relieves the need for the Rails app to include "therubyracer"
or similar gems in its Gemfile.

[1]: https://github.com//umd-lib/fcrepo-vagrant
[2]: https://github.com//umd-lib/fcrepo-search
[4]: https://atlas.hashicorp.com/peichman-umd/boxes/ruby/versions/1.0.0
[5]: https://www.phusionpassenger.com/
[6]: https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/install_language_runtime.html#optional-install-node-js-if-you-re-using-rails

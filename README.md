# archelon-vagrant

Vagrant box for running the [Archelon](archelon) application.

## Prerequisites

### fcrepo-vagrant 
The fcrepo-search app depends on a solr service for functioning. Use the 
[fcrepo-vagrant] to bring up a solr instance.

The [archelon.env](files/archelon.env) is already configured to
point to the IP address of the Solr VM included in the fcrepo-vagrant. The
`SOLR_URL` property in this file can be changed to point to a different solr
server if necessary.

**Warning:** Without a working `SOLR_URL`, Archelon will not function.

### archleon
The [archelon] repo will be automatically checked out onto the host machine, if the 
vagrant finds that the `/apps/git/archelon` directory does not exist when you 
run `vagrant up`.

### archleon-env

The [archelon-env] repo will be automatically checked out onto the host machine, if the 
vagrant finds that the `/apps/git/archelon-env` directory does not exist when you 
run `vagrant up` 

## Usage

```
> git clone git@github.com:umd-lib/archelon-vagrant.git
> cd archelon-vagrant
> vagrant up
```

You should be able to access the Archelon app at <http://192.168.44.14>.

## Details

Base box: [peichman-umd/ruby (1.0.0)][4] with:

* CentOS 7.0 64-bit
* RVM 1.26.11
* Ruby 2.2.4
* Rails 4.2.6

Installs the most recent version of [Phusion Passenger][5] (5.0.26 as of March
29, 2016). Configures Apache with mod_passenger to serve the Rails app found in
`/apps/archelon/src` on port 80.

Also [installs NodeJS and NPM][6], for compiling Javascript resources in Rails'
asset pipeline. This relieves the need for the Rails app to include "therubyracer"
or similar gems in its Gemfile.

[fcrepo-vagrant]: https://github.com//umd-lib/fcrepo-vagrant
[archelon]: https://github.com//umd-lib/archelon
[archelon-env]: https://bitbucket.org/umd-lib/archelon-env
[4]: https://atlas.hashicorp.com/peichman-umd/boxes/ruby/versions/1.0.0
[5]: https://www.phusionpassenger.com/
[6]: https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/install_language_runtime.html#optional-install-node-js-if-you-re-using-rails

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (Apache 2.0).


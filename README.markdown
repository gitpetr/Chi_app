This is a web app for chirch.

**Setup (Development)**

------------------------------------------------------------------------------------------

1) Before installation make sure that you installed PostgreSQL and Imagemagik.

To install Imagemagik in Mac use homebrew:

  `$ brew install imagemagick`

2) In `config/` create `database.yml` from `database.example.yml`. Give a password in database.yml in test and development sections.

3) In `config/initializers/` create `secret_token.rb` from `secret_token.example.rb`

4) To lauch app:

```shell
$ cd app_name
$ bundle
$ rake db:create:all
$ rake db:migrate
$ rake db:seeds
$ rake db:test:prepare
```

5) After that, you should make sure that all tests pass:

```shell
$ rake spec
```

**Note:** There is known bug, that sometimes some tests just fall. Unfortunately, its impossible to find out, why. Just rerun tests and it should be enough for them to pass.

6) Create admin (login: qwerty@qwerty.com, password: qwerty):
  `$ rake db:create_admin`

7) Also you probably'd like to use .rvmrc file to set correct version. To use it you should do that:

```shell
 $ cd this_app
 $ rvm rvmrc trust DIR
```

**Setup (production)**

------------------------------------------------------------------------------------------

All things done on Ubuntu 12.04 LTS.

0) Create database manually on the server:

```shell
 $ ssh deployer@your_ip_here
 $ sudo -u postgres psql
 $ create database chirch_app_production owner postgres;
```

1) Install imagemagick on server:

```shell
 $ sudo apt-get install imagemagick
 $ sudo apt-get install libmagickwand-dev
```

2) Use [this screencast](http://railscasts.com/episodes/335-deploying-to-a-vps) to setup application.

2.1) To create separate user to deploy do this on server:

```shell
 $ groupadd admin
 $ adduser deployer --ingroup admin
```

3) On your server go to your app's **shared** folder (it generated automatically via capistrano). And create you folder to keep new images:

```shell
 $ mkdir uploads
```

Then give nessesary rights to created folder:

```shell
 $ sudo chmod 775 uploads
```

And on your local machine in config/deploy.rb:

```ruby
 task :symlink_config, roles: :app do
   ...
   run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
 end
```

and after this push git and deploy:

```shell
 $ git push
 $ cap deploy
```

4) Do not forget to change a secret key in `shared/config/initializers/secret_token.rb`

**Changelog**

------------------------------------------------------------------------------------------
* Sitemap generator. Edit `config/sitemap.rb` and then run `rake sitemap:refresh`.
* Albums with photos, Sermons.
* Slim migration. If you have troubles on production then you should just restart the whole server.
* Admin can upload multiple photos now.
* Now for capybara's js tests i use chrome browser. I added in `/spec/spec_helper.rb` that:

```ruby
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
```

And also in installed driver (not sure about that): `$ brew install chromedriver`

* Google map inetgration via `gmaps4rails` gem. After installation make sure that in `gmaps4rails.css.scss` you did that:

```css
.map_container {
  // ...
  max-width: 800px;
}

.gmaps4rails_map {
  // ...
  max-width: 800px;
}
```

* Contacts: show, edit, update.
* Slideshow starts when user clicks a photo.
* Uploading image has thumb version. Original resizes to 800x600 pixels.
* Photo: showing, uploading, editing, deleting. For uploading i use `carrierwave`.
* Article: showing, adding, updating, deleting.
* CanCan implemented.
* I implemented rich text editor via 'bootstrap-wysihtml5-rails'. [how to](https://github.com/Nerian/bootstrap-wysihtml5-rails)
* I created my own .rvmrc to use project-specific ruby (1.9.3-head now) and gemset (global). I did that:

    `$ rvm --rvmrc --create ruby-2.0.0-p0@chirchApp`

    Don't forget to run that in current project:

    `$ rvm rvmrc trust DIR`

    And then reload shell.
* User can't delete himself now. To enable this feature:
  1) Remove from routes.rb from:

    `devise_for :users, :skip => [:registrations]`

    that:

    `:skip => [:registrations]`

     OR add link (i enabled few featerus in routes).

  2) Add to app/views/devise/registrations/edit (or in other file):

     `
     %legend
       %h3=t(".cansel_acc_header")
     %p
       =t(".cansel_acc_text")
       #{link_to "Cansel your accaunt", registration_path(resource_name), :confirm => "Are you sure?", :method => :delete}
     `

* Added line to load script if it IE 8 or less.
* Now users can't register in system. To enable this feature:
  1) Remove from routes.rb from:

    `devise_for :users, :skip => [:registrations]`

    that:

    `:skip => [:registrations]`

    OR add link (i enabled few featerus in routes).

  2) From app/views/devise/shared/_links uncomment this:
    ` -#  %br/
      -#- if devise_mapping.registerable? && controller_name != 'registrations'
      -#  = link_to t(".sign_up_link"), new_registration_path(resource_name)`
* Devise views converted from .erb to .haml via [This link](https://github.com/plataformatec/devise/wiki/How-To%3a-Create-Haml-and-Slim-Views)
* I18n (English and Russian).
* Links added to login/logout.
* Show flash messages (which can be closed) and debug information (for developer only).
* Navbar now can be collapesed.
* Bootstrap integrated in the app via 'twitter-bootstrap-rails' gem.
* Haml integrated in the app.

# Refinery CMS Contacts

__Contacts engine for Refinery CMS.__

Attach contact form to any page with contact information

## Requirements

This version supports Rails 4.2.x and Refinery CMS ~> 3.0.0.

## Features

* create contact, contact has many email address
* contact can be attached to many pages
* rendering contact form with contact info ( optional )
* send email
* server side validation, client side validation ( optional )
* recaptcha
* email obfuscation in selectbox on frontend


## Screenshots

All screenshots are in [branch screenshots](https://github.com/Matho/refinerycms-contacts/tree/screenshots)

![Edit contact](https://raw.github.com/Matho/refinerycms-contacts/screenshots/0.1.x/01_edit_contact.png)
![Attach contact to page](https://raw.github.com/Matho/refinerycms-contacts/screenshots/0.1.x/03_attach_contact_to_page.png)
![Frontend show](https://raw.github.com/Matho/refinerycms-contacts/screenshots/0.1.x/06_frontend_client_side_validation.png)

## Language

Gem is translated to slovak and english.


## Installation
### Gem + migrations

Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'refinerycms-contacts', '~> 0.2.0'
```

Now, run

```ruby
bundle install
```

Next, to install run:

```ruby
 rails g refinery:contacts
```

Run database migrations:

```ruby
rake db:migrate
```

Seed your database:

```ruby
rake db:seed
```

Override PagesContoller to get strong params work

```ruby
rake refinery:override controller=admin/pages_controller
```

Open that file, find function permitted_page_params and append

```ruby
contact_page: [:contact_id,:contact_info]
```

### Assets + views

If you don't have Chosen JS included in your backend yet, append this code to your_app/config/initializers/refinery/core.rb

```ruby
 config.register_javascript "refinery/contacts/admin/jquery.chosen.min.js"
 config.register_stylesheet "refinery/contacts/admin/chosen.css"
```

To ``view/refinery/pages/show.html.erb`` add ``<%= render "/refinery/contacts/contacts/show" %>``

To your app stylesheet manifest add ``*= require refinery/contacts/contacts``
To your app javascript manifest add ``//= require refinery/contacts/contacts``

### reCaptcha

Register your reCaptcha code at http://www.google.com/recaptcha/whyrecaptcha and set-up it in ``config/initializers/recaptcha.rb``
If you want, add that initializer file to .gitignore or rewrite it to use ENV variables from gitignored YAML file

### Send mail testing

If you want to test mail sending in development I recommend to use gem letter_opener.
In ``app/config/environments/development.rb`` add these lines:

```ruby
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.raise_delivery_errors = true
```
If you have set-up ActionMailer::Base.smtp_settings block for development mode, comment it.

### Configure mailers

You can override mailer views from folder ``views/refinery/contacts/contact_mailer`` and edit.

### Client side validations

Client side validations gem is not installed by default by refinerycms-contacts gem! You need to install it:

Include ClientSideValidations in your Gemfile
```ruby
gem 'client_side_validations', '~> 3.2.1'
```

Then run the install generator
```ruby
rails g client_side_validations:install
```

This will install the initializer:
```
config/initializers/client_side_validations.rb
```
**ATTENTION!!!**

Because of [some issues](https://github.com/refinery/refinerycms/issues/961#issuecomment-4594545) we must
delete that initializer and write this code into file ``config/application.rb`` :
```ruby
config.to_prepare do
      ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
        unless html_tag =~ /^<label/
          %{<div class="field_with_errors">#{html_tag}<label for="#{instance.send(:tag_id)}" class="message">#{instance.error_message.first}</label></div>}.html_safe
        else
          %{<div class="field_with_errors">#{html_tag}</div>}.html_safe
        end
      end
    end
```

Add JS to your manifest:
```ruby
//= require rails.validations
```
In file ``config/initializers/refinery/contacts.rb `` set client_side_validations to true to don't show server-side validation error in errorExplanations div
```ruby
config.client_side_validations = true
```
### Precompile assets

Before production, don't forget to precompile assets by:

```ruby
rake assets:precompile
```

## Todo list

* add js pop-up in page's tab to allow create contact "in-place" instead of clicking through menu
* tests :(

## Code

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Matho/refinerycms-contacts)

## Known bugs

* WymEditor tab name don't show title in correct current_locale
* reCaptcha validation shows errors both for incorrect-captcha-sol and verification_failed key

## Testing
TODO

## License

Refinery CMS Contacts engine is released under the MIT license. Created by Martin Markech
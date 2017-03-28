# ruby
Ruby apps, tdd (rubydoctest, test/unit), gems (yaml, tty, artii, ...), oop and functional programming.

# Ruby debugging
ruby -rdebug atm.rb

# RSpec - Testing framework - where "R" = Ruby and "Spec" = "Specification"

+ Given some context
+ When some event occurs
+ Then I expect some outcome
+ Given ... When ... Then ...

RSpec uses a DSL (Domain Specific Language)
RSpec can be used to test Ruby and Rails applications.

User stories:
+ Description of the experience of a user of our software
+ Describe our goals
+ Excellent planning tool
+ Excellent communication tool with developers
+ Excellent communication tool with clients
+ Describes a single step in the user experience
  + Given... When... Then...

Example User Story #1
+ <b>Given</b> that a user is not logged in
+ <b>When</b> the user visits the login page
+ <b>Then</b> the user should see form fields for username and password and a submit button

Example User Story #2 - The "happy path"
+ <b>Given</b> that a user is not logged in
+ <b>When</b> the user enters a valid username and password and submits the form
+ <b>Then</b> the site should redirect them to an appropriate user page

Example User Story #3 - The "unhappy path"
+ <b>Given</b> that a user is not logged in
+ <b>When</b> the user enters a valid username and an invalid password and submits the form
+ <b>Then</b> the site should return a generic "not valid" error message and re-display the login form along with a "I am not a robot" field to prevent spamming

Example User Story #4 - The "unhappy path"
+ <b>Given</b> that a user is not logged in
+ <b>When</b> the user enters a an invalid username and a valid password and submits the form
+ <b>Then</b> the site should return a generic "not valid" error message and re-display the login form along with a "I am not a robot" field to prevent spamming

Example User Story #5 - Edge case (invalid credit card number or other missing or invalid fields)
+ <b>Given</b> that a user is not logged in and is viewing the login form
+ <b>When</b> the user leaves the form's username field blank and submits the form
+ <b>Then</b> the site should return a "username is cannot be blank" error message and re-display the login form

General Test Advice
+ Test should always be maintained and provide good coverage
+ Keep test suite fast so that you can run it more frequently
+ Make sure all tests pass before a commit is performed
+ Avoid brittle - tightly coupled tests - i.e. based on features not on implementation.

# Installing RSpec
Need [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Gems](https://rubygems.org/) installed for [RSpec](https://github.com/rspec/rspec).
```
$ ruby -v
ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin15]
$ gem -v
2.6.11
$ gem install rspec
rspec -v
3.5.4
$ rspec -h  # to display help
$ gem list  # list of gems installed
$ gem update rspec
$ rbenv rehash  # ruby env manager
```

# RSpec configurations:
+ --no-color (by default), <b>--color</b> (or -c for short)
+ --format progress (by default), --format documentation (or -f d for short)
+ --no-profile (by default), --profile (or -p)
+ --no-fail-fast (by default), --fail-fast
+ --order defined (by default), --order random
+ specify default configurations in (in order of precidence)
  + Global: ~/.rspec (example .rspec file contents below:)
  ```
  --color
  ```
  + Project specific (in version control): ./.rspec
  + Local (not in version control): ./.rspec-local
  + Command line
  + Inside RSpec code not recommend.


# Using RSpec
+ [(RSpec cheat sheet)](http://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/)
```
$ mkdir cat_project
$ cd !$
$ mkdir spec
$ mkdir lib
$ rspec --init
create   .rspec
create   spec/spec_helper.rb
$ touch spec/cat_spec.rb
$ touch lib/cat.rb
$ rspec
```
```
  Ruby Project Directory Structure:
    + cat_project
      + lib
        - cat.rb
      + spec
        - cat_spec.rb
      .rspec              # Ruby 
      init.rb             # Main Ruby program
```

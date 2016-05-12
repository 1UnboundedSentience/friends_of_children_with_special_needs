This app can be used to aid the online workflow for FCSN organization: coordinate and simplify the registration process, sign up for classes, etc. 

## Getting Set Up
The site is built with [Ruby](https://www.ruby-lang.org) on [Rails](http://rubyonrails.org/). Follow these steps to get it running on your local machine:

##### Install software

* If you need to install Ruby, instructions can be found on the [Ruby download page](https://www.ruby-lang.org/en/downloads/). Install the version matching .ruby-version
* If you need to install Bundler, run `gem install bundler`
* Clone the [github repo](git@github.com:bamohan/friends_of_children_with_special_needs.git)
* `cd` into the project folder and run `bundle install`

##### Populating the database and running the site
* Run `rake db:create`, `rake db:migrate` and `rake db:seed`.
* To load the server, run `rails s`.
* run `rake test` to run tests
* Navigate to `localhost:3000`. To login to admin, use `coodinator@fcsn.org`, PW: `testing123`.
  To login as parent, use `parent@fcsn.org` PW: `testing123`

#### Troubleshooting

## Contributing to the project
* Forms are checked in under the [`forms`](https://github.com/bamohan/friends_of_children_with_special_needs/tree/master/forms/classes) directory
* Assign yourself to an issue
* Create a branch using the convention `[issue-number]-issue-description`. 'Example: 34-code-climate-issues'
* Make code changes including necessary tests
* Make incremental commits to make it easier to review PRs
* Include `[#issue_number]` in the commit message so it links the commit to the issue.
  * example: '[#34] Fix Codeclimate issues '
* Create a PR, post the PR in the #rubyonrails slack channel and have it reviewed
* Once you have :+1: :ship-it: or any words indicating your PR is good to be merged, merge it to master
* Run tests: 'rake test`
* If all tests pass, push the changes to master

### Creating Issues on Github
* Create new issues and tag them as Bugs or Feature. Provide as much information as possible.

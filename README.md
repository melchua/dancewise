# Dancewise: Aka wheretofuckingdance

[wheretofuckingdance.com](https://www.wheretofuckingdance.com/)

## Install

### Clone the repository

```shell
git clone git@github.com:melchua/dancewise.git
cd dancewise
```

### Check your Ruby version

```shell
rbenv version
```

The ouput should start with something like `3.0.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
brew install rbenv
```

```shell
rbenv install 3.0.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

None for now

### Initialize the database

```shell
rails db:create db:migrate
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a dancewise
heroku git:remote --remote heroku-staging -a dancewise-staging
```

## Serve

```shell
rails s
```

## Process for merging into master

Branch protection has been setup on the master branch. So you should never be able to
merge a branch into master (remote - on GitHub) without an approved pull request (PR).

You should also not be able to (and should not) push to master directly from your dev environment.
ie. `git push master`

The process to implement a new feature in the code is:

0. Make sure you are have the most up-to-date master branch
```shell
git checkout master
git pull
```

1. Create a new branch locally

```shell
git checkout -b your-feature-branch-name
```

2. Stage and commit files in to your local branch

```shell
git add .
git status
git commit -m "One liner description of what your branch has added to the codebase"
```

3. Push your branch to GitHub

```shell
git push
```

4. Go the GitHub repository, create a new [Pull Request](https://github.com/melchua/dancewise/pulls) for your branch to merge into master

5. Write a description in your pull request, request a reviewer, and save the pull request

## Deploy

### With Heroku pipeline (recommended)

### NOTE: THIS HAS NOT BEEN SETUP YET. THIS WILL NOT WORK. WE WILL INSTEAD PUSH TO PRODUCTION USING THE LAST SECTION, BUT WE WILL NEED TO BE VERY CAREFUL WHEN DOING THIS

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku master
heroku run rails db:migrate
```

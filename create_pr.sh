require 'octokit'

title = "title test"
body  = 'body test'

client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
client.create_pull_request(
  'krossblack777/test-bot',
  'master',
  ENV['BRANCH'],
  title,
  body
)

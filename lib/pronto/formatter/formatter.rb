module Pronto
  module Formatter
    def self.get(names)
      names ||= 'text'
      Array(names).map { |name| FORMATTERS[name.to_s] || TextFormatter }
        .uniq.map(&:new)
    end

    def self.names
      FORMATTERS.keys
    end

    FORMATTERS = {
      'bitbucket' => BitbucketFormatter,
      'bitbucket_pr' => BitbucketPullRequestFormatter,
      'bitbucket_server_pr' => BitbucketServerPullRequestFormatter,
      'codeclimate' => CodeclimateFormatter,
      'checkstyle' => CheckstyleFormatter,
      'github' => GithubFormatter,
      'github_pr' => GithubPullRequestFormatter,
      'github_pr_review' => GithubPullRequestReviewFormatter,
      'github_status' => GithubStatusFormatter,
      'gitlab' => GitlabFormatter,
      'json' => JsonFormatter,
      'null' => NullFormatter,
      'text' => TextFormatter,
    }.freeze
  end
end

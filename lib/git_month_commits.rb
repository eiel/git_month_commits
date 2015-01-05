require "git_month_commits/version"
require 'rugged'
require 'active_support/all'

class GitMonthCommits
  attr_writer :time

  def github_url
    repo_url = repo.config["remote.origin.url"]
    raise "not found remote.origin.url" if repo_url.nil?

    if match = repo_url.match(/git@github.com:(.*).git/)
      url = "https://github.com/#{match[1]}/compare/"
    end
    url + compare
  end

  def compare
    since = nil
    untill = nil
    repo.walk(repo.last_commit).each do |commit|
      untill = commit if untill.nil? && commit.time < until_time
      break if commit.time < since_time
      since = commit
    end
    "#{since.oid}...#{untill.oid}"
  end

  def since_time
    time.last_month.beginning_of_month
  end

  def until_time
    time.last_month.end_of_month
  end

  def time
    @time ||= Time.new
  end

  def repo
    @repo ||= Rugged::Repository.discover(".")
  end
end

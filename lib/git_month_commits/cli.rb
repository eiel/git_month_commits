require 'git_month_commits'

class GitMonthCommits::CLI
  def open
    require 'launchy'
    Launchy.open commits.github_url
  end

  def log
    system("git log #{commits.compare}")
  end

  private

  def commits
    @commits ||= GitMonthCommits.new
  end
end

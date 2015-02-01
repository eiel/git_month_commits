$LOAD_PATH << File.join(File.dirname(__FILE__),"..","lib")

require 'git_month_commits'

RSpec.describe GitMonthCommits do
  describe '#github_url' do
    let(:commits) { GitMonthCommits.new }
    subject { commits.github_url }

    before(:each) do
      Dir.chdir(".")
    end

    context "when 2015-02-02" do
      before(:each) do
        commits.time = Time.new(2015,2,2)
      end

      let(:compare_url) { "https://github.com/eiel/git_month_commits/compare/"}
      let(:since) { "aeb2c16116dc6c38fd2c81a1b6958b40e935b28d" }
      let(:untill) { "e7211879259049ad0941b9788028cdf3cf24d228" }

      it { is_expected.to eq("#{compare_url}#{since}...#{untill}") }

    end
  end
end

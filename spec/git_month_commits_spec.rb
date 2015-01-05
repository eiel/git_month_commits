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
      let(:since) { "e13422ceb12ed87346a7c760e5db8c9c5466b572" }
      let(:untill) { "e13422ceb12ed87346a7c760e5db8c9c5466b572" }

      it { is_expected.to eq("#{compare_url}#{since}...#{untill}") }

    end
  end
end

# encoding: utf-8
require "rake"

describe 'Test Rake Forsquare Tasks' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require("sq", ["./lib/tasks"])
    Rake::Task.define_task(:environment)
  end

  context "venueが実行された場合" do
    before do
      @rake["sq:venue"].execute
    end
    it "venue should be xxxx"
  end
end

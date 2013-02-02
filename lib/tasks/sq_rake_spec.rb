# encoding: utf-8
describe 'Test Rake Forsquare Tasks' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require("sq", ["#{Rails.root}/lib/tasks"])
    Rake::Task.define_task(:environment)
  end

  context "venueが実行された場合" do
    before do
      @rake["sq:venue"].execute
    end
    it "response code shuould be 200" do
      puts @venues[response]
    end
  end
end

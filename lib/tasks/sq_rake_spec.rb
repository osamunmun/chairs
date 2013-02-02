# encoding: utf-8
require "rake"
require File.expand_path(File.dirname(__FILE__) + "/../../spec/spec_helper.rb")

describe 'Test Rake Forsquare Tasks' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require("sq", ["./lib/tasks"])
    Rake::Task.define_task(:environment)
  end

  context "venueが実行された場合" do
    before do
      @expected = Cafe.all
      @rake["sq:venue"].execute
    end
    it "venue should be updated" do 
      @expected.each{|cafe|
        cafe['updated_at'] != Cafe.find_by_id(cafe['id'])['updated']
      }
    end
  end
end

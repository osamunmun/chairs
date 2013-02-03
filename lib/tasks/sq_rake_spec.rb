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
  context "herenowが実行された場合" do
    before do
      @expected = Hash.new
      venue_ids = Cafe.all
      venue_ids.each{|venue|
        @expected["#{venue['venue_id']}"] = venue['updated_at']
      }
      @rake["sq:venue"].execute
    end
    it "venue should be updated" do 
      @expected.each{|updated|
        updated['updated_at'] != Herenow.find_by_venue_id(updated.key)['updated_at']
      }
    end
  end
end

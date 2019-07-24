require 'rails_helper'
require 'pry'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Note, :type => :model do
  describe '#search' do
    let(:search_term) { 'SearchTerm' }
    let(:note_match_count) { 50 }

    before(:each) do
      folder_level_count = rand(15..40)
      top_dir = create(:directory)
      while(folder_level_count >= 0)
        top_dir = create(:directory, parent_id: top_dir.id)
        folder_level_count -= 1
      end

      @matched_directory = Directory.last
      FactoryBot.create_list(:note, note_match_count, directory_id: @matched_directory.id, name: search_term)
      @result = Note.search(search_term)
    end

    context 'valid' do
      it "returns all matched notes" do
        expect(@result.count).to eq(note_match_count)
      end
      it "returns correct directory" do
        expect(@result.map(&:directory_id).all?{|id| id == @matched_directory.id}).to eq(true)
      end
      it "returns directory file paths" do
        expect(@result.map{|n| n.directory.full_path }.any?{|path| path == @matched_directory.full_path}).to eq(true)
      end
    end
  end
end
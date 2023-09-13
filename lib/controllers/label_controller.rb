require 'json'
require_relative '../classes/label'
require_relative '../helpers/list_manager'

class LabelController < ListManager
  attr_accessor :labels

  def initialize
    super
    @labels = []
  end

  def list_all_labels
    label_data = File.exist?('./lib/data/labels.json') ? JSON.parse(File.read('./lib/data/labels.json')) : []

    label_data.each do |label|
      @labels << Label.new(label['id'], label['title'], label['color'])
    end

    @labels.each_with_index do |label, index|
      puts "#{label.id} - #{label.title}"
    end
  end
end
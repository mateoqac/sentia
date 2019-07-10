class User < ApplicationRecord
  require 'csv'
  
  validates :name, :number, :date, :description, presence: true
  validates_uniqueness_of :name, scope: :number

  def self.import(file)
    transaction do
      CSV.foreach(file.path, headers: true) do |row|
        begin
          u = User.new
          u.date = row.to_hash['date'].to_date unless row.to_hash['date'].nil?
          u.name = row.to_hash['name'] unless row.to_hash['name'].nil?
          u.number = row.to_hash['number'].to_i unless row.to_hash['number'].nil?
          u.description = row.to_hash['description'] unless row.to_hash['description'].nil?
          u.save!
        rescue 
          puts "The following row has some fields invalid #{row.to_hash}"
        end
      end
    end
  end
end

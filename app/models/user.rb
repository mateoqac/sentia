class User < ApplicationRecord
  require 'csv'

  def self.import(file)
    transaction do
      CSV.foreach(file.path, headers: true) do |row|
          u = User.new
          u.date = row.to_hash['date'].to_date
          u.name = row.to_hash['name']
          u.number = row.to_hash['number'].to_i
          u.description = row.to_hash['name']
          u.save!
      end
    end
  end
end

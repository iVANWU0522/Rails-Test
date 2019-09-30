class Person < ApplicationRecord
  belongs_to :location
  belongs_to :affiliation
  validates :first_name, presence: true
  validates :location_id, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :affiliation_id, presence: true
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      names = row[0].split(" ")
      if row[4].nil?
        return
      end
      if Location.find_by_name(row[1])
        l_id = Location.find_by_name(row[1]).id
      else
        l = Location.create!({
          name: row[1].capitalize
        })
        l_id = l.id
      end
      if Affiliation.find_by_name(row[4])
        a_id = Affiliation.find_by_name(row[4]).id
      else
        a = Affiliation.create!({
          name: row[4]
        })
        a_id = a.id
      end
      Person.create!({
        first_name: names[0].capitalize,
        last_name: names[1]&.capitalize,
        location_id: l_id,
        species: row[2],
        gender: row[3],
        affiliation_id: a_id,
        weapon: row[5],
        vehicle: row[6]

      })
    end
  end

end

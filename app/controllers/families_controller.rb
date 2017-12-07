class FamiliesController < ApplicationController
  include FamiliesHelper

  def index
    @members = Member.all

    latest_gathering = Gathering.last
    if latest_gathering != nil
      latest_families = latest_gathering.families
      @families = Family.where(id: latest_families)
    end
  end

  def generate_families
    member_ids = Member.all.pluck(:id)

    # shuffle the list of ids and then split into families - we want
    # families be as even as possible, so we check if they're equally divisble
    # if not, we split into families of 3 and carry the remainder into another
    if divisible_by_four?(member_ids.length)
      fams = member_ids.shuffle.each_slice(4).to_a
    elsif divisible_by_five?(member_ids.length)
      fams = member_ids.shuffle.each_slice(5).to_a
    else
      fams = member_ids.shuffle.each_slice(3).to_a
    end

    outlier = fams.last
    if outlier != nil && outlier.length < 3
      outlier.each do |o|
        fams.first << o
      end
      fams = fams - fams.pop(1)
    end

    gathering = Gathering.new

    fams.each do |fam|
      family = Family.new
      fam.each do |member_id|
        m = Member.find(member_id)
        family.members << m.name
      end

      family.save!
      gathering.families << family.id
    end

    gathering.save!

    redirect_to families_path
  end
end

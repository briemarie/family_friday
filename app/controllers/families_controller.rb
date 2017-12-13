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
    divider = divisible_by(member_ids.length)
    member_groups = member_ids.shuffle.each_slice(divider).to_a

    outlier = member_groups.last
    if !outlier.nil? && outlier.length < 3
      member_groups.first << outlier.first
      if !outlier.second.nil?
        member_groups.second << outlier.second
      end
      member_groups.pop(1)
    end

    gathering = Gathering.new

    member_groups.each do |group|
      family = Family.new
      group.each do |member_id|
        member = Member.find(member_id)
        family.members << member.name
      end

      family.save!
      gathering.families << family.id
    end

    gathering.save!

    redirect_to families_path
  end
end

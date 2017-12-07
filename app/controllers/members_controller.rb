class MembersController < ApplicationController
  def index
    @members = Member.all.order(:name)
  end

  def create
    @member = Member.create(member_params)

    if @member.save
      redirect_to members_path
    end
  end

  def new
    @member = Member.new()
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end

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

  def update
    member = Member.find(params[:id])
    member.update_attribute(:present, params[:present])
    member.save

    puts "4678356923"
    puts params[:present]

    redirect_to members_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :present)
  end
end

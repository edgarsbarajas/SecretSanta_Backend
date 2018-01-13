class FamilyController < ApplicationController
  def show
    fam = Family.find(params[:id]).persons
    fam = fam.map do |person|
      person = person.as_json
    end

    fam.each do |d|
      d['gift_ideas'] = GiftIdea.where(person_id: d['id']).pluck(:gift_idea)
    end

    render json: fam.to_a
  end
end

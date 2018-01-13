class PeopleController < ApplicationController
  def create
    names = params["names"]
    phone_numbers = params["phoneNumbers"]

    if !names.include?("") && !phone_numbers.include?("")
      new_family = Family.create()

      names.each_with_index do |person, index|
        new_family.persons.create(name: person, phone_number: phone_numbers[index], creator: index == 0 ? true : false, chosen: false, password: Faker::Number.number(3))
      end

      new_family.assignGiftees()
      new_family.sendMessages()

      render json: {family_id: new_family.id}
    else
      render json: {status: "Error", message: "Name or phone numbers cannot be blank"}
    end
  end

  def update
    params[:giftIdeas].each do |gift|
      GiftIdea.create(gift_idea: gift, person_id: params[:id])
    end
  end
end

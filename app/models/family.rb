class Family < ApplicationRecord
  has_many :persons

  def assignGiftees
    persons = self.persons

    persons.each do |person|
      until person.giftee_id
        randomFamilyMember = persons.find(persons.pluck(:id).sample)

        if !randomFamilyMember.chosen && randomFamilyMember.id != person.id
          person.update(giftee_id: randomFamilyMember.id)
          randomFamilyMember.update(chosen: true)
        end
      end
    end
  end # end of def assignGiftees

  def sendMessages
    account_sid = 'ACcadef504f050d32a61aa43b3f3d939da'
    auth_token = ENV['TWILIO_AUTH']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = '+14159664302'

    participants = {}

    self.persons.each do |person|
      participants["+1#{person.phone_number}"] = {name: person.name, password: person.password}
    end

    # Example:
    # friends = {
    #   '+19255863672' => 'Edgar Barajas'
    # }

    participants.each do |key, value|
      client.messages.create(
        from: from,
        to: key,
        body: "Hey #{value[:name]}, welcome to Secret Santa!\nVisit http://secret-santa-plus.herokuapp.com/family/#{self.id} to reveal the person you'll be buying a gift for this year, and to fill out your gift suggestions form!\n\nYour password is: #{value[:password]}\n\nHappy Holidays! :)"
      )
    end
  end
end

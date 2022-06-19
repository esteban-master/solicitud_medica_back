class NewProfessionalOrPatientServices
  def self.new_entity(params)
    name = params[:name]
    tax_number = params[:tax_number]
    photo = params[:photo]
    address = params[:address]
    uid = params[:uid]
    phone = params[:phone]
    age = params[:age]

    if Entity.find_by(uid: uid).blank?
      new_entity =  Entity.new(
        name: name,
        tax_number: tax_number,
        photo: photo,
        address: address,
        uid: uid,
        phone: phone,
        age: age
      )
      { new_entity: new_entity, error: nil }
    else
      { new_entity: nil, error: 'Ya existe un usuario creado con ese uid' }
    end
  end

  def self.new(params, model)
    entity = new_entity(params)
    profession_id = params[:professionId] ? params[:professionId] : nil
    new = nil
    if entity[:error].blank?
      if model == 'professional'
        new = HealthProfessional.new(
          profession_id: profession_id
        )
      else
        new = Patient.new
      end

      ActiveRecord::Base.transaction do
        entity[:new_entity].save
        new.entity = entity[:new_entity]
        new.save
        if model == 'professional'
          entity[:new_entity].update(health_professional_id: new.id)
        else
          entity[:new_entity].update(patient_id: new.id)
        end
      end

      { new: new, error: nil }
    else
      { new: nil, error: entity[:error] }
    end
  end
end
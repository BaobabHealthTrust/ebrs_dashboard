require 'couchrest_model'

class Child < CouchRest::Model::Base

  before_save NameCodes.new("first_name")

  before_save NameCodes.new("last_name")

  before_save NameCodes.new("first_name", "mother")

  before_save NameCodes.new("last_name", "mother")

  before_save NameCodes.new("first_name", "father")

  before_save NameCodes.new("last_name", "father")

  before_save NameCodes.new("first_name", "informant")

  before_save NameCodes.new("last_name", "informant")

  before_save      RecordState.new("record_status")
  after_save       RecordState.new("record_status")

  before_save      RecordState.new("request_status")
  after_save       RecordState.new("request_status")

  before_save      RecordState.new("facility_code")
  after_save       RecordState.new("facility_code")

  before_save      RecordState.new("district_code")
  after_save       RecordState.new("district_code")

  # before_save      EncryptionWrapper.new("district_id_number")
  # after_save       EncryptionWrapper.new("district_id_number")
  # after_initialize EncryptionWrapper.new("district_id_number")


  before_save      EncryptionWrapper.new("first_name")
  after_save       EncryptionWrapper.new("first_name")
  after_initialize EncryptionWrapper.new("first_name")

  before_save      EncryptionWrapper.new("middle_name")
  after_save       EncryptionWrapper.new("middle_name")
  after_initialize EncryptionWrapper.new("middle_name")

  before_save      EncryptionWrapper.new("last_name")
  after_save       EncryptionWrapper.new("last_name")
  after_initialize EncryptionWrapper.new("last_name")


  before_save      EncryptionWrapper.new("first_name", "mother")
  after_save       EncryptionWrapper.new("first_name", "mother")
  after_initialize EncryptionWrapper.new("first_name", "mother")

  before_save      EncryptionWrapper.new("middle_name", "mother")
  after_save       EncryptionWrapper.new("middle_name", "mother")
  after_initialize EncryptionWrapper.new("middle_name", "mother")

  before_save      EncryptionWrapper.new("last_name", "mother")
  after_save       EncryptionWrapper.new("last_name", "mother")
  after_initialize EncryptionWrapper.new("last_name", "mother")

  before_save      EncryptionWrapper.new("id_number", "mother")
  after_save       EncryptionWrapper.new("id_number", "mother")
  after_initialize EncryptionWrapper.new("id_number", "mother")


  before_save      EncryptionWrapper.new("first_name", "father")
  after_save       EncryptionWrapper.new("first_name", "father")
  after_initialize EncryptionWrapper.new("first_name", "father")

  before_save      EncryptionWrapper.new("middle_name", "father")
  after_save       EncryptionWrapper.new("middle_name", "father")
  after_initialize EncryptionWrapper.new("middle_name", "father")

  before_save      EncryptionWrapper.new("last_name", "father")
  after_save       EncryptionWrapper.new("last_name", "father")
  after_initialize EncryptionWrapper.new("last_name", "father")

  before_save      EncryptionWrapper.new("id_number", "father")
  after_save       EncryptionWrapper.new("id_number", "father")
  after_initialize EncryptionWrapper.new("id_number", "father")


  before_save      EncryptionWrapper.new("first_name", "informant")
  after_save       EncryptionWrapper.new("first_name", "informant")
  after_initialize EncryptionWrapper.new("first_name", "informant")

  before_save      EncryptionWrapper.new("middle_name", "informant")
  after_save       EncryptionWrapper.new("middle_name", "informant")
  after_initialize EncryptionWrapper.new("middle_name", "informant")

  before_save      EncryptionWrapper.new("last_name", "informant")
  after_save       EncryptionWrapper.new("last_name", "informant")
  after_initialize EncryptionWrapper.new("last_name", "informant")

  before_save      EncryptionWrapper.new("id_number", "informant")
  after_save       EncryptionWrapper.new("id_number", "informant")
  after_initialize EncryptionWrapper.new("id_number", "informant")

  before_save      EncryptionWrapper.new("record_status")
  after_save       EncryptionWrapper.new("record_status")
  after_initialize EncryptionWrapper.new("record_status")

  before_save      EncryptionWrapper.new("request_status")
  after_save       EncryptionWrapper.new("request_status")
  after_initialize EncryptionWrapper.new("request_status")

  before_save      EncryptionWrapper.new("national_serial_number")
  after_save       EncryptionWrapper.new("national_serial_number")
  after_initialize EncryptionWrapper.new("national_serial_number")

  def person_id=(value)
    self['_id']=value.to_s
  end

  def person_id
    self['_id']
  end

  property :first_name, String
  property :middle_name, String
  property :last_name, String
  property :first_name_code, String
  property :last_name_code, String
  property :gender, String
  property :birthdate, String
  property :birthdate_estimated, String
  property :place_of_birth, String
  property :hospital_of_birth, String
  property :birth_address, String
  property :birth_village, String
  property :birth_ta, String
  property :birth_district, String
  property :other_birth_place_details, String
  property :birth_weight, String
  property :created_by, String
  property :date_created, String
  property :record_status, String
  property :certificate_issued, String
  property :date_certificate_issued, String
  property :type_of_birth, String
  property :other_type_of_birth, String
  property :parents_married_to_each_other, String
  property :date_of_marriage, String
  property :gestation_at_birth, String
  property :number_of_prenatal_visits, String
  property :month_prenatal_care_started, String
  property :mode_of_delivery, String
  property :number_of_children_born_alive_inclusive, String
  property :number_of_children_born_still_alive, String
  property :level_of_education, String
  property :request_status, String    # ACTIVE | DC_ASK | GRANTED | REJECTED | PRINTED | CLOSED | VOIDED
  property :district_id_number, String
  property :facility_code, String
  property :district_code, String
  property :national_serial_number, String
  property :court_order_attached, String
  property :parents_signed, String
  property :updated_by, String
  property :voided_by, String
  property :voided_date, String
  property :voided, TrueClass, :default => false
  property :form_signed, TrueClass, :default => false

  property :mother do
    property :id_number, String
    property :first_name, String
    property :middle_name, String
    property :last_name, String
    property :maiden_name, String
    property :first_name_code, String
    property :last_name_code, String
    property :gender, String
    property :birthdate, String
    property :birthdate_estimated, String
    property :current_village, String
    property :current_ta, String
    property :current_district, String
    property :home_village, String
    property :home_ta, String
    property :home_district, String
    property :home_country, String
    property :citizenship, String
    property :occupation, String
  end

  property :father do
    property :id_number, String
    property :first_name, String
    property :middle_name, String
    property :last_name, String
    property :first_name_code, String
    property :last_name_code, String
    property :gender, String
    property :birthdate, String
    property :birthdate_estimated, String
    property :current_village, String
    property :current_ta, String
    property :current_district, String
    property :home_village, String
    property :home_ta, String
    property :home_district, String
    property :home_country, String
    property :citizenship, String
    property :occupation, String
  end

  property :informant do
    property :id_number, String
    property :first_name, String
    property :middle_name, String
    property :last_name, String
    property :first_name_code, String
    property :last_name_code, String
    property :relationship_to_child, String
    property :current_village, String
    property :current_ta, String
    property :current_district, String
    property :addressline1, String
    property :addressline2, String
    property :city, String
    property :phone_number, String
  end

  property :merged, String, :default => nil
  property :_deleted, TrueClass, :default => false
  property :_rev, String

  timestamps!

  design do
    view :by__id,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['record_status'] && doc['merged'] == null) {
                    emit(doc['_id'], 1);
                  }
                }"

    view :all,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['record_status'] && doc['merged'] == null) {
                    emit(doc['_id'], 1);
                  }
                }"

    view :by_name,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['record_status'] && doc['merged'] == null) {
                    emit([doc['first_name_code'], doc['last_name_code']], 1);
                  }
                }"

    view :by_district_id_number,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['record_status'] && doc['merged'] == null) {
                    emit(doc['district_id_number'], 1);
                  }
                }"

    view :by_merged,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['merged'] != null) {
                    emit(doc['district_id_number'], 1);
                  }
                }"
                
     view :by_child_parents,
         :map => "function(doc) {
                  if (doc['type'] == 'Child' && doc['record_status']) {
                    emit(doc.first_name_code, doc.last_name_code, doc.gender, doc.birthdate, doc.mother.first_name_code, doc.mother.last_name_code, doc.father.first_name_code,doc.father.last_name_code, 1);
                  }
                }"
    view :by_birth_district_and_record_status

    view :by_district_code_and_record_status

    view :by_district_code

  end

end

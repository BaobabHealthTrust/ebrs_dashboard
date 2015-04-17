require 'test_helper'

class ChildrenControllerTest < ActionController::TestCase
  setup do
    @child = children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child" do
    assert_difference('Child.count') do
      post :create, child: { birth_district: @child.birth_district, birth_ta: @child.birth_ta, birth_village: @child.birth_village, birth_weight: @child.birth_weight, birthdate: @child.birthdate, certificate_issued: @child.certificate_issued, created_by: @child.created_by, date_certificate_issued: @child.date_certificate_issued, date_created: @child.date_created, date_of_marriage: @child.date_of_marriage, father: @child.father, first_name: @child.first_name, gender: @child.gender, gestation_at_birth: @child.gestation_at_birth, hospital_of_birth: @child.hospital_of_birth, informant: @child.informant, last_name: @child.last_name, level_of_education: @child.level_of_education, middle_name: @child.middle_name, mode_of_delivery: @child.mode_of_delivery, month_prenatal_care_started: @child.month_prenatal_care_started, mother: @child.mother, number_of_children_born_alive_inclusive: @child.number_of_children_born_alive_inclusive, number_of_children_born_still_alive: @child.number_of_children_born_still_alive, number_of_prenatal_visits: @child.number_of_prenatal_visits, occupation: @child.occupation, other_birth_place_details: @child.other_birth_place_details, parents_married_to_each_other: @child.parents_married_to_each_other, place_of_birth: @child.place_of_birth, record_status: @child.record_status, type_of_birth: @child.type_of_birth }
    end

    assert_redirected_to child_path(assigns(:child))
  end

  test "should show child" do
    get :show, id: @child
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child
    assert_response :success
  end

  test "should update child" do
    patch :update, id: @child, child: { birth_district: @child.birth_district, birth_ta: @child.birth_ta, birth_village: @child.birth_village, birth_weight: @child.birth_weight, birthdate: @child.birthdate, certificate_issued: @child.certificate_issued, created_by: @child.created_by, date_certificate_issued: @child.date_certificate_issued, date_created: @child.date_created, date_of_marriage: @child.date_of_marriage, father: @child.father, first_name: @child.first_name, gender: @child.gender, gestation_at_birth: @child.gestation_at_birth, hospital_of_birth: @child.hospital_of_birth, informant: @child.informant, last_name: @child.last_name, level_of_education: @child.level_of_education, middle_name: @child.middle_name, mode_of_delivery: @child.mode_of_delivery, month_prenatal_care_started: @child.month_prenatal_care_started, mother: @child.mother, number_of_children_born_alive_inclusive: @child.number_of_children_born_alive_inclusive, number_of_children_born_still_alive: @child.number_of_children_born_still_alive, number_of_prenatal_visits: @child.number_of_prenatal_visits, occupation: @child.occupation, other_birth_place_details: @child.other_birth_place_details, parents_married_to_each_other: @child.parents_married_to_each_other, place_of_birth: @child.place_of_birth, record_status: @child.record_status, type_of_birth: @child.type_of_birth }
    assert_redirected_to child_path(assigns(:child))
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete :destroy, id: @child
    end

    assert_redirected_to children_path
  end
end

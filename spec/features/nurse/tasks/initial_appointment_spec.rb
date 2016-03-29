# filename: ./spec/features/nurse/tasks/initial_appointment_spec.rb

require './spec/support/nurse/tasks_helper'
require './spec/support/nurse/tasks/initial_appointment_helper'

feature 'Nurse, Participant Tasks, Initial in person appointment' do
  background { english_nurse.sign_in }

  scenario 'Nurse sees number of days since task was due' do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_number_of_days_since_due
  end

  scenario 'Nurse sees task overdue' do
    pt_707_nurse_tasks.open

    expect(pt_707_nurse_tasks).to have_overdue_tasks
    # check css in progress-bar
  end

  scenario 'Nurse cancels initial in-person appointment' do
    pt_311_nurse_tasks.open

    expect(pt_311_nurse_tasks).to have_one_task_in_count
    expect(confirmation_call).to be_complete
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.cancel
    cancel_form.complete

    expect(pt_311_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_canceled
  end

  scenario 'Nurse cancels out of reschedule form' do
    pt_317_nurse_tasks.open

    expect(pt_317_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.open_reschedule_form
    navigation.cancel

    expect(pt_317_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active
  end

  scenario 'Nurse reschedules initial in-person appointment' do
    pt_318_nurse_tasks.open

    expect(pt_318_nurse_tasks).to have_one_task_in_count
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.open_reschedule_form
    reschedule_form.complete

    expect(pt_318_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_scheduled
  end

  scenario 'Nurse cancels out of confirmation form' do
    pt_313_nurse_tasks.open

    expect(pt_313_nurse_tasks).to have_one_task_in_count
    expect(confirmation_call).to be_complete
    expect(initial_in_person_appt).to be_active

    initial_in_person_appt.confirm

    expect(initial_in_person_appt).to be_visible

    navigation.cancel

    expect(initial_in_person_appt).to_not be_complete
  end

  scenario 'Nurse must enter a integer in session length field' do
    pt_314_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    pt_314_nurse_tasks.enter_session_length
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse must enter session length' do
    pt_315_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse must enter session location' do
    pt_316_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_general_notes
    navigation.submit

    expect(initial_in_person_appt).to be_visible
  end

  scenario 'Nurse confirms an initial in-person appointment' do
    # check your patients list for current task
    expect(patient_319).to have_initial_appointment

    # create initial appointment
    pt_319_nurse_tasks.open
    initial_in_person_appt.confirm
    initial_in_person_appt.enter_location
    pt_319_nurse_tasks.enter_session_length

    expect(initial_in_person_appt).to have_next_contact_date

    initial_in_person_appt.enter_general_notes
    navigation.submit

    contact_information.enter_smartphone_number
    contact_information.enter_phone_id
    navigation.submit

    expect(pt_400_nurse_tasks).to have_no_tasks_in_count
    expect(initial_in_person_appt).to be_complete
    expect(follow_up_week_1).to be_scheduled
    expect(follow_up_week_3).to be_scheduled
    expect(call_to_schedule_final_appointment).to be_scheduled

    # check clinical summary page for notes
    clinical_summary.open

    expect(clinical_summary).to have_first_appt_notes_visible

    # check contact information page for completeness
    clinical_summary.return_to_tasks
    contact_information.open

    expect(contact_information).to have_initial_appointment

    # check Your Patients list for old / new tasks
    your_patients.return

    expect(patient_319).to_not have_initial_appointment
    expect(patient_319).to have_tasks_completed
  end
end
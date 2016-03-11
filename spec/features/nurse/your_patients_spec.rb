# filename: ./spec/features/nurse/your_patients_spec.rb

require './spec/support/nurse/your_patients_helper'

feature 'English Nurse, Your Patients' do
  background { english_nurse.sign_in }

  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    expect(your_patients).to have_assigned_patients
  end

  scenario 'Nurse sees configuration token' do
    expect(your_patients).to have_configuration_tokens
  end

  scenario 'Nurse sees participants ordered correctly' do
    expect(your_patients).to be_ordered_correctly
  end

  scenario 'Nurse sees multiple tasks for one patient ordered correctly'

  scenario 'Nurse sees no adherence task for pt w connectivity task active' do
    expect(patient_427).to_not have_non_adherence_task
  end

  scenario 'Nurse sees all tasks resolved' do
    expect(patient_300).to have_tasks_completed
  end

  feature 'Active, tasks' do
    scenario 'Nurse sees confirmation call' do
      expect(patient_302).to have_tasks_active

      expect(patient_302).to have_confirmation_call
    end

    scenario 'Nurse sees initial in person appointment' do
      expect(patient_312).to have_tasks_active

      expect(patient_312).to have_initial_appointment
    end

    scenario 'Nurse sees follow up call week 1' do
      expect(patient_322).to have_tasks_active

      expect(patient_322).to have_follow_up_week_1
    end

    scenario 'Nurse sees follow up call week 3' do
      expect(patient_330).to have_tasks_active

      expect(patient_330).to have_follow_up_week_3
    end

    scenario 'Nurse sees call to schedule final appointment' do
      expect(patient_703).to have_tasks_active

      expect(patient_703).to have_call_to_schedule_final_appt
    end

    scenario 'Nurse sees final appointment' do
      expect(patient_344).to have_tasks_active

      expect(patient_344).to have_final_appointment
    end

    scenario 'Nurse sees help request' do
      expect(patient_404).to have_tasks_active

      expect(patient_404).to have_help_request
    end

    scenario 'Nurse sees non-connectivity call' do
      expect(patient_414).to have_tasks_active

      expect(patient_414).to have_lack_of_connectivity_task
    end

    scenario 'Nurse sees non-adherence call' do
      expect(patient_421).to have_tasks_active

      expect(patient_421).to have_non_adherence_task
    end
  end

  # need to figure out how to do this w/o setting the overdue date with data
  # may need to use something to manipulate the server time
  # otherwise just have one set of examples testing css

  feature 'Overdue, tasks assigned before noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end

  feature 'Overdue, tasks assigned after noon' do
    scenario 'Nurse sees confirmation call'
    scenario 'Nurse sees initial in person appointment'
    scenario 'Nurse sees follow up call week 1'
    scenario 'Nurse sees follow up call week 3'
    scenario 'Nurse sees call to schedule final appointment'
    scenario 'Nurse sees final appointment'
    scenario 'Nurse sees help request'
    scenario 'Nurse sees non-connectivity call'
    scenario 'Nurse sees non-adherence call'
  end
end

feature 'Spanish Nurse, Your Patients' do
  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    spanish_nurse.sign_in

    expect(spanish_patients).to have_assigned_patients
  end
end

feature 'Portuguese Nurse, Your Patients' do
  scenario 'Nurse sees participants assigned to them in Your Patients table' do
    portuguese_nurse.sign_in

    expect(portuguese_patients).to have_assigned_patients
  end
end

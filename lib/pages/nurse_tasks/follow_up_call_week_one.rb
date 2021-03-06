require './lib/pages/nurse_tasks/cancel_form'
require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/translations/nurse_tasks/follow_up_call_week_one'

class NurseTasks
  # page object for second contact
  class FollowUpCallWeekOne
    include Capybara::DSL
    include NurseTasksForms
    include Translations::NurseTaskTitles::FollowUpCallWeekOne

    def initialize(follow_up_call_week_one)
      @locale ||= follow_up_call_week_one[:locale]
    end

    def active?
      has_list_item?(follow_up_week_one_title) &&
        has_active_progress_bar_item?(follow_up_week_one_title)
    end

    def complete?
      has_no_list_item?(follow_up_week_one_title) &&
        has_complete_progress_bar_item?(follow_up_week_one_title)
    end

    def canceled?
      has_no_list_item?(follow_up_week_one_title) &&
        has_canceled_progress_bar_item?(follow_up_week_one_title)
    end

    def overdue?
      has_list_item?(follow_up_week_one_title) &&
        has_overdue_progress_bar_item?(follow_up_week_one_title)
    end

    def confirm
      confirm_task follow_up_week_one_title
      visible?
    end

    def cancel
      cancel_task follow_up_week_one_title
    end

    def open_reschedule_form
      open_reschedule follow_up_week_one_title
    end

    def visible?
      has_css?('h1', text: follow_up_week_one_title)
    end

    def enter_difficulties
      2.times { options.delete_at(0) }
      @responses ||= options.sample(2)
      @responses.each { |option| check option }
    end

    def general_notes
      'Notes are so much fun'
    end

    def enter_notes
      fill_in 'second_contact[notes]', with: general_notes
    end

    def has_form_headings?
      has_task_form_headings?(3)
    end

    def has_current_date_selections?
      has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
        has_hour_selector?(3)
    end

    def has_difficulties_options?
      actual = (0..7).map { |i| all('.checkbox')[i].text }
      expect(actual).to eq(options)
    end

    def has_canceled_alert?
      cancel_form.has_cancel_alert?(follow_up_week_one_title)
    end

    def has_difficulties_responses?
      has_text?('Did the patient have any difficulties using CONEMO?: ' \
                "#{@responses[0]}, #{@responses[1]}") ||
        has_text?('Did the patient have any difficulties using CONEMO?: ' \
                  "#{@responses[0]}, #{@responses[1]}")
    end

    private

    def cancel_form
      @cancel_form ||= NurseTasks::CancelForm.new(locale: @locale)
    end
  end
end

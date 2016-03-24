require './lib/pages/shared/nurse_tasks_forms'
translations_path = './lib/pages/shared/translations/'
require "#{translations_path}nurse_tasks/call_to_schedule_final_appointment"

class YourPatients
  class NurseTasks
    # page object for call to schedule final appointment task
    class CallToScheduleFinalAppointment
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::CallToScheduleFinalAppointment

      def initialize(call_to_schedule_final_appointment)
        @locale ||= call_to_schedule_final_appointment[:locale]
      end

      def scheduled?
        has_no_list_item?(call_to_schedule_final_title) &&
          has_scheduled_progress_bar_item?(call_to_schedule_final_title)
      end

      def active?
        has_list_item?(call_to_schedule_final_title) &&
          has_active_progress_bar_item?(call_to_schedule_final_title)
      end

      def complete?
        has_no_list_item?(call_to_schedule_final_title) &&
          has_complete_progress_bar_item?(call_to_schedule_final_title)
      end

      def canceled?
        has_no_list_item?(call_to_schedule_final_title) &&
          has_canceled_progress_bar_item?(call_to_schedule_final_title)
      end

      def confirm
        confirm_task call_to_schedule_final_title
        visible?
      end

      def cancel
        cancel_task call_to_schedule_final_title
      end

      def open_reschedule_form
        open_reschedule call_to_schedule_final_title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: call_to_schedule_final_title)
      end

      def enter_next_contact_date
        select_next_date(7)
      end

      def update_contact_at_to_today
        sleep(1)
        selector[2].click
        select_list_item(Date.today.strftime('%-d'))
      end

      def toggle_options_list
        selector[10].click
      end

      def select_location
        sleep(1)
        selector[10].click
        location = (2..9).map { |i| "unit #{i}" }
        find('.select2-result-label', text: location.sample).click
      end

      def has_form_headings?
        has_task_form_headings?(2)
      end

      def has_current_date_selections?
        has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
          has_hour_selector?(3)
      end

      def has_next_contact_date?
        has_date_selectors?(Date.today, 6, locale(5, 5, 7), locale(7, 7, 5)) &&
          has_time_selectors?(8, 9)
      end

      def has_location_options?
        has_task_options?(10, 9)
      end
    end
  end
end

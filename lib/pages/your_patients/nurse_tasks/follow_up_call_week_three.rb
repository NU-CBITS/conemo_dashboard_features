require './lib/pages/shared/nurse_tasks_forms'
require './lib/pages/shared/translations/nurse_tasks/follow_up_call_week_three'

class YourPatients
  class NurseTasks
    # page object for first contact page of active participants
    class FollowUpCallWeekThree
      include Capybara::DSL
      include NurseTasksForms
      include Translations::NurseTasks::FollowUpCallWeekThree

      def initialize(follow_up_call_week_three)
        @locale ||= follow_up_call_week_three[:locale]
      end

      def scheduled?
        has_no_list_item?(follow_up_week_three_title) &&
          has_scheduled_progress_bar_item?(follow_up_week_three_title)
      end

      def active?
        has_list_item?(follow_up_week_three_title) &&
          has_active_progress_bar_item?(follow_up_week_three_title)
      end

      def complete?
        has_no_list_item?(follow_up_week_three_title) &&
          has_complete_progress_bar_item?(follow_up_week_three_title)
      end

      def canceled?
        has_no_list_item?(follow_up_week_three_title) &&
          has_canceled_progress_bar_item?(follow_up_week_three_title)
      end

      def confirm
        confirm_task follow_up_week_three_title
        visible?
      end

      def cancel
        cancel_task follow_up_week_three_title
      end

      def open_reschedule_form
        open_reschedule follow_up_week_three_title
      end

      def reschedule
        open_reschedule_form
        reschedule_task
      end

      def visible?
        has_css?('h1', text: follow_up_week_three_title)
      end

      def enter_difficulties
        selector[5].click
        options.delete_at(1)
        select_list_item(options.sample)
      end

      def toggle_options_list
        selector[5].click
      end

      def general_notes
        'Notes notes notes notes'
      end

      def enter_general_notes
        fill_in 'third_contact[notes]', with: general_notes
      end

      def has_form_headings?
        has_task_form_headings?(4)
      end

      def has_current_date_selections?
        has_date_selectors?(Date.today, 1, locale(0, 0, 2), locale(2, 2, 0)) &&
          has_hour_selector?(3)
      end

      def has_difficulties_options?
        has_task_options?(5, 7)
      end

      def has_next_contact_date?
        next_contact = Date.today + 21
        has_date_selectors?(next_contact, 7, locale(6, 6, 8),
                            locale(8, 8, 6)) && has_hour_selector?(9)
      end
    end
  end
end

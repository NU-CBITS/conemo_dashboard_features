require './lib/pages/translations'

module Translations
  # translations for Nurse Tasks
  module NurseTasksTranslations
    include Translations

    def singular_active_task
      locale('Tarea pendiente', 'Tarefa pendente', 'Task pending')
    end

    def plural_active_task
      locale('Tareas pendientes', 'Tarefas pendentes', 'Tasks pending')
    end

    def singular_overdue_task
      locale('Tarea astrasada', 'Tarefa atrasada', 'Overdue task')
    end

    def plural_overdue_task
      locale('Tareas astrasadas', 'Tarefas atrasadas', 'Overdue tasks')
    end

    def scheduled_key_label
      locale('scheduled but not due', 'scheduled but not due',
             'scheduled but not due')
    end

    def confirmed_key_label
      locale('confirmed', 'confirmed', 'confirmed')
    end

    def active_key_label
      locale('active due', 'active due', 'active due')
    end

    def canceled_key_label
      locale('cancelled', 'cancelled', 'cancelled')
    end

    def overdue_key_label
      locale('Overdue', 'Overdue', 'Overdue')
    end

    def progress_bar_heading
      locale('Línea de tiempo', 'Linha do tempo', 'Timeline')
    end

    def tasks_heading
      locale('Tareas', 'Tarefas', 'Tasks')
    end

    def mark_resolved_button
      locale('Tarea resuelta', 'Marcar tarefa como resolvida',
             'Mark as resolved')
    end

    def contact_supervisor_button
      locale('Contactar supervisor/a', 'Contactar supervisor',
             'Contact supervisor')
    end

    def contact_supervisor_alert
      locale('¿Estás seguro/a de que quieres enviar una solicitud de ayuda ' \
             'al supervisor?',
             'Tem certeza que quer pedir ajuda ao seu supervisor?',
             'are you sure you want to notify the supervisor that you need ' \
             'help?')
    end

    def last_supervisor_contact_heading
      locale('último contacto supervisor de enviado en',
             'último aviso para supervisor enviado em',
             'Last supervisor contact sent')
    end

    def contact_supervisor_confirmation
      locale('Una solicitud de ayuda fue enviada a tu supervisor/a para que ' \
             'revise este asunto',
             'Uma notificação foi enviada para o seu supervisor sobre este ' \
             'assunto',
             'a notification has been sent for your supervisor to review ' \
             'this issue')
    end

    def clear_supervisor_contact_button
      locale('Borrar tarea', 'Limpar tarefa', 'Clear')
    end

    def clear_supervisor_contact_alert
      locale('¿Estás seguro/a de que quieres borrar esto?',
             'Está certo de que deseja apagar?',
             'Are you sure you want to clear this?')
    end

    def feminine_success_alert
      locale('guardada exitosamente', 'salvo com sucesso',
             'saved successfully')
    end

    def masculine_success_alert
      locale('guardado exitosamente', 'registrado com sucesso',
             'saved successfully')
    end
  end
end

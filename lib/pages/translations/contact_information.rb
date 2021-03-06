require './lib/pages/translations'
Dir['./lib/pages/translations/contact_information/*.rb']
  .each { |file| require file }

module Translations
  # module for Contact Information page
  module ContactInformation
    include Translations
    include Translations::ContactInformation::SpanishContactInformation
    include Translations::ContactInformation::PortugueseContactInformation
    include Translations::ContactInformation::EnglishContactInformation

    def contact_information_title
      locale('Información de contacto', 'Informações de contato',
             'Contact information')
    end

    def smartphone_information_title
      locale('Smartphone', 'Informações de Smartphone',
             'Smartphone Information')
    end

    def phone_number_header
      locale('Número del smartphone / número de serie:',
             'Número do Smartphone / número de serie:',
             'Phone number / serial number:')
    end

    def serial_number_header
      locale('Código del smartphone:', 'Código do Smartphone:',
             'Phone ID:')
    end

    def expected_headings
      locale(spanish_headings, portuguese_headings, english_headings)
    end

    def saved_contact_information_alert
      locale('Información actualizada exitosamente',
             'Informações do participante atualizadas com sucesso',
             'Successfully updated participant')
    end

    def smartphone_creation_alert
      locale('Smartphone guardado exitosamente',
             'Smartphone registrado com sucesso',
             'Successfully created smartphone')
    end
  end
end

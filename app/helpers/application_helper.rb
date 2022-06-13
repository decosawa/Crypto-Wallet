module ApplicationHelper

    def date_br(date_us)
        
        date_us.strftime("%d/%m/%Y")

    end

    def rails_env

        if(Rails.env.development?)

            "Develompment Enviroment"

        elsif(Rails.env.production?)

            "Production Enviroment"
        else

            "Test Enviroment"

        end

    end

end

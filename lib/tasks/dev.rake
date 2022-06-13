namespace :dev do

  desc "Set up the development environment"

  task setup: :environment do
    
    if(Rails.env.development?)

      show_spinner("Erasing database...", "Task finished! | 1/4" ) do

        %x(rails db:drop)

      end

      show_spinner("Creating database...", "Task finished! | 2/4" ) do

        %x(rails db:create)

      end

      show_spinner("Migrating database...", "Task finished! | 3/4" ) do

        %x(rails db:migrate)

      end

      show_spinner("Seeding database...", "Task finished! | 4/4" ) do

        %x(rails db:seed)

      end

    else

      puts "You are not in development environment"

    end

  end

  private

    def show_spinner(msg_start, msg_end)

      spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :dots) 
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")

    end

end

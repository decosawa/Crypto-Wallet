namespace :dev do

  desc "Set up the development environment"
  task setup: :environment do
    
    if(Rails.env.development?)

      show_spinner("Erasing database...", "Task finished! | 1/5" ) do

        %x(rails db:drop)

      end

      show_spinner("Creating database...", "Task finished! | 2/5" ) do

        %x(rails db:create)

      end

      show_spinner("Migrating database...", "Task finished! | 3/5" ) do

        %x(rails db:migrate)

      end

      %x(rails dev:add_mining_type)
      %x(rails dev:add_cryptocurrency)

    else

      puts "You are not in development environment"

    end

  end

  desc "Register the cryptocurrency"
  task add_cryptocurrency: :environment do

    show_spinner("Registering cryptocurrency...", "Task finished! | 5/5" ) do

      coins = [

          {

            description: "Bitcoin", 
            acronym: "BTC", 
            url_image: "https://imgs.jusbr.com/publications/images/bf89dddcc864eb9d0df14b480177f5eb",
            mining_type: MiningType.find_by(acronym: "PoW")

          }, 
          {

            description: "Ethereum", 
            acronym: "ETH", 
            url_image: "https://styles.redditmedia.com/t5_2zf9m/styles/communityIcon_hebckbd64w811.png",
            mining_type: MiningType.all.sample

          }, 
          {

            description: "Dash", 
            acronym: "DASH", 
            url_image: "https://dynamic-assets.coinbase.com/666dcae79d8896d18a69b5354bfa95bd6d8eef206863281e2acd9a12f14b21726624450a5bc39287b9b380ec2dfa47f51ba6b3b01bd61a5630c53c0654f92c64/asset_icons/b68ce7819b9a02aeceb2454040f8b09dda0a9faf2df70755789d089de668051a.png",
            mining_type: MiningType.all.sample

          }
          
      ]

      coins.each do |coin|

        sleep(3)
        Coin.find_or_create_by(coin)

      end

    end
  
  end

  desc "Register the mining type"
  task add_mining_type: :environment do

    show_spinner("Registering mining type...", "Task finished! | 4/5" ) do

      mining_types = [

        {

          description: "Proof of Work",
          acronym: "PoW"

        },
        {

          description: "Proof of Stake",
          acronym: "PoS"

        },
        {

          description: "Proof of Capacity",
          acronym: "PoC"

        }

      ]

      mining_types.each do |mining_type|

        MiningType.find_or_create_by!(mining_type)

      end

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

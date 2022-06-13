# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'tty-spinner'

spinner = TTY::Spinner.new("[:spinner] Registering cryptocurrency...", format: :dots)
spinner.auto_spin
coins = [

    {

        description: "Bitcoin", 
        acronym: "BTC", 
        url_image: "https://imgs.jusbr.com/publications/images/bf89dddcc864eb9d0df14b480177f5eb"

    }, 
    {

        description: "Ethereum", 
        acronym: "ETH", 
        url_image: "https://styles.redditmedia.com/t5_2zf9m/styles/communityIcon_hebckbd64w811.png"

    }, 
    {

        description: "Dash", 
        acronym: "DASH", 
        url_image: "https://dynamic-assets.coinbase.com/666dcae79d8896d18a69b5354bfa95bd6d8eef206863281e2acd9a12f14b21726624450a5bc39287b9b380ec2dfa47f51ba6b3b01bd61a5630c53c0654f92c64/asset_icons/b68ce7819b9a02aeceb2454040f8b09dda0a9faf2df70755789d089de668051a.png"

    }
    
]
coins.each do |coin|

    sleep(3)
    Coin.find_or_create_by(coin)

end
spinner.success("(Task finished!)")
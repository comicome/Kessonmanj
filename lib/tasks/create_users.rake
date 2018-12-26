namespace :create_users do
  desc "Create users for the application"
  task create_all: :environment do

    users_params = [
      {
        "email" => "r.lauwerier@wizville.fr",
        "password" => "wizville",
        "first_name" => "Romain",
        "last_name" => "Lauwerier"
      },
      {
        "email" => "t.delaitre@wizville.fr",
        "password" => "wizville",
        "first_name" => "Thimothée",
        "last_name" => "de Laitre"
      },
      {
        "email" => "c.bruchon@wizville.fr",
        "password" => "wizville",
        "first_name" => "Clément",
        "last_name" => "Bruchon"
      },
      {
        "email" => "m.pellat@wizville.fr",
        "password" => "wizville",
        "first_name" => "Marine",
        "last_name" => "Pellat"
      },
      {
        "email" => "d.he@wizville.fr",
        "password" => "wizville",
        "first_name" => "Dan",
        "last_name" => "He"
      },
      {
        "email" => "m.alric@wizville.fr",
        "password" => "wizville",
        "first_name" => "Matthias",
        "last_name" => "Alric"
      },
      {
        "email" => "s.loyer@wizville.fr",
        "password" => "wizville",
        "first_name" => "Sébastien",
        "last_name" => "Loyer"
      },
      {
        "email" => "j.taylor@wizville.fr",
        "password" => "wizville",
        "first_name" => "Jennifer",
        "last_name" => "Taylor"
      },
      {
        "email" => "j.martinez@wizville.fr",
        "password" => "wizville",
        "first_name" => "Julie",
        "last_name" => "Martinez"
      },
      {
        "email" => "i.belaifa@wizville.fr",
        "password" => "wizville",
        "first_name" => "Imane",
        "last_name" => "Beleifa"
      },
      {
        "email" => "a.durusquec@wizville.fr",
        "password" => "wizville",
        "first_name" => "Aude",
        "last_name" => "du Rusquec"
      },
      {
        "email" => "m.lebreton@wizville.fr",
        "password" => "wizville",
        "first_name" => "Marie",
        "last_name" => "Lebreton"
      },
      {
        "email" => "l.meens@wizville.fr",
        "password" => "wizville",
        "first_name" => "Louis",
        "last_name" => "Meens"
      },
      {
        "email" => "s.laurendeau@wizville.fr",
        "password" => "wizville",
        "first_name" => "Sylvain",
        "last_name" => "Laurendeau"
      },
      {
        "email" => "a.alapini@wizville.fr",
        "password" => "wizville",
        "first_name" => "Aymeric",
        "last_name" => "Alapini"
      },
      {
        "email" => "a.cappel@wizville.fr",
        "password" => "wizville",
        "first_name" => "Amélia",
        "last_name" => "Cappel"
      },
      {
        "email" => "h.daumas@wizville.fr",
        "password" => "wizville",
        "first_name" => "Hugo",
        "last_name" => "Daumas"
      },
      {
        "email" => "r.carton@wizville.fr",
        "password" => "wizville",
        "first_name" => "Raphaël",
        "last_name" => "Carton"
      },
      {
        "email" => "k.clemenceau@wizville.fr",
        "password" => "wizville",
        "first_name" => "Kathleen",
        "last_name" => "Clemenceau"
      },
      {
        "email" => "j.melloul@wizville.fr",
        "password" => "wizville",
        "first_name" => "Jessica",
        "last_name" => "Melloul"
      },
      {
        "email" => "v.faure@izville.fr",
        "password" => "wizville",
        "first_name" => "Virginie",
        "last_name" => "Fauré"
      },
      {
        "email" => "c.delaval@wizville.fr",
        "password" => "wizville",
        "first_name" => "Côme",
        "last_name" => "Delaval"
      },
    ]

    User.create(users_params)

    puts User.count
  end

end

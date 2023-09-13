player1 = Player.create!(
    name: "John", 
    email: "john@example.com", 
    password: "password", 
    password_confirmation: "password")
player2 = Player.create!(
    name: "Jane", 
    email: "jane@example.com", 
    password: "password", 
    password_confirmation: "password")
player3 = Player.create!(
    name: "Joe", 
    email: "joe@example.com", 
    password: "password", 
    password_confirmation: "password")
clay = Player.create!(
    name: "Clay", 
    email: "clay@example.com", 
    password: "password", 
    password_confirmation: "password")
    
team1 = Team.create!(name: "Hickory City Park Rangers", facility: "Hickory City Park")
team2 = Team.create!(name: "Catawba All Stars", facility: "Catawba Country Club")

team1.players << player1
team1.players << clay
team2.players << player2
team2.players << player3

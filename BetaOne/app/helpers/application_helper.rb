# encoding: UTF-8
module ApplicationHelper
    def self.nav_item user_id
        user = User.find(user_id)
      
        arr = Array.new
        nav_itemx = arr.push({id: "home", href: "/home", value: "Home"})
        nav_itemx = arr.push({id: "clients", href: "/clients/list", value: "Cliente"})
        nav_itemx = arr.push({id: "users", href: "/users/list", value: "Usuário"})
        nav_itemx = arr.push({id: "residences", href: "/residences", value: "Imóveis"})
    
        nav_itemx
    end
end

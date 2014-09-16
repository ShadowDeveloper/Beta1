# encoding: UTF-8
module ApplicationHelper
    def self.nav_item
      
        arr = Array.new
        nav_itemx = arr.push({id: /home/, href: "/home", value: "Home", icon:"fi-home"})
        nav_itemx = arr.push({id: /clients/, href: "/clients/list", value: "Cliente", icon:"fi-torso"})
        nav_itemx = arr.push({id: /users/, href: "/users/list", value: "Usuário", icon:"fi-torso-business"})
        nav_itemx = arr.push({id: /residences/, href: "/residences", value: "Imóveis", icon:"fi-home"})
        nav_itemx
    end
end
